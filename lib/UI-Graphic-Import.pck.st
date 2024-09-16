'From Cuis7.1 [latest update: #6722] on 16 September 2024 at 2:07:23 pm'!
'Description Utility code to fetch grapics from file system.'!
!provides: 'UI-Graphic-Import' 1 0!
!requires: 'Graphics-Files-Additional' 1 29 nil!
SystemOrganization addCategory: #'UI-Graphic-Import'!


!classDefinition: #SimpleIconImporter category: #'UI-Graphic-Import'!
Object subclass: #SimpleIconImporter
	instanceVariableNames: 'forms path'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Graphic-Import'!
!classDefinition: 'SimpleIconImporter class' category: #'UI-Graphic-Import'!
SimpleIconImporter class
	instanceVariableNames: ''!


!SimpleIconImporter commentStamp: '<historical>' prior: 0!
I load icons from files (both PNG and SVG) and cached them in a dictionary (forms instance variable).

I am simple, but useful.  I can manage different size of the same icon. 

When asked for an icon with the message get: #blank32, I will search in the path for blank.svg, fallback to blank.png, then scale at squared size 32.!

!SimpleIconImporter methodsFor: 'accessing' stamp: 'KenD 9/15/2024 12:28:41'!
getForm: iconSymbolWithSize
" icons get: #blank32 "
	| size |
	(size := iconSymbolWithSize select: [:c | c isDigit ]) 
		ifEmpty: [self error: 'Missing size in icon symbol'].
	^ self 
		getForm: (iconSymbolWithSize select: [:c | c isLetter ])
		size: size asNumber! !

!SimpleIconImporter methodsFor: 'accessing' stamp: 'KenD 9/15/2024 12:35:15'!
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

!SimpleIconImporter methodsFor: 'accessing' stamp: 'KenD 9/15/2024 12:28:41'!
getForm: icon size: integer
" Search first for SVG icon, then PNG one "
	^ forms 
		at: (icon, integer asString) asSymbol
		ifAbsentPut: [ | file | 
			(file := path // (icon, '.svg')) exists
				ifTrue: [ |svg|
					svg := [SVGMainMorph fromFile: file] 
						on: SVGWarning 
						do: [:warning | warning resume].
					svg imageForm: integer asPoint depth: 32]									
				ifFalse: [(file := path // (icon , '.png')) exists
					ifTrue: [| form |
						form := PNGReadWriter formFromFileEntry: file.
						form width = integer 
							ifTrue: 	[form] 
							ifFalse: [	form magnifyTo: integer asPoint] ]
					ifFalse: [self error: 'Missing icon file ', icon ] ]
			]! !

!SimpleIconImporter methodsFor: 'accessing' stamp: 'KenD 9/15/2024 12:31:42'!
getMorph: iconSymbolWithSize

	^ ImageMorph newWith: (self getForm:  iconSymbolWithSize)! !

!SimpleIconImporter methodsFor: 'accessing' stamp: 'KenD 9/15/2024 12:33:22'!
getMorph: iconSymbol ofSize: rectWidthPixels

	^ ImageMorph newWith: (self getForm:  iconSymbol size: rectWidthPixels)! !

!SimpleIconImporter methodsFor: 'accessing' stamp: 'KenD 9/15/2024 12:26:47'!
path: iconsDirectoryEntry
	path := iconsDirectoryEntry asDirectoryEntry! !

!SimpleIconImporter methodsFor: 'initialization' stamp: 'hlsf 8/13/2023 16:29:00'!
initialize
	forms := Dictionary new.! !

!SimpleIconImporter class methodsFor: 'instance creation' stamp: 'hlsf 8/13/2023 15:37:01'!
path: aDriectoryEntry
	^ self new ::
		path: aDriectoryEntry;
		yourself! !
