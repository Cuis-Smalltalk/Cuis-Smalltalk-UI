'From Cuis7.9 [latest update: #8306] on 10 November 2026 at 2:49:50 pm'!
'Description Save combined Morph into a package which requires its dependent code.
Restore via
  Feature require: <package>'!
!provides: 'UI-Packager' '1.2.0'!
SystemOrganization addCategory: #'UI-Packager'!


!classDefinition: #MorphicPackager category: #'UI-Packager'!
Object subclass: #MorphicPackager
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Packager'!
!classDefinition: 'MorphicPackager class' category: #'UI-Packager'!
MorphicPackager class
	instanceVariableNames: ''!


!MorphicPackager commentStamp: '<historical>' prior: 0!
I am a way to write a complex Morph to disk in a package
which requires all packages which the Morph depends on.

This means you can require that package and get your complex morph back.

!

!ReferenceStream methodsFor: '*ui-packager' stamp: 'KenD 8/Mar/2022, 1:07:30 am (UTC)'!
references
	"Answer IdentityDictionary of objects written out so far.
	 Keys are the objects."
	
	^ references! !

!ReferenceStream class methodsFor: '*ui-packager' stamp: 'KenD 8/Mar/2022, 1:07:53 am (UTC)'!
packagesFromDumpOnFile: morphObjectFileEntry object: aMorph
	"Export object to file and answer set of packages it requires.
	 WARNING: will overwrite file without checking!!"

	| refStream packageSet |	
	morphObjectFileEntry forceWriteStreamDo: [ :stream |
		refStream := self on: stream.
		refStream nextPut: aMorph 
	].
	packageSet := Set new.
	refStream references keys do: [ :o || pkg |
		pkg := CodePackage packageOfClass: o class ifNone: [nil].
		pkg ifNotNil: [ :requiredPackage |
			packageSet add: requiredPackage 
		]
	].
	^packageSet
		
	! !

!Morph methodsFor: '*ui-packager' stamp: 'KenD 10/Nov/2026, 10:47:32 pm (UTC)'!
packageFileEntry: packageFileEntry 
requires: packRequires 
forLoadofName: packageName
	"Create a Package which requires the set of required codePackages
	and whose initializer reads in objects from morphObjectFileName"
	| codePkg requirements fspec feature |	
        self flag: #FIXME.
	self flag: #'IncorporateIntoSameFile'. 

	requirements := packRequires 
		collect: [ :pkg | pkg featureSpec requirementOfMe ].
	requirements add:  Feature baseSystemFeature requirementOfMe.

	"Set up for CodePackage>>writeOnStream:"
	codePkg := CodePackage 
		named: packageName 
		createIfAbsent: true 
		registerIfNew: false.
	feature := Feature name: packageName version: SemanticVersion zero. 
	fspec := FeatureSpec provides: feature requires: requirements.
	codePkg
 	       description: 'Load Morph for ', packageName;
  	      featureSpec: fspec;
   	     fullFileName: packageFileEntry fullPrintString;
    	    save.  "Write header & requirements"

	packageFileEntry 
		appendContents: 
('
!!classDefinition: #{1} category: ''{1}''!!
Object subclass: #{1}
	instanceVariableNames: ''''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''{1}''!!
!!classDefinition: ''{1} class'' category: ''{1}''!!
{1} class
	instanceVariableNames: ''''!! 

!!{1} class methodsFor: ''class initialization'' stamp: ''{2}''!!
initialize

   | filePrefix |
	
    filePrefix := (CodePackage installedPackages at: #{1})
		fullFileName pathAndLocalName at: 1.
    [
        (Delay forSeconds: 1) wait.
        UISupervisor whenUIinSafeState: [
	    (ReferenceStream restoreFromFile: (filePrefix asString , ''/{1}.obj'') asFileEntry) 
		  openInWorld 
	]
    ] fork!! !!

{1} initialize!!
'
	format: { packageName. Utilities changeStamp. }
).
	PopUpMenu inform: packageFileEntry name , ' saved'.! !

!Morph methodsFor: '*ui-packager' stamp: 'jmv 12/Sep/2024, 8:41:39 pm (UTC)'!
saveAsPackage
	"Save me and create a package which requires all my dependent code."
	
	| packageName |
	(PopUpMenu confirm: 
'OK to create a Package and Category for myself
 with the name you specify?')
		ifFalse: [ ^nil ].

	packageName := StringRequestMorph request: 'Enter a Unique Name'.
	(packageName notEmpty) 
		ifFalse: [ ^nil ].
	
	self saveAsPackage: packageName
	
	

	! !

!Morph methodsFor: '*ui-packager' stamp: 'KenD 9/Mar/2022, 4:50:16 pm (UTC)'!
saveAsPackage: packageName
	"Save me and create a package which requires all my dependent code."
	
	| packageFileName packageFileEntry morphObjectFileName morphObjectFileEntry packRequires |
	packageFileName := packageName , '.pck.st'.
	packageFileEntry := packageFileName asFileEntry.
	packageFileEntry ifExists: [ :fe | 
		(PopUpMenu confirm: packageFileName, ' already exists. Overwrite?')
				ifFalse: [ ^nil ]
	].
       self flag: #FIXME.
	self flag: #'IncorporateIntoSameFile'. 
	morphObjectFileName := (packageName , '.obj').
	morphObjectFileEntry := morphObjectFileName asFileEntry.
	morphObjectFileEntry ifExists: [ :fe |
		(PopUpMenu confirm: morphObjectFileName, ' already exists. Overwrite?')
				ifFalse: [ ^nil ]
	].
	packRequires := ReferenceStream packagesFromDumpOnFile: morphObjectFileEntry object: self.
	self packageFileEntry: packageFileEntry requires: packRequires forLoadofName: packageName.
	
	

	! !
