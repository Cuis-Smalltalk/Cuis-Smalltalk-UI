'From Cuis 6.0 [latest update: #5065] on 8 February 2022 at 5:43:14 pm'!
'Description Various Morphs required to construct widgets and other UI affordances.'!
!provides: 'UI-Base-Morphs' 1 14!
!requires: 'Cuis-Base' 60 5031 nil!
SystemOrganization addCategory: 'UI-Base-Morphs'!


!classDefinition: #WindowTitleMorph category: 'UI-Base-Morphs'!
LayoutMorph subclass: #WindowTitleMorph
	instanceVariableNames: 'titleMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Base-Morphs'!
!classDefinition: 'WindowTitleMorph class' category: 'UI-Base-Morphs'!
WindowTitleMorph class
	instanceVariableNames: ''!

!classDefinition: #SqueezeLabelMorph category: 'UI-Base-Morphs'!
LabelMorph subclass: #SqueezeLabelMorph
	instanceVariableNames: 'minChars'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Base-Morphs'!
!classDefinition: 'SqueezeLabelMorph class' category: 'UI-Base-Morphs'!
SqueezeLabelMorph class
	instanceVariableNames: ''!

!classDefinition: #EllipseMorph category: 'UI-Base-Morphs'!
BoxedMorph subclass: #EllipseMorph
	instanceVariableNames: 'borderStyle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Base-Morphs'!
!classDefinition: 'EllipseMorph class' category: 'UI-Base-Morphs'!
EllipseMorph class
	instanceVariableNames: ''!

!classDefinition: #FrameMorph category: 'UI-Base-Morphs'!
BoxedMorph subclass: #FrameMorph
	instanceVariableNames: 'colorIndex borderStyle'
	classVariableNames: 'Colors'
	poolDictionaries: ''
	category: 'UI-Base-Morphs'!
!classDefinition: 'FrameMorph class' category: 'UI-Base-Morphs'!
FrameMorph class
	instanceVariableNames: ''!

!classDefinition: #LineMorph category: 'UI-Base-Morphs'!
BoxedMorph subclass: #LineMorph
	instanceVariableNames: 'startPointSelector endPointSelector lineWidth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Base-Morphs'!
!classDefinition: 'LineMorph class' category: 'UI-Base-Morphs'!
LineMorph class
	instanceVariableNames: ''!

!classDefinition: #PointerLineMorph category: 'UI-Base-Morphs'!
LineMorph subclass: #PointerLineMorph
	instanceVariableNames: 'endPointMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Base-Morphs'!
!classDefinition: 'PointerLineMorph class' category: 'UI-Base-Morphs'!
PointerLineMorph class
	instanceVariableNames: ''!


!WindowTitleMorph commentStamp: '<historical>' prior: 0!
I hold and layout the title section of windows/panels.

My owner gets messages for standard buttons.

As my instances are created before my owner is set, I delegate events to my owner.

To simplify management, all buttons are present but hidden unless requested.

See Panel, LayoutMorphEditPanel and LayoutSpecEditPanel as usage examples!

!SqueezeLabelMorph commentStamp: '<historical>' prior: 0!
A LabelMorph displays a fixed size string (with font an emphasis).
I do the same but can be "pinched" to squeeze out letters.

minChars specifies the minimum number of characters I should display.
I display at least 3 characters.!

!EllipseMorph commentStamp: '<historical>' prior: 0!
A round bordered Morph. Supports borderWidth and borderColor. 

EllipseMorph new borderWidth:10; borderColor: Color green; openInWorld.
!

!FrameMorph commentStamp: '<historical>' prior: 0!
I appear as an empty frame!

!LineMorph commentStamp: '<historical>' prior: 0!
I am a line from my start point to my end point.!

!PointerLineMorph commentStamp: '<historical>' prior: 0!
I am a LineMorph which has a "pointer" morph which I maintain in position at my endpoint.!

!SqueezeLabelMorph class methodsFor: 'instance creation' stamp: 'KenD 12/13/2021 13:28:42'!
initializedInstance

	| newInstance |
	newInstance := super new :: minCharsToShow: 7.
	^newInstance 
		morphExtent: newInstance minimumExtent;
		yourself! !

!LineMorph class methodsFor: 'instance creation' stamp: 'KenD 9/26/2013 16:21'!
initializedInstance
	"Hand out a sample line"

	^ self new startPoint: 20@30 endPoint: 120@160 width: 6 color: Color cyan
! !

!PointerLineMorph class methodsFor: 'instance creation' stamp: 'KenD 9/15/2016 17:37:25'!
initializedInstance

	| newInst |
	newInst  := super initializedInstance.
	newInst updateEndPoint.
	^newInst! !

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

!WindowTitleMorph methodsFor: 'accessing' stamp: 'KenD 1/17/2022 12:43:06'!
dontShrinkTitle

	| oldTitle |
	oldTitle := titleMorph.
	titleMorph := LabelMorph 
				contents: titleMorph contents 
				font: titleMorph font
				"emphasis: titleMorph emphasis" .
	self replaceSubmorph: oldTitle by: titleMorph! !

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

!WindowTitleMorph methodsFor: 'geometry' stamp: 'KenD 10/25/2021 14:27:13'!
labelHeight
	"Answer the height for the window label."

	^  Preferences windowTitleFont lineSpacing+1! !

!WindowTitleMorph methodsFor: 'geometry' stamp: 'KenD 10/25/2021 15:17:28'!
minimumButtonsExtent

	| width height numButtons |
	numButtons := self buttonNamesShown size.
	height := Theme current titleBarButtonsExtent y.
	"Note: separation between each button + two ends"
	width := (numButtons * self buttonExtent x) + (numButtons + 2 * self buttonSeparation).
	^ width @ height! !

!WindowTitleMorph methodsFor: 'geometry' stamp: 'KenD 11/23/2016 14:52:05'!
minimumExtent

	| minButtonExt minTitleExt |
	minButtonExt :=  self minimumButtonsExtent.
	minTitleExt    := self minimumTitleExtent.
	^ (minButtonExt x + minTitleExt x) 
     	   @ (minButtonExt y max: minTitleExt y)! !

!WindowTitleMorph methodsFor: 'geometry' stamp: 'jmv 4/25/2019 10:08:37'!
minimumTitleExtent
	"My titleString can shrink a bit but not completely"
	| font |
	font := Preferences windowTitleFont.

	"Keep space for 8 characters"
	^ (8 * (font widthOf: $A)) @ (4 + font lineSpacing)
	! !

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

!WindowTitleMorph methodsFor: 'event handling' stamp: 'KenD 10/26/2021 16:07:19'!
resetTitleFont
	"Reset my title font"
	titleMorph font: Preferences windowTitleFont! !

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

!WindowTitleMorph methodsFor: 'initialization' stamp: 'KenD 10/26/2021 16:12:16'!
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
					font: Preferences windowTitleFont
					minCharsToShow: 8
					:: 
					color: Color black.
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

!WindowTitleMorph methodsFor: 'initialization' stamp: 'KenD 1/17/2022 08:19:28'!
dontShrinkTitle: aString buttonsNamed: aSymbolColleciton
	"Set me up"
	
	titleMorph := LabelMorph contents: aString font: Preferences windowTitleFont.
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

!SqueezeLabelMorph methodsFor: 'accessing' stamp: 'KenD 10/26/2021 05:45:41'!
minCharsToShow

	^minChars! !

!SqueezeLabelMorph methodsFor: 'accessing' stamp: 'KenD 12/20/2021 13:56:26'!
minCharsToShow: numChars
	"I show at least 3 characters at minimum"
	
	minChars := numChars max: 3! !

!SqueezeLabelMorph methodsFor: 'drawing' stamp: 'KenD 12/20/2021 15:19:54'!
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
	(excessWidth > 0)
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

!SqueezeLabelMorph methodsFor: 'initialization' stamp: 'KenD 12/20/2021 13:57:09'!
initialize

	self minCharsToShow: 3. "required for size calc by super"
	super initialize.
	self layoutSpec: (LayoutSpec morphHeightProportionalWidth: 1.0).! !

!SqueezeLabelMorph class methodsFor: 'instance creation' stamp: 'KenD 10/26/2021 05:52:29'!
contents: aString font: aFont emphasis: emphasisCode minCharsToShow: numChars

	^ super contents: aString font: aFont emphasis: emphasisCode :: minCharsToShow: numChars! !

!SqueezeLabelMorph class methodsFor: 'instance creation' stamp: 'KenD 10/26/2021 05:52:00'!
contents: aString font: aFont minCharsToShow: numChars

	^ super contents: aString font: aFont :: minCharsToShow: numChars! !

!SqueezeLabelMorph class methodsFor: 'instance creation' stamp: 'KenD 10/26/2021 05:50:59'!
contents: aString minCharsToShow: numChars

	^ super contents: aString :: minCharsToShow: numChars! !

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

!EllipseMorph methodsFor: 'drawing' stamp: 'hlsf 12/16/2021 09:38:39'!
drawOn: aCanvas 
	| radius |
	radius _ extent // 2.
	aCanvas ellipseCenter: radius radius: radius borderWidth: borderWidth borderColor: borderColor fillColor: color! !

!EllipseMorph methodsFor: 'geometry testing' stamp: 'jmv 10/7/2009 23:21'!
isOrthoRectangularMorph
	^false! !

!EllipseMorph methodsFor: 'geometry testing' stamp: 'KenD 2/8/2022 17:32:49'!
knowsOwnLocalBounds

	^false! !

!EllipseMorph methodsFor: 'geometry testing' stamp: 'pb 3/17/2020 13:36:07'!
morphContainsPoint: aLocalPoint

	| radius other delta xOverY |
	(self morphLocalBounds containsPoint: aLocalPoint) ifFalse: [^ false].  "quick elimination"
	extent > `1@1`
		ifFalse: [^ true].  "Degenerate case -- code below fails by a bit"

	radius _ extent y asFloat / 2.
	other _ extent x asFloat / 2.
	delta _ aLocalPoint - (other@radius).
	xOverY _ extent x asFloat / extent y asFloat.
	^ (delta x asFloat / xOverY) squared + delta y squared <= radius squared! !

!EllipseMorph methodsFor: 'initialization' stamp: 'dgd 2/14/2003 22:37'!
defaultBorderWidth
	"answer the default border width for the receiver"
	^ 1! !

!EllipseMorph methodsFor: 'visual properties' stamp: 'KenD 12/31/2021 13:07:32'!
borderStyle

	^ borderStyle! !

!EllipseMorph methodsFor: 'visual properties' stamp: 'KenD 12/31/2021 13:08:14'!
borderStyle: aSymbol

	( #(simple raised inset) includes: aSymbol )
		ifFalse: [ self error: 'Border Style must be one of #simple #raised or #inset; got: ', aSymbol printString ].
		
	borderStyle := aSymbol! !

!EllipseMorph methodsFor: 'visual properties' stamp: 'jmv 3/10/2018 22:24:29'!
defaultColor
	"Return the default fill style for the receiver"
	^ `Color yellow`! !

!EllipseMorph class methodsFor: 'new-morph participation' stamp: 'pb 6/8/2017 23:50:14'!
categoryInNewMorphMenu
	^ 'Basic'! !

!EllipseMorph class methodsFor: 'examples' stamp: 'KenD 12/20/2021 10:57:45'!
example1
"
  EllipseMorph example1 openInWorld 
"
	^ self new morphExtent: 50@20! !

!EllipseMorph class methodsFor: 'examples' stamp: 'KenD 12/20/2021 10:58:03'!
example2
"
  EllipseMorph example2 openInWorld 
"
	^ self new morphExtent: 50@80;
		borderWidth: 4;
		borderColor: Color red muchDarker;
		color: Color red;
		morphPosition: 0@0! !

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

!FrameMorph methodsFor: 'drawing' stamp: 'hlsf 12/16/2021 09:49:05'!
drawOn: aCanvas
	"A canvas is already set with a proper transformation from our coordinates to those of the Canvas target."

	aCanvas
		frameRectangle: (0@0 extent: extent)
		color: borderColor
		borderWidth: borderWidth
		borderStyleSymbol: borderStyle
! !

!FrameMorph methodsFor: 'geometry testing' stamp: 'KenD 11/7/2021 14:16:26'!
morphContainsPoint: aPoint
	"Only the frame contains a point"
	| outerExtent innerExtent |
	outerExtent := (0@0 extent: self morphExtentInOwner).
	innerExtent := outerExtent insetBy: self borderWidth.
	^ (outerExtent containsPoint: aPoint)
		and: [(innerExtent containsPoint: aPoint) not].! !

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

!LineMorph methodsFor: 'private' stamp: 'KenD 12/17/2021 19:30:49'!
minimumExtent

	^ lineWidth @ lineWidth ! !

!LineMorph methodsFor: 'private' stamp: 'KenD 9/27/2013 15:45'!
rect

	^ Rectangle origin: 0@0 corner: extent! !

!LineMorph methodsFor: 'private' stamp: 'KenD 9/30/2013 15:29'!
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

!LineMorph methodsFor: 'drawing' stamp: 'KenD 12/20/2021 11:48:06'!
drawOn: aCanvas
	"Draw self in own coordinates"
	
	| rect |
	"Reduce to avoid external artifacts"
	rect := self rect insetBy: 1.
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

!LineMorph methodsFor: 'geometry testing' stamp: 'KenD 9/26/2013 15:39'!
isOrthoRectangularMorph

	^ false! !

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

!LineMorph methodsFor: 'geometry' stamp: 'KenD 2/28/2015 11:31'!
morphExtentInWorld: newExtent
	"world coordinates"
	self flag: #jmvVer2.
	self morphExtent: (self internalizeDistanceFromWorld: newExtent)! !

!LineMorph methodsFor: 'initialize-release' stamp: 'KenD 9/30/2013 15:25'!
startPoint: startPoint endPoint: endPoint width: numPixels color: aColor

	lineWidth := numPixels.
	color       := aColor.
	self setPointSelectorsFromStartPoint: startPoint endPoint: endPoint.
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

!PointerLineMorph methodsFor: 'accessing' stamp: 'KenD 9/15/2016 16:25:30'!
endPointMorph
	
	^ endPointMorph! !

!PointerLineMorph methodsFor: 'accessing' stamp: 'KenD 12/12/2016 15:15:59'!
endPointMorph: aMorph
	
	self endPointMorph ifNotNil: [ :pointer | self removeMorph: pointer ].
	endPointMorph := aMorph.
	self addMorphFront: aMorph.
	self updateEndPoint.
! !

!PointerLineMorph methodsFor: 'initialization' stamp: 'KenD 9/15/2016 16:40:58'!
initialize

	super initialize.
	self endPointMorph:
		(BoxedMorph new 
			:: color: Color yellow; 
			borderColor: Color red; 
			borderWidth: 3; 
			morphExtent: 16@16; 
			yourself).
	self updateEndPoint.! !

!PointerLineMorph methodsFor: 'geometry' stamp: 'KenD 9/15/2016 16:28:43'!
morphExtent: newExtent

	super morphExtent: newExtent.
	self updateEndPoint.! !

!PointerLineMorph methodsFor: 'geometry' stamp: 'KenD 12/12/2016 15:21:19'!
setPointSelectorsFromStartPoint: startPoint endPoint: endPoint

	super setPointSelectorsFromStartPoint: startPoint endPoint: endPoint.
	self updateEndPoint ! !

!PointerLineMorph methodsFor: 'geometry' stamp: 'KenD 12/19/2021 08:17:41'!
submorphsMightProtrude
	"My pointer morph sticks out"
	
	^ true! !

!PointerLineMorph methodsFor: 'geometry' stamp: 'KenD 11/7/2021 14:13:48'!
updateEndPoint
	"Place my pointer morph at my endpoint, centered"
	
	| pointMorphCenter endPointOffset |
	pointMorphCenter := (self endPointMorph morphExtentInOwner) / 2.
	endPointOffset := (self rect perform: endPointSelector) + (self lineWidth / 2).
	self endPointMorph morphPosition: endPointOffset - pointMorphCenter.! !

!PointerLineMorph class methodsFor: 'examples' stamp: 'KenD 12/20/2021 11:40:31'!
example1
"
  PointerLineMorph example1 openInWorld 
"
	^ super example1! !
FrameMorph initialize!
