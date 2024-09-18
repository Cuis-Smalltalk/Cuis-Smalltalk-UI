'From Cuis7.1 [latest update: #6727] on 18 September 2024 at 8:24:53 pm'!
'Description Utility code to fetch grapics from file system.'!
!provides: 'UI-Graphic-Import' 1 2!
!requires: 'SVG' 1 21 nil!
!requires: 'Graphics-Files-Additional' 1 29 nil!
SystemOrganization addCategory: #'UI-Graphic-Import'!


!classDefinition: #IconImporter category: #'UI-Graphic-Import'!
Object subclass: #IconImporter
	instanceVariableNames: 'forms path'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Graphic-Import'!
!classDefinition: 'IconImporter class' category: #'UI-Graphic-Import'!
IconImporter class
	instanceVariableNames: ''!


!IconImporter commentStamp: '<historical>' prior: 0!
I load icons from files (both PNG and SVG) and cached them in a dictionary (forms instance variable).

I am simple, but useful.  I can manage different size of the same icon. 

When asked for an icon with the message get: #blank32, I will search in the path for blank.svg, fallback to blank.png, then scale at squared size 32.!

!IconImporter methodsFor: 'accessing' stamp: 'hlsf 9/17/2024 18:08:59'!
getForm: iconSymbolWithSize
" icons get: #blank32 "
	| size |
	(size := iconSymbolWithSize select: [:c | c isDigit ]) 
		ifEmpty: [self error: 'Missing size in icon symbol'].
	^ self 
		getForm: (iconSymbolWithSize select: [:c | c isLetter ])
		ofSize: size asNumber! !

!IconImporter methodsFor: 'accessing' stamp: 'KenD 9/15/2024 12:35:15'!
getForm: icon ofSize: rectWidthPixels
" Search first for SVG icon, then PNG one "
	^ forms 
		at: (icon, rectWidthPixels asString) asSymbol
		ifAbsentPut: [ | file | 
			(file := path // (icon, '.svg')) exists
				ifTrue: [ |svg|
					svg := [SVGMainMorph fromFile: file] 
						on: SVGWarning 
						do: [:warning | warning resume].
					svg imageForm: rectWidthPixels asPoint depth: 32]									
				ifFalse: [(file := path // (icon , '.png')) exists
					ifTrue: [| form |
						form := PNGReadWriter formFromFileEntry: file.
						form width = rectWidthPixels 
							ifTrue: 	[form] 
							ifFalse: [	form magnifyTo: rectWidthPixels asPoint] ]
					ifFalse: [self error: 'Missing icon file ', icon ] ]
			]! !

!IconImporter methodsFor: 'accessing' stamp: 'KenD 9/15/2024 12:31:42'!
getMorph: iconSymbolWithSize

	^ ImageMorph newWith: (self getForm:  iconSymbolWithSize)! !

!IconImporter methodsFor: 'accessing' stamp: 'hlsf 9/17/2024 18:09:23'!
getMorph: iconSymbol ofSize: rectWidthPixels

	^ ImageMorph newWith: (self getForm:  iconSymbol ofSize: rectWidthPixels)! !

!IconImporter methodsFor: 'accessing' stamp: 'KenD 9/15/2024 12:26:47'!
path: iconsDirectoryEntry
	path := iconsDirectoryEntry asDirectoryEntry! !

!IconImporter methodsFor: 'initialization' stamp: 'hlsf 8/13/2023 16:29:00'!
initialize
	forms := Dictionary new.! !

!IconImporter class methodsFor: 'instance creation' stamp: 'hlsf 8/13/2023 15:37:01'!
path: aDriectoryEntry
	^ self new ::
		path: aDriectoryEntry;
		yourself! !
