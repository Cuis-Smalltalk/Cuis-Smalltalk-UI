'From Cuis7.9 [latest update: #8031] on 28 June 2026 at 10:21:53 am'!
'Description I supply simple click-select elements.'!
!provides: 'UI-Click-Select' 1 102!
!requires: 'UI-Widgets' 1 48 nil!
!requires: 'Cuis-Base' 75 7262 nil!
!requires: 'UI-Core' 1 0 nil!
SystemOrganization addCategory: #'UI-Click-Select'!


!classDefinition: #CheckGroup category: #'UI-Click-Select'!
LinearLayoutMorph subclass: #CheckGroup
	instanceVariableNames: 'list font buttonOnLeft buttons'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'CheckGroup class' category: #'UI-Click-Select'!
CheckGroup class
	instanceVariableNames: ''!

!classDefinition: #PluggableCheckboxMorph category: #'UI-Click-Select'!
CheckGroup subclass: #PluggableCheckboxMorph
	instanceVariableNames: 'model getSelected setSelected'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'PluggableCheckboxMorph class' category: #'UI-Click-Select'!
PluggableCheckboxMorph class
	instanceVariableNames: ''!

!classDefinition: #RadioGroup category: #'UI-Click-Select'!
CheckGroup subclass: #RadioGroup
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'RadioGroup class' category: #'UI-Click-Select'!
RadioGroup class
	instanceVariableNames: ''!

!classDefinition: #DropDownButtonMorph category: #'UI-Click-Select'!
LinearLayoutMorph subclass: #DropDownButtonMorph
	instanceVariableNames: 'model dropDownList setMorphIndex button'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'DropDownButtonMorph class' category: #'UI-Click-Select'!
DropDownButtonMorph class
	instanceVariableNames: ''!

!classDefinition: #DropDownListMorph category: #'UI-Click-Select'!
DropDownButtonMorph subclass: #DropDownListMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'DropDownListMorph class' category: #'UI-Click-Select'!
DropDownListMorph class
	instanceVariableNames: ''!

!classDefinition: #InnerListOfMorph category: #'UI-Click-Select'!
LinearLayoutMorph subclass: #InnerListOfMorph
	instanceVariableNames: 'highlightedRow selectedRow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'InnerListOfMorph class' category: #'UI-Click-Select'!
InnerListOfMorph class
	instanceVariableNames: ''!

!classDefinition: #MultiSelectMenu category: #'UI-Click-Select'!
MenuMorph subclass: #MultiSelectMenu
	instanceVariableNames: 'choices seed result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'MultiSelectMenu class' category: #'UI-Click-Select'!
MultiSelectMenu class
	instanceVariableNames: ''!

!classDefinition: #PluggableDropDownListMorph category: #'UI-Click-Select'!
PluggableListMorph subclass: #PluggableDropDownListMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'PluggableDropDownListMorph class' category: #'UI-Click-Select'!
PluggableDropDownListMorph class
	instanceVariableNames: ''!

!classDefinition: #PluggableListOfMorph category: #'UI-Click-Select'!
PluggableListMorph subclass: #PluggableListOfMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'PluggableListOfMorph class' category: #'UI-Click-Select'!
PluggableListOfMorph class
	instanceVariableNames: ''!

!classDefinition: #PluggableDropDownListOfMorph category: #'UI-Click-Select'!
PluggableListOfMorph subclass: #PluggableDropDownListOfMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'PluggableDropDownListOfMorph class' category: #'UI-Click-Select'!
PluggableDropDownListOfMorph class
	instanceVariableNames: ''!

!classDefinition: #CheckButtonMorph category: #'UI-Click-Select'!
BorderedBoxMorph subclass: #CheckButtonMorph
	instanceVariableNames: 'isSelected hoverColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'CheckButtonMorph class' category: #'UI-Click-Select'!
CheckButtonMorph class
	instanceVariableNames: ''!

!classDefinition: #RadioButtonMorph category: #'UI-Click-Select'!
CheckButtonMorph subclass: #RadioButtonMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'RadioButtonMorph class' category: #'UI-Click-Select'!
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

!PluggableListOfMorph commentStamp: 'hlsf 1/14/2022 11:01:29' prior: 0!
I am a vertical list of Morph. I have no horizontal scrollbar but I may have a vertical one.
My width is adjusted to the larger morph of my list.!

!PluggableDropDownListOfMorph commentStamp: '<historical>' prior: 0!
I am a list of Morph with a modal behavior. When the user moves the mouse cursor outisde of me, I am deleted.!

!CheckButtonMorph commentStamp: 'hlsf 6/8/2024 12:06:19' prior: 0!
I am simple check button.

Convention: 
- defaultColor : the color when I am checked
- defaultBorderColor: the color when I am unchecked!

!RadioButtonMorph commentStamp: '<historical>' prior: 0!
I am a very simple radio button.!

!CheckGroup methodsFor: 'accessing' stamp: 'hlsf 27/Jan/2022, 9:55:54 am (UTC)'!
buttonClass
" What kind of button am I, check or radio? "
	^ CheckButtonMorph ! !

!CheckGroup methodsFor: 'accessing' stamp: 'hlsf 27/Jan/2022, 9:49:38 am (UTC)'!
buttonFor: aSymbol
	"Return aRadioButton corresponding to selector"
	
	| symbols row |
	symbols := self list.
	row :=  submorphs at: ((symbols size) + 1 - (symbols indexOf: aSymbol ifAbsent: [ ^nil ])).
	^ row submorphs detect: [ :s | s class == self buttonClass ] ifNone: [ nil ]! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 19/Nov/2013, 7:02:00 pm (UTC)'!
buttonOnLeft

	^ buttonOnLeft ! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 20/Nov/2013, 11:56:00 am (UTC)'!
buttons

	^ buttons! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 19/Nov/2013, 5:46:00 pm (UTC)'!
font

	^ font! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 19/Nov/2013, 5:45:00 pm (UTC)'!
labelStrings

	^ self list collect: [ :each | each asString ]! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 19/Nov/2013, 5:45:00 pm (UTC)'!
list
	"Answer my array of label symbols"

	^ list! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 2:18:00 pm (UTC)'!
rowFor: aSymbol
	"My rows are submorphs inversly ordered from my list"
	
	| symbols |
	symbols := self list.

	^ self submorphs at: ((symbols size) + 1 - (symbols indexOf: aSymbol ifAbsent: [ ^nil ]))! !

!CheckGroup methodsFor: 'accessing' stamp: 'KenD 20/Nov/2013, 12:49:00 pm (UTC)'!
symbolForButton: radioButton

	^ self list at: (self buttons indexOf: radioButton)! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 14/Feb/2022, 9:36:10 am (UTC)'!
adjustLabels: labelList to: maxStringWidth
| labelLayout |
	"Make all labels have same width"
	labelLayout := LayoutSpec 
			fixedWidth: maxStringWidth + 4
			fixedHeight: self font lineSpacing 
			offAxisEdgeWeight: #center.
	labelList do: [ :label | label layoutSpec: labelLayout ].! !

!CheckGroup methodsFor: 'initialization' stamp: 'KenD 20/Nov/2013, 1:05:00 pm (UTC)'!
buttonOnLeft: aBoolean

	buttonOnLeft := aBoolean ! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 14/Feb/2022, 9:36:41 am (UTC)'!
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

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 5/Apr/2025, 8:16:29 am (UTC)'!
fromMorphsDict: morphDict
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

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 5/Apr/2025, 8:16:56 am (UTC)'!
initialize
	"Initialize self to harmless values"
	
	super initialize.
	list := #().
	self setFont: (Preferences at: #standardButtonFont);
		 buttonOnLeft: true;
		 separation: 2@2;
		 color: Color transparent! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 5/Apr/2025, 8:14:35 am (UTC)'!
newButton

	^self buttonClass ofSize: self buttonClass defaultDiameter ::
		layoutSpec: LayoutSpec keepMorphExtent;
		yourself! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 27/Jan/2022, 11:37:38 am (UTC)'!
newButtonRow

	^ LayoutMorph newRow ::
		separation: 5; 
		color: Color transparent; 
		axisEdgeWeight: #rowLeft;
		yourself! !

!CheckGroup methodsFor: 'initialization' stamp: 'hlsf 27/Jan/2022, 11:34:10 am (UTC)'!
pack: button and: aMorph in: row

	self buttonOnLeft
		ifTrue: [ row  addMorph: button; addMorph: aMorph ] 
		ifFalse: [ row addMorph: aMorph; addMorph: button ]! !

!CheckGroup methodsFor: 'initialization' stamp: 'KenD 20/Nov/2013, 1:06:00 pm (UTC)'!
setFont: aFont

	font := aFont ! !

!CheckGroup methodsFor: 'geometry' stamp: 'hlsf 27/Jan/2022, 10:35:39 am (UTC)'!
naturalHeight
	"Answer the combined heights of my elements"
	
	^ 4  + ((self list size) 
		* (2 + ((self font lineSpacing) max: (self buttonClass defaultDiameter))))! !

!CheckGroup methodsFor: 'events' stamp: 'hlsf 3/Jul/2022, 11:06:45 am (UTC)'!
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

!CheckGroup methodsFor: 'events' stamp: 'hlsf 14/Jul/2025, 10:13:17 am (UTC)'!
newSelection: radioButton
	" Inform we have a new selection "
	self triggerEvent: #informCheckSelection with: (self symbolForButton: radioButton)
	! !

!CheckGroup methodsFor: 'events' stamp: 'hlsf 27/Jan/2022, 11:34:35 am (UTC)'!
registerEvents

	^ self buttons do: [ :b | b when: #checkSelection send: #newSelection: to: self ]! !

!CheckGroup methodsFor: 'events' stamp: 'hlsf 1/Mar/2026, 3:28:54 pm (UTC)'!
registerEventsFor: aMorph with: aButton
"Make button react to a Morph"

	aMorph 
		setProperty: #'handlesMouseDown:' 		
		toValue: true;
		
		setProperty: #'mouseButton1Up:localPosition:'
		toValue: [ :event :position |  aButton toggleSelection ];
		
		setProperty: #'handlesMouseOver:' 		
		toValue: true;
		
		setProperty: #'mouseEnter:' 
		toValue: [ :event | aButton mouseEnter: event ];

		setProperty: #'mouseLeave:' 
		toValue: [ :event | aButton mouseLeave: event ].
! !

!CheckGroup methodsFor: 'events' stamp: 'KenD 25/Nov/2013, 5:29:00 pm (UTC)'!
unselectAll

	self buttons do: [ :b | b isSelected: false ].
	self redrawNeeded 
	! !

!CheckGroup class methodsFor: 'examples' stamp: 'hlsf 2/May/2025, 10:44:35 am (UTC)'!
example1
"
	self example1 openInWorld
"
	| group |
	group := self fromList: #('Cuis-Smalltalk' 'Pharo' 'Squeak').
	group buttons do: [:each | 
		each when: #checkSelection send: #show: to: Transcript].
	^ group! !

!CheckGroup class methodsFor: 'examples' stamp: 'hlsf 30/Aug/2025, 9:41:35 am (UTC)'!
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
			put: (ImageMorph newWith: (aForm magnifyTo: 32@32))
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

!CheckGroup class methodsFor: 'examples' stamp: 'hlsf 12/Feb/2022, 9:29:15 am (UTC)'!
example3
"
	self example3 openInWorld
"
	| group |
	group _ self fromList: #('Cuis-Smalltalk' 'Pharo' 'Squeak') buttonOnLeft: false.
	group 	buttons do: [:each | 
			each when: #checkSelection send: #show: to: Transcript].
	^ group! !

!CheckGroup class methodsFor: 'instance creation' stamp: 'hlsf 12/Feb/2022, 9:42:30 am (UTC)'!
fromList: buttonLabels
	^ self fromList: buttonLabels buttonOnLeft: true! !

!CheckGroup class methodsFor: 'instance creation' stamp: 'hlsf 12/Feb/2022, 9:28:06 am (UTC)'!
fromList: buttonLabels buttonOnLeft: boolean
	"Add label list as array of symbols to a new instance of me"

	| listOfSymbols |
	listOfSymbols := OrderedCollection new.
	buttonLabels do: [ :each | listOfSymbols add: each asSymbol ].
	
	^ self newColumn
		buttonOnLeft: boolean;
		 fromList: listOfSymbols asArray ! !

!CheckGroup class methodsFor: 'instance creation' stamp: 'hlsf 5/Apr/2025, 8:16:29 am (UTC)'!
fromMorphsDict: aDictionaryOfMorphs
	"Add dict of (name->morph) to a new instance of me"

	^ self newColumn fromMorphsDict: aDictionaryOfMorphs ! !

!CheckGroup class methodsFor: 'instance creation' stamp: 'hlsf 12/Feb/2022, 9:43:05 am (UTC)'!
fromMorphsDict: aDictionaryOfMorphs buttonOnLeft: boolean
	^ self fromList: aDictionaryOfMorphs buttonOnLeft: true! !

!CheckGroup class methodsFor: 'new-morph participation' stamp: 'KenD 6/Dec/2013, 5:07:00 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!PluggableCheckboxMorph methodsFor: 'accessing' stamp: 'hlsf 12/Feb/2022, 7:41:40 am (UTC)'!
getSelected: aSymbol
	getSelected _ aSymbol ! !

!PluggableCheckboxMorph methodsFor: 'accessing' stamp: 'hlsf 12/Feb/2022, 8:20:21 am (UTC)'!
model: aModel
	model ifNotNil: [model removeActionsWithReceiver: self].
	aModel ifNotNil: [aModel addDependent: self].
	model _ aModel! !

!PluggableCheckboxMorph methodsFor: 'accessing' stamp: 'hlsf 12/Feb/2022, 7:41:44 am (UTC)'!
setSelected: aSymbol
	setSelected _ aSymbol ! !

!PluggableCheckboxMorph methodsFor: 'events' stamp: 'hlsf 12/Feb/2022, 8:28:52 am (UTC)'!
newSelection: radioButton
	super newSelection: radioButton.
	model perform: setSelected with: radioButton isSelected! !

!PluggableCheckboxMorph methodsFor: 'updating' stamp: 'hlsf 5/Apr/2025, 9:05:34 am (UTC)'!
update: aSymbol
	aSymbol == getSelected
		ifTrue: [self buttons first selected: (model perform: getSelected)].
	self redrawNeeded.! !

!PluggableCheckboxMorph methodsFor: 'initialization' stamp: 'hlsf 14/Feb/2022, 9:38:47 am (UTC)'!
adjustLabels: labels to: number
" We want to be free to adjust as we wish later. So do nothing "! !

!PluggableCheckboxMorph class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 12:59:10 pm (UTC)'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!PluggableCheckboxMorph class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 12:39:48 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!PluggableCheckboxMorph class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 12:41:13 pm (UTC)'!
initializedInstance

	^self example1! !

!PluggableCheckboxMorph class methodsFor: 'examples' stamp: 'hlsf 5/Apr/2025, 8:31:07 am (UTC)'!
example1
"
	self example1 morphPosition: 50@50; openInWorld
"
	^ self 
		model: (ValueHolder with: true)
		getSelected:  #propertyValue
		setSelected:  #propertyValue:
		label: 'I like Cuis-Smalltalk'::
		setBalloonText: 'I am a check box illustrated with a text label.';
		yourself! !

!PluggableCheckboxMorph class methodsFor: 'examples' stamp: 'hlsf 30/Aug/2025, 9:41:26 am (UTC)'!
example2
"
	self example2 openInWorld
"
	^ self 
		model: (ValueHolder with: false)
		getSelected:  #propertyValue
		setSelected:  #propertyValue:
		label: (ImageMorph newWith: (Theme current globeIcon magnifyTo: 32@32)) ::
			setBalloonText: 'I am a check box illustrated with a morph.';
		yourself! !

!PluggableCheckboxMorph class methodsFor: 'instance creation' stamp: 'hlsf 5/Apr/2025, 8:12:09 am (UTC)'!
model: aModel getSelected: getter setSelected: setter label: aMorphOrString
	| checkbox | 
	checkbox := (aMorphOrString is: #Morph) 
		ifTrue: [self fromMorphsDict: 	(Dictionary  newFromPairs: {aMorphOrString printString .  aMorphOrString})]
		ifFalse: [self fromList: (Array with: aMorphOrString)	 buttonOnLeft: false].
	aMorphOrString ifNil: [self error: 'Label must be a string or a morph'].
	checkbox model: aModel ;
		getSelected: getter;
		setSelected: setter.
	"Update the view"
	aModel changed: getter.
	^ checkbox ! !

!RadioGroup methodsFor: 'accessing' stamp: 'hlsf 27/Jan/2022, 9:55:42 am (UTC)'!
buttonClass
" What kind of button am I, check or radio? "
	^ RadioButtonMorph ! !

!RadioGroup methodsFor: 'events' stamp: 'hlsf 27/Jan/2022, 10:05:52 am (UTC)'!
newSelection: radioButton

	"Unselect other buttons"
	self buttons do: [ :b | b == radioButton ifFalse: [ b isSelected: false ] ].
	self triggerEvent: #informRadioSelection with: (self symbolForButton: radioButton)
	! !

!RadioGroup methodsFor: 'events' stamp: 'hlsf 27/Jan/2022, 11:34:58 am (UTC)'!
registerEvents

	^ self buttons do: [ :b | b when: #radioSelection send: #newSelection: to: self ]! !

!RadioGroup methodsFor: 'events' stamp: 'hlsf 27/Jan/2022, 11:35:37 am (UTC)'!
registerEventsFor: aMorph with: aButton
"Make button react to a Morph"

	super registerEventsFor: aMorph with: aButton .
	aMorph 
		setProperty: #'mouseButton1Up:localPosition:'
		toValue: [ :event :position |  aButton select ]! !

!RadioGroup class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 12:59:20 pm (UTC)'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!RadioGroup class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 12:40:06 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!RadioGroup class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 12:40:33 pm (UTC)'!
initializedInstance

	^self example1! !

!RadioGroup class methodsFor: 'examples' stamp: 'hlsf 24/Apr/2025, 10:03:05 pm (UTC)'!
example1
"
	self example1 openInWorld
"
	| group |
	group := self fromList: #('guess YES' 'guess NO').
	group buttons do: [:each | 
			each when: #radioSelection send: #show: to: Transcript].
	^ group! !

!RadioGroup class methodsFor: 'examples' stamp: 'hlsf 30/Aug/2025, 9:41:03 am (UTC)'!
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
			put: (ImageMorph newWith: (aForm magnifyTo: 32@32))
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

!DropDownButtonMorph methodsFor: 'action' stamp: 'hlsf 5/Apr/2025, 1:14:45 pm (UTC)'!
toggleDropDownList
	dropDownList owner 
		ifNil: [	
			self world addMorphFront: dropDownList position: 
				self positionInWorld + self morphBottomLeft - (dropDownList scroller gap @0).
			dropDownList addAlarm: #delete after: 3000 ]
		ifNotNil: [dropDownList delete]! !

!DropDownButtonMorph methodsFor: 'action' stamp: 'hlsf 27/Oct/2024, 8:27:51 pm (UTC)'!
update: action
	dropDownList update: action.
	action == setMorphIndex 
		ifTrue: [
			self updateButton.
			dropDownList delete]! !

!DropDownButtonMorph methodsFor: 'action' stamp: 'hlsf 25/Jan/2026, 10:50:26 am (UTC)'!
updateButton
	| form  |
	(dropDownList getListItem: dropDownList getCurrentSelectionIndex) ifNotNil: [:widget |
		form :=  widget imageForm.
		button
			icon: form;
			morphExtent: form extent;
			redrawNeeded ]! !

!DropDownButtonMorph methodsFor: 'accessing' stamp: 'drgeo 28/Jun/2026, 7:48:55 am (UTC)'!
adoptWidgetsColor: paneColor
	super adoptWidgetsColor: paneColor.
	adoptsWidgetsColor ifTrue: [dropDownList adoptWidgetsColor: paneColor]! !

!DropDownButtonMorph methodsFor: 'accessing' stamp: 'hlsf 23/Aug/2025, 10:57:46 am (UTC)'!
buttonStyle: buttonStyle
	button buttonStyle: buttonStyle ! !

!DropDownButtonMorph methodsFor: 'accessing' stamp: 'hlsf 21/Jan/2022, 8:24:43 am (UTC)'!
model: anObject
	"Set my model and make me me a dependent of the given object."
	model ifNotNil: [model removeActionsWithReceiver: self].
	anObject ifNotNil: [anObject addDependent: self].
	model _ anObject! !

!DropDownButtonMorph methodsFor: 'accessing' stamp: 'hlsf 2/Apr/2022, 12:22:45 pm (UTC)'!
selectedItem
	^ dropDownList getCurrentSelectionIndex = 0
		ifTrue: [nil]
		ifFalse: [dropDownList getListItem: dropDownList getCurrentSelectionIndex]! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'hlsf 24/Mar/2022, 9:12:26 am (UTC)'!
autoDeselect: aBoolean
	dropDownList autoDeselect: aBoolean ! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'hlsf 13/Feb/2022, 8:36:33 am (UTC)'!
defaultBorderWidth
	"answer the default border width for the receiver"
	^ 0! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'hlsf 12/Sep/2024, 8:37:13 am (UTC)'!
defaultColor
	"answer the default color/fill style for the receiver"
	^ `Color lightGray muchLighter`! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'drgeo 28/Jun/2026, 7:47:42 am (UTC)'!
initialize
	super initialize.
	self doAdoptWidgetsColor ! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'hlsf 17/Aug/2025, 11:17:35 am (UTC)'!
installButtons
	|  arrowButton dropDownHeight |
	button := PluggableButtonMorph new ::
		borderWidth: 0;
		model: self;
		action: #toggleDropDownList.
	self updateButton.
	arrowButton := PluggableButtonMorph new ::
		iconDrawSelector: #drawDownIcon;
		buttonStyle: #none;
		model: self;
		action: #toggleDropDownList.
	dropDownHeight := Theme current scrollbarThickness max: (button morphHeight * 0.7) rounded.
	arrowButton 	morphExtent: dropDownHeight asPoint.
	self separation: 0 @ 4.
	self 
		addMorph: button 
		layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: #center).
	self	
		addMorph: arrowButton 
		layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: #center).
	self morphExtent: 0@0. "Shrink to the minimum"! !

!DropDownButtonMorph methodsFor: 'initialization' stamp: 'jmv 17/May/2024, 4:05:56 pm (UTC)'!
model: anObject listGetter: getListSel indexGetter: getSelectionSel indexSetter: setSelectionSel
	self model: anObject.
	setMorphIndex := setSelectionSel .
	dropDownList := PluggableDropDownListOfMorph 
		withModel: anObject 
		listGetter: getListSel 
		indexGetter: getSelectionSel 
		indexSetter: setSelectionSel.
	self installButtons! !

!DropDownButtonMorph methodsFor: 'submorphs-add/remove' stamp: 'hlsf 22/Jan/2022, 9:27:41 am (UTC)'!
delete
	super delete.
	dropDownList delete! !

!DropDownButtonMorph methodsFor: 'geometry testing' stamp: 'hlsf 15/May/2022, 10:47:57 am (UTC)'!
hasVariableExtent
	^ false! !

!DropDownButtonMorph methodsFor: 'layout in owner' stamp: 'hlsf 10/Oct/2023, 9:02:06 pm (UTC)'!
layoutSpec
	"Layout specific. Return the layout spec describing where the
	receiver should appear in a proportional layout"

	layoutSpec ifNotNil: [ :ls | ^ ls ].
	layoutSpec := LayoutSpec keepMorphExtent.
	layoutSpec morph: self.

	^ layoutSpec! !

!DropDownButtonMorph class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 12:59:35 pm (UTC)'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!DropDownButtonMorph class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 12:41:52 pm (UTC)'!
includeInNewMorphMenu
	
	^ true! !

!DropDownButtonMorph class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 12:41:58 pm (UTC)'!
initializedInstance

	^self example1! !

!DropDownButtonMorph class methodsFor: 'instance creation' stamp: 'hlsf 21/Jan/2022, 8:27:53 am (UTC)'!
new
	^ self newRow! !

!DropDownButtonMorph class methodsFor: 'instance creation' stamp: 'jmv 17/May/2024, 3:52:47 pm (UTC)'!
withModel: anObject listGetter: getListSel indexGetter: getSelectionSel indexSetter: setSelectionSel
	"Create a 'pluggable' list view on the given model parameterized by the given message selectors."
	^self new
		model: anObject listGetter: getListSel indexGetter: getSelectionSel indexSetter: setSelectionSel ! !

!DropDownButtonMorph class methodsFor: 'examples' stamp: 'hlsf 12/Sep/2024, 9:25:05 am (UTC)'!
example1
"
	self example1 openInWorld
"
| palette |
	palette := #(#blue #white #red #green #black #orange) collect: [ :aColor |
		BorderedBoxMorph new ::
			morphExtent: 80@15;
			color: (Color perform: aColor);
			padding: 0;
			borderWidth: 1;
			borderColor: Color black;
			yourself].
	^ DropDownButtonMorph 
		withModel: (ListModel with: palette)
		listGetter: #list
		indexGetter: #listIndex
		indexSetter: #listIndex:! !

!DropDownListMorph methodsFor: 'initialization' stamp: 'jmv 17/May/2024, 3:54:39 pm (UTC)'!
model: anObject listGetter: getListSel indexGetter: getSelectionSel indexSetter: setSelectionSel
	self model: anObject.
	setMorphIndex := setSelectionSel .
	dropDownList := PluggableDropDownListMorph 
		withModel: anObject 
		listGetter: getListSel 
		indexGetter: getSelectionSel 
		indexSetter: setSelectionSel.
	self installButtons! !

!DropDownListMorph methodsFor: 'action' stamp: 'hlsf 10/Oct/2023, 7:49:53 pm (UTC)'!
buttonWidth 
	^ (dropDownList list 
		ifEmpty: [30] 
		ifNotEmpty: [:aList | aList max: [: aLabel |  dropDownList scroller widthToDisplayItem: aLabel] ])
		+20! !

!DropDownListMorph methodsFor: 'action' stamp: 'hlsf 5/Apr/2025, 1:14:50 pm (UTC)'!
toggleDropDownList
	dropDownList owner 
		ifNil: [	
			self world addMorphFront: dropDownList position: 
				self positionInWorld + self morphBottomLeft.
			dropDownList addAlarm: #delete after: 3000]
		ifNotNil: [dropDownList delete]! !

!DropDownListMorph methodsFor: 'action' stamp: 'hlsf 28/Sep/2023, 7:24:56 pm (UTC)'!
updateButton
	| label |
	label := dropDownList getCurrentSelectionIndex = 0
		ifTrue: ['']
		ifFalse: [dropDownList getListItem: dropDownList getCurrentSelectionIndex].
	button label: label;
		morphExtent: self buttonWidth @ FontFamily defaultPointSize;
		redrawNeeded! !

!DropDownListMorph class methodsFor: 'examples' stamp: 'jmv 17/May/2024, 4:06:06 pm (UTC)'!
example1
"
	self example1 openInWorld
"
	^ self 
		withModel: (ListModel with: #(#blue #white #red #green #black #orange) )
		listGetter: #list 
		indexGetter: #listIndex 
		indexSetter: #listIndex:! !

!InnerListOfMorph methodsFor: 'initialization' stamp: 'hlsf 20/Jan/2022, 9:08:38 am (UTC)'!
defaultColor
	^ `Color white`! !

!InnerListOfMorph methodsFor: 'initialization' stamp: 'hlsf 20/Jan/2022, 9:11:47 am (UTC)'!
initialize
	super initialize.
	self separation: 8@8.
	self morphWidth: 0.
	selectedRow _ highlightedRow _ nil! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 16/Jan/2022, 8:24:49 am (UTC)'!
highlightedRow: n
	highlightedRow = n ifFalse: [
		highlightedRow ifNotNil: [
			self invalidateLocalRect: (self drawBoundsForRow: highlightedRow) ].
		highlightedRow _ n.
		highlightedRow ifNotNil: [
			self invalidateLocalRect: (self drawBoundsForRow: highlightedRow) ].
		].! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 2/May/2025, 4:12:22 pm (UTC)'!
listChanged
	highlightedRow := selectedRow := nil.! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 19/Jan/2022, 7:02:38 pm (UTC)'!
rowAtLocation: aPoint 
	| detectedRow |
	detectedRow _ 0.
	1 to: submorphs size do: [:row |
		((self drawBoundsForRow: row) containsPoint: aPoint)
			ifTrue: [ detectedRow _ row] 		].
	^ detectedRow ! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 19/Jan/2022, 6:58:37 pm (UTC)'!
rowAtLocation: aPoint ifNone: aNoneBlock
	| detectedRow|
	1 to: submorphs size do: [:row |
		((self drawBoundsForRow: row) containsPoint: aPoint)
			ifTrue: [ detectedRow _ row]		].
	^ detectedRow ifNil: aNoneBlock ! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 19/Jan/2022, 7:12:44 pm (UTC)'!
selectedRow
	"return the currently selected row, or nil if none is selected"
	^selectedRow! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 19/Jan/2022, 7:12:19 pm (UTC)'!
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

!InnerListOfMorph methodsFor: 'geometry' stamp: 'hlsf 16/Jan/2022, 7:20:28 am (UTC)'!
adjustExtent
	self morphExtent: self minimumExtent ! !

!InnerListOfMorph methodsFor: 'geometry' stamp: 'KenD 14/Sep/2024, 1:12:03 pm (UTC)'!
maximumItemHeight
"The maximum height among the item"
	^ submorphs 
		ifEmpty: [0]
		ifNotEmpty: [submorphs max: [:morph | morph fullBoundsInOwner height + (self gap * 2)]]! !

!InnerListOfMorph methodsFor: 'geometry' stamp: 'hlsf 12/Sep/2024, 8:30:37 am (UTC)'!
minimumWidth
"The minium width to consider to fit in the UI"
	^ submorphs 
		ifEmpty: [0]
		ifNotEmpty: [submorphs max: [:morph | morph fullBoundsInOwner width + (padding x * 2)]]! !

!InnerListOfMorph methodsFor: 'geometry' stamp: 'hlsf 13/Jul/2025, 9:14:37 am (UTC)'!
totalHeight
"The complete height of the list, when fully viewable"
	^ submorphs 
		inject: self gap * 2 
		into: [:totalHeight :morph | totalHeight  + morph fullBoundsInOwner height]! !

!InnerListOfMorph methodsFor: 'drawing' stamp: 'hlsf 7/Dec/2024, 8:09:29 am (UTC)'!
drawBoundsForRow: row
"calculate the bounds that row should be drawn at.  This might be outside our bounds!!"
	^ row = 0
		ifTrue: [0@0 corner: 0@0]
		ifFalse: [(submorphs atLast: row) fullBoundsInOwner expandBy: padding "* (1 @ 0.5)"]
! !

!InnerListOfMorph methodsFor: 'drawing' stamp: 'hlsf 2/Sep/2024, 5:33:36 pm (UTC)'!
drawHighlightOn: aCanvas
	| selectionDrawBounds |
	highlightedRow ifNil: [ ^self ].
	highlightedRow = 0 ifTrue: [ ^self ].
	selectionDrawBounds := self drawBoundsForRow: highlightedRow.
	selectionDrawBounds := selectionDrawBounds intersect: self localBounds.
	aCanvas
		fillRectangle: selectionDrawBounds
		color: ((Theme current listHighlightFocused: owner hasKeyboardFocus) alpha: 0.3)! !

!InnerListOfMorph methodsFor: 'drawing' stamp: 'hlsf 19/Jan/2022, 7:21:59 pm (UTC)'!
drawOn: aCanvas
	super drawOn: aCanvas .
	self drawHighlightOn: aCanvas.
	self drawSelectionOn: aCanvas ! !

!InnerListOfMorph methodsFor: 'drawing' stamp: 'hlsf 2/Sep/2024, 5:33:41 pm (UTC)'!
drawSelectionOn: aCanvas
	| selectionDrawBounds |
	selectedRow ifNil: [ ^self ].
	selectedRow = 0 ifTrue: [ ^self ].
	selectionDrawBounds := self drawBoundsForRow: selectedRow.
	selectionDrawBounds := selectionDrawBounds intersect: self localBounds.
	aCanvas
		fillRectangle: selectionDrawBounds
		color: (Theme current listHighlightFocused: owner hasKeyboardFocus)! !

!InnerListOfMorph methodsFor: 'private' stamp: 'hlsf 19/Jan/2022, 7:07:52 pm (UTC)'!
noSelection
	selectedRow _ nil.
	highlightedRow _ nil! !

!InnerListOfMorph class methodsFor: 'new-morph participation' stamp: 'hlsf 14/Jan/2022, 7:48:30 am (UTC)'!
includeInNewMorphMenu
	^ false! !

!InnerListOfMorph class methodsFor: 'instance creation' stamp: 'hlsf 14/Jan/2022, 9:10:50 am (UTC)'!
new
	^ self newColumn! !

!MultiSelectMenu methodsFor: 'events-processing' stamp: 'KenD 17/Dec/2016, 12:36:43 pm (UTC)'!
accept

	self modalSelection: self result! !

!MultiSelectMenu methodsFor: 'events-processing' stamp: 'KenD 17/Dec/2016, 12:33:01 pm (UTC)'!
cancel

	self modalSelection: self seed! !

!MultiSelectMenu methodsFor: 'events-processing' stamp: 'KenD 17/Dec/2016, 1:59:22 pm (UTC)'!
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

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 17/Dec/2016, 11:31:57 am (UTC)'!
choices

	^ choices ! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 17/Dec/2016, 12:36:58 pm (UTC)'!
result

	^ result ! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 17/Dec/2016, 12:37:13 pm (UTC)'!
result: newResult

	result := newResult ! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 17/Dec/2016, 11:32:09 am (UTC)'!
seed

	^ seed ! !

!MultiSelectMenu methodsFor: 'initialization' stamp: 'KenD 14/May/2018, 10:10:12 pm (UTC)'!
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

!MultiSelectMenu methodsFor: 'initialization' stamp: 'KenD 17/Dec/2016, 12:35:16 pm (UTC)'!
choices: aSymbolCollection seed: initialValue title: aString

	self choices: aSymbolCollection seed: initialValue.
	self addTitle: aString.! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 17/Dec/2016, 1:49:12 pm (UTC)'!
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

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 17/Dec/2016, 1:12:07 pm (UTC)'!
clearForZero
	"Set 'zero' selector to '<on>'"

	| zeroName zeroItem |
	zeroName := self choices at: 1.
	zeroItem := self submorphs detect:
		[ :item | (item isKindOf: MenuItemMorph) and: [ item contents = zeroName ] ].
	zeroItem contents: '<off>' , zeroName asString.! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 17/Dec/2016, 1:34:11 pm (UTC)'!
itemFor: nameSymbol

	^ self submorphs detect: [ :item |
			(item isKindOf: MenuItemMorph) 
				and: [ item contents = nameSymbol ]
	  ]! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 17/Dec/2016, 1:12:15 pm (UTC)'!
setForZero
	"Set 'zero' selector to '<on>'"

	| zeroName zeroItem |
	zeroName := self choices at: 1.
	zeroItem := self submorphs detect:
		[ :item | (item isKindOf: MenuItemMorph) and: [ item contents = zeroName ] ].
	zeroItem contents: '<on>' , zeroName asString.! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 17/Dec/2016, 12:08:36 pm (UTC)'!
tagFromSeedFor: nameSymbol
	"Answer nameSymbol preceeded by '<on>' or '<off>'"

	| index bit |
	index := self choices indexOf: nameSymbol.
	bit := index - 1.
	
	^ ((seed bitAt: bit) isZero)
		ifTrue:   [ '<off>' , nameSymbol asString ]
		ifFalse:  [ '<on>'  , nameSymbol asString ]! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 17/Dec/2016, 1:24:12 pm (UTC)'!
updateZeroMarker
	"If no choices checked, set zero'th choice, else clear it"

	(self result isZero)
		ifTrue:  [ self clearAllButZero ]
		ifFalse: [ self clearForZero ].! !

!MultiSelectMenu class methodsFor: 'instance creation' stamp: 'KenD 17/Dec/2016, 12:01:56 pm (UTC)'!
choices: aSymbolCollection seed: initialValue
"
	(MultiSelectMenu choices: TextEmphasis choices seed: 3) openInHand.
"
	^ self new choices: aSymbolCollection seed: initialValue! !

!MultiSelectMenu class methodsFor: 'instance creation' stamp: 'KenD 17/Dec/2016, 12:39:40 pm (UTC)'!
choices: aSymbolCollection seed: initialValue title: aString
"
	(MultiSelectMenu choices: TextEmphasis choices seed: 3 title: 'Text Emphasis') invokeModal inspect.
"
	^ self new choices: aSymbolCollection seed: initialValue title: aString ! !

!MultiSelectMenu class methodsFor: 'new-morph participation' stamp: 'KenD 23/Dec/2016, 7:13:31 am (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!PluggableDropDownListMorph methodsFor: 'updating' stamp: 'hlsf 19/Oct/2025, 10:03:31 am (UTC)'!
updateList
	super updateList.
	extent := self defaultExtent.
	self morphExtent: (scroller desiredWidth + Theme current scrollbarThickness + 10) @ extent y! !

!PluggableDropDownListMorph methodsFor: 'access' stamp: 'hlsf 30/Sep/2023, 3:24:52 pm (UTC)'!
adoptWidgetsColor: paneColor
	super adoptWidgetsColor: paneColor.
	borderColor := color darker.
	color := color lighter.
	! !

!PluggableDropDownListMorph methodsFor: 'access' stamp: 'hlsf 28/Sep/2023, 7:20:34 pm (UTC)'!
list
	^ list! !

!PluggableDropDownListMorph methodsFor: 'initialization' stamp: 'hlsf 30/Sep/2023, 3:24:12 pm (UTC)'!
defaultBorderWidth
	^ 1! !

!PluggableDropDownListMorph methodsFor: 'initialization' stamp: 'hlsf 8/Dec/2024, 5:51:21 pm (UTC)'!
defaultExtent
	^ `150 @100`! !

!PluggableDropDownListMorph methodsFor: 'initialization' stamp: 'hlsf 5/Apr/2025, 10:39:38 am (UTC)'!
initialize
	super initialize.
	extent := 150 @100! !

!PluggableDropDownListMorph methodsFor: 'accessing' stamp: 'hlsf 23/Jan/2026, 12:52:41 pm (UTC)'!
defaultLayerNumber
	^ 15! !

!PluggableDropDownListMorph methodsFor: 'events' stamp: 'hlsf 5/Apr/2025, 1:13:53 pm (UTC)'!
mouseEnter: event
	self removeAlarm: #delete! !

!PluggableDropDownListMorph methodsFor: 'events' stamp: 'hlsf 5/Apr/2025, 7:28:57 am (UTC)'!
mouseLeave: event
	self delete! !

!PluggableListOfMorph methodsFor: 'access' stamp: 'hlsf 2/May/2025, 4:14:21 pm (UTC)'!
getList
	getListSelector ifNil: [^ #()].
	list := model perform: getListSelector.
	list ifNil: [^ #()].	
	scroller removeAllMorphs.
	list do: [:aMorph | self addToScroller: aMorph].
	self suitedExtent.
	^ list! !

!PluggableListOfMorph methodsFor: 'access' stamp: 'hlsf 27/Jan/2026, 3:34:10 pm (UTC)'!
getListItem: index
	"get the index-th item in the displayed list"
	^ list at: index ifAbsent: [nil]! !

!PluggableListOfMorph methodsFor: 'initialization' stamp: 'hlsf 22/Jan/2022, 10:39:41 am (UTC)'!
initialize
	super initialize.
	self hHideScrollBar.! !

!PluggableListOfMorph methodsFor: 'initialization' stamp: 'hlsf 8/Jan/2022, 10:09:36 am (UTC)'!
innerMorphClass
	^ InnerListOfMorph ! !

!PluggableListOfMorph methodsFor: 'testing' stamp: 'hlsf 8/Jan/2022, 10:10:10 am (UTC)'!
is: aSymbol
	^ aSymbol == #PluggableListOfMorph or: [ super is: aSymbol ]! !

!PluggableListOfMorph methodsFor: 'geometry' stamp: 'hlsf 21/Jan/2022, 9:17:30 am (UTC)'!
minimumItemExtent
"the minimum list item extent to consider to fit in the UI"
	^ scroller minimumWidth @ scroller maximumItemHeight ! !

!PluggableListOfMorph methodsFor: 'geometry' stamp: 'hlsf 8/Dec/2024, 5:24:05 pm (UTC)'!
scrollDeltaHeight
	scroller hasSubmorphs ifFalse: [^1].
	^ scroller submorphs min: [:item | item fullBoundsInOwner height]! !

!PluggableListOfMorph methodsFor: 'geometry' stamp: 'hlsf 22/Jan/2022, 8:47:06 am (UTC)'!
suitedExtent
	self morphHeight: (extent y min: scroller totalHeight max: 100).
	self morphWidth: self minimumExtent x + scroller minimumWidth! !

!PluggableListOfMorph methodsFor: 'as yet unclassified' stamp: 'hlsf 5/Jun/2022, 9:18:17 am (UTC)'!
defaultBorderWidth
	^ 1! !

!PluggableListOfMorph class methodsFor: 'examples' stamp: 'hlsf 12/Sep/2024, 9:27:24 am (UTC)'!
example1
"
	self example1 openInWorld
"
| palette |
	palette := #(#blue #white #red #green #black #orange) collect: [ :aColor |
		BorderedBoxMorph new ::
			morphExtent: 80@15;
			padding: 0;
			color: (Color perform: aColor);
			borderWidth: 1;
			borderColor: Color black;
			yourself].
	^ PluggableListOfMorph 
		withModel: (ListModel with: palette)
		listGetter: #list
		indexGetter: #listIndex
		indexSetter: #listIndex:! !

!PluggableDropDownListOfMorph methodsFor: 'accessing' stamp: 'hlsf 23/Jan/2026, 12:52:44 pm (UTC)'!
defaultLayerNumber
	^ 15! !

!PluggableDropDownListOfMorph methodsFor: 'events' stamp: 'hlsf 5/Apr/2025, 1:13:39 pm (UTC)'!
mouseEnter: event
	self removeAlarm: #delete! !

!PluggableDropDownListOfMorph methodsFor: 'events' stamp: 'hlsf 5/Apr/2025, 7:27:53 am (UTC)'!
mouseLeave: event
	self delete! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 8/Jun/2024, 10:34:01 am (UTC)'!
defaultBorderColor

	^ `Color gray muchDarker`! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 5/Apr/2025, 8:03:54 am (UTC)'!
defaultBorderWidth

	^ 2! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 8/Jun/2024, 9:59:02 am (UTC)'!
defaultColor

	^ `Color white`! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 25/Jan/2022, 6:44:42 pm (UTC)'!
defaultDiameter

	^ self class defaultDiameter ! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 12/Sep/2024, 8:24:30 am (UTC)'!
defaultPadding
	^ `0@0`! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 8/Jun/2024, 10:34:24 am (UTC)'!
initialize

	super initialize.
	self borderColor: self defaultBorderColor.
	self ofSize: self defaultDiameter.
	self selected: false.! !

!CheckButtonMorph methodsFor: 'initialization' stamp: 'hlsf 29/Mar/2024, 9:19:29 am (UTC)'!
ofSize: numPixels

	| size scale |
	scale :=  FontFamily defaultPointSize / 12.
	size := numPixels * scale.
	self borderWidth: ((self defaultBorderWidth * scale) rounded max: 1).
	self morphExtent: size @ size.
	self layoutSpec: (LayoutSpec 
							fixedWidth: size 
							fixedHeight: size
							offAxisEdgeWeight:  #center)! !

!CheckButtonMorph methodsFor: 'event handling testing' stamp: 'hlsf 25/Jan/2022, 6:45:57 pm (UTC)'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"
	^true! !

!CheckButtonMorph methodsFor: 'event handling testing' stamp: 'hlsf 25/Jan/2022, 6:46:01 pm (UTC)'!
handlesMouseOver: evt
	"Do I want to receive mouseEnter: and mouseLeave: when the button is up and the hand is empty?" 
	^true! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 25/Jan/2022, 6:46:23 pm (UTC)'!
isSelected

	^ isSelected ! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 9/Jun/2024, 6:29:32 am (UTC)'!
isSelected: aBoolean
	self selected: aBoolean.
	self triggerEvent: #checkSelection with: self
! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 25/Jan/2022, 6:46:45 pm (UTC)'!
select
	"Select me if unselected"

	(self isSelected) ifFalse: [ self isSelected: true ]
! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 12/Aug/2024, 5:03:56 pm (UTC)'!
selected: aBoolean
"Do not emit event. Should it not be the prerogative of the model?"
	isSelected := aBoolean.
	self adjustHoverColor! !

!CheckButtonMorph methodsFor: 'accessing' stamp: 'hlsf 25/Jan/2022, 6:46:49 pm (UTC)'!
toggleSelection

	self isSelected: self isSelected not
! !

!CheckButtonMorph methodsFor: 'event handling' stamp: 'hlsf 25/Jan/2022, 7:07:03 pm (UTC)'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition
	(self coversPixel: aMouseButtonEvent eventPosition)
		ifTrue: [ self toggleSelection ]
! !

!CheckButtonMorph methodsFor: 'event handling' stamp: 'hlsf 12/Aug/2024, 4:40:51 pm (UTC)'!
mouseEnter: event
	"The mouse has entered the area of the receiver"
	self hoverColor: (color alphaMixed: 0.5 with: borderColor) ! !

!CheckButtonMorph methodsFor: 'event handling' stamp: 'hlsf 12/Aug/2024, 5:02:25 pm (UTC)'!
mouseLeave: event
	"The mouse has left the area of the receiver, restore the fill color depending on my state "
	self adjustHoverColor ! !

!CheckButtonMorph methodsFor: 'event handling' stamp: 'hlsf 25/Jan/2022, 6:47:11 pm (UTC)'!
update: aParameter

	self redrawNeeded! !

!CheckButtonMorph methodsFor: 'geometry testing' stamp: 'hlsf 15/May/2022, 10:44:16 am (UTC)'!
hasVariableExtent
"Does not make sense to be fitted in owner morph"
	^ false! !

!CheckButtonMorph methodsFor: 'geometry testing' stamp: 'hlsf 9/Jun/2024, 2:47:09 pm (UTC)'!
requiresVectorCanvas
	^ true! !

!CheckButtonMorph methodsFor: 'drawing' stamp: 'hlsf 5/Apr/2025, 7:56:56 am (UTC)'!
drawOn: aCanvas
	| myBounds  |
	myBounds := self localBounds insetBy: borderWidth.
	aCanvas strokeWidth: borderWidth color: borderColor fillColor: color do: [
		aCanvas 
			roundRectangleMinX: myBounds left maxX: myBounds 
			right minY: myBounds top maxY: myBounds bottom 
			rx: myBounds width * 0.4 ry: myBounds height * 0.4].
	myBounds := myBounds insetBy: borderWidth * 1.1.
	aCanvas fillColor: hoverColor do: [
		aCanvas 
		roundRectangleMinX: myBounds left maxX: myBounds 
		right minY: myBounds top maxY: myBounds bottom 
		rx: myBounds width * 0.4 ry: myBounds height * 0.4]! !

!CheckButtonMorph methodsFor: 'private' stamp: 'hlsf 12/Aug/2024, 5:03:41 pm (UTC)'!
adjustHoverColor
" Adjust my hover color depending on my state "
	self isSelected 
		ifFalse: [self hoverColor: color]
		ifTrue: [self hoverColor: borderColor]! !

!CheckButtonMorph methodsFor: 'private' stamp: 'hlsf 12/Aug/2024, 4:49:50 pm (UTC)'!
hoverColor: aColor
" The color when cursor is over me "
	hoverColor := aColor.
	self redrawNeeded
	! !

!CheckButtonMorph methodsFor: 'as yet unclassified' stamp: 'drgeo 28/Jun/2026, 7:32:26 am (UTC)'!
adoptWidgetsColor: paneColor
	color := paneColor whiter.
	borderColor := paneColor muchDarker.
	self adjustHoverColor ! !

!CheckButtonMorph class methodsFor: 'accessing' stamp: 'hlsf 9/Jun/2024, 2:51:06 pm (UTC)'!
defaultDiameter
	^ FontFamily defaultPointSize + 6! !

!CheckButtonMorph class methodsFor: 'new-morph participation' stamp: 'hlsf 25/Jan/2022, 6:47:33 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!CheckButtonMorph class methodsFor: 'examples' stamp: 'hlsf 5/Apr/2025, 7:51:07 am (UTC)'!
example1
"
	self example1 morphPosition: 50@50; openInWorld
"
	| button |
	 button := self new color: Color white; borderColor: Color red.
	button isSelected: true.
	button when: #checkSelection send: #show: to: Transcript.
	^ button ! !

!CheckButtonMorph class methodsFor: 'instance creation' stamp: 'hlsf 25/Jan/2022, 6:48:51 pm (UTC)'!
ofSize: numPixels

	^ self new ofSize: numPixels! !

!RadioButtonMorph methodsFor: 'drawing' stamp: 'hlsf 12/Aug/2024, 4:40:12 pm (UTC)'!
drawOn: aCanvas 
	| radius |
	radius := extent // 2.
	aCanvas 
		ellipseCenter: radius 
		radius: radius 
		borderWidth: borderWidth 
		borderColor: borderColor 
		fillColor: hoverColor! !

!RadioButtonMorph methodsFor: 'event handling' stamp: 'hlsf 25/Jan/2022, 6:59:26 pm (UTC)'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	((self coversPixel: aMouseButtonEvent eventPosition) and: [self isSelected not])
		ifTrue: [ self isSelected: true ]
! !

!RadioButtonMorph methodsFor: 'event handling' stamp: 'hlsf 31/Aug/2024, 1:00:42 pm (UTC)'!
mouseEnter: event
	"The mouse has entered the area of the receiver"
	self isSelected ifFalse: [super mouseEnter: event]! !

!RadioButtonMorph methodsFor: 'accessing' stamp: 'hlsf 24/Apr/2025, 9:57:23 pm (UTC)'!
isSelected: aBoolean
	self selected: aBoolean.
	isSelected ifTrue: [self triggerEvent: #radioSelection with: self	]
! !

!RadioButtonMorph methodsFor: 'private' stamp: 'hlsf 12/Aug/2024, 5:04:16 pm (UTC)'!
adjustHoverColor
" Adjust my hover color depending on my state "
	self isSelected 
		ifFalse: [self hoverColor: borderColor]
		ifTrue: [self hoverColor: color ]! !

!RadioButtonMorph class methodsFor: 'examples' stamp: 'hlsf 22/Jul/2024, 8:56:24 pm (UTC)'!
example1
"
	self example1 openInWorld
"
	^ super example1 
		when: #radioSelection send: #show: to: Transcript.
! !
