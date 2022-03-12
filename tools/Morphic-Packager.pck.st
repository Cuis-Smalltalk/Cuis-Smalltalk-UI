'From Cuis 6.0 [latest update: #5093] on 12 March 2022 at 2:59:15 pm'!
'Description Save combined Morph into a package which requires its dependent code.
Restore via 
  Feature require: <package>'!
!provides: 'Morphic-Packager' 1 12!
!requires: 'Cuis-Base' 60 5092 nil!
SystemOrganization addCategory: 'Morphic-Packager'!


!classDefinition: #MorphicPackager category: 'Morphic-Packager'!
Object subclass: #MorphicPackager
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-Packager'!
!classDefinition: 'MorphicPackager class' category: 'Morphic-Packager'!
MorphicPackager class
	instanceVariableNames: ''!


!MorphicPackager commentStamp: '<historical>' prior: 0!
I am a way to write a complex Morph to disk in a package
which requires all packages which the Morph depends on.

This means you can require that package and get your complex moprph back.

!

!ReferenceStream methodsFor: '*morphic-packager' stamp: 'KenD 3/7/2022 17:07:30'!
references
	"Answer IdentityDictionary of objects written out so far.
	 Keys are the objects."
	
	^ references! !

!ReferenceStream class methodsFor: '*morphic-packager' stamp: 'KenD 3/7/2022 17:07:53'!
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

!Morph methodsFor: '*morphic-packager' stamp: 'KenD 3/12/2022 14:32:43'!
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
	feature := Feature name: packageName version: 1 revision: 0. 
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

    [
        (Delay forSeconds: 1) wait.
        UISupervisor whenUIinSafeState: [
	    (ReferenceStream restoreFromFile: ''{1}.obj'' asFileEntry) openInWorld 
	]
    ] fork!! !!

{1} initialize!!
'
	format: { packageName. Utilities changeStamp. }
).
	PopUpMenu inform: packageFileEntry name , ' saved'.! !

!Morph methodsFor: '*morphic-packager' stamp: 'KenD 3/12/2022 14:25:17'!
saveAsPackage
	"Save me and create a package which requires all my dependent code."
	
	| packageName |
	(PopUpMenu confirm: 
'OK to create a Package and Category for myself
 with the name you specify?')
		ifFalse: [ ^nil ].

	packageName := FillInTheBlankMorph request: 'Enter a Unique Name'.
	(packageName notEmpty) 
		ifFalse: [ ^nil ].
	
	self saveAsPackage: packageName
	
	

	! !

!Morph methodsFor: '*morphic-packager' stamp: 'KenD 3/9/2022 08:50:16'!
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
