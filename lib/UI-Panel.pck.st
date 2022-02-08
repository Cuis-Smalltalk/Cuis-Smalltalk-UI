'From Cuis 6.0 [latest update: #5065] on 8 February 2022 at 1:20:38 pm'!
'Description I supply titled Panels, useful windows simpler
than SystemWindows.'!
!provides: 'UI-Panel' 1 20!
!requires: 'Cuis-Base' 60 5031 nil!
!requires: 'UI-Base-Morphs' 1 11 nil!
!requires: 'UI-Entry' 1 8 nil!
SystemOrganization addCategory: 'UI-Panel'!


!classDefinition: #PluggableScrollBar category: 'UI-Panel'!
ScrollBar subclass: #PluggableScrollBar
	instanceVariableNames: 'refreshValueSelector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PluggableScrollBar class' category: 'UI-Panel'!
PluggableScrollBar class
	instanceVariableNames: ''!

!classDefinition: #Panel category: 'UI-Panel'!
PluggableMorph subclass: #Panel
	instanceVariableNames: 'widgetsColor titleMorph layoutMorph stayUp'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'Panel class' category: 'UI-Panel'!
Panel class
	instanceVariableNames: ''!

!classDefinition: #DialogPanel category: 'UI-Panel'!
Panel subclass: #DialogPanel
	instanceVariableNames: 'buttonArea'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'DialogPanel class' category: 'UI-Panel'!
DialogPanel class
	instanceVariableNames: ''!

!classDefinition: #EditPanel category: 'UI-Panel'!
DialogPanel subclass: #EditPanel
	instanceVariableNames: 'editModel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'EditPanel class' category: 'UI-Panel'!
EditPanel class
	instanceVariableNames: ''!

!classDefinition: #ValueEntryPanel category: 'UI-Panel'!
DialogPanel subclass: #ValueEntryPanel
	instanceVariableNames: 'kind'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'ValueEntryPanel class' category: 'UI-Panel'!
ValueEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #CharacterEntryPanel category: 'UI-Panel'!
ValueEntryPanel subclass: #CharacterEntryPanel
	instanceVariableNames: 'characterEditMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'CharacterEntryPanel class' category: 'UI-Panel'!
CharacterEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #PointEntryPanel category: 'UI-Panel'!
ValueEntryPanel subclass: #PointEntryPanel
	instanceVariableNames: 'xEntryMorph yEntryMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PointEntryPanel class' category: 'UI-Panel'!
PointEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #PositiveFloatEntryPanel category: 'UI-Panel'!
ValueEntryPanel subclass: #PositiveFloatEntryPanel
	instanceVariableNames: 'numberEntryMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PositiveFloatEntryPanel class' category: 'UI-Panel'!
PositiveFloatEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #PositiveIntegerEntryPanel category: 'UI-Panel'!
ValueEntryPanel subclass: #PositiveIntegerEntryPanel
	instanceVariableNames: 'numberEntryMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PositiveIntegerEntryPanel class' category: 'UI-Panel'!
PositiveIntegerEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #StringEntryPanel category: 'UI-Panel'!
ValueEntryPanel subclass: #StringEntryPanel
	instanceVariableNames: 'stringEditMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'StringEntryPanel class' category: 'UI-Panel'!
StringEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #WizardPanel category: 'UI-Panel'!
DialogPanel subclass: #WizardPanel
	instanceVariableNames: 'pages currentPageIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'WizardPanel class' category: 'UI-Panel'!
WizardPanel class
	instanceVariableNames: ''!

!classDefinition: #WizardPage category: 'UI-Panel'!
Object subclass: #WizardPage
	instanceVariableNames: 'wizard panel buttons title'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'WizardPage class' category: 'UI-Panel'!
WizardPage class
	instanceVariableNames: ''!


!PluggableScrollBar commentStamp: '<historical>' prior: 0!
I am a ScrollBar which can get new values from my model.!

!Panel commentStamp: '<historical>' prior: 0!
I present a view of pickable images
!

!DialogPanel commentStamp: '<historical>' prior: 0!
I am a dialog panel with a button area at my bottom.!

!EditPanel commentStamp: '<historical>' prior: 0!
I abstract common edit methods for my concrete subclasses.

The gist is that my model is a reference to the original object.
My editModel is a "putty" or "shadow" copy to which all edit operations are applied.
If the user Update's then the changes are propagated from the editModel to the model.

Examples:
  LayoutMorphEditPanel open:  (LayoutMorph newRow).
  LayoutSpecEditPanel open: (LayoutSpec useAll).!

!ValueEntryPanel commentStamp: '<historical>' prior: 0!
I am an abstract class for editing simple values.!

!CharacterEntryPanel commentStamp: '<historical>' prior: 0!
I provide for editing/changing a single character.!

!PointEntryPanel commentStamp: '<historical>' prior: 0!
I am a panel for filling in a Point value.

My xEntryMorph and yEntryMorph hold the current points x@y value.

!

!PositiveFloatEntryPanel commentStamp: '<historical>' prior: 0!
I edit positive real numbers!

!PositiveIntegerEntryPanel commentStamp: '<historical>' prior: 0!
I edit positive integers!

!StringEntryPanel commentStamp: '<historical>' prior: 0!
I allow a user to edit a string!

!WizardPanel commentStamp: '<historical>' prior: 0!
I am an abstractact wizard to let the user input data in a sequence of differents pages. 
My model hold the data. In DrGeo, the model is a macro builder or script builder
It emits event when 
 - the user changes the page with the next and previous buttons
 - the user press apply and cancel
!

!Panel methodsFor: 'printing' stamp: 'KenD 4/24/2015 16:04'!
printOn: aStream 

	super printOn: aStream.
	aStream nextPutAll: '('.
	aStream
		print: self label;
		nextPutAll: ')'! !

!PluggableScrollBar methodsFor: 'initialization' stamp: 'KenD 8/26/2015 12:27'!
fontPreferenceChanged

	super fontPreferenceChanged.
	slider morphExtent: self buttonExtent @ self buttonExtent.! !

!PluggableScrollBar methodsFor: 'initialization' stamp: 'KenD 11/26/2013 21:12'!
initialize

	super initialize.
	slider morphExtent: self buttonExtent @ self buttonExtent.! !

!PluggableScrollBar methodsFor: 'accessing' stamp: 'KenD 11/25/2013 18:44'!
model: thang setValueSelector: setValueSym refreshValueSelector: getValueSym

	model := thang.
	setValueSelector := setValueSym.
	refreshValueSelector := getValueSym ! !

!PluggableScrollBar methodsFor: 'model access' stamp: 'KenD 2/8/2022 07:47:53'!
refreshValueFromModel
	"Called externally to reset value from model"

	refreshValueSelector ifNotNil: [
		self 
			value:  (model perform: refreshValueSelector) ;
			computeSlider.
	]! !

!PluggableScrollBar class methodsFor: 'new-morph participation' stamp: 'KenD 12/6/2013 19:06'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!Panel methodsFor: 'submorphs-add/remove' stamp: 'KenD 12/9/2013 16:44'!
addMorph: aMorph 
	"Add a submorph to our client area."

	layoutMorph addMorph: aMorph! !

!Panel methodsFor: 'submorphs-add/remove' stamp: 'KenD 12/9/2013 16:44'!
addMorph: aMorph layoutSpec: aLayoutSpec
	"Add a submorph to our client area."

	layoutMorph addMorph: aMorph layoutSpec: aLayoutSpec! !

!Panel methodsFor: 'submorphs-add/remove' stamp: 'KenD 12/18/2013 19:36'!
replaceArea: oldArea with: newArea
	"Replace oldArea in its container with newArea and clean up any ActionMaps"
	
	oldArea owner replaceSubmorph: oldArea by: newArea.
	oldArea releaseActionMap.
	self model removeActionsWithReceiver: oldArea.
	oldArea submorphsDo: [ :sm | 
		sm releaseActionMap.
		self model removeActionsWithReceiver: sm
	].

! !

!Panel methodsFor: 'drawing' stamp: 'KenD 9/5/2020 14:04:08'!
addPossiblyUncoveredAreasIn: aRectangle to: aCollection
	"Answer an array of rectangles encompassing those areas in aRectangle not completely
	covered by self. These are the areas that might require further drawing (of morphs below us)
	All areas that might possibly be uncovered must be included."
	 | r |
	self visible ifFalse: [ ^self ].
	
	color mightBeTranslucent ifTrue: [
		aCollection add: aRectangle.
		^self ].

	"Solid rectangle.
	This will be the fastest in many cases. So, please disable rounded corners if on slow hardware!!"
	Theme current roundWindowCorners ifFalse: [
		aRectangle areasOutside: self displayBounds do: [ :rr |  aCollection add: rr ].
		^self ].

	"The solid rectangle does not include the corners.
	Report a couple of rows (top and bottom) or columns (left and right) as uncovered areas.
	We could also try to be more careful and answer each rounded corner...
	Right now, report top and bottom rows as uncovered areas"
	r _ Theme current roundedWindowRadius.
	aRectangle areasOutside: (self displayBounds insetBy: 0@r) do: [ :rr |  aCollection add: rr ]! !

!Panel methodsFor: 'drawing' stamp: 'KenD 12/9/2013 17:08'!
drawClassicFrameOn: aCanvas color: titleColor
	"Window border encompasses title area. No round corners. No title gradient."

	aCanvas fillRectangle: (0@0 extent: extent) color: color borderWidth: borderWidth borderStyleSymbol: #simple baseColorForBorder: self widgetsColor.

	"A border was drawn at the left, top and right of the title area.
	The look is that the title area is inside the window"
	aCanvas fillRectangle: (borderWidth@borderWidth extent: extent x - (2*borderWidth)@ self labelHeight) color: titleColor! !

!Panel methodsFor: 'drawing' stamp: 'KenD 10/27/2021 12:46:29'!
drawOn: aCanvas

	| titleColor |

	titleColor _ self defaultColor.
	(Theme current roundWindowCorners)
		ifTrue: [
			"Round corners. Optional title gradient."
			self drawRoundedFrameOn: aCanvas color: titleColor ]
		ifFalse: [
			"No round corners. No title gradient."
			self drawClassicFrameOn: aCanvas color: titleColor ].

	self titleMorph ifNotNil: [ :titleM | titleM drawOn: aCanvas ].! !

!Panel methodsFor: 'drawing' stamp: 'KenD 9/25/2021 13:54:42'!
drawRoundedFrameOn: aCanvas color: theUIsColor
	"Title area is not inside window borders"
	aCanvas
		drawRoundedFrame: (0@0 extent: extent) 
		border: borderWidth 
		color: borderColor 
		insideColor: color 
		labelHeight: self labelHeight + borderWidth! !

!Panel methodsFor: 'drawing' stamp: 'hlsf 12/16/2021 10:43:34'!
makeMeFullyVisible 

	self world morphExtent > (0@0) ifFalse: [^ self].

	(self morphPosition >= (0@0) and: [ self morphPosition < (self world morphExtent-extent)]) ifTrue: [
		^ self "OK -- visible"].

	self morphPosition: (RealEstateAgent initialFrameFor: self initialExtent: self morphExtentInWorld world: self world) topLeft! !

!Panel methodsFor: 'drawing' stamp: 'KenD 12/9/2013 17:08'!
makeMeVisible 

	self world morphExtent > (0@0) ifFalse: [^ self].

	(self morphPosition >= (0@0) and: [ self morphPosition < (self world morphExtent-self labelHeight)]) ifTrue: [
		^ self "OK -- at least my top left is visible"].

	"window not on screen (probably due to reframe) -- move it now"
	self morphPosition: (RealEstateAgent initialFrameFor: self initialExtent: extent world: self world) topLeft! !

!Panel methodsFor: 'layout' stamp: 'KenD 12/9/2013 16:46'!
beColumn
	layoutMorph
		ifNotNil: [ layoutMorph beColumn ]
		ifNil: [
			layoutMorph _ LayoutMorph newColumn.
			self addMorphFront: layoutMorph ]! !

!Panel methodsFor: 'layout' stamp: 'KenD 12/9/2013 16:46'!
beRow
	layoutMorph
		ifNotNil: [ layoutMorph beRow ]
		ifNil: [
			layoutMorph _ LayoutMorph newRow.
			self addMorphFront: layoutMorph ]! !

!Panel methodsFor: 'layout' stamp: 'jmv 8/23/2020 20:43:06'!
layoutSubmorphs
	"Compute a new layout of submorphs based on the given layout bounds."

	| myBounds |
	layoutMorph ifNotNil: [
		myBounds _ self layoutBounds.
		layoutMorph
			morphPosition: myBounds origin;
			morphExtent: myBounds extent 
	].
	titleMorph ifNotNil: [ titleMorph layoutSubmorphs ].
	
	self layoutNeeded: false! !

!Panel methodsFor: 'geometry' stamp: 'jmv 4/25/2019 10:07:34'!
boxExtent
	"answer the extent to use in all the buttons. 
	 
	the label height is used to be proportional to the fonts preferences"
	| e |
	e _ Preferences windowTitleFont lineSpacing.
	^e@e! !

!Panel methodsFor: 'geometry' stamp: 'KenD 10/3/2019 12:52:58'!
fitInWorld

	"Try to be contained in the world; return boundingBox"
	| displayRect boundingBox |
	displayRect := RealEstateAgent maximumUsableAreaInWorld: self runningWorld.
	boundingBox  := self morphPositionInWorld extent: self morphExtentInWorld.
	boundingBox := boundingBox translatedToBeWithin: displayRect.
	self morphPositionInWorld: boundingBox origin.
	^boundingBox! !

!Panel methodsFor: 'geometry' stamp: 'KenD 8/26/2015 12:31'!
fontPreferenceChanged
	"My size will have changed. "
	
	super fontPreferenceChanged.
	self morphExtent: self minimumExtent.
! !

!Panel methodsFor: 'geometry' stamp: 'KenD 4/18/2015 20:35'!
labelRectangle
	"Actually the whole label area"

	| e x0 y0 x1 y1|
	e _ self boxExtent.
	x0 _  e x * 4 + 14.
	y0 _ 2.
	x1 _ extent x - 1.
	y1 _ e y + 1.
	^x0@y0 corner: x1@y1
	
	
	
! !

!Panel methodsFor: 'geometry' stamp: 'KenD 12/9/2013 17:05'!
labelRectangleForEmbossed
	"Actually the whole label area"

	| e x0 y0 x1 y1 |
	e _ self boxExtent.
	x0 _ e x * 4 + 14.
	y0 _ 1.
	x1 _ extent x - 1.
	y1 _ e y + 2.
	^x0@y0 corner: x1@y1
	
	
	
! !

!Panel methodsFor: 'geometry' stamp: 'KenD 11/7/2021 14:17:20'!
layoutBounds
	"Return the bounds for laying out children of the receiver"
	"Exclude the label area"

	^  (0@0 extent: self morphExtentInOwner) insetBy: (0 @ (self labelHeight) corner: 0 @ 0)! !

!Panel methodsFor: 'geometry' stamp: 'KenD 4/10/2021 08:48:50'!
minPaneHeightForReframe

	^ self boxExtent y + 10! !

!Panel methodsFor: 'geometry' stamp: 'KenD 12/9/2013 17:06'!
minPaneWidthForReframe

	^ ScrollBar scrollbarThickness * 3! !

!Panel methodsFor: 'geometry' stamp: 'KenD 3/9/2020 13:29:27'!
minimumExtent
	"Subclasses may want to override me"
	
	| minTitleExtent minLayoutExtent  |
	
	minTitleExtent    := titleMorph    minimumExtent.
	minLayoutExtent := layoutMorph minimumExtent.
	
	^ ((minTitleExtent x max: minLayoutExtent x)
		@ (minTitleExtent y + minLayoutExtent y))
	! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 12/9/2013 18:55'!
buildMorphicWindow

	self subclassResponsibility ! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 12/9/2013 18:42'!
buttonColor

	^ Theme current buttonColorFrom: self widgetsColor! !

!Panel methodsFor: 'GUI building' stamp: 'jmv 4/25/2019 10:07:38'!
defaultButtonPaneHeight
	"Answer the user's preferred default height for new button panes."

	^ Preferences standardButtonFont lineSpacing * 14 // 8! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 4/25/2015 08:51'!
hideButtons

	self titleMorph hideButtons ! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 4/25/2015 08:45'!
showButtonsNamed: aSymbolCollection

	self titleMorph showButtonsNamed: aSymbolCollection ! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 12/9/2013 18:42'!
textBackgroundColor

	^ Theme current paneBackgroundFrom: self widgetsColor! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 12/22/2016 14:16:03'!
windowColor
	"Some default"
	
	^ Theme current transcript  "model class windowColor"! !

!Panel methodsFor: 'dropping/grabbing' stamp: 'KenD 9/17/2019 13:26:55'!
valueWhenDropped

	^nil! !

!Panel methodsFor: 'events' stamp: 'KenD 4/24/2015 16:45'!
closeButtonClicked
	"The user clicked on the close-box control in the window title.  For Mac users only, the Mac convention of option-click-on-close-box is obeyed if the mac option key is down."

	Preferences dismissAllOnOptionClose ifTrue:
		[Sensor rawMacOptionKeyPressed ifTrue:
			[^ self world closeUnchangedWindows]].
	self delete  "closeBox overrides stayUp"
! !

!Panel methodsFor: 'events' stamp: 'KenD 4/24/2015 16:45'!
collapseButtonClicked
	
	self collapse
! !

!Panel methodsFor: 'events' stamp: 'KenD 4/24/2015 16:45'!
expandButtonClicked
	
	self expand
! !

!Panel methodsFor: 'events' stamp: 'KenD 4/24/2015 16:46'!
pinButtonClicked
	"The user clicked on the push pin. Subclasses should add actions and invoke me"
	
	self stayUp: true
	! !

!Panel methodsFor: 'events' stamp: 'KenD 12/9/2013 17:07'!
wantsToBeDroppedInto: aMorph
	"Return true if it's okay to drop the receiver into aMorph"
	
	^ aMorph isWorldMorph! !

!Panel methodsFor: 'events' stamp: 'KenD 4/28/2015 13:42'!
windowMenuButtonClicked
	
	self subclassResponsibility 
! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 12/29/2021 10:17:01'!
defaultAlignement

	^ #center! !

!Panel methodsFor: 'initialization' stamp: 'KenD 10/26/2021 06:57:59'!
defaultBorderColor

	^self defaultColor! !

!Panel methodsFor: 'initialization' stamp: 'KenD 12/9/2013 17:05'!
defaultBorderWidth
	"answer the default border width for the receiver"

	^ Theme current roundWindowCorners
		ifTrue: [ 3 ]
		ifFalse: [ 2 ]! !

!Panel methodsFor: 'initialization' stamp: 'KenD 10/25/2021 16:08:55'!
defaultColor

	^`(Color r: 0.8 g: 0.6 b: 0.3) lighter`! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 12/25/2021 16:55:34'!
defaultSeparation

	^ 10 "Pixels between controls/layouts"! !

!Panel methodsFor: 'initialization' stamp: 'KenD 10/25/2021 15:46:25'!
initialize
	"Initialize a system window. Add label, stripes, etc., if desired"

	super initialize.
	titleMorph := WindowTitleMorph title: 'Untitled'.
	borderColor := self defaultColor.
	stayUp := false. "UI push pin to change"
	titleMorph 
			layoutSpec: (LayoutSpec morphHeightProportionalWidth: 1.0);
			morphExtent: extent x @ (self labelHeight + borderWidth);
			layoutSubmorphs.

	super addMorph: titleMorph.

	"by default"
	self beColumn.
! !

!Panel methodsFor: 'initialization' stamp: 'KenD 4/18/2015 18:30'!
openInWorld
	"Ensure all widgets have proper colors before opening"
	
	self widgetsColor: self windowColor.
	super openInWorld.
	^ self! !

!Panel methodsFor: 'testing' stamp: 'KenD 12/9/2013 16:45'!
is: aSymbol
	^ aSymbol == #Panel or: [ super is: aSymbol ]! !

!Panel methodsFor: 'testing' stamp: 'KenD 12/9/2013 16:45'!
isOpaqueMorph
	"Not really used, as we also reimplement #addPossiblyUncoveredAreasIn:to:"
	^ (Theme current roundWindowCorners or: [ color mightBeTranslucent ]) not! !

!Panel methodsFor: 'label' stamp: 'KenD 4/24/2015 15:48'!
label

	^ self titleMorph titleString ! !

!Panel methodsFor: 'label' stamp: 'KenD 10/25/2021 14:26:02'!
labelHeight
	"Answer the height for the window label."

	^  Preferences windowTitleFont lineSpacing+1! !

!Panel methodsFor: 'label' stamp: 'KenD 4/25/2015 12:54'!
relabel

	| newLabel |
	newLabel _ FillInTheBlankMorph 
		request: 'New title for this window'
		initialAnswer: self labelString.
	newLabel isEmpty ifTrue: [^self].
	self setLabel: newLabel! !

!Panel methodsFor: 'label' stamp: 'KenD 4/28/2015 18:34'!
setLabel: aString

	self titleMorph titleString: aString.
! !

!Panel methodsFor: 'label' stamp: 'KenD 12/9/2013 17:02'!
update: aSymbol

	super update: aSymbol.
	aSymbol == #relabel
		ifTrue: [ model ifNotNil: [ self setLabel: model labelString ]]! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/24/2015 15:54'!
layoutMorph

	^ layoutMorph! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/24/2015 15:41'!
pinButton
	"private"
	
	^ titleMorph pinButton ! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/19/2015 07:30'!
stayUp

	^ stayUp! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/19/2015 14:11'!
stayUp: aBoolean

	stayUp := aBoolean.
	aBoolean
		ifTrue: [ self pinButton hide ] 
		ifFalse: [ self pinButton show ] ! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/24/2015 15:44'!
titleMorph 

	^ titleMorph! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/18/2015 18:16'!
widgetsColor

	widgetsColor ifNotNil: [ ^ widgetsColor ].
	^Display depth > 2
		ifTrue: [ self windowColor ]
		ifFalse: [ Color white ]
! !

!Panel methodsFor: 'accessing' stamp: 'KenD 12/20/2021 18:32:33'!
widgetsColor: aColor
	"aColor will be used for titles, borders, etc.
	A variation of it, #paneColorFrom:, will be used for panes background"

	widgetsColor _ aColor.
	self color: self textBackgroundColor.
	self adoptWidgetsColor: widgetsColor! !

!Panel methodsFor: 'change reporting' stamp: 'KenD 4/24/2015 18:20'!
morphExtent: newExtent

	super morphExtent: newExtent.
	self titleMorph morphExtent: extent x @ (self labelHeight + borderWidth)! !

!Panel class methodsFor: 'instance creation' stamp: 'hlsf 12/27/2021 11:09:02'!
example1
" 
	Panel example1 openInWorld
"
| panel |
	panel _ Panel new.
	panel 	titleMorph showButtonsNamed: #(#close).
	^ panel
		! !

!Panel class methodsFor: 'instance creation' stamp: 'KenD 12/9/2013 18:53'!
open: model

	^self open: model label: nil! !

!Panel class methodsFor: 'instance creation' stamp: 'hlsf 12/30/2021 10:09:42'!
open: model label: aString

	|  window |
	window _ self new.
	window
		model: model;
		buildMorphicWindow.
	aString ifNotNil: [ window setLabel: aString ].
	^ window 	morphPosition: 
			(RealEstateAgent 
					initialFrameFor: window 
					initialExtent: window minimumExtent 
					world: self runningWorld ) topLeft;
		openInWorld;
		yourself! !

!DialogPanel methodsFor: 'GUI building' stamp: 'hlsf 12/27/2021 10:25:05'!
buildMorphicWindow
	layoutMorph removeAllMorphs.
	self newPane ifNotNil: [:pane | layoutMorph 		addMorphUseAll: pane].
	self newButtonArea ifNotNil: [:buttons | layoutMorph addMorphKeepMorphHeight: self newButtonArea].
	layoutMorph 		separation: self defaultSeparation;
		axisEdgeWeight: #center;
		adoptWidgetsColor: self widgetsColor.
	self morphExtent: self minimumExtent! !

!DialogPanel methodsFor: 'GUI building' stamp: 'hlsf 12/30/2021 10:38:36'!
newButtonArea
"Return the morph where the buttons are layed out"
	self subclassResponsibility ! !

!DialogPanel methodsFor: 'GUI building' stamp: 'hlsf 12/30/2021 10:39:08'!
newPane
"Return the morph containing the controls of the dialog"
	self subclassResponsibility ! !

!DialogPanel methodsFor: 'event handling' stamp: 'hlsf 12/25/2021 10:15:49'!
refreshView

	self subclassResponsibility ! !

!EditPanel methodsFor: 'accessing' stamp: 'KenD 7/4/2015 08:58'!
editModel
	"A subclass may wish to supply a custom editModel rather than model clone.
	[Note Object>>copy and Morph>>copy]"
	
	editModel ifNil: [ editModel := self model shallowCopy postCopy ].
	
	^ editModel! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 4/19/2015 15:22'!
cancelAndForgetEverything

	editModel := nil.
	self stayUp 
		ifFalse: [ self delete ]
		ifTrue: [ self refreshView ]! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 12/18/2013 19:38'!
replaceArea: oldArea with: newArea
	"Replace oldArea in its container with newArea and clean up any ActionMaps"
	
	super replaceArea: oldArea with: newArea.
	oldArea submorphsDo: [ :sm | 
		self editModel removeActionsWithReceiver: sm
	].
! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 7/27/2015 13:25'!
showHalo

	| aMorph |
	aMorph := self model.
	(aMorph isKindOf: Morph)
	ifFalse: [ self subclassResponsibility ] "subclass must override if model not Morph"
	ifTrue: [ aMorph isInWorld ifTrue: [ aMorph show; addHalo ] ]! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 7/27/2015 16:32'!
showHaloButtonClicked

	self subclassResponsibility! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 12/17/2013 19:01'!
updateMasterFromCopy
	"Update model from editModel"
	
	self subclassResponsibility ! !

!EditPanel methodsFor: 'initialization' stamp: 'KenD 12/17/2013 19:02'!
editModel: anObject

	editModel := anObject! !

!EditPanel methodsFor: 'GUI building' stamp: 'hlsf 12/30/2021 10:37:31'!
newButtonArea
	"Answer a LayoutMorph with Update and Cancel buttons"
	
	buttonArea _ LayoutMorph newRow 
		separation: 8@0;
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #updateMasterFromCopy
				label: 'Update')
			layoutSpec: (LayoutSpec 
							proportionalWidth: 0.3 
							proportionalHeight:  1 
							offAxisEdgeWeight: #center);
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #cancelAndForgetEverything
				label: 'Cancel')
			layoutSpec: (LayoutSpec 
							proportionalWidth: 0.3 
							proportionalHeight:  1 
							offAxisEdgeWeight: #center);
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #showHaloButtonClicked
				label: 'Show Halo')
			layoutSpec: (LayoutSpec 
							proportionalWidth: 0.3 
							proportionalHeight:  1 
							offAxisEdgeWeight: #center);
		layoutSpec: (LayoutSpec 
							proportionalWidth: 1 
							fixedHeight: (2 * Preferences windowTitleFont lineSpacing)
							offAxisEdgeWeight: #center);
		axisEdgeWeight: #center;
		color: self widgetsColor.
	^ buttonArea! !

!ValueEntryPanel methodsFor: 'events' stamp: 'KenD 12/22/2016 14:05:30'!
accept

	self delete.
	self model accept.! !

!ValueEntryPanel methodsFor: 'events' stamp: 'KenD 12/22/2016 15:24:13'!
cancel

	self delete! !

!ValueEntryPanel methodsFor: 'GUI building' stamp: 'hlsf 12/25/2021 10:30:40'!
newButtonArea
	"Add ACCEPT and CANCEL buttons"
	buttonArea _ LayoutMorph newRow
		separation: 8@0;
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #accept
				label: 'Accept')
			layoutSpec: (LayoutSpec new ::
							proportionalWidth: 0.4 minimum: 100;
							proportionalHeight:  1;
							offAxisEdgeWeight: #center);
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #cancel
				label: 'Cancel')
			layoutSpec: (LayoutSpec new ::
							proportionalWidth: 0.4 minimum: 100;
							proportionalHeight:  1;
							offAxisEdgeWeight: #center);
		axisEdgeWeight: #center;
		color: (Color transparent).
		
	^ buttonArea ! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:23:25'!
checkValidity: aModel
	self subclassResponsibility ! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/30/2021 11:30:25'!
open: aModel label: stringName
	self checkValidity: aModel propertyValue.
	^ super open: aModel label: stringName! !

!CharacterEntryPanel methodsFor: 'events' stamp: 'KenD 4/28/2019 18:50:16'!
accept
	
	self delete.
	self model 
		ifNotNil: [ :myModel | 
			myModel propertyValue: (self characterEditMorph value at: 1) 
		].! !

!CharacterEntryPanel methodsFor: 'events' stamp: 'KenD 3/18/2019 17:04:32'!
valueWhenDropped
	
	self model 
		ifNotNil: [ :m | 
			m propertyValue: (self characterEditMorph value at: 1) 
		] ifNil: [ '_' ].! !

!CharacterEntryPanel methodsFor: 'accessing' stamp: 'KenD 3/29/2017 13:37:21'!
characterEditMorph

	^ characterEditMorph! !

!CharacterEntryPanel methodsFor: 'initialization' stamp: 'hlsf 12/25/2021 17:54:42'!
initialize
	characterEditMorph := (SimpleNumberEntryMorph singleCharSelection: $c).
	super initialize.
! !

!CharacterEntryPanel methodsFor: 'initialization' stamp: 'hlsf 12/30/2021 11:12:32'!
model: aModel
	super model: aModel.
	characterEditMorph setValue: aModel propertyValue! !

!CharacterEntryPanel methodsFor: 'GUI building' stamp: 'hlsf 12/25/2021 16:47:44'!
newPane

	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		separation: self defaultSeparation;
		axisEdgeWeight: #center;
		addMorph: characterEditMorph ; "set in #initialize"
		color: (Color transparent).
	
	^ entryLayout ! !

!CharacterEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:23:45'!
checkValidity: aChar
	(aChar isKindOf: Character) 
		ifFalse: [ self error: 'I require a Character: ' , aChar printString ].
! !

!CharacterEntryPanel class methodsFor: 'examples' stamp: 'hlsf 12/27/2021 11:09:15'!
example1
" 
	CharacterEntryPanel example1 openInWorld 
"
	^ self open: Character space label: 'Key in a character'! !

!PointEntryPanel methodsFor: 'events' stamp: 'KenD 4/28/2019 18:50:41'!
accept
	
	self delete.
	self model 
		ifNotNil: [ :myModel | 
			myModel propertyValue: 
				(xEntryMorph value @ yEntryMorph value) 
		].! !

!PointEntryPanel methodsFor: 'events' stamp: 'KenD 3/18/2019 17:03:19'!
valueWhenDropped

	self model 
		ifNotNil: [ :m | 
			m propertyValue: 
				(xEntryMorph value @ yEntryMorph value) 
		] ifNil: [ 0@0 ]! !

!PointEntryPanel methodsFor: 'initialization' stamp: 'hlsf 12/25/2021 17:54:51'!
initialize
	xEntryMorph := (SimpleNumberEntryMorph floatDefault: 0.0 maxNumChars: 8).
	yEntryMorph := (SimpleNumberEntryMorph floatDefault: 0.0 maxNumChars: 8).
	super initialize.
! !

!PointEntryPanel methodsFor: 'initialization' stamp: 'hlsf 12/30/2021 11:13:39'!
model: aModel
	super model: aModel.
	xEntryMorph setValue: aModel propertyValue x.
	yEntryMorph setValue: aModel propertyValue y! !

!PointEntryPanel methodsFor: 'GUI building' stamp: 'hlsf 12/25/2021 16:47:44'!
newPane

	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		separation: self defaultSeparation;
		axisEdgeWeight: #center;
		addMorph: xEntryMorph; "set in #initialize"
		addMorph: (LabelMorph new :: contents: '@' );
		addMorph: yEntryMorph;
		color: (Color transparent).
	
	^ entryLayout ! !

!PointEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:28:29'!
checkValidity: aPoint
	(aPoint isKindOf: Point) ifFalse: [ self error: 'I require a Point: ' , aPoint printString ].
! !

!PointEntryPanel class methodsFor: 'examples' stamp: 'hlsf 12/27/2021 11:09:19'!
example1
" 
	PointEntryPanel example1 openInWorld 
"
	^  self
		open: 10@200
		label: 'Point Value' ! !

!PositiveFloatEntryPanel methodsFor: 'events' stamp: 'KenD 1/11/2022 14:33:48'!
accept
	
	self delete.
	self model 
		ifNotNil: [ :myModel | 
			myModel propertyValue: numberEntryMorph value 
		].! !

!PositiveFloatEntryPanel methodsFor: 'events' stamp: 'KenD 1/11/2022 14:34:07'!
valueWhenDropped
	
	^ self model  
		ifNotNil: [ :m | 
			m propertyValue: numberEntryMorph value 
		] ifNil: [ 0 ]! !

!PositiveFloatEntryPanel methodsFor: 'initialization' stamp: 'KenD 1/11/2022 14:33:17'!
initialize
	numberEntryMorph := 
		(SimpleNumberEntryMorph 
			positiveFloatDefault: 1.0 
			maxNumChars: 8).
	super initialize.
! !

!PositiveFloatEntryPanel methodsFor: 'initialization' stamp: 'KenD 1/11/2022 14:31:20'!
model: aModel
	super model: aModel.
	numberEntryMorph setValue: aModel propertyValue ! !

!PositiveFloatEntryPanel methodsFor: 'GUI building' stamp: 'KenD 1/11/2022 14:30:49'!
newPane

	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		separation: self defaultSeparation;
		axisEdgeWeight: #center;
		addMorph: numberEntryMorph ; "set in #initialize"
		color: (Color transparent).
	
	^ entryLayout ! !

!PositiveFloatEntryPanel class methodsFor: 'instance creation' stamp: 'KenD 1/11/2022 14:29:38'!
checkValidity: aNumber
	(aNumber isKindOf: Number) ifFalse: [ self error: 'I require a Positive Number ' , aNumber printString ].
	(aNumber >= 0) ifFalse: [ self error: 'I require a Positive Number: ' , aNumber printString ]! !

!PositiveIntegerEntryPanel methodsFor: 'events' stamp: 'KenD 4/28/2019 18:51:07'!
accept
	
	self delete.
	self model 
		ifNotNil: [ :myModel | 
			myModel propertyValue: numberEntryMorph value 
		].! !

!PositiveIntegerEntryPanel methodsFor: 'events' stamp: 'KenD 3/18/2019 17:02:36'!
valueWhenDropped
	
	^ self model  
		ifNotNil: [ :m | 
			m propertyValue: numberEntryMorph value 
		] ifNil: [ 0 ]! !

!PositiveIntegerEntryPanel methodsFor: 'initialization' stamp: 'hlsf 12/25/2021 17:52:50'!
initialize
	numberEntryMorph := (SimpleNumberEntryMorph integerDefault: 0 maxNumChars: 8).
	super initialize.
! !

!PositiveIntegerEntryPanel methodsFor: 'initialization' stamp: 'hlsf 12/30/2021 11:14:01'!
model: aModel
	super model: aModel.
	numberEntryMorph setValue: aModel propertyValue ! !

!PositiveIntegerEntryPanel methodsFor: 'GUI building' stamp: 'hlsf 12/25/2021 16:47:44'!
newPane

	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		separation: self defaultSeparation;
		axisEdgeWeight: #center;
		addMorph: numberEntryMorph ; "set in #initialize"
		color: (Color transparent).
	
	^ entryLayout ! !

!PositiveIntegerEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:53:21'!
checkValidity: aNumber
	(aNumber isKindOf: Integer) ifFalse: [ self error: 'I require a Positive Integer: ' , aNumber printString ].
	(aNumber >= 0) ifFalse: [ self error: 'I require a Positive Integer: ' , aNumber printString ]! !

!PositiveIntegerEntryPanel class methodsFor: 'examples' stamp: 'hlsf 12/27/2021 11:09:30'!
example1
"
	PositiveIntegerEntryPanel example1 openInWorld
"
	^ self open: 152 label: 'Edit a positive integer'! !

!PositiveIntegerEntryPanel class methodsFor: 'examples' stamp: 'hlsf 12/27/2021 11:09:38'!
example2
"
	PositiveIntegerEntryPanel example2 openInWorld
"
	^ self open: -152 label: 'Can''t negative integer'! !

!StringEntryPanel methodsFor: 'events' stamp: 'KenD 4/28/2019 18:52:43'!
accept
	
	self delete.
	self model 
		ifNotNil: [ :myModel | 
			myModel propertyValue: stringEditMorph contents 
		].! !

!StringEntryPanel methodsFor: 'events' stamp: 'KenD 3/18/2019 17:01:36'!
valueWhenDropped
	
	^ self model 
		ifNotNil: [ :m | 
			m propertyValue: stringEditMorph contents 
		] 
		ifNil: [ '' ]! !

!StringEntryPanel methodsFor: 'initialization' stamp: 'hlsf 12/25/2021 17:55:14'!
initialize
	stringEditMorph := OneLineEditorMorph contents: '' .
	stringEditMorph layoutSpec: 
		(LayoutSpec 
			proportionalWidth: 1 
			fixedHeight: Preferences windowTitleFont lineSpacing ).
	super initialize.
! !

!StringEntryPanel methodsFor: 'initialization' stamp: 'hlsf 12/30/2021 11:14:21'!
model: aModel
	super model: aModel.
	stringEditMorph contents: aModel propertyValue! !

!StringEntryPanel methodsFor: 'GUI building' stamp: 'hlsf 12/25/2021 16:47:44'!
newPane

	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		separation: self defaultSeparation;
		axisEdgeWeight: #rowLeft;
		addMorph: stringEditMorph ; "set in #initialize"
		color: Color transparent;
		borderColor: Color black.
	
	^ entryLayout ! !

!StringEntryPanel methodsFor: 'accessing' stamp: 'KenD 12/22/2016 16:11:42'!
stringEditMorph

	^ stringEditMorph ! !

!StringEntryPanel class methodsFor: 'examples' stamp: 'hlsf 12/27/2021 11:09:47'!
example1
"
	StringEntryPanel example1 openInWorld 
"
	^ self open: 'Smalltalk' label: 'Cuis language is...'! !

!StringEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:55:39'!
checkValidity: aString
	(aString isKindOf: String) ifFalse: [ self error: 'I require a String: ' , aString printString ]! !

!WizardPanel methodsFor: 'GUI building' stamp: 'hlsf 12/27/2021 10:25:18'!
newButtonArea
"Ask the current page its buttons, if any"
	^ buttonArea _  currentPageIndex ifNotNil: [ (pages at: currentPageIndex) buttons]! !

!WizardPanel methodsFor: 'GUI building' stamp: 'hlsf 12/27/2021 10:20:21'!
newPane
"Ask to the current page its pane, if any"
	^ currentPageIndex ifNotNil: [	(pages at: currentPageIndex) panel]! !

!WizardPanel methodsFor: 'accessing' stamp: 'hlsf 12/25/2021 16:51:55'!
emptyPane
	^ LayoutMorph newColumn 
		doAdoptWidgetsColor;
		adoptWidgetsColor: self widgetsColor.! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 11/3/2021 18:41:35'!
apply
	self triggerEvent: #apply! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 11/3/2021 18:43:02'!
cancel
	pages do: [:each | each delete].
	self delete.
	self triggerEvent: #cancel! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 10/31/2021 11:35:43'!
nextPage
	self goPage: currentPageIndex + 1
	! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 10/31/2021 11:35:43'!
previousPage
	self goPage: currentPageIndex - 1! !

!WizardPanel methodsFor: 'initialize-release' stamp: 'hlsf 11/3/2021 16:20:50'!
addPage: wizardPage
	pages add: wizardPage.
	currentPageIndex ifNil: ["The first added page is the first one to show"
		currentPageIndex _ 1.
		self setLabel: wizardPage title.
		self buildMorphicWindow	]! !

!WizardPanel methodsFor: 'initialize-release' stamp: 'hlsf 12/27/2021 11:10:57'!
addPages
" override to add the pages to your wizrard panel"
	self shouldBeImplemented ! !

!WizardPanel methodsFor: 'initialize-release' stamp: 'hlsf 10/31/2021 10:08:07'!
initialize
	super initialize.
	pages _ OrderedCollection new.! !

!WizardPanel methodsFor: 'navigation' stamp: 'hlsf 11/3/2021 18:40:47'!
goPage: number
	(number < 1 or: [number > pages size]) ifTrue: [^ self].
	currentPageIndex _ number.
	self setLabel: (pages at: currentPageIndex) title.
	self buildMorphicWindow.
	self triggerEvent: #page with: number.! !

!WizardPanel methodsFor: 'open/close' stamp: 'hlsf 11/19/2021 11:04:46'!
delete
	super delete.
	self releaseActionMap ! !

!WizardPanel methodsFor: 'open/close' stamp: 'hlsf 12/29/2021 10:20:37'!
minimumExtent
	^ 550@350 ! !

!WizardPanel methodsFor: 'testing' stamp: 'hlsf 12/25/2021 16:53:33'!
isReadyToApply
	^ false! !

!WizardPanel class methodsFor: 'examples' stamp: 'hlsf 12/27/2021 11:09:57'!
example1
"
	self example1 openInWorld
"
| wizard | 
	wizard := WizardPanel open: nil label: 'A Wizard panel'.
	wizard 
		addPage: ((WizardPage firstPage: 'First page' on: wizard) 
			contents: 'A description for first page');
		addPage: ((WizardPage standardPage: 'Standard page' on: wizard) 
			contents: 'A description for standard page');
		addPage: ((WizardPage applyPage: 'Final page' on: wizard) 
			contents: 'Another description for apply page').
	^ wizard! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 10/31/2021 20:47:46'!
buttons
	^ buttons ifNil: [
		buttons _ LayoutMorph newRow 
		separation: 5;
		axisEdgeWeight: #rowRight;
		yourself]! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 12/30/2021 10:11:12'!
contents: aStringOrMorph
	aStringOrMorph isString 
		ifTrue: [ "If string, just be our new panel"
			panel _ TextParagraphMorph contents: aStringOrMorph.
			panel 
				borderWidth: 0 ; 
				color: Color transparent]
		ifFalse: [ "If Morph, the Wizard directly gave us the panel with contents already set"
			panel _ aStringOrMorph]! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 10/31/2021 12:22:19'!
panel
	^ panel! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 10/31/2021 20:12:16'!
title
	^ title! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 10/31/2021 12:07:06'!
wizard: aWizard
	wizard _ aWizard 
	! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 11/19/2021 10:43:55'!
applyButton
	^ (PluggableButtonMorph 
		model: wizard
		action: #apply
		label: 'Apply' translated) enableSelector: #isReadyToApply! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 11/3/2021 18:42:26'!
cancelButton
	^ PluggableButtonMorph 
		model: wizard
		action: #cancel
		label: 'Cancel' translated! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 10/31/2021 12:21:19'!
nextButton
	^ PluggableButtonMorph 
		model: wizard
		action: #nextPage
		label: 'Next' translated.! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 10/31/2021 12:21:34'!
previousButton
	^ PluggableButtonMorph 
		model: wizard
		action: #previousPage
		label: 'Previous' translated.! !

!WizardPage methodsFor: 'initialization' stamp: 'hlsf 11/3/2021 15:20:49'!
applyPage: string
	title _ string.
	self buttons
		addMorph: self cancelButton;
		addMorph: self previousButton;
		addMorph: self applyButton! !

!WizardPage methodsFor: 'initialization' stamp: 'hlsf 11/3/2021 15:08:57'!
delete
"Clean up if necessary at Wizard close"! !

!WizardPage methodsFor: 'initialization' stamp: 'hlsf 11/3/2021 15:16:13'!
firstPage: string
	title _ string.
	self buttons
		addMorph: self cancelButton;
		addMorph: self nextButton.! !

!WizardPage methodsFor: 'initialization' stamp: 'hlsf 11/3/2021 15:18:56'!
standardPage: string
	title _ string.
	self buttons
		addMorph: self cancelButton;
		addMorph: self previousButton;
		addMorph: self nextButton ! !

!WizardPage class methodsFor: 'instance creation' stamp: 'hlsf 11/3/2021 15:04:52'!
applyPage: aString on: aWizard
	^ self new 
		wizard: aWizard ;
		applyPage: aString;
		yourself! !

!WizardPage class methodsFor: 'instance creation' stamp: 'hlsf 11/3/2021 15:04:14'!
firstPage: aString on: aWizard
	^ self new 
		wizard: aWizard ;
		firstPage: aString;
		yourself! !

!WizardPage class methodsFor: 'instance creation' stamp: 'hlsf 11/3/2021 15:04:38'!
standardPage: aString on: aWizard
	^ self new 
		wizard: aWizard ;
		standardPage: aString;
		yourself! !
