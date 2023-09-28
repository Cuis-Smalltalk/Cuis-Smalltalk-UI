'From Cuis 6.0 [latest update: #5979] on 28 September 2023 at 9:55:39 pm'!
'Description I supply simple click-select elements.'!
!provides: 'UI-Click-Select' 1 42!
!requires: 'Cuis-Base' 60 5031 nil!
!requires: 'UI-Core' 1 0 nil!
SystemOrganization addCategory: 'UI-Click-Select'!


!classDefinition: #CheckGroup category: 'UI-Click-Select'!
LayoutMorph subclass: #CheckGroup
	instanceVariableNames: 'list font buttonOnLeft buttons'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'CheckGroup class' category: 'UI-Click-Select'!
CheckGroup class
	instanceVariableNames: ''!

!classDefinition: #PluggableCheckboxMorph category: 'UI-Click-Select'!
CheckGroup subclass: #PluggableCheckboxMorph
	instanceVariableNames: 'model getSelected setSelected'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'PluggableCheckboxMorph class' category: 'UI-Click-Select'!
PluggableCheckboxMorph class
	instanceVariableNames: ''!

!classDefinition: #RadioGroup category: 'UI-Click-Select'!
CheckGroup subclass: #RadioGroup
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'RadioGroup class' category: 'UI-Click-Select'!
RadioGroup class
	instanceVariableNames: ''!

!classDefinition: #DropDownButtonMorph category: 'UI-Click-Select'!
LayoutMorph subclass: #DropDownButtonMorph
	instanceVariableNames: 'model dropDownList setMorphIndex button'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'DropDownButtonMorph class' category: 'UI-Click-Select'!
DropDownButtonMorph class
	instanceVariableNames: ''!

!classDefinition: #DropDownListMorph category: 'UI-Click-Select'!
DropDownButtonMorph subclass: #DropDownListMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'DropDownListMorph class' category: 'UI-Click-Select'!
DropDownListMorph class
	instanceVariableNames: ''!

!classDefinition: #InnerListOfMorph category: 'UI-Click-Select'!
LayoutMorph subclass: #InnerListOfMorph
	instanceVariableNames: 'highlightedRow selectedRow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'InnerListOfMorph class' category: 'UI-Click-Select'!
InnerListOfMorph class
	instanceVariableNames: ''!

!classDefinition: #PluggableDropDownListMorph category: 'UI-Click-Select'!
PluggableListMorph subclass: #PluggableDropDownListMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'PluggableDropDownListMorph class' category: 'UI-Click-Select'!
PluggableDropDownListMorph class
	instanceVariableNames: ''!

!classDefinition: #PluggableListOfMorph category: 'UI-Click-Select'!
PluggableListMorph subclass: #PluggableListOfMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'PluggableListOfMorph class' category: 'UI-Click-Select'!
PluggableListOfMorph class
	instanceVariableNames: ''!

!classDefinition: #PluggableDropDownListOfMorph category: 'UI-Click-Select'!
PluggableListOfMorph subclass: #PluggableDropDownListOfMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'PluggableDropDownListOfMorph class' category: 'UI-Click-Select'!
PluggableDropDownListOfMorph class
	instanceVariableNames: ''!

!classDefinition: #MultiSelectMenu category: 'UI-Click-Select'!
MenuMorph subclass: #MultiSelectMenu
	instanceVariableNames: 'choices seed result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'MultiSelectMenu class' category: 'UI-Click-Select'!
MultiSelectMenu class
	instanceVariableNames: ''!

!classDefinition: #CheckButtonMorph category: 'UI-Click-Select'!
BoxedMorph subclass: #CheckButtonMorph
	instanceVariableNames: 'isSelected'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'CheckButtonMorph class' category: 'UI-Click-Select'!
CheckButtonMorph class
	instanceVariableNames: ''!

!classDefinition: #RadioButtonMorph category: 'UI-Click-Select'!
CheckButtonMorph subclass: #RadioButtonMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'RadioButtonMorph class' category: 'UI-Click-Select'!
RadioButtonMorph class
	instanceVariableNames: ''!


!CheckGroup commentStamp: '<historical>' prior: 0!
I manage a CheckGroup -- a Group of CheckButtons, each with a label.

I am a columnMorph

Each of my submorphs is a row layoutMorph which contains a radio button and a label and may contain other, additional  morphs.

iVars:
 list  an Array of Symbols used as labels or an Array of Morphs displayed
 font - font for labels
 buttonOnLeft -- if True, button image then label else label then button image
 buttons - cached array of buttons
!

!PluggableCheckboxMorph commentStamp: 'hlsf 2/12/2022 10:40:13' prior: 0!
A unique pluggable checkbox with a label or a morph.!

!RadioGroup commentStamp: '<historical>' prior: 0!
I manage a RadioGroup -- a Group of RadioButtons, each with a label.!

!DropDownButtonMorph commentStamp: '<historical>' prior: 0!
A button with a dropdown list of Morphs to select from.!

!DropDownListMorph commentStamp: '<historical>' prior: 0!
A button with a dropdown list to select from.!

!InnerListOfMorph commentStamp: '<historical>' prior: 0!
The morph that displays the list of Morph in a PluggableListOfMorph.!

!PluggableListOfMorph commentStamp: 'hlsf 1/14/2022 11:01:29' prior: 0!
I am a vertical list of Morph. I have no horizontal scrollbar but I may have a vertical one.
My width is adjusted to the larger morph of my list.!

!PluggableDropDownListOfMorph commentStamp: '<historical>' prior: 0!
I am a list of Morph with a modal behavior. When the user outisde of me, I am deleted.!

!MultiSelectMenu commentStamp: '<historical>' prior: 0!
I am used to relate a set of names to an integer incoding, where each  symbolic name is realated to a bit.

My instances present the selections to a user with Accept/Cancel.

Cancel returns the seed (which is used to set the initial values), Accept returns the new ORed value.

When the value ranked zero is selected, the other 'bits' are delselected.

For example, TextEmphasis codes are a bit ORing of values:
 2r00000000  0  normal
 2r00000001	 1	bold
 2r00000010	 2	itallic
 2r00000100	 4	underlined		
 2r00001000	 8	struck out       
 2r00010000	16 Superscript 
 2r00100000	32 Subscript      
 2r01000000	64 	with ST-80 Glyphs
 !

!CheckButtonMorph commentStamp: '<historical>' prior: 0!
I am simple check button!

!RadioButtonMorph commentStamp: '<historical>' prior: 0!
I am a very simple radio button.!

!CheckGroup methodsFor: 'accessing' stamp: 'hlsf 1/27/2022 11:55:54'!
buttonClass
" What kind of button am I, check or radio? "
	^ CheckButtonMorph ! !

!CheckGroup methodsFor: 'accessing' stamp: 'hlsf 1/27/2022 11:49:38'!
buttonFor: aSymbol
	"Return aRadioButton corresponding to selector"
	
	| symbols row |
	symbols := self list.
	row :=  submorphs at: ((symbols size) + 1 - (symbols indexOf: aSymbol ifAbsent: [ ^nil ])).
	^ row submorphs detect: [ :s | s class == self buttonClass ] ifNone: [ nil ]! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 11/19/2013 21:02'!
buttonOnLeft

	^ buttonOnLeft ! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 11/20/2013 13:56'!
buttons

	^ buttons! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 11/19/2013 19:46'!
font

	^ font! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 11/19/2013 19:45'!
labelStrings

	^ self list collect: [ :each | each asString ]! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 11/19/2013 19:45'!
list
	"Answer my array of label symbols"

	^ list! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:18'!
rowFor: aSymbol
	"My rows are submorphs inversly ordered from my list"
	
	| symbols |
	symbols := self list.

	^ self submorphs at: ((symbols size) + 1 - (symbols indexOf: aSymbol ifAbsent: [ ^nil ]))! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 11/20/2013 14:49'!
symbolForButton: radioButton

	^ self list at: (self buttons indexOf: radioButton)! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 2/14/2022 11:36:10'!
adjustLabels: labelList to: maxStringWidth
| labelLayout |
	"Make all labels have same width"
	labelLayout := LayoutSpec 
			fixedWidth: maxStringWidth + 4
			fixedHeight: self font lineSpacing 
			offAxisEdgeWeight: #center.
	labelList do: [ :label | label layoutSpec: labelLayout ].! !

!CheckGroup methodsFor: 'initialization' stamp: 'KenD 11/20/2013 15:05'!
buttonOnLeft: aBoolean

	buttonOnLeft := aBoolean ! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 2/14/2022 11:36:41'!
fromList: arrayOfSymbols
	"Set up my submorphs from arrayOfSymbols"

	| maxStringWidth buttonList labelList |
	maxStringWidth := 0.
	self removeAllMorphs. "Don't keep old stuff."
	list _ arrayOfSymbols.
	buttonList  := OrderedCollection new.
	labelList    := OrderedCollection new.
	arrayOfSymbols do: [ :labelSym | | newRow label button |
		newRow := self newButtonRow.
		button := self newButton.
		label := LabelMorph contents: labelSym asString font: self font.
		maxStringWidth := maxStringWidth max: (self font widthOfString: labelSym).
		self registerEventsFor: label with: button.
		self pack: button and: label in: newRow.
		buttonList add: button.
		labelList add: label.
		self addMorph: newRow 	].
	buttons _ buttonList asArray.
	self registerEvents.
	self adjustLabels: labelList to: maxStringWidth ! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 2/12/2022 11:06:16'!
fromMorphDict: morphDict
	"Set up my submorphs from collectionOfMorphs"
	
	|  buttonList morphList |
	buttonList  := OrderedCollection new.
	morphList    := OrderedCollection new.
	morphDict keysAndValuesDo: [ :aName :aMorph | | newRow button |
		newRow := self newButtonRow.
		button := self newButton.
		self registerEventsFor: aMorph with: button.
		self pack: button and: aMorph in: newRow.
		buttonList add: button.
		morphList add: aName.
		self addMorph: newRow 	].
	buttons _ buttonList asArray.
	self registerEvents.
	list _ morphList asArray! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 7/3/2022 13:06:51'!
initialize
	"Initialize self to harmless values"
	
	super initialize.
	list _ #().
	self    setFont: (Preferences at: #standardButtonFont);
		 buttonOnLeft: true;
		 separation: 2@2;
		 color: Color transparent! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 1/27/2022 13:34:19'!
newButton

	^self buttonClass 	ofSize: self buttonClass defaultDiameter ::
		layoutSpec: LayoutSpec keepMorphExtent;
		yourself! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 1/27/2022 13:37:38'!
newButtonRow

	^ LayoutMorph newRow ::
		separation: 5; 
		color: Color transparent; 
		axisEdgeWeight: #rowLeft;
		yourself! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 1/27/2022 13:34:10'!
pack: button and: aMorph in: row

	self buttonOnLeft
		ifTrue: [ row  addMorph: button; addMorph: aMorph ] 
		ifFalse: [ row addMorph: aMorph; addMorph: button ]! !

!CheckGroup methodsFor: 'initialization' stamp: 'KenD 11/20/2013 15:06'!
setFont: aFont

	font := aFont ! !

!CheckGroup methodsFor: 'geometry' stamp: 'hlsf 1/27/2022 12:35:39'!
naturalHeight
	"Answer the combined heights of my elements"
	
	^ 4  + ((self list size) 
		* (2 + ((self font lineSpacing) max: (self buttonClass defaultDiameter))))! !

!CheckGroup methodsFor: 'events' stamp: 'hlsf 7/3/2022 13:06:45'!
fontPreferenceChanged

	| labelStrings maxStringWidth labelLayoutSpec |
	super fontPreferenceChanged.
	self setFont: (Preferences at: #standardButtonFont).
	maxStringWidth := 3. "minimum"
	labelStrings := self labelStrings.
	labelStrings do: [ :str |
		maxStringWidth := maxStringWidth max:  (self font widthOfString: str)
	].
	labelLayoutSpec := 
			LayoutSpec 
					fixedWidth: maxStringWidth + 4
					fixedHeight: self font lineSpacing + 2
					offAxisEdgeWeight: #center. 
	self submorphsDo: [ :selectLine |
		selectLine submorphsDo: [ :aMorph |
			(aMorph respondsTo: #setFont:)
				ifTrue: [ aMorph setFont: (Preferences at: #standardButtonFont) ].
			(aMorph respondsTo: #font:)
				ifTrue: [ aMorph font: (Preferences at: #standardButtonFont) ].
			(aMorph respondsTo: #ofSize:)
				ifTrue: [aMorph ofSize: self buttonClass defaultDiameter].
			((aMorph isKindOf: LabelMorph)
			  and: [labelStrings includes: aMorph contents])
				ifTrue: [ aMorph layoutSpec: labelLayoutSpec ].
		]
	].! !

!CheckGroup methodsFor: 'events' stamp: 'hlsf 1/27/2022 13:28:47'!
newSelection: radioButton

	"Unselect other buttons"
	self triggerEvent: #informCheckSelection with: (self symbolForButton: radioButton)
	! !

!CheckGroup methodsFor: 'events' stamp: 'hlsf 1/27/2022 13:34:35'!
registerEvents

	^ self buttons do: [ :b | b when: #checkSelection send: #newSelection: to: self ]! !

!CheckGroup methodsFor: 'events' stamp: 'hlsf 1/27/2022 13:34:39'!
registerEventsFor: aMorph with: aButton
"Make button react to a Morph"

	aMorph 
		setProperty: #'handlesMouseDown:' 		
		toValue: [ :ignored | true ];
		
		setProperty: #'mouseButton1Up:localPosition:'
		toValue: [ :event :position |  aButton toggleSelection ];
		
		setProperty: #'handlesMouseOver:' 		
		toValue: [ :ignored | true ];
		
		setProperty: #'mouseEnter:' 
		toValue: [ :event | aButton mouseEnter: event ];

		setProperty: #'mouseLeave:' 
		toValue: [ :event | aButton mouseLeave: event ].
! !

!CheckGroup methodsFor: 'events' stamp: 'KenD 11/25/2013 19:29'!
unselectAll

	self buttons do: [ :b | b isSelected: false ].
	self redrawNeeded 
	! !

!CheckGroup class methodsFor: 'examples' stamp: 'hlsf 1/27/2022 11:57:55'!
example1
"
	self example1 openInWorld
"
	| group |
	group _ self fromList: #('Cuis-Smalltalk' 'Pharo' 'Squeak').
	group 	buttons do: [:each | 
			each when: #checkSelection send: #show: to: Transcript].
	^ group! !

!CheckGroup class methodsFor: 'examples' stamp: 'hlsf 1/27/2022 13:29:37'!
example2
	"Answer a CheckGroup of images"
"
	CheckGroup example2 openInWorld.
"
	| pallet statusLabel checkSelection formsDict morphDict |
	statusLabel :=  LabelMorph initializedInstance.
	pallet := LayoutMorph newColumn.
	pallet addMorph: (WindowTitleMorph 
					title: 'Radio Graphic' ).
	formsDict := (Theme content 
						from: 'Theme' 
						get: {'16x16'. 'emotes'}
			      ) asDictionary.
	morphDict := Dictionary new.
	formsDict keysAndValuesDo: [ :aName :aForm |
		morphDict 
			at: aName 
			put: (ImageMorph new image: (aForm magnifyTo: 32@32))
	].
	checkSelection := CheckGroup fromMorphsDict: morphDict.
	statusLabel contents: 'unselected'.
	pallet addMorph: statusLabel.
	pallet addMorph: checkSelection.
	checkSelection 
		when: #informCheckSelection 
		send: #contents: 
		to:  statusLabel.
	
	^pallet! !

!CheckGroup class methodsFor: 'examples' stamp: 'hlsf 2/12/2022 11:29:15'!
example3
"
	self example3 openInWorld
"
	| group |
	group _ self fromList: #('Cuis-Smalltalk' 'Pharo' 'Squeak') buttonOnLeft: false.
	group 	buttons do: [:each | 
			each when: #checkSelection send: #show: to: Transcript].
	^ group! !

!CheckGroup class methodsFor: 'instance creation' stamp: 'hlsf 2/12/2022 11:42:30'!
fromList: buttonLabels
	^ self fromList: buttonLabels buttonOnLeft: true! !

!CheckGroup class methodsFor: 'instance creation' stamp: 'hlsf 2/12/2022 11:28:06'!
fromList: buttonLabels buttonOnLeft: boolean
	"Add label list as array of symbols to a new instance of me"

	| listOfSymbols |
	listOfSymbols := OrderedCollection new.
	buttonLabels do: [ :each | listOfSymbols add: each asSymbol ].
	
	^ self newColumn
		buttonOnLeft: boolean;
		 fromList: listOfSymbols asArray ! !

!CheckGroup class methodsFor: 'instance creation' stamp: 'KenD 10/31/2021 08:46:21'!
fromMorphsDict: aDictionaryOfMorphs
	"Add dict of (name->morph) to a new instance of me"

	^ self newColumn fromMorphDict: aDictionaryOfMorphs ! !

!CheckGroup class methodsFor: 'instance creation' stamp: 'hlsf 2/12/2022 11:43:05'!
fromMorphsDict: aDictionaryOfMorphs buttonOnLeft: boolean
	^ self fromList: aDictionaryOfMorphs buttonOnLeft: true! !

!CheckGroup class methodsFor: 'new-morph participation' stamp: 'KenD 12/6/2013 19:07'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!PluggableCheckboxMorph methodsFor: 'accessing' stamp: 'hlsf 2/12/2022 09:41:40'!
getSelected: aSymbol
	getSelected _ aSymbol ! !

!PluggableCheckboxMorph methodsFor: 'accessing' stamp: 'hlsf 2/12/2022 10:20:21'!
model: aModel
	model ifNotNil: [model removeActionsWithReceiver: self].
	aModel ifNotNil: [aModel addDependent: self].
	model _ aModel! !

!PluggableCheckboxMorph methodsFor: 'accessing' stamp: 'hlsf 2/12/2022 09:41:44'!
setSelected: aSymbol
	setSelected _ aSymbol ! !

!PluggableCheckboxMorph methodsFor: 'events' stamp: 'hlsf 2/12/2022 10:28:52'!
newSelection: radioButton
	super newSelection: radioButton.
	model perform: setSelected with: radioButton isSelected! !

!PluggableCheckboxMorph methodsFor: 'updating' stamp: 'hlsf 2/12/2022 10:39:11'!
update: aSymbol
	super update: aSymbol.
	aSymbol == setSelected 
		ifTrue: [self buttons first selected: (model perform: getSelected)]. "No event, or ping-ping between model and view"
	self redrawNeeded.! !

!PluggableCheckboxMorph methodsFor: 'initialization' stamp: 'hlsf 2/14/2022 11:38:47'!
adjustLabels: labels to: number
" We want to be free to adjust as we wish later. So do nothing "! !

!PluggableCheckboxMorph class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:59:10'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!PluggableCheckboxMorph class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:39:48'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!PluggableCheckboxMorph class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:41:13'!
initializedInstance

	^self example1! !

!PluggableCheckboxMorph class methodsFor: 'examples' stamp: 'hlsf 4/2/2022 14:37:47'!
example1
"
	self example1 openInWorld
"
	^ self 
		model: (ValueHolder with: true)
		getSelected:  #propertyValue
		setSelected:  #propertyValue:
		label: 'I like Cuis-Smalltalk'::
		setBalloonText: 'I am a check box illustrated with a text label.';
		yourself! !

!PluggableCheckboxMorph class methodsFor: 'examples' stamp: 'hlsf 4/2/2022 14:40:24'!
example2
"
	self example2 openInWorld
"
	^ self 
		model: (ValueHolder with: false)
		getSelected:  #propertyValue
		setSelected:  #propertyValue:
		label: (ImageMorph new image: (Theme current globeIcon magnifyTo: 32@32)) ::
		setBalloonText: 'I am a check box illustrated with a morph.';
		yourself! !

!PluggableCheckboxMorph class methodsFor: 'instance creation' stamp: 'drgeo 9/11/2022 23:22:53'!
model: aModel getSelected: getter setSelected: setter label: aMorphOrString
	| checkbox | 
	checkbox _ 	(aMorphOrString is: #Morph) 
		ifTrue: [self fromMorphsDict: 	(Dictionary  newFromPairs: {aMorphOrString printString .  aMorphOrString})]
		ifFalse: [self fromList: (Array with: aMorphOrString)	 buttonOnLeft: false].
	aMorphOrString ifNil: [self error: 'Label must be a string or a morph'].
	checkbox model: aModel ;
		getSelected: getter;
		setSelected: setter.
	"Update the view"
	aModel changed: setter.
	^ checkbox ! !

!RadioGroup methodsFor: 'accessing' stamp: 'hlsf 1/27/2022 11:55:42'!
buttonClass
" What kind of button am I, check or radio? "
	^ RadioButtonMorph ! !

!RadioGroup methodsFor: 'events' stamp: 'hlsf 1/27/2022 12:05:52'!
newSelection: radioButton

	"Unselect other buttons"
	self buttons do: [ :b | b == radioButton ifFalse: [ b isSelected: false ] ].
	self triggerEvent: #informRadioSelection with: (self symbolForButton: radioButton)
	! !

!RadioGroup methodsFor: 'events' stamp: 'hlsf 1/27/2022 13:34:58'!
registerEvents

	^ self buttons do: [ :b | b when: #radioSelection send: #newSelection: to: self ]! !

!RadioGroup methodsFor: 'events' stamp: 'hlsf 1/27/2022 13:35:37'!
registerEventsFor: aMorph with: aButton
"Make button react to a Morph"

	super registerEventsFor: aMorph with: aButton .
	aMorph 
		setProperty: #'mouseButton1Up:localPosition:'
		toValue: [ :event :position |  aButton select ]! !

!RadioGroup class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:59:20'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!RadioGroup class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:40:06'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!RadioGroup class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:40:33'!
initializedInstance

	^self example1! !

!RadioGroup class methodsFor: 'examples' stamp: 'hlsf 1/27/2022 20:50:25'!
example1
"
	self example1 openInWorld
"
	| group |
	group _ self fromList: #('guess YES' 'guess NO').
	group 	buttons do: [:each | 
			each when: #radioSelection send: #show: to: Transcript].
	^ group! !

!RadioGroup class methodsFor: 'examples' stamp: 'hlsf 1/27/2022 12:43:47'!
example2
	"Answer a RadioGroup of images"
"
	RadioGroup example2 openInWorld.
"
	| pallet statusLabel radioSelection formsDict morphDict |
	statusLabel :=  LabelMorph initializedInstance.
	pallet := LayoutMorph newColumn.
	pallet addMorph: (WindowTitleMorph 
					title: 'Radio Graphic' ).
	formsDict := (Theme content 
						from: 'Theme' 
						get: {'16x16'. 'emotes'}
			      ) asDictionary.
	morphDict := Dictionary new.
	formsDict keysAndValuesDo: [ :aName :aForm |
		morphDict 
			at: aName 
			put: (ImageMorph new image: (aForm magnifyTo: 32@32))
	].
	radioSelection := RadioGroup fromMorphsDict: morphDict.
	statusLabel contents: 'unselected'.
	pallet addMorph: statusLabel.
	pallet addMorph: radioSelection.
	radioSelection 
		when: #informRadioSelection 
		send: #contents: 
		to:  statusLabel.
	
	^pallet! !

!DropDownButtonMorph methodsFor: 'action' stamp: 'hlsf 4/2/2022 12:16:28'!
toggleDropDownList
	dropDownList owner 
		ifNil: [	
			self world addMorphFront: dropDownList position: 
				self morphPositionInWorld 
					+ self morphBottomLeft 
					- (dropDownList scroller xSeparation @0) ]
		ifNotNil: [dropDownList delete]! !

!DropDownButtonMorph methodsFor: 'action' stamp: 'hlsf 2/13/2022 09:50:08'!
update: action
	super update: action.
	action == setMorphIndex 
		ifTrue: [
			self updateButton.
			dropDownList delete]! !

!DropDownButtonMorph methodsFor: 'action' stamp: 'hlsf 1/22/2022 15:23:51'!
updateButton
	| form |
	form _ (dropDownList getListItem: dropDownList getCurrentSelectionIndex) imageForm: 32.
	button
		icon: form;
		morphExtent: form extent;
		redrawNeeded 
	! !

!DropDownButtonMorph methodsFor: 'accessing' stamp: 'hlsf 1/22/2022 15:03:53'!
adoptWidgetsColor: paneColor
	super adoptWidgetsColor: paneColor.
	dropDownList adoptWidgetsColor: paneColor! !

!DropDownButtonMorph methodsFor: 'accessing' stamp: 'hlsf 1/21/2022 10:24:43'!
model: anObject
	"Set my model and make me me a dependent of the given object."
	model ifNotNil: [model removeActionsWithReceiver: self].
	anObject ifNotNil: [anObject addDependent: self].
	model _ anObject! !

!DropDownButtonMorph methodsFor: 'accessing' stamp: 'hlsf 4/2/2022 14:22:45'!
selectedItem
	^ dropDownList getCurrentSelectionIndex = 0
		ifTrue: [nil]
		ifFalse: [dropDownList getListItem: dropDownList getCurrentSelectionIndex]! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'hlsf 3/24/2022 11:12:26'!
autoDeselect: aBoolean
	dropDownList autoDeselect: aBoolean ! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'hlsf 2/13/2022 10:36:33'!
defaultBorderWidth
	"answer the default border width for the receiver"
	^ 0! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'hlsf 1/21/2022 10:25:13'!
defaultColor
	"answer the default color/fill style for the receiver"
	^ `Color lightGray`! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'hlsf 4/2/2022 12:03:37'!
installButtons
	|  arrowButton |
	button _ PluggableButtonMorph new ::
		borderWidth: 0;
		model: self;
		action: #toggleDropDownList.
	self updateButton.
	arrowButton _ PluggableButtonMorph new ::
		iconDrawSelector: #drawDownIcon;
		model: self;
		action: #toggleDropDownList;
		morphExtent: Theme current scrollbarThickness asPoint.
	self separation: 0 @ 4.
	self 
		addMorph: button 
		layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: #center).
	self	
		addMorph: arrowButton 
		layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: #center).
	self morphExtent: 0@0. "Shrink to the minimum"! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'hlsf 2/15/2022 22:00:48'!
model: anObject listGetter: getListSel indexGetter: getSelectionSel indexSetter: setSelectionSel
	self model: anObject.
	setMorphIndex _ setSelectionSel .
	dropDownList _ PluggableDropDownListOfMorph 
		model: anObject 
		listGetter: getListSel 
		indexGetter: getSelectionSel 
		indexSetter: setSelectionSel.
	self installButtons! !

!DropDownButtonMorph methodsFor: 'submorphs-add/remove' stamp: 'hlsf 1/22/2022 11:27:41'!
delete
	super delete.
	dropDownList delete! !

!DropDownButtonMorph methodsFor: 'geometry testing' stamp: 'hlsf 5/15/2022 12:47:57'!
hasVariableExtent
	^ false! !

!DropDownButtonMorph class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:59:35'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!DropDownButtonMorph class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:41:52'!
includeInNewMorphMenu
	
	^ true! !

!DropDownButtonMorph class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:41:58'!
initializedInstance

	^self example1! !

!DropDownButtonMorph class methodsFor: 'instance creation' stamp: 'hlsf 1/21/2022 10:23:52'!
model: anObject listGetter: getListSel indexGetter: getSelectionSel indexSetter: setSelectionSel
	"Create a 'pluggable' list view on the given model parameterized by the given message selectors."
	^self new
		model: anObject listGetter: getListSel indexGetter: getSelectionSel indexSetter: setSelectionSel ! !

!DropDownButtonMorph class methodsFor: 'instance creation' stamp: 'hlsf 1/21/2022 10:27:53'!
new
	^ self newRow! !

!DropDownButtonMorph class methodsFor: 'examples' stamp: 'hlsf 4/2/2022 14:33:06'!
example1
"
	self example1 openInWorld
"
| palette |
	palette _ #(#blue #white #red #green #black #orange) collect: [ :aColor |
		BoxedMorph new ::
			morphExtent: 80@15;
			color: (Color perform: aColor);
			borderWidth: 1;
			borderColor: Color black;
			yourself].
	^ DropDownButtonMorph 
		model: (ListModel with: palette)
		listGetter: #list
		indexGetter: #listIndex
		indexSetter: #listIndex:! !

!DropDownListMorph methodsFor: 'initialization' stamp: 'hlsf 4/2/2022 12:09:21'!
model: anObject listGetter: getListSel indexGetter: getSelectionSel indexSetter: setSelectionSel
	self model: anObject.
	setMorphIndex _ setSelectionSel .
	dropDownList _ PluggableDropDownListMorph 
		model: anObject 
		listGetter: getListSel 
		indexGetter: getSelectionSel 
		indexSetter: setSelectionSel
		mainView: nil
		menuGetter: nil
		keystrokeAction: nil.		
	self installButtons! !

!DropDownListMorph methodsFor: 'action' stamp: 'hlsf 9/28/2023 21:27:10'!
buttonWidth 
	^ (dropDownList list 
		ifEmpty: [30] 
		ifNotEmpty: [:aList | aList max: [: aLabel |  dropDownList scroller widthToDisplayItem: aLabel] ])
		+20! !

!DropDownListMorph methodsFor: 'action' stamp: 'hlsf 4/2/2022 11:49:59'!
toggleDropDownList
	dropDownList owner 
		ifNil: [	
			self world addMorphFront: dropDownList position: 
				self morphPositionInWorld 
					+ self morphBottomLeft]
		ifNotNil: [dropDownList delete]! !

!DropDownListMorph methodsFor: 'action' stamp: 'hlsf 9/28/2023 21:24:56'!
updateButton
	| label |
	label := dropDownList getCurrentSelectionIndex = 0
		ifTrue: ['']
		ifFalse: [dropDownList getListItem: dropDownList getCurrentSelectionIndex].
	button label: label;
		morphExtent: self buttonWidth @ FontFamily defaultPointSize;
		redrawNeeded! !

!DropDownListMorph class methodsFor: 'examples' stamp: 'hlsf 4/2/2022 14:36:05'!
example1
"
	self example1 openInWorld
"
	^ self 
		model: (ListModel with: #(#blue #white #red #green #black #orange) )
		listGetter: #list 
		indexGetter: #listIndex 
		indexSetter: #listIndex:! !

!InnerListOfMorph methodsFor: 'initialization' stamp: 'hlsf 1/20/2022 11:08:38'!
defaultColor
	^ `Color white`! !

!InnerListOfMorph methodsFor: 'initialization' stamp: 'hlsf 1/20/2022 11:11:47'!
initialize
	super initialize.
	self separation: 8@8.
	self morphWidth: 0.
	selectedRow _ highlightedRow _ nil! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 1/16/2022 10:24:49'!
highlightedRow: n
	highlightedRow = n ifFalse: [
		highlightedRow ifNotNil: [
			self invalidateLocalRect: (self drawBoundsForRow: highlightedRow) ].
		highlightedRow _ n.
		highlightedRow ifNotNil: [
			self invalidateLocalRect: (self drawBoundsForRow: highlightedRow) ].
		].! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 1/20/2022 11:06:04'!
listChanged
	highlightedRow _ 	selectedRow _ nil.! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 1/19/2022 21:02:38'!
rowAtLocation: aPoint 
	| detectedRow |
	detectedRow _ 0.
	1 to: submorphs size do: [:row |
		((self drawBoundsForRow: row) containsPoint: aPoint)
			ifTrue: [ detectedRow _ row] 		].
	^ detectedRow ! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 1/19/2022 20:58:37'!
rowAtLocation: aPoint ifNone: aNoneBlock
	| detectedRow|
	1 to: submorphs size do: [:row |
		((self drawBoundsForRow: row) containsPoint: aPoint)
			ifTrue: [ detectedRow _ row]		].
	^ detectedRow ifNil: aNoneBlock ! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 1/19/2022 21:12:44'!
selectedRow
	"return the currently selected row, or nil if none is selected"
	^selectedRow! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 1/19/2022 21:12:19'!
selectedRow: index
	"select the index-th row.  if nil, remove the current selection"
	selectedRow = index ifFalse: [
		selectedRow ifNotNil: [
			self invalidateLocalRect: (self drawBoundsForRow: selectedRow) ].
		highlightedRow ifNotNil: [
			self invalidateLocalRect: (self drawBoundsForRow: highlightedRow) ].
		selectedRow _ index.
		highlightedRow _ nil.
		selectedRow ifNotNil: [
			self invalidateLocalRect: (self drawBoundsForRow: selectedRow) ].
		].! !

!InnerListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/16/2022 09:20:28'!
adjustExtent
	self morphExtent: self minimumExtent ! !

!InnerListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/21/2022 11:17:50'!
maximumItemHeight
"The maximum height among the item"
	^ submorphs 
		ifEmpty: [0]
		ifNotEmpty: [submorphs max: [:morph | morph fullBoundsInOwner height + (self ySeparation * 2)]]! !

!InnerListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/21/2022 11:10:18'!
minimumWidth
"The minium width to consider to fit in the UI"
	^ submorphs 
		ifEmpty: [0]
		ifNotEmpty: [submorphs max: [:morph | morph fullBoundsInOwner width + (self xSeparation * 2)]]! !

!InnerListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/21/2022 11:11:13'!
totalHeight
"The complete height of the list, when fully viewable"
	^ submorphs 
		inject: self ySeparation * 2 
		into: [:totalHeight :morph | totalHeight  + morph fullBoundsInOwner height]! !

!InnerListOfMorph methodsFor: 'drawing' stamp: 'hlsf 1/20/2022 11:11:28'!
drawBoundsForRow: row
"calculate the bounds that row should be drawn at.  This might be outside our bounds!!"
	^ (submorphs atLast: row) fullBoundsInOwner expandBy: separation * (1 @ 0.5)
! !

!InnerListOfMorph methodsFor: 'drawing' stamp: 'hlsf 1/19/2022 21:13:31'!
drawHighlightOn: aCanvas
	| selectionDrawBounds |
	highlightedRow ifNil: [ ^self ].
	highlightedRow = 0 ifTrue: [ ^self ].
	selectionDrawBounds _ self drawBoundsForRow: highlightedRow.
	selectionDrawBounds _ selectionDrawBounds intersect: self morphLocalBounds.
	aCanvas
		fillRectangle: selectionDrawBounds
		color: ((Theme current listHighlightFocused: owner hasKeyboardFocus) alpha: 0.3)! !

!InnerListOfMorph methodsFor: 'drawing' stamp: 'hlsf 1/19/2022 21:21:59'!
drawOn: aCanvas
	super drawOn: aCanvas .
	self drawHighlightOn: aCanvas.
	self drawSelectionOn: aCanvas ! !

!InnerListOfMorph methodsFor: 'drawing' stamp: 'hlsf 1/18/2022 21:29:27'!
drawSelectionOn: aCanvas
	| selectionDrawBounds |
	selectedRow ifNil: [ ^self ].
	selectedRow = 0 ifTrue: [ ^self ].
	selectionDrawBounds _ self drawBoundsForRow: selectedRow.
	selectionDrawBounds _ selectionDrawBounds intersect: self morphLocalBounds.
	aCanvas
		fillRectangle: selectionDrawBounds
		color: (Theme current listHighlightFocused: owner hasKeyboardFocus)! !

!InnerListOfMorph methodsFor: 'private' stamp: 'hlsf 1/19/2022 21:07:52'!
noSelection
	selectedRow _ nil.
	highlightedRow _ nil! !

!InnerListOfMorph class methodsFor: 'new-morph participation' stamp: 'hlsf 1/14/2022 09:48:30'!
includeInNewMorphMenu
	^ false! !

!InnerListOfMorph class methodsFor: 'instance creation' stamp: 'hlsf 1/14/2022 11:10:50'!
new
	^ self newColumn! !

!PluggableDropDownListMorph methodsFor: 'event handling' stamp: 'hlsf 4/2/2022 12:09:08'!
keyboardFocusChange: aBoolean
	aBoolean ifFalse: [		self delete ].! !

!PluggableDropDownListMorph methodsFor: 'updating' stamp: 'hlsf 9/28/2023 21:16:05'!
updateList
	super updateList.
	self morphExtent: scroller desiredWidth + 30 @ extent y! !

!PluggableDropDownListMorph methodsFor: 'as yet unclassified' stamp: 'hlsf 9/28/2023 21:20:34'!
list
	^ list! !

!PluggableListOfMorph methodsFor: 'access' stamp: 'hlsf 1/21/2022 11:25:23'!
getList
	getListSelector 		ifNil: [^ #()].
	list _ model perform: getListSelector.
	list ifNil: [^ #()].	
	scroller removeAllMorphs.
	list do: [:aMorph | 	self addToScroller: aMorph].
	self suitedExtent.
	^ list! !

!PluggableListOfMorph methodsFor: 'initialization' stamp: 'hlsf 1/22/2022 12:39:41'!
initialize
	super initialize.
	self hHideScrollBar.! !

!PluggableListOfMorph methodsFor: 'initialization' stamp: 'hlsf 1/8/2022 12:09:36'!
innerMorphClass
	^ InnerListOfMorph ! !

!PluggableListOfMorph methodsFor: 'testing' stamp: 'hlsf 1/8/2022 12:10:10'!
is: aSymbol
	^ aSymbol == #PluggableListOfMorph or: [ super is: aSymbol ]! !

!PluggableListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/21/2022 11:17:30'!
minimumItemExtent
"the minimum list item extent to consider to fit in the UI"
	^ scroller minimumWidth @ scroller maximumItemHeight ! !

!PluggableListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/16/2022 09:55:03'!
scrollDeltaHeight
	^ scroller submorphs min: [:item | item fullBoundsInOwner height]! !

!PluggableListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/22/2022 10:47:06'!
suitedExtent
	self morphHeight: (extent y min: scroller totalHeight max: 100).
	self morphWidth: self minimumExtent x + scroller minimumWidth! !

!PluggableListOfMorph methodsFor: 'as yet unclassified' stamp: 'hlsf 6/5/2022 11:18:17'!
defaultBorderWidth
	^ 1! !

!PluggableListOfMorph class methodsFor: 'examples' stamp: 'hlsf 4/2/2022 14:35:12'!
example1
"
	self example1 openInWorld
"
| palette |
	palette _ #(#blue #white #red #green #black #orange) collect: [ :aColor |
		BoxedMorph new ::
			morphExtent: 80@15;
			color: (Color perform: aColor);
			borderWidth: 1;
			borderColor: Color black;
			yourself].
	^ PluggableListOfMorph 
		model: (ListModel with: palette)
		listGetter: #list
		indexGetter: #listIndex
		indexSetter: #listIndex:! !

!PluggableDropDownListOfMorph methodsFor: 'as yet unclassified' stamp: 'hlsf 4/2/2022 12:08:25'!
keyboardFocusChange: aBoolean
	aBoolean ifFalse: [		self delete ].! !

!MultiSelectMenu methodsFor: 'events-processing' stamp: 'KenD 12/17/2016 14:36:43'!
accept

	self modalSelection: self result! !

!MultiSelectMenu methodsFor: 'events-processing' stamp: 'KenD 12/17/2016 14:33:01'!
cancel

	self modalSelection: self seed! !

!MultiSelectMenu methodsFor: 'events-processing' stamp: 'KenD 12/17/2016 15:59:22'!
toggle: nameSymbol

	| index bit |
	index := self choices indexOf: nameSymbol.
	bit := index - 1.
	
	(index = 1)
	ifTrue:  [  
		self result: 0.
		self clearAllButZero.
	]
	ifFalse: [ | menuItem bitClear |
		menuItem := self itemFor: nameSymbol.
		bitClear := (self result bitAt: bit) isZero.
		bitClear 
			ifTrue: [ "Set bit"
				self result: (self result bitAt: bit put: 1).
				menuItem contents: ('<on>', menuItem contents).
			]
			ifFalse: [ "Clear bit"
				self result: (self result bitAt: bit put: 0).
				menuItem contents: ('<off>', menuItem contents).
			] 
	].
	
	self updateZeroMarker.! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 12/17/2016 13:31:57'!
choices

	^ choices ! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 12/17/2016 14:36:58'!
result

	^ result ! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 12/17/2016 14:37:13'!
result: newResult

	result := newResult ! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 12/17/2016 13:32:09'!
seed

	^ seed ! !

!MultiSelectMenu methodsFor: 'initialization' stamp: 'KenD 5/15/2018 00:10:12'!
choices: aSymbolCollection seed: initialValue

	super initialize.
	self stayUp: true.
	choices := aSymbolCollection.
	seed := initialValue.
	result := seed.
	"Add my selections" 
	self choices do: [ :nameSymbol |
		self add: (self tagFromSeedFor: nameSymbol)
			  target: self 
			  action: #toggle: 
			  argument: nameSymbol.
	].
	self updateZeroMarker.
		
	self addLine.
	
	self add: 'ACCEPT' 
		  target: self 
		  action: #accept.
	self add: 'CANCEL' 
		  target: self 
		  action: #cancel.
! !

!MultiSelectMenu methodsFor: 'initialization' stamp: 'KenD 12/17/2016 14:35:16'!
choices: aSymbolCollection seed: initialValue title: aString

	self choices: aSymbolCollection seed: initialValue.
	self addTitle: aString.! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 15:49:12'!
clearAllButZero
	"Set 'zero' selector to '<on>' => everyone else is '<off>'"

	| zeroName |
	zeroName := self choices at: 1.
	self submorphsDo: [ :item |
		((item isKindOf: MenuItemMorph) and: [ self choices includes: item contents ])
		ifTrue: [ (item contents = zeroName)
				ifFalse: [ item contents: '<off>', item contents ]
				ifTrue:  [ item contents: '<on>' , item contents ]. "zero marker"
		]
	]  
! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 15:12:07'!
clearForZero
	"Set 'zero' selector to '<on>'"

	| zeroName zeroItem |
	zeroName := self choices at: 1.
	zeroItem := self submorphs detect:
		[ :item | (item isKindOf: MenuItemMorph) and: [ item contents = zeroName ] ].
	zeroItem contents: '<off>' , zeroName asString.! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 15:34:11'!
itemFor: nameSymbol

	^ self submorphs detect: [ :item |
			(item isKindOf: MenuItemMorph) 
				and: [ item contents = nameSymbol ]
	  ]! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 15:12:15'!
setForZero
	"Set 'zero' selector to '<on>'"

	| zeroName zeroItem |
	zeroName := self choices at: 1.
	zeroItem := self submorphs detect:
		[ :item | (item isKindOf: MenuItemMorph) and: [ item contents = zeroName ] ].
	zeroItem contents: '<on>' , zeroName asString.! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 14:08:36'!
tagFromSeedFor: nameSymbol
	"Answer nameSymbol preceeded by '<on>' or '<off>'"

	| index bit |
	index := self choices indexOf: nameSymbol.
	bit := index - 1.
	
	^ ((seed bitAt: bit) isZero)
		ifTrue:   [ '<off>' , nameSymbol asString ]
		ifFalse:  [ '<on>'  , nameSymbol asString ]! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 15:24:12'!
updateZeroMarker
	"If no choices checked, set zero'th choice, else clear it"

	(self result isZero)
		ifTrue:  [ self clearAllButZero ]
		ifFalse: [ self clearForZero ].! !

!MultiSelectMenu class methodsFor: 'instance creation' stamp: 'KenD 12/17/2016 14:01:56'!
choices: aSymbolCollection seed: initialValue
"
	(MultiSelectMenu choices: TextEmphasis choices seed: 3) openInHand.
"
	^ self new choices: aSymbolCollection seed: initialValue! !

!MultiSelectMenu class methodsFor: 'instance creation' stamp: 'KenD 12/17/2016 14:39:40'!
choices: aSymbolCollection seed: initialValue title: aString
"
	(MultiSelectMenu choices: TextEmphasis choices seed: 3 title: 'Text Emphasis') invokeModal inspect.
"
	^ self new choices: aSymbolCollection seed: initialValue title: aString ! !

!MultiSelectMenu class methodsFor: 'new-morph participation' stamp: 'KenD 12/23/2016 09:13:31'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 1/27/2022 13:31:34'!
defaultBorderWidth

	^ 4! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 1/25/2022 20:44:36'!
defaultColor

	^ `Color gray lighter lighter`! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 1/25/2022 20:44:42'!
defaultDiameter

	^ self class defaultDiameter ! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 1/25/2022 20:45:10'!
initialize

	super initialize.
	isSelected := false.
	self borderColor: self defaultColor.
	self ofSize: self defaultDiameter! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 3/14/2023 21:12:14'!
ofSize: numPixels

	| size scale |
	scale _  (Preferences at: #standardButtonFont) pointSize / 14.0.
	size _ numPixels * scale.
	self borderWidth: ((self defaultBorderWidth * scale) truncated max: 1).
	self morphExtent: size @ size.
	self layoutSpec: (LayoutSpec 
							fixedWidth: size 
							fixedHeight: size
							offAxisEdgeWeight:  #center)! !

!CheckButtonMorph methodsFor: 'event handling testing' stamp: 'hlsf 1/25/2022 20:45:57'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"
	^true! !

!CheckButtonMorph methodsFor: 'event handling testing' stamp: 'hlsf 1/25/2022 20:46:01'!
handlesMouseOver: evt
	"Do I want to receive mouseEnter: and mouseLeave: when the button is up and the hand is empty?" 
	^true! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 1/25/2022 20:46:19'!
fillColor: aColor
	"My color is my fillColor"
	self color: aColor
	! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 1/25/2022 20:46:23'!
isSelected

	^ isSelected ! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 2/12/2022 10:38:24'!
isSelected: aBoolean
	self selected: aBoolean.
	self triggerEvent: #checkSelection with: self
! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 1/25/2022 20:46:45'!
select
	"Select me if unselected"

	(self isSelected) ifFalse: [ self isSelected: true ]
! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 2/12/2022 10:36:41'!
selected: aBoolean
"Do not emit event. Should it not be the prerogative of the model?"
	(isSelected _ aBoolean)
		ifFalse: [self fillColor: self defaultColor] 
		ifTrue: [	self fillColor: Color black]. ! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 1/25/2022 20:46:49'!
toggleSelection

	self isSelected: self isSelected not
! !

!CheckButtonMorph methodsFor: 'event handling' stamp: 'hlsf 1/25/2022 21:07:03'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition
	(self coversPixel: aMouseButtonEvent eventPosition)
		ifTrue: [ self toggleSelection ]
! !

!CheckButtonMorph methodsFor: 'event handling' stamp: 'hlsf 1/25/2022 21:07:16'!
mouseEnter: event
	"The mouse has entered the area of the receiver"
	self isSelected ifFalse: [ | baseColor | 
		baseColor _ self defaultColor.
		self fillColor: ( Color h: baseColor hue s: baseColor saturation * 1.3 v: baseColor brightness * 0.6)]! !

!CheckButtonMorph methodsFor: 'event handling' stamp: 'hlsf 1/25/2022 20:47:06'!
mouseLeave: event
	"The mouse has left the area of the receiver"

	self isSelected ifFalse: [ self fillColor: self defaultColor ]! !

!CheckButtonMorph methodsFor: 'event handling' stamp: 'hlsf 1/25/2022 20:47:11'!
update: aParameter

	self redrawNeeded! !

!CheckButtonMorph methodsFor: 'geometry testing' stamp: 'hlsf 5/15/2022 12:44:16'!
hasVariableExtent
"Does not make sense to be fitted in owner morph"
	^ false! !

!CheckButtonMorph class methodsFor: 'accessing' stamp: 'hlsf 7/3/2022 13:07:38'!
defaultDiameter

	^ (Preferences at: #standardButtonFont) lineSpacing! !

!CheckButtonMorph class methodsFor: 'new-morph participation' stamp: 'hlsf 1/25/2022 20:47:33'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!CheckButtonMorph class methodsFor: 'examples' stamp: 'hlsf 5/14/2022 11:17:55'!
example1
"
	self example1 openInWorld
"
	| checkButton |
	 checkButton _ CheckButtonMorph new.
	checkButton when: #checkSelection send: #show: to: Transcript.
	^ checkButton ! !

!CheckButtonMorph class methodsFor: 'instance creation' stamp: 'hlsf 1/25/2022 20:48:51'!
ofSize: numPixels

	^ self new ofSize: numPixels! !

!RadioButtonMorph methodsFor: 'accessing' stamp: 'hlsf 1/25/2022 20:48:05'!
isSelected: aBoolean
	(isSelected := aBoolean)
		ifFalse: [self fillColor: self defaultColor] 
		ifTrue: [
			self fillColor: Color black. 
			self triggerEvent: #radioSelection with: self 		]
! !

!RadioButtonMorph methodsFor: 'drawing' stamp: 'hlsf 1/25/2022 20:36:15'!
drawOn: aCanvas 
	| radius |
	radius _ extent // 2.
	aCanvas ellipseCenter: radius radius: radius borderWidth: borderWidth borderColor: borderColor fillColor: color! !

!RadioButtonMorph methodsFor: 'event handling' stamp: 'hlsf 1/25/2022 20:59:26'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	((self coversPixel: aMouseButtonEvent eventPosition) and: [self isSelected not])
		ifTrue: [ self isSelected: true ]
! !
