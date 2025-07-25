'From Cuis7.3 [latest update: #7115] on 3 May 2025 at 9:46:22 am'!
'Description '!
!provides: 'UI-Core' 1 24!
!requires: 'Cuis-Base' 71 6722 nil!
SystemOrganization addCategory: #'UI-Core'!


!classDefinition: #SignMorph category: #'UI-Core'!
HoverHelpMorph subclass: #SignMorph
	instanceVariableNames: 'object'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Core'!
!classDefinition: 'SignMorph class' category: #'UI-Core'!
SignMorph class
	instanceVariableNames: ''!

!classDefinition: #WindowTitleMorph category: #'UI-Core'!
LinearLayoutMorph subclass: #WindowTitleMorph
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

!classDefinition: #FrameMorph category: #'UI-Core'!
BorderedBoxMorph subclass: #FrameMorph
	instanceVariableNames: 'colorIndex borderStyle'
	classVariableNames: 'Colors'
	poolDictionaries: ''
	category: 'UI-Core'!
!classDefinition: 'FrameMorph class' category: #'UI-Core'!
FrameMorph class
	instanceVariableNames: ''!

!classDefinition: #LineMorph category: #'UI-Core'!
ColoredBoxMorph subclass: #LineMorph
	instanceVariableNames: 'startPointSelector endPointSelector lineWidth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Core'!
!classDefinition: 'LineMorph class' category: #'UI-Core'!
LineMorph class
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


!SignMorph commentStamp: '<historical>' prior: 0!
My instances are visual proxy's for objects which do not have a visual representation.

This is helpful for drag-n-drop.

A sign by its nature points to something else.  Use: 
	SignMorph forObject: <object>

ivar:
   object - the object I point-to/denote/stand-for

Examples:
  (SignMorph forObject: Color green) openInHand.
  (SignMorph forObject: 4.7) openInHand.
  (SignMorph forObject: 'Ball of string') openInHand.
  (EllipseMorph initializedInstance signMorphForMe) openInHand.
!

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

!FrameMorph commentStamp: '<historical>' prior: 0!
I appear as an empty frame!

!LineMorph commentStamp: '<historical>' prior: 0!
I am a line from my start point to my end point.!

!ListModel commentStamp: 'hlsf 4/20/2023 14:30:41' prior: 0!
I am a model presenting a list of objects. 
I am used with PluggableListOfMorph or any other pluggable widget handling list.!

!ListMultiModel commentStamp: '<historical>' prior: 0!
Several items from my collection can be selected.!

!SignMorph methodsFor: 'accessing' stamp: 'KenD 3/1/2022 14:31:22'!
contents: aString

	self contents: aString wrappedTo: nil! !

!SignMorph methodsFor: 'accessing' stamp: 'KenD 10/5/2013 17:15'!
name

	^ contents ! !

!SignMorph methodsFor: 'accessing' stamp: 'KenD 10/5/2013 16:58'!
object

	^ object! !

!SignMorph methodsFor: 'accessing' stamp: 'KenD 3/2/2022 07:22:44'!
propertyValue

	^ self object! !

!SignMorph methodsFor: 'accessing' stamp: 'KenD 3/2/2022 07:13:35'!
propertyValue: newValue

	object := newValue.
	self contents: newValue printString! !

!SignMorph methodsFor: 'delegation' stamp: 'KenD 10/5/2013 16:58'!
doesNotUnderstand: aMessage
	"Delegate operations to the object I represent and Answer the result."

	^ aMessage sendTo: object.! !

!SignMorph methodsFor: 'initialization' stamp: 'KenD 7/24/2024 11:46:26'!
defaultBorderColor
	"Match with Visual Menu Item text color: 'UI-DragAndDrop' "
	
	^ `Color r: 0.5 g: 0.07 b: 0.5`
! !

!SignMorph methodsFor: 'initialization' stamp: 'KenD 3/11/2022 15:52:16'!
defaultBorderWidth

	^ 4
! !

!SignMorph methodsFor: 'initialization' stamp: 'KenD 3/11/2022 15:52:31'!
forObject: anObject

	| nameString |
	
	nameString := anObject name ifNotNil: [ :name | name ] ifNil: [ anObject printString ].
	super initialize.  "Initialize extent as required by #redrawNeeded"
	object := anObject.
	self contents: nameString
! !

!SignMorph methodsFor: 'initialization' stamp: 'KenD 3/11/2022 15:52:41'!
forObject: anObject withName: aString

	super initialize.  "Initialize extent as required by #redrawNeeded"
	object := anObject.
	self contents: aString asString! !

!SignMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 2/9/2022 14:50:43'!
dropAction: aDropTargetMorph
	"Find accepting MetaProperties of target morph
	 and allow user to choose action."
	
	| metaPropsForMyValue myValue choices selection |
	(Smalltalk includesKey: #MetaProperty) ifFalse: [^nil ].
	
	myValue := self valueWhenDropped.
	metaPropsForMyValue := 
		(MetaProperty metaPropsForMorph:  aDropTargetMorph targetMorph)
			select: [ :metaProp | metaProp accepts: myValue ]. 
	(metaPropsForMyValue size isZero) ifTrue: [^nil ].
	
	choices := OrderedCollection with: #Cancel.
	choices addAll: (metaPropsForMyValue keys).
	
	"I am being carried by the hand.  Disappear and let user make a choice."
	self delete.
	selection := PopUpMenu withCaption: 'Choose setter' 
						chooseFrom: choices.
	(selection = 1) ifFalse: [ "1 -> Cancel" | propName setterSym metaProp |
		propName := choices at: selection.
		setterSym := (propName , ':') asSymbol.
		metaProp := metaPropsForMyValue at: propName.
		(metaProp isKindOf: MetaPropertyMultiSelect)
			ifTrue: [myValue := metaProp encodeProc value: myValue].
		aDropTargetMorph targetMorph 
			perform: setterSym
			with: myValue ;
			triggerEvent: #propertyChanged.
	].! !

!SignMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 3/3/2022 12:35:29'!
justDroppedInto: newOwnerMorph event: anEvent 
	"This message is sent to a dropped morph after it has been dropped on -- and been accepted by -- a drop-sensitive morph"

	self showAcceptAndDeleteSelf ! !

!SignMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 3/3/2022 12:57:57'!
rejectDropMorphEvent: dropEvent
	"The receiver has been rejected.  Disappear"
	
"	Transcript newLine; show: 'SignMorph>>rejectDropMorphEvent'. "
	self showReject; hide; delete.
	self world ifNotNil: [ :w | w activeHand removeMorph: self ].
! !

!SignMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 12/6/2016 18:53:56'!
valueWhenDropped

	^ self object ! !

!SignMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 3/3/2022 12:30:50'!
wantsToBeDroppedInto: aMorph
	"Who do I wish to be dropped onto?"

	((Smalltalk includesKey: #MorphEditLens) "May not be present"
	 and: [aMorph isKindOf: (Smalltalk at: #MorphEditLens)])
		ifTrue: [ ^true ].
		
	(aMorph hasProperty: #dropAction)
		ifTrue: [ ^true ].
		
	((Smalltalk includesKey: #VisualPropertyMenuItem)
	 and: [ aMorph isKindOf: (Smalltalk at: #VisualPropertyMenuItem) ])
		ifTrue: [ ^true ].
				
	^ false! !

!SignMorph methodsFor: 'drawing' stamp: 'hlsf 9/12/2024 10:52:59'!
drawOn: aCanvas
	"Add border to inherited"
	| r |
	r := self localBounds.
	"aCanvas roundRect: r color: self color radius: 4."
	aCanvas fillRectangle: r color: self color.
	aCanvas
		drawTextComposition: textComposition 
		at: (r insetBy: 4) origin 
		extent: textComposition usedExtent 
		color: `Color black` 
		selectionColor: (Theme current textHighlightFocused: false) avoidOverhang: true.
! !

!SignMorph class methodsFor: 'instance creation' stamp: 'KenD 10/5/2013 16:54'!
contents: someString

	Error signal: 'USE: ', self name asString, ' forObject: anObject'
	! !

!SignMorph class methodsFor: 'instance creation' stamp: 'KenD 10/5/2013 16:52'!
forObject: anObject

	^ self basicNew forObject: anObject ! !

!SignMorph class methodsFor: 'instance creation' stamp: 'KenD 10/5/2013 17:28'!
forObject: anObject withName: aString

	^ self basicNew forObject: anObject withName: aString! !

!SignMorph class methodsFor: 'instance creation' stamp: 'KenD 10/5/2013 16:54'!
new

	Error signal: 'USE: ', self name asString, ' forObject: anObject'
	! !

!SignMorph class methodsFor: 'examples' stamp: 'KenD 7/11/2024 13:29:15'!
example1
" self example1 openInWorld "
	^ SignMorph forObject: (Preferences at: #standardListFont)! !

!SignMorph class methodsFor: 'examples' stamp: 'hlsf 12/17/2021 09:54:49'!
example2
" self example2 openInWorld "
	^ SignMorph forObject: #giveMeASign! !

!SignMorph class methodsFor: 'examples' stamp: 'hlsf 12/17/2021 09:55:49'!
example3
" self example3 openInWorld "
	| rect |
	rect _ Rectangle origin: 1@2 corner: 2@3.
	^ SignMorph 
		forObject: rect 
		withName: 'aRectangle(' , rect hash asString, ')' ! !

!SignMorph class methodsFor: 'examples' stamp: 'hlsf 12/17/2021 09:56:22'!
example4
" self example4 openInWorld "
	| rect |
	rect _ Rectangle origin: 1@2 corner: 2@3.
	^ SignMorph forObject: rect! !

!SignMorph class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 14:56:49'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!SignMorph class methodsFor: 'new-morph participation' stamp: 'KenD 10/5/2013 16:55'!
includeInNewMorphMenu 

	^ false! !

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

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 9/2/2024 19:34:52'!
height

	^ self extentInOwner y! !

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

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 9/2/2024 19:34:56'!
width

	^ self extentInOwner x! !

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

!WindowTitleMorph methodsFor: 'initialization' stamp: 'KenD 3/8/2025 14:22:01'!
initialize

	super initialize.
	self
		morphPosition: 0@0;
		gap: self buttonSeparation;
		padding: 6@6;
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

!SqueezeLabelMorph methodsFor: 'drawing' stamp: 'hlsf 4/5/2025 10:02:09'!
drawOn: aCanvas
	"We draw a string within a border.
	If not enough space, the string is squeezed.
	If excess space, the string is centered."
	
	| fitString stringWidth maxStringWidth excessWidth xOffset |
	fitString := self contents.
	stringWidth := self font widthOfString: fitString.
	maxStringWidth := extent x - self interiorOrigin x .
	(stringWidth > maxStringWidth)
	ifTrue: [ | numChars charsToElide |
		numChars := fitString size.
		"NB:  Char size varies.  Approximate"
		charsToElide := 
			((stringWidth - maxStringWidth) / self font averageCharWidth) ceiling.
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

!SqueezeLabelMorph methodsFor: 'geometry' stamp: 'KenD 10/26/2021 05:29:28'!
measureMinimumContent

	| f |
	f _ self font.
	^((f widthOfString: (contents squeezedTo: minChars)) max: 3)  @ f lineSpacing! !

!SqueezeLabelMorph methodsFor: 'geometry' stamp: 'hlsf 9/12/2024 10:48:42'!
minimumExtent

	^ self minimumStringExtent + self interiorOrigin ! !

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

!SqueezeLabelMorph methodsFor: 'as yet unclassified' stamp: 'hlsf 5/1/2025 12:55:29'!
contents: newContents
	super contents: newContents.
	self setBalloonText: newContents asString! !

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

!FrameMorph methodsFor: 'geometry testing' stamp: 'KenD 7/10/2024 14:02:04'!
minimumExtent
	"This returns the minimum extent that the morph may be shrunk to.
	It is expressed in the morph own coordinates, like morphExtent."

	^ `10@10`! !

!FrameMorph methodsFor: 'geometry testing' stamp: 'KenD 9/2/2024 19:35:05'!
morphContainsPoint: aPoint
	"Only the frame contains a point"
	| outerExtent innerExtent |
	outerExtent := (0@0 extent: self extentInOwner).
	innerExtent := outerExtent insetBy: self borderWidth.
	^ (outerExtent containsPoint: aPoint)
		and: [(innerExtent containsPoint: aPoint) not].! !

!FrameMorph methodsFor: 'accessing' stamp: 'hlsf 12/16/2021 09:49:05'!
borderStyle

	^ borderStyle! !

!FrameMorph methodsFor: 'accessing' stamp: 'hlsf 12/16/2021 09:49:05'!
borderStyle: aSymbol

	(#(simple inset raised) includes: aSymbol) ifFalse: [
		 Error signal: aSymbol printString, ' must be #raised, #inset, or #simple'
	].
	borderStyle := aSymbol! !

!FrameMorph methodsFor: 'accessing' stamp: 'KenD 9/16/2013 14:58'!
borderWidth

	^ borderWidth ! !

!FrameMorph methodsFor: 'initialization' stamp: 'KenD 10/12/2013 16:45'!
defaultBorderColor
	"answer the default border color/fill style for the receiver"
	
	^  self class colors first! !

!FrameMorph methodsFor: 'initialization' stamp: 'KenD 10/12/2013 16:41'!
defaultBorderWidth
	"answer the default border width for the receiver"
	
	^ 8! !

!FrameMorph methodsFor: 'initialization' stamp: 'KenD 9/17/2013 15:25'!
defaultColor

     ^ Color transparent! !

!FrameMorph methodsFor: 'initialization' stamp: 'KenD 10/12/2013 16:59'!
defaultExtent

	^ 100 @ 60! !

!FrameMorph methodsFor: 'initialization' stamp: 'KenD 10/12/2013 16:41'!
defaultFrameSelector
	"answer the default frame selector for the receiver"
	
	^ #simple! !

!FrameMorph methodsFor: 'initialization' stamp: 'hlsf 12/16/2021 09:47:37'!
initialize

	super initialize.

	colorIndex := 1.
	self borderColor:    self defaultBorderColor;
		 borderStyle: self defaultFrameSelector;
		 borderWidth:    self defaultBorderWidth;
		 morphExtent:    self defaultExtent.
! !

!FrameMorph methodsFor: 'events-processing' stamp: 'KenD 9/15/2013 21:15'!
cycleBorderColor
	"Change border color to next in Colors"

	(colorIndex = self class colors size)
	ifTrue:  [colorIndex := 1]
	ifFalse: [colorIndex := colorIndex + 1].

	self borderColor: (self class colors at: colorIndex).

	^ self borderColor! !

!FrameMorph methodsFor: 'events-processing' stamp: 'jmv 2/13/2014 14:24'!
stepAt: millisecondClockValue

	self cycleBorderColor ! !

!FrameMorph methodsFor: 'drawing' stamp: 'hlsf 12/16/2021 09:49:05'!
drawOn: aCanvas
	"A canvas is already set with a proper transformation from our coordinates to those of the Canvas target."

	aCanvas
		frameRectangle: (0@0 extent: extent)
		color: borderColor
		borderWidth: borderWidth
		borderStyleSymbol: borderStyle
! !

!FrameMorph methodsFor: 'events' stamp: 'KenD 9/15/2013 21:35'!
stopStepping

	self world stopStepping: self.! !

!FrameMorph class methodsFor: 'accessing' stamp: 'KenD 9/15/2013 21:05'!
colors

	^ Colors ! !

!FrameMorph class methodsFor: 'accessing' stamp: 'KenD 9/15/2016 15:55:19'!
setColors: colorArray
"
	self setColors: (Color orange mix: Color purple shades: 8).
	self example1.
"

	Colors := colorArray! !

!FrameMorph class methodsFor: 'examples' stamp: 'hlsf 12/16/2021 09:47:37'!
example1
"
	self example1 openInWorld.
"
	| fm |
	fm := FrameMorph new..
	"fm cycleBorderColor."
	fm borderStyle: #simple.
	fm borderWidth: 8.
	fm morphPosition: 20@20.
	fm morphExtent: 200@100.
	fm openInWorld.
	fm startStepping.
	^ fm
"
	fm stopStepping.
"! !

!FrameMorph class methodsFor: 'class initialization' stamp: 'KenD 12/12/2021 15:52:52'!
initialize
"
	self initialize.
"
	Colors := { Color red. Color yellow. Color green. }.! !

!LineMorph methodsFor: 'private' stamp: 'KenD 9/27/2013 15:36'!
basicExtent: aPoint

	extent := aPoint! !

!LineMorph methodsFor: 'private' stamp: 'KenD 9/27/2013 15:45'!
rect

	^ Rectangle origin: 0@0 corner: extent! !

!LineMorph methodsFor: 'private' stamp: 'hlsf 9/12/2024 10:20:32'!
setPointSelectorsFromStartPoint: startPoint endPoint: endPoint
	"Reset both my start and end points -- points in owner coordinates"

	| origin corner rect |
	origin  := ((startPoint x) min: (endPoint x)) @ ((startPoint y) min: (endPoint y)).
	corner := ((startPoint x) max: (endPoint x)) @ ((startPoint y) max: (endPoint y)).
	
	rect := Rectangle origin: origin corner: corner. "Owner coordinates"

	(startPoint = rect topLeft)        ifTrue: [ startPointSelector := #topLeft ].
	(startPoint = rect topRight)       ifTrue: [ startPointSelector := #topRight ].
	(startPoint = rect bottomLeft)  ifTrue: [ startPointSelector := #bottomLeft ].
	(startPoint = rect bottomRight) ifTrue: [ startPointSelector := #bottomRight ].
	
	(endPoint = rect topLeft)         ifTrue: [ endPointSelector   := #topLeft ].
	(endPoint = rect topRight)        ifTrue: [ endPointSelector   := #topRight ].
	(endPoint = rect bottomLeft)   ifTrue: [ endPointSelector   := #bottomLeft ].
	(endPoint = rect bottomRight)  ifTrue: [ endPointSelector   := #bottomRight ].

	self basicExtent: rect extent.
	self morphPosition: rect topLeft.
	"@@DEBUG@@"
"	('SetArgs: startPoint: ', startPoint asString, ' endPoint: ', endPoint asString) print.
	('Result:    startPoint: ', self startPoint asString, ' endPoint: ', self endPoint asString) print.
"! !

!LineMorph methodsFor: 'accessing' stamp: 'KenD 9/27/2013 15:32'!
color

	^ color! !

!LineMorph methodsFor: 'accessing' stamp: 'KenD 9/27/2013 16:35'!
color: aColor

	(aColor class = Color) ifFalse: [ Error signal: 'Not a color: ', aColor printString ].

	color := aColor.
	self redrawNeeded ! !

!LineMorph methodsFor: 'accessing' stamp: 'KenD 9/26/2013 19:11'!
endPoint
	"Answer my endPoint in owner's coordinates"

	^ (self rect perform: endPointSelector) + (self morphPosition) truncated ! !

!LineMorph methodsFor: 'accessing' stamp: 'jmv 9/29/2013 22:47'!
endPoint: aPoint
	"aPoint is in owner coordinates.  Set my startPoint in own coordinates"
	
	(aPoint isKindOf: Point) ifFalse: [ Error signal: 'Not a Point: ', aPoint printString ].
		
	self redrawNeeded.
	self setPointSelectorsFromStartPoint: self startPoint 
		  endPoint: aPoint.
	self redrawNeeded.! !

!LineMorph methodsFor: 'accessing' stamp: 'KenD 9/26/2013 18:55'!
length

	^ self startPoint dist: self endPoint! !

!LineMorph methodsFor: 'accessing' stamp: 'KenD 9/26/2013 16:23'!
lineWidth

	^ lineWidth ! !

!LineMorph methodsFor: 'accessing' stamp: 'KenD 9/30/2013 14:36'!
lineWidth: newWidthInPixels

	self redrawNeeded.
	lineWidth := newWidthInPixels.
	self redrawNeeded ! !

!LineMorph methodsFor: 'accessing' stamp: 'KenD 9/26/2013 19:11'!
startPoint
	"Answer my startPoint in owner's coordinates"
	
	^ (self rect perform: startPointSelector) + (self morphPosition) truncated! !

!LineMorph methodsFor: 'accessing' stamp: 'KenD 9/30/2013 14:36'!
startPoint: aPoint
	"aPoint is in owner coordinates.  Set my startPoint in own coordinates"
	
	(aPoint isKindOf: Point) ifFalse: [ Error signal: 'Not a Point: ', aPoint printString ].
	
	self redrawNeeded.
	self setPointSelectorsFromStartPoint: aPoint 
		 endPoint: self endPoint.
	self redrawNeeded.! !

!LineMorph methodsFor: 'accessing' stamp: 'KenD 9/30/2013 14:36'!
startPoint: newStart endPoint: newEnd
	"Reset my start and end points (Nota Bene: points in owner coordinates)"

	(newStart isKindOf: Point)
		ifFalse: [ Error signal: 'Not a Point: ', newStart printString ].
	(newEnd isKindOf: Point)
		ifFalse: [ Error signal: 'Not a Point: ', newEnd printString ].

	self redrawNeeded.	
	self setPointSelectorsFromStartPoint: newStart endPoint: newEnd.
	self redrawNeeded.! !

!LineMorph methodsFor: 'drawing' stamp: 'hlsf 9/12/2024 10:21:55'!
drawOn: aCanvas
	"Draw self in own coordinates"
	
	| rect |
	"Reduce to avoid external artifacts"
	rect := self rect insetBy: lineWidth .
	aCanvas
		line: (rect perform: startPointSelector)
		to:  (rect perform: endPointSelector)
		width: lineWidth
		color: color! !

!LineMorph methodsFor: 'initialization' stamp: 'KenD 9/27/2013 15:54'!
initialize

	super initialize.
	extent := 100@180.
	startPointSelector := #topLeft.
	endPointSelector   := #bottomRight.
	lineWidth := 6.
	color := Color cyan.
	! !

!LineMorph methodsFor: 'initialization' stamp: 'KenD 9/30/2013 15:25'!
startPoint: startPoint endPoint: endPoint width: numPixels color: aColor

	lineWidth := numPixels.
	color       := aColor.
	self setPointSelectorsFromStartPoint: startPoint endPoint: endPoint.
	! !

!LineMorph methodsFor: 'geometry testing' stamp: 'KenD 9/26/2013 15:39'!
isOrthoRectangularMorph

	^ false! !

!LineMorph methodsFor: 'geometry testing' stamp: 'KenD 7/10/2024 14:02:40'!
minimumExtent
	"This returns the minimum extent that the morph may be shrunk to.
	It is expressed in the morph own coordinates, like morphExtent."

	^ `10@10`! !

!LineMorph methodsFor: 'geometry' stamp: 'KenD 9/27/2013 16:29'!
morphExtent
	"Answer an extent which includes me, taking into account my lineWidth"

	^ extent + lineWidth + lineWidth! !

!LineMorph methodsFor: 'geometry' stamp: 'KenD 9/27/2013 16:28'!
morphExtent: aPoint 
	"Set the receiver's extent to value provided. Honor my minimumExtent."

	| innerExtent |
	innerExtent := aPoint - lineWidth - lineWidth.
	extent = innerExtent ifTrue: [^ self ].
	self redrawNeeded.
	extent _ (innerExtent max: self minimumExtent).
	self redrawNeeded! !

!LineMorph class methodsFor: 'instance creation' stamp: 'KenD 9/26/2013 16:21'!
initializedInstance
	"Hand out a sample line"

	^ self new startPoint: 20@30 endPoint: 120@160 width: 6 color: Color cyan
! !

!LineMorph class methodsFor: 'instance creation' stamp: 'KenD 9/26/2013 18:51'!
startPoint: start endPoint: end

	^ self new startPoint: start endPoint: end! !

!LineMorph class methodsFor: 'instance creation' stamp: 'KenD 9/26/2013 16:21'!
startPoint: start endPoint: end width: numPixels color: aColor

	^ self new startPoint: start endPoint: end width: numPixels color: aColor! !

!LineMorph class methodsFor: 'examples' stamp: 'KenD 12/20/2021 11:41:49'!
example1
"
  LineMorph example1 openInWorld 
"
	^ self 
		startPoint: Display center 
		endPoint: Display extent // (3/2) 
		width: 8 
		color: (Color lightGreen alpha: 0.8)! !

!ListModel methodsFor: 'accessing' stamp: 'hlsf 4/2/2022 14:30:19'!
list
	^ collection! !

!ListModel methodsFor: 'accessing' stamp: 'hlsf 5/2/2025 18:18:11'!
list: aCollection
	collection := aCollection.
	aCollection ifNotEmpty: [selectedIndex := 1]! !

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

!Morph methodsFor: '*ui-core' stamp: 'KenD 9/2/2024 20:24:18'!
showAccept
	"I have just been dropped.
	Draw and erase a green box ."

	| hilightMorph mPos mExtent |
	mPos     := self positionInWorld.
	mExtent := self extentInOwner.
	hilightMorph := FrameMorph new.
	hilightMorph   borderWidth: 6;
					borderColor: Color green;
					morphExtent: mExtent + 6;
					openInWorld;
					morphPosition: mPos - (6@6). "surround aMorph"

	hilightMorph addAlarm: #delete after: 400.! !

!Morph methodsFor: '*ui-core' stamp: 'KenD 9/2/2024 20:24:21'!
showAcceptAndDeleteSelf
	"I have just been dropped.
	Draw and erase a green box and delete self."

	| hilightMorph mPos mExtent |
	mPos     := self positionInWorld.
	mExtent := self extentInOwner.
	hilightMorph := FrameMorph new.
	hilightMorph   borderWidth: 6;
					borderColor: Color green;
					morphExtent: mExtent + 6;
					openInWorld;
					morphPosition: mPos - (6@6). "surround aMorph"

	self               addAlarm: #delete after: 200.
	hilightMorph addAlarm: #delete after: 400.! !

!Morph methodsFor: '*ui-core' stamp: 'KenD 9/2/2024 20:24:28'!
showReject
	"Draw and erase a red X"

	| leftStroke rightStroke mPos mExtent |
	mPos := self positionInWorld.
	mExtent := self extentInOwner.
	"Show a red X"
	leftStroke   := LineMorph 
						startPoint: mPos - (10@10) 
						endPoint: (mPos + mExtent + (10@10)) 
						width: 6
						color: Color red.
	rightStroke := LineMorph 
						startPoint: mPos + (-10 @ (mExtent y + 10))
						endPoint: (mPos + ((10 + mExtent x) @ -10)) 
						width: 6
						color: Color red.
	leftStroke   openInWorld.
	rightStroke openInWorld.
	
	"NB: Keep Morph when rejected"
	leftStroke   addAlarm: #delete after: 400.	
	rightStroke addAlarm: #delete after: 400.
	! !

!Morph methodsFor: '*ui-core' stamp: 'KenD 7/24/2024 11:48:05'!
signMorphForMe

	^ SignMorph forObject: self! !

!Morph methodsFor: '*ui-core' stamp: 'KenD 7/24/2024 11:47:57'!
wantsDroppedMorph: aMorph event: evt
	"Return true if the receiver wishes to accept the given morph, 
	 which is being dropped by a hand in response to the given event. 
	Note that for a successful drop operation both parties need to agree. 
	The symmetric check is done automatically via aMorph wantsToBeDroppedInto: self.
	 Individual Morpks may override by setting the corresponding property
	 to an appropriate two argument closure."

	^self valueOfProperty: #wantsDroppedMorph:event:
		 ifPresentDo: [ :wantsMorphEvt | wantsMorphEvt value: aMorph value: evt ]
		 ifAbsent: [ true ]! !
FrameMorph initialize!
