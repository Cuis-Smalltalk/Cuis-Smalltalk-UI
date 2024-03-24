'From Cuis6.3 [latest update: #6279] on 24 March 2024 at 12:08:20 pm'!
'Description '!
!provides: 'UI-Core' 1 6!
SystemOrganization addCategory: #'UI-Core'!


!classDefinition: #WindowTitleMorph category: #'UI-Core'!
LayoutMorph subclass: #WindowTitleMorph
	instanceVariableNames: 'titleMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Core'!
!classDefinition: 'WindowTitleMorph class' category: #'UI-Core'!
WindowTitleMorph class
	instanceVariableNames: ''!

!classDefinition: #SqueezeLabelMorph category: #'UI-Core'!
LabelMorph subclass: #SqueezeLabelMorph
	instanceVariableNames: 'minChars centered'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Core'!
!classDefinition: 'SqueezeLabelMorph class' category: #'UI-Core'!
SqueezeLabelMorph class
	instanceVariableNames: ''!

!classDefinition: #ListModel category: #'UI-Core'!
Object subclass: #ListModel
	instanceVariableNames: 'collection selectedIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Core'!
!classDefinition: 'ListModel class' category: #'UI-Core'!
ListModel class
	instanceVariableNames: ''!

!classDefinition: #ListMultiModel category: #'UI-Core'!
ListModel subclass: #ListMultiModel
	instanceVariableNames: 'listSelections'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Core'!
!classDefinition: 'ListMultiModel class' category: #'UI-Core'!
ListMultiModel class
	instanceVariableNames: ''!

!classDefinition: #ValueHolder category: #'UI-Core'!
Object subclass: #ValueHolder
	instanceVariableNames: 'action property'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Core'!
!classDefinition: 'ValueHolder class' category: #'UI-Core'!
ValueHolder class
	instanceVariableNames: ''!


!WindowTitleMorph commentStamp: 'hlsf 4/14/2022 15:15:50' prior: 0!
I hold and layout the title section of windows/panels.

My owner gets messages for standard buttons.

As my instances are created before my owner is set, I delegate events to my owner.

To simplify management, all buttons are present but hidden unless requested.

See Panel, LayoutMorphEditPanel and LayoutSpecEditPanel as usage examples

My buttons can be  #(close collapse expand windowMenu pin showHalo )!

!SqueezeLabelMorph commentStamp: '<historical>' prior: 0!
A LabelMorph displays a fixed size string (with font an emphasis).
I do the same but can be "pinched" to squeeze out letters.

minChars specifies the minimum number of characters I should display.
I display at least 3 characters.!

!ListModel commentStamp: 'hlsf 4/20/2023 14:30:41' prior: 0!
I am a model presenting a list of objects. 
I am used with PluggableListOfMorph or any other pluggable widget handling list.!

!ListMultiModel commentStamp: '<historical>' prior: 0!
Several items from my collection can be selected.!

!WindowTitleMorph methodsFor: 'buttons' stamp: 'KenD 4/24/2015 08:01'!
buttonNamesShown

	| names |
	names := OrderedCollection new.

	self submorphsDo: [ :aMorph |
		((aMorph isKindOf: PluggableButtonMorph) 
		  and: [ aMorph visible ])
			ifTrue: [ names add: aMorph iconName ]
	].

	^ names! !

!WindowTitleMorph methodsFor: 'buttons' stamp: 'KenD 10/26/2021 11:12:34'!
hideAllButtons

	self submorphsDo: [ :m | 
		(m isKindOf: PluggableButtonMorph) ifTrue: [ m hide ]
	]! !

!WindowTitleMorph methodsFor: 'buttons' stamp: 'KenD 10/26/2021 11:13:04'!
showAllButtons

	self submorphsDo: [ :m | 
		(m isKindOf: PluggableButtonMorph) ifTrue: [ m show ] 
	]! !

!WindowTitleMorph methodsFor: 'buttons' stamp: 'KenD 10/26/2021 11:13:43'!
showButtonsNamed: aSymbolColleciton

	aSymbolColleciton  do: [ :aName |
		(self buttonNamed: aName)
			ifNotNil: [ :aButton | aButton show ]
	]
! !

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 4/23/2015 17:01'!
buttonNamed: aSymbol

	^ self submorphs  
		detect: [ :aMorph | 
			(aMorph isKindOf: PluggableButtonMorph) 
				and: [ aMorph iconName = aSymbol ] 
		]
		ifNone: [ ^ nil ]! !

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 4/23/2015 16:28'!
color
	"I take on the color of my title bar"

	^ Color transparent ! !

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 3/19/2022 16:31:22'!
dontShrinkTitle

	| oldTitle |
	oldTitle := titleMorph.
	titleMorph := LabelMorph 
				contents: titleMorph contents 
				font: titleMorph font
				"emphasis: titleMorph emphasis" .
	self 
		replaceSubmorph: oldTitle by: titleMorph;
		morphExtent: self minimumExtent; "recalculate"
		redrawNeeded.
		! !

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 11/7/2021 14:14:49'!
height

	^ self morphExtentInOwner y! !

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 4/23/2015 17:01'!
pinButton

	^ self buttonNamed: #pin! !

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 12/12/2021 14:57:54'!
titleString

	^ titleMorph contents ! !

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 10/26/2021 11:25:43'!
titleString: aString
	"Remember titleString and display it"

	titleMorph contents: aString
	! !

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 11/7/2021 14:14:53'!
width

	^ self morphExtentInOwner x! !

!WindowTitleMorph methodsFor: 'geometry' stamp: 'KenD 10/25/2021 15:10:36'!
buttonExtent
	"answer the extent to use in all the buttons. "
	 
	^ Theme current titleBarButtonsExtent
! !

!WindowTitleMorph methodsFor: 'geometry' stamp: 'KenD 10/25/2021 15:28:13'!
buttonSeparation

	^  (self buttonExtent x) * 4 // 10! !

!WindowTitleMorph methodsFor: 'geometry' stamp: 'hlsf 7/3/2022 13:06:22'!
labelHeight
	"Answer the height for the window label."

	^  (Preferences at: #windowTitleFont) lineSpacing+1! !

!WindowTitleMorph methodsFor: 'geometry' stamp: 'KenD 10/25/2021 15:17:28'!
minimumButtonsExtent

	| width height numButtons |
	numButtons := self buttonNamesShown size.
	height := Theme current titleBarButtonsExtent y.
	"Note: separation between each button + two ends"
	width := (numButtons * self buttonExtent x) + (numButtons + 2 * self buttonSeparation).
	^ width @ height! !

!WindowTitleMorph methodsFor: 'geometry' stamp: 'KenD 3/19/2022 16:35:47'!
minimumExtent

	| minButtonExt minTitleExt |
	minButtonExt :=  self minimumButtonsExtent.
	minTitleExt    := self minimumTitleExtent.
	^ (minButtonExt x + minTitleExt x) 
     	   @ (minButtonExt y max: minTitleExt y)! !

!WindowTitleMorph methodsFor: 'geometry' stamp: 'KenD 3/19/2022 16:26:52'!
minimumTitleExtent
	"My titleMorph may be a LabelMorph or a SqueezeLabelMorph.
	 It knows.."
	
	^ titleMorph ifNil: [ 100 @ 30 ] ifNotNil: [ :t | t 	minimumExtent ]! !

!WindowTitleMorph methodsFor: 'event handling' stamp: 'KenD 4/23/2015 16:21'!
closeButtonClicked
	"Delegate action to owner"
	
	self owner closeButtonClicked
! !

!WindowTitleMorph methodsFor: 'event handling' stamp: 'KenD 4/23/2015 16:21'!
collapseButtonClicked	"Delegate action to owner"

	self owner collapseButtonClicked
! !

!WindowTitleMorph methodsFor: 'event handling' stamp: 'KenD 4/23/2015 16:30'!
expandButtonClicked
	"Delegate action to owner"
	
	self owner expandButtonClicked
! !

!WindowTitleMorph methodsFor: 'event handling' stamp: 'KenD 10/26/2021 16:07:19'!
fontPreferenceChanged

  super fontPreferenceChanged.
  self 
	rescaleButtons;
	resetTitleFont
	! !

!WindowTitleMorph methodsFor: 'event handling' stamp: 'KenD 4/23/2015 16:21'!
pinButtonClicked
	"Delegate action to owner"
		
	self owner pinButtonClicked 
	! !

!WindowTitleMorph methodsFor: 'event handling' stamp: 'KenD 10/25/2021 15:14:56'!
rescaleButtons
	"boxExtent changed.  Update my buttons."
	| newExtent |
	newExtent := self buttonExtent.
	self submorphsDo: [ :aMorph |
		(aMorph isKindOf: PluggableButtonMorph) 
			ifTrue: [ aMorph morphExtent: newExtent ].
	].
! !

!WindowTitleMorph methodsFor: 'event handling' stamp: 'hlsf 7/3/2022 13:06:27'!
resetTitleFont
	"Reset my title font"
	titleMorph font: (Preferences at: #windowTitleFont)! !

!WindowTitleMorph methodsFor: 'event handling' stamp: 'KenD 7/4/2015 15:22'!
showHaloButtonClicked
	"Delegate action to owner"
		
	self owner showHaloButtonClicked 
	! !

!WindowTitleMorph methodsFor: 'event handling' stamp: 'KenD 4/23/2015 16:31'!
windowMenuButtonClicked
	"Delegate action to owner"
	
	self owner windowMenuButtonClicked
! !

!WindowTitleMorph methodsFor: 'initialization' stamp: 'hlsf 3/24/2024 11:57:35'!
addAllButtonsAndTitle
	"Buttons first"
   #( ( close  closeButtonClicked 'close this window' closeIcon drawCloseIcon )
	   ( collapse collapseButtonClicked 'collapse this window' collapseIcon drawCollapseIcon )
	   ( expand expandButtonClicked 'expand this window' expandIcon drawExpandIcon )
	   ( windowMenu windowMenuButtonClicked 'window menu' windowMenuIcon drawMenuIcon )
	   ( showHalo showHaloButtonClicked 'show target halo' doItIcon drawUpIcon  )
"	   ( pin pinButtonClicked 'pin me (don''t close)' pushPinIcon drawPushPinIcon )  ADD AFTER TLTLE (below)"
	) do: [ :rowArgs | 
	  self 
		perform: #addButton:action:baloonText:themeName:drawAction:
		withArguments: rowArgs 
	].
	
	"Title next"
	titleMorph := SqueezeLabelMorph 
					contents: 'Untitled' 
					font: (Preferences at: #windowTitleFont)
					minCharsToShow: 8
					:: 
					color: Theme current windowLabel .
	self addMorph: titleMorph.
	
	"PushPin goes after Title"
	self  
		addButton: #pin 
		action: #pinButtonClicked 
		baloonText:  'pin (keep) this window' 
		themeName: #pushPinIcon 
		drawAction: #drawPushPinIcon.
		! !

!WindowTitleMorph methodsFor: 'initialization' stamp: 'KenD 10/25/2021 15:10:36'!
addButton: nameSym 
action: actionSym 
baloonText: toolHelpString 
themeName: iconName
drawAction: drawSelector

	"add a a button morph to me"
	| button |
	button := PluggableButtonMorph model: self action: actionSym.
	button
		icon: ((Theme current perform: iconName) magnifyTo: self buttonExtent) ;
		setBalloonText: toolHelpString;
		iconName: nameSym;
		morphExtent: self buttonExtent;
		iconDrawSelector: drawSelector.
		
	self addMorph: button
	! !

!WindowTitleMorph methodsFor: 'initialization' stamp: 'hlsf 7/3/2022 13:06:18'!
dontShrinkTitle: aString buttonsNamed: aSymbolColleciton
	"Set me up"
	
	titleMorph := LabelMorph contents: aString font: (Preferences at: #windowTitleFont).
	self hideAllButtons.
	aSymbolColleciton  do: [ :aName |
		(self buttonNamed: aName)
			ifNotNil: [ :aButton | aButton show ]
	].
! !

!WindowTitleMorph methodsFor: 'initialization' stamp: 'KenD 10/26/2021 16:11:47'!
initialize

	super initialize.
	self
		morphPosition: 0@0;
		separation: self buttonSeparation;
		layoutSpec: (LayoutSpec 
						proportionalWidth: 1  
						fixedHeight: (self minimumExtent y) );
		addAllButtonsAndTitle.
! !

!WindowTitleMorph methodsFor: 'initialization' stamp: 'KenD 10/26/2021 11:12:34'!
title: aString buttonsNamed: aSymbolColleciton
	"Set me up"
	
	self titleString: aString.
	self hideAllButtons.
	aSymbolColleciton  do: [ :aName |
		(self buttonNamed: aName)
			ifNotNil: [ :aButton | aButton show ]
	].
! !

!WindowTitleMorph class methodsFor: 'accessing' stamp: 'KenD 7/4/2015 14:40'!
buttonNames

	^ #( close collapse expand windowMenu pin showHalo )! !

!WindowTitleMorph class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 15:01:10'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!WindowTitleMorph class methodsFor: 'new-morph participation' stamp: 'KenD 4/28/2015 18:45'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ false! !

!WindowTitleMorph class methodsFor: 'instance creation' stamp: 'KenD 1/17/2022 08:18:02'!
dontShrinkTitle: aString buttonsNamed: aSymbolCollection

	((self buttonNames) includesAllOf: aSymbolCollection)
		ifFalse: [ | stdNames outliers |
			stdNames := self buttonNames.
			outliers := aSymbolCollection reject: [ :aName | stdNames includes: aName ].
			self error: 'Bad button name(s): ', outliers printString 
		].
	^ (self newRow) dontShrinkTitle: aString buttonsNamed: aSymbolCollection
! !

!WindowTitleMorph class methodsFor: 'instance creation' stamp: 'KenD 4/23/2015 17:05'!
title: aString

	^ self title: aString buttonsNamed: #()! !

!WindowTitleMorph class methodsFor: 'instance creation' stamp: 'KenD 4/28/2019 18:57:20'!
title: aString buttonsNamed: aSymbolCollection

	((self buttonNames) includesAllOf: aSymbolCollection)
		ifFalse: [ | stdNames outliers |
			stdNames := self buttonNames.
			outliers := aSymbolCollection reject: [ :aName | stdNames includes: aName ].
			self error: 'Bad button name(s): ', outliers printString 
		].
	^ (self newRow) title: aString buttonsNamed: aSymbolCollection
! !

!WindowTitleMorph class methodsFor: 'examples' stamp: 'hlsf 12/16/2021 10:14:58'!
example1
" WindowTitleMorph example1 openInWorld "
	^ self title: 'I am title for a window or a panel' buttonsNamed: self buttonNames! !

!SqueezeLabelMorph methodsFor: 'accessing' stamp: 'hlsf 5/4/2023 15:35:43'!
centered: boolean
	centered := boolean ! !

!SqueezeLabelMorph methodsFor: 'accessing' stamp: 'KenD 10/26/2021 05:45:41'!
minCharsToShow

	^minChars! !

!SqueezeLabelMorph methodsFor: 'accessing' stamp: 'KenD 12/20/2021 13:56:26'!
minCharsToShow: numChars
	"I show at least 3 characters at minimum"
	
	minChars := numChars max: 3! !

!SqueezeLabelMorph methodsFor: 'drawing' stamp: 'hlsf 5/4/2023 15:36:37'!
drawOn: aCanvas
	"We draw a string within a border.
	If not enough space, the string is squeezed.
	If excess space, the string is centered."
	
	| fitString stringWidth maxStringWidth excessWidth xOffset |
	fitString := self contents.
	stringWidth := self font widthOfString: fitString.
	maxStringWidth := extent x - self extentBorder.
	(stringWidth > maxStringWidth)
	ifTrue: [ | numChars charsToElide |
		numChars := fitString size.
		"NB:  Char size varies.  Approximate"
		charsToElide := 
			((stringWidth - maxStringWidth) / self averageCharWidth) ceiling.
		charsToElide := charsToElide + 2. "fudge"
		fitString := fitString 
			squeezedTo: ((numChars - charsToElide) max: minChars).
		stringWidth := self font widthOfString: fitString.
"
		Transcript log: 'numChars ', numChars asString.
		Transcript log: 'charsToElide: ', charsToElide asString.
		Transcript log: 'num chars: ', ((numChars - charsToElide) max: minChars) asString.
		Transcript newLine.
"
	].
	excessWidth := (maxStringWidth - stringWidth) max: 0. 
	(excessWidth > 0 and: [centered])
		ifTrue: [ xOffset := borderWidth + (excessWidth / 2) ]
		ifFalse: [ xOffset := borderWidth ].

	self drawOn: aCanvas theString: fitString position: (xOffset @ borderWidth)
! !

!SqueezeLabelMorph methodsFor: 'drawing' stamp: 'KenD 12/20/2021 12:20:41'!
drawOn: aCanvas theString: aString position: aPoint
	aCanvas
		drawString: (aString ifNil: [ '' ])
		at: aPoint
		font: self fontToUse
		color: color
		embossed: (Theme current embossedButtonLabels).
	(borderWidth > 0) ifTrue: [
		aCanvas
			frameRectangle: (`0@0` extent: extent)
			color: borderColor
			borderWidth: borderWidth
			borderStyleSymbol: #simple ]! !

!SqueezeLabelMorph methodsFor: 'geometry' stamp: 'KenD 12/20/2021 15:11:43'!
averageCharWidth
	| currentFont |
	currentFont := self font.
	^ (currentFont widthOfString: 'A') + (currentFont widthOfString: 'i') / 2
	! !

!SqueezeLabelMorph methodsFor: 'geometry' stamp: 'KenD 10/26/2021 05:29:28'!
measureMinimumContent

	| f |
	f _ self font.
	^((f widthOfString: (contents squeezedTo: minChars)) max: 3)  @ f lineSpacing! !

!SqueezeLabelMorph methodsFor: 'geometry' stamp: 'KenD 12/20/2021 12:44:46'!
minimumExtent

	^ self minimumStringExtent + self extentBorder! !

!SqueezeLabelMorph methodsFor: 'geometry' stamp: 'KenD 12/20/2021 14:53:14'!
minimumStringExtent
	"Answer enough space to contain capitalized minChars
	where we hold a minimum of 3 characters"
	
	| f |
	f _ self font.
	^ (f widthOfString: (contents squeezedTo: minChars)) @ f lineSpacing! !

!SqueezeLabelMorph methodsFor: 'initialization' stamp: 'hlsf 3/24/2024 12:02:05'!
initialize

	self minCharsToShow: 3. "required for size calc by super"
	super initialize.
	self layoutSpec: (LayoutSpec morphHeightProportionalWidth: 1.0).
	centered := true.! !

!SqueezeLabelMorph class methodsFor: 'instance creation' stamp: 'KenD 10/26/2021 05:52:29'!
contents: aString font: aFont emphasis: emphasisCode minCharsToShow: numChars

	^ super contents: aString font: aFont emphasis: emphasisCode :: minCharsToShow: numChars! !

!SqueezeLabelMorph class methodsFor: 'instance creation' stamp: 'KenD 10/26/2021 05:52:00'!
contents: aString font: aFont minCharsToShow: numChars

	^ super contents: aString font: aFont :: minCharsToShow: numChars! !

!SqueezeLabelMorph class methodsFor: 'instance creation' stamp: 'KenD 10/26/2021 05:50:59'!
contents: aString minCharsToShow: numChars

	^ super contents: aString :: minCharsToShow: numChars! !

!SqueezeLabelMorph class methodsFor: 'instance creation' stamp: 'KenD 12/13/2021 13:28:42'!
initializedInstance

	| newInstance |
	newInstance := super new :: minCharsToShow: 7.
	^newInstance 
		morphExtent: newInstance minimumExtent;
		yourself! !

!SqueezeLabelMorph class methodsFor: 'instance creation' stamp: 'KenD 10/26/2021 05:53:29'!
minCharsToShow: numChars

	^ super new :: minCharsToShow: numChars! !

!SqueezeLabelMorph class methodsFor: 'examples' stamp: 'KenD 12/20/2021 14:56:36'!
example1
"
  SqueezeLabelMorph example1 openInWorld 
"
| label |
	label _ self 
		contents: 'I am a long label that can be squeezed to 25 characters' 
		minCharsToShow: 25.
	label 
		color: Color green;
		emphasis: TextEmphasis bold emphasisCode;
		borderWidth: 4;
		borderColor: Color yellow;
		morphExtent: label minimumExtent.
	^ label
	! !

!SqueezeLabelMorph class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:58:16'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!ListModel methodsFor: 'accessing' stamp: 'hlsf 4/2/2022 14:30:19'!
list
	^ collection! !

!ListModel methodsFor: 'accessing' stamp: 'hlsf 5/30/2023 18:26:48'!
list: aCollection
	collection := aCollection.
	aCollection 		ifNotEmpty: [selectedIndex := 1]! !

!ListModel methodsFor: 'accessing' stamp: 'hlsf 4/2/2022 14:28:03'!
listIndex
	^ selectedIndex! !

!ListModel methodsFor: 'accessing' stamp: 'hlsf 5/18/2022 16:22:58'!
listIndex: index
	selectedIndex _ index.
	"Inform the model we changed"
	self changed: #listIndex:.
	"Inform any interested view we changed the selected item"
	self triggerEvent: #listSelectionChanged with: self! !

!ListModel methodsFor: 'accessing' stamp: 'hlsf 7/26/2023 13:24:32'!
removeSelectedItem
	collection remove: self selectedItem.
	selectedIndex := 0.! !

!ListModel methodsFor: 'accessing' stamp: 'hlsf 4/21/2023 14:14:52'!
selectedItem
	^ selectedIndex isZero
		ifTrue: [nil ] 
		ifFalse: [collection at: selectedIndex]! !

!ListModel methodsFor: 'initialization' stamp: 'hlsf 5/30/2023 18:23:41'!
initialize
	super initialize.
	selectedIndex := 0! !

!ListModel class methodsFor: 'instance creation' stamp: 'hlsf 4/2/2022 14:28:53'!
with: aCollection
	^ self new ::
		list: aCollection ;
		yourself! !

!ListMultiModel methodsFor: 'accessing' stamp: 'hlsf 4/21/2023 14:58:57'!
list: aCollection
	super list: aCollection.
	self clearSelections ! !

!ListMultiModel methodsFor: 'accessing' stamp: 'hlsf 4/21/2023 12:13:54'!
listSelectionAt: index
	^ listSelections at: index! !

!ListMultiModel methodsFor: 'accessing' stamp: 'hlsf 4/23/2023 15:41:29'!
listSelectionAt: index put: value
	listSelections at: index put: value.
	self changed: #allSelections! !

!ListMultiModel methodsFor: 'accessing' stamp: 'hlsf 4/23/2023 15:51:28'!
selectedIndexes
	| indexes |
	indexes := OrderedCollection new.
	1 to: collection size do: [:i | (listSelections at: i) ifTrue: [indexes add: i]].
	^ indexes
	! !

!ListMultiModel methodsFor: 'accessing' stamp: 'hlsf 4/23/2023 15:41:45'!
selectedIndexes: indexes
	self clearSelections.
	indexes do: [:i | 		listSelections at: i put: true].
	self changed: #allSelections! !

!ListMultiModel methodsFor: 'accessing' stamp: 'hlsf 4/21/2023 14:54:33'!
selectedItems
	| items |
	items := OrderedCollection new.
	1 to: collection size do: [:i | 
		(listSelections at: i) ifTrue: [items add: (collection at: i)] ].
	^ items! !

!ListMultiModel methodsFor: 'accessing' stamp: 'hlsf 9/28/2023 11:50:44'!
selectedItems: items
	self selectedIndexes: (items collect: [:anItem | collection indexOf: anItem])! !

!ListMultiModel methodsFor: 'private' stamp: 'hlsf 4/23/2023 15:35:24'!
clearSelections
	listSelections := Array new: collection size withAll: false.
	self listIndex: 0.
	self changed: #allSelections! !

!ListMultiModel methodsFor: 'copying' stamp: 'hlsf 4/21/2023 15:27:36'!
postCopy
	listSelections := listSelections copy! !

!ValueHolder methodsFor: 'accessing' stamp: 'KenD 3/21/2022 15:10:07'!
action: aBlock
	action _ aBlock! !

!ValueHolder methodsFor: 'accessing' stamp: 'KenD 3/21/2022 15:10:28'!
propertyValue

	^ property! !

!ValueHolder methodsFor: 'accessing' stamp: 'hlsf 4/2/2022 14:38:35'!
propertyValue: aValue

	property _ aValue.
	self changed: #propertyValue:. "Inform any interested view we have changed our state"
	action ifNotNil: [action valueWithPossibleArgument: property]! !

!ValueHolder class methodsFor: 'instance creation' stamp: 'KenD 3/21/2022 15:11:17'!
with: aProperty

	^ self new :: 
		propertyValue: aProperty! !
