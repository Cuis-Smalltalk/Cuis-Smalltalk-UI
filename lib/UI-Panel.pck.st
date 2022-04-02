'From Cuis 6.0 [latest update: #5096] on 2 April 2022 at 2:43:12 pm'!
'Description I supply titled Panels, useful windows simpler
than SystemWindows.'!
!provides: 'UI-Panel' 1 45!
!requires: 'Cuis-Base' 60 5031 nil!
!requires: 'UI-Base-Morphs' 1 11 nil!
!requires: 'UI-Entry' 1 8 nil!
SystemOrganization addCategory: 'UI-Panel'!


!classDefinition: #LabelGroup category: 'UI-Panel'!
LayoutMorph subclass: #LabelGroup
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'LabelGroup class' category: 'UI-Panel'!
LabelGroup class
	instanceVariableNames: ''!

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
	instanceVariableNames: 'entry'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'ValueEntryPanel class' category: 'UI-Panel'!
ValueEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #CharacterEntryPanel category: 'UI-Panel'!
ValueEntryPanel subclass: #CharacterEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'CharacterEntryPanel class' category: 'UI-Panel'!
CharacterEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #FloatEntryPanel category: 'UI-Panel'!
ValueEntryPanel subclass: #FloatEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'FloatEntryPanel class' category: 'UI-Panel'!
FloatEntryPanel class
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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PositiveFloatEntryPanel class' category: 'UI-Panel'!
PositiveFloatEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #PositiveIntegerEntryPanel category: 'UI-Panel'!
ValueEntryPanel subclass: #PositiveIntegerEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PositiveIntegerEntryPanel class' category: 'UI-Panel'!
PositiveIntegerEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #RangeFloatEntryPanel category: 'UI-Panel'!
ValueEntryPanel subclass: #RangeFloatEntryPanel
	instanceVariableNames: 'min max'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'RangeFloatEntryPanel class' category: 'UI-Panel'!
RangeFloatEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #StringEntryPanel category: 'UI-Panel'!
ValueEntryPanel subclass: #StringEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'StringEntryPanel class' category: 'UI-Panel'!
StringEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #TextEntryPanel category: 'UI-Panel'!
StringEntryPanel subclass: #TextEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'TextEntryPanel class' category: 'UI-Panel'!
TextEntryPanel class
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


!LabelGroup commentStamp: '<historical>' prior: 0!
A morph laid out with a column of labels and a column of associated controls.!

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
I am an abstract class for editing simple values.

I take a model which has accessors #propertyValue and #propertyValue:
which get and set the value I am editing.

- entry the morph I am using to edit the model!

!CharacterEntryPanel commentStamp: '<historical>' prior: 0!
I provide for editing/changing a single character.!

!FloatEntryPanel commentStamp: '<historical>' prior: 0!
I edit floats!!!

!PointEntryPanel commentStamp: '<historical>' prior: 0!
I am a panel for filling in a Point value.

My xEntryMorph and yEntryMorph hold the current points x@y value.

!

!PositiveFloatEntryPanel commentStamp: '<historical>' prior: 0!
I edit a real number greater than zero!

!PositiveIntegerEntryPanel commentStamp: '<historical>' prior: 0!
I edit positive integers!

!RangeFloatEntryPanel commentStamp: '<historical>' prior: 0!
I edit a real number in the interval [min ; max]!

!StringEntryPanel commentStamp: '<historical>' prior: 0!
I allow a user to edit a string!

!WizardPanel commentStamp: '<historical>' prior: 0!
I am an abstractact wizard to let the user input data in a sequence of differents pages. 
My model hold the data. In DrGeo, the model is a macro builder or script builder
It emits event when 
 - the user changes the page with the next and previous buttons
 - the user press apply and cancel
!

!Panel class methodsFor: 'instance creation' stamp: 'KenD 3/13/2022 07:30:33'!
initializedInstance
"
	self initializedInstance openInHand.
"
	| panel |
	panel _ Panel new.
	panel 	titleMorph showButtonsNamed: #(#close).
	^ panel
		! !

!Panel methodsFor: 'printing' stamp: 'KenD 4/24/2015 16:04'!
printOn: aStream 

	super printOn: aStream.
	aStream nextPutAll: '('.
	aStream
		print: self label;
		nextPutAll: ')'! !

!LabelGroup methodsFor: 'initialization' stamp: 'KenD 4/1/2022 12:31:18'!
defaultColor

	^ Color transparent ! !

!LabelGroup methodsFor: 'initialization' stamp: 'KenD 4/1/2022 12:31:24'!
initialize

	super initialize.
	self separation: 2! !

!LabelGroup methodsFor: 'initialization' stamp: 'KenD 4/1/2022 12:32:31'!
with: labelsAndControls

	| labelMorphs labelWidth |
	labelMorphs _ labelsAndControls collect: [:assoc | LabelMorph contents: assoc key].
	labelWidth _ labelMorphs max: [:each | each morphWidth].
	labelMorphs withIndexDo: [:label :i | | row height control | 
		control _ (labelsAndControls at: i) value.
		height _ label morphHeight max: control morphHeight.
		row _ LayoutMorph newRow separation: 4.
		row 
			color: self defaultColor;
			addMorph: label fixedWidth: labelWidth;
			addMorphUseAll: control.
		self addMorph: row fixedHeight: height]! !

!LabelGroup class methodsFor: 'instance creation' stamp: 'KenD 4/1/2022 12:29:53'!
newWith: labelsAndControls
	"key: label, value: control morph"
	
	^ self newColumn with: labelsAndControls! !

!LabelGroup class methodsFor: 'examples' stamp: 'KenD 4/1/2022 12:30:11'!
example1
"
	LabelGroup example1 openInWorld
"
	^ self newWith: {
		'Name' -> (TextEntryMorph contents: '').
		'Description' -> (TextModelMorph withText: '')	}! !

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

!PluggableScrollBar methodsFor: 'accessing' stamp: 'KenD 2/8/2022 17:40:04'!
value
	
	^value! !

!PluggableScrollBar methodsFor: 'accessing' stamp: 'KenD 2/8/2022 17:38:53'!
value: zeroToOne

	value := zeroToOne min: 1.0 max: 0.0! !

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

!Panel methodsFor: 'initialization' stamp: 'KenD 3/13/2022 07:27:59'!
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

	^self 
		beColumn;  "by default"
		widgetsColor: self windowColor;
		yourself
	
! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 3/19/2022 11:14:01'!
openInWorld
	self morphPosition: 
			(RealEstateAgent 
					initialFrameFor: self 
					initialExtent: self minimumExtent 
					world: self runningWorld ) topLeft;
		widgetsColor: self windowColor.
	super 	openInWorld! !

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

!Panel class methodsFor: 'instance creation' stamp: 'hlsf 3/19/2022 11:21:28'!
open: model label: aString
	|  window |
	window _ self new ::
		model: model;
		buildMorphicWindow.
	aString ifNotNil: [ window setLabel: aString ].
	window openInWorld.
	^ window! !

!Panel class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 15:02:35'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!Panel class methodsFor: 'new-morph participation' stamp: 'KenD 3/13/2022 07:31:29'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ true! !

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

!DialogPanel class methodsFor: 'new-morph participation' stamp: 'KenD 3/13/2022 07:31:41'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ false! !

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

!ValueEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:22:27'!
accept
	self delete.
	self model 		ifNotNil: [ :myModel | 			
		myModel propertyValue: entry value 		].! !

!ValueEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:22:36'!
cancel
	self delete! !

!ValueEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:22:12'!
valueWhenDropped
	
	^ self model  
		ifNotNil: [ :m | 	m propertyValue: entry value ] 
		ifNil: [ entry value ]! !

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

!ValueEntryPanel methodsFor: 'GUI building' stamp: 'hlsf 3/19/2022 10:22:57'!
newPane
	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		separation: self defaultSeparation;
		axisEdgeWeight: #center;
		addMorph: entry ; "set in #initialize"
		color: (Color transparent).
	^ entryLayout ! !

!ValueEntryPanel methodsFor: 'initialization' stamp: 'hlsf 3/19/2022 10:19:26'!
initialize
	self initializeEntry.
	super initialize.
! !

!ValueEntryPanel methodsFor: 'initialization' stamp: 'hlsf 3/19/2022 10:19:26'!
initializeEntry
	self subclassResponsibility 
! !

!ValueEntryPanel methodsFor: 'initialization' stamp: 'hlsf 3/19/2022 10:23:21'!
model: aModel
	super model: aModel.
	entry ifNotNil: [:anEntry | anEntry setValue: aModel propertyValue]! !

!ValueEntryPanel methodsFor: 'accessing' stamp: 'hlsf 3/19/2022 10:21:04'!
entry
"Subclass should redefine if needed"
	^ entry! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:23:25'!
checkValidity: aModel
	self subclassResponsibility ! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 3/19/2022 10:59:27'!
open: aModel label: stringName
	self checkValidity: aModel propertyValue.
	^ super open: aModel label: stringName.! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 3/26/2022 11:26:00'!
openWide: aModel label: stringName
"My title is not shrinked, the dialog is extended as necessary to have the tile completely readable"
	| panel |
	panel _ self open: aModel label: stringName.
	panel titleMorph dontShrinkTitle.
	panel morphExtent: panel minimumExtent.
	^panel
	! !

!CharacterEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:23:54'!
accept
	self delete.
	self model ifNotNil: [ :myModel | 
		myModel propertyValue: (entry value at: 1) ]! !

!CharacterEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:24:16'!
valueWhenDropped
	self model 
		ifNotNil: [ :m | m propertyValue: (entry value at: 1) ] 
		ifNil: [ '_' ]! !

!CharacterEntryPanel methodsFor: 'initialization' stamp: 'KenD 3/20/2022 08:39:05'!
initializeEntry
	entry := SimpleNumberEntryMorph singleCharSelection: $c.
	entry acceptCancelReceiver: self
! !

!CharacterEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:23:45'!
checkValidity: aChar
	(aChar isKindOf: Character) 
		ifFalse: [ self error: 'I require a Character: ' , aChar printString ].
! !

!CharacterEntryPanel class methodsFor: 'examples' stamp: 'KenD 3/20/2022 15:58:16'!
example1
" 
	CharacterEntryPanel example1 
"
	| model |
	model := SignMorph forObject: $A.
	model openInWorld.
	^ self open: model label: 'Key in a character'! !

!FloatEntryPanel methodsFor: 'initialization' stamp: 'KenD 3/21/2022 15:30:11'!
initializeEntry

	entry := SimpleNumberEntryMorph floatDefault: 1.0 maxNumChars: 8.
	entry acceptCancelReceiver: self! !

!FloatEntryPanel class methodsFor: 'instance creation' stamp: 'KenD 3/21/2022 15:32:16'!
checkValidity: aNumber

	(aNumber isKindOf: Number) ifFalse: [ self error: 'I require a Number ' , aNumber printString ].! !

!PointEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:24:48'!
accept	
	self delete.
	self model ifNotNil: [ :myModel | 
		myModel propertyValue: (xEntryMorph value @ yEntryMorph value) ]! !

!PointEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:25:11'!
valueWhenDropped
	self model 
		ifNotNil: [ :m | m propertyValue: 	(xEntryMorph value @ yEntryMorph value) ] 
		ifNil: [ 0@0 ]! !

!PointEntryPanel methodsFor: 'initialization' stamp: 'KenD 3/20/2022 08:39:13'!
initializeEntry
	xEntryMorph := SimpleNumberEntryMorph floatDefault: 0.0 maxNumChars: 8.
	yEntryMorph := SimpleNumberEntryMorph floatDefault: 0.0 maxNumChars: 8.
	xEntryMorph acceptCancelReceiver: self.
	yEntryMorph acceptCancelReceiver: self! !

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

!PointEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/17/2022 21:22:13'!
example1
" 
	PointEntryPanel example1 
"
	| model |
	model := SignMorph forObject: (10@200).
	model openInWorld.
	^  self
		open: model
		label: 'Point Value' ! !

!PositiveFloatEntryPanel methodsFor: 'initialization' stamp: 'KenD 3/20/2022 16:01:08'!
initializeEntry

	entry := SimpleNumberEntryMorph positiveFloatDefault: 1.0 maxNumChars: 8.
	entry acceptCancelReceiver: self
! !

!PositiveFloatEntryPanel class methodsFor: 'instance creation' stamp: 'KenD 1/11/2022 14:29:38'!
checkValidity: aNumber
	(aNumber isKindOf: Number) ifFalse: [ self error: 'I require a Positive Number ' , aNumber printString ].
	(aNumber >= 0) ifFalse: [ self error: 'I require a Positive Number: ' , aNumber printString ]! !

!PositiveFloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/19/2022 11:25:47'!
example1
"
	PositiveFloatEntryPanel example1
"
	| model |
	model := SignMorph forObject: 3.1415.
	model openInWorld.
	^ self open: model label: 'Edit a positive float'! !

!PositiveFloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/19/2022 11:31:13'!
example2
"
	PositiveFloatEntryPanel example2
"
	| model |
	model := SignMorph forObject: -3.1415.
	model openInWorld.
	^ self open: model label: 'Edit a positive float'! !

!PositiveIntegerEntryPanel methodsFor: 'initialization' stamp: 'KenD 3/20/2022 08:39:25'!
initializeEntry
	entry := SimpleNumberEntryMorph integerDefault: 0 maxNumChars: 8.
	entry acceptCancelReceiver: self! !

!PositiveIntegerEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:53:21'!
checkValidity: aNumber
	(aNumber isKindOf: Integer) ifFalse: [ self error: 'I require a Positive Integer: ' , aNumber printString ].
	(aNumber >= 0) ifFalse: [ self error: 'I require a Positive Integer: ' , aNumber printString ]! !

!PositiveIntegerEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/17/2022 21:22:40'!
example1
"
	PositiveIntegerEntryPanel example1
"
	| model |
	model := SignMorph forObject: 152.
	model openInWorld.
	^ self open: model label: 'Edit a positive integer'! !

!PositiveIntegerEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/17/2022 21:22:44'!
example2
"
	PositiveIntegerEntryPanel example2
"
	| model |
	model := SignMorph forObject: -152.
	"Expect failed invariant"
	^ self open: model label: 'Can''t negative integer'! !

!RangeFloatEntryPanel methodsFor: 'accessing' stamp: 'hlsf 3/19/2022 10:55:50'!
min: aMinFloat max: aMaxFloat
	min _ aMinFloat.
	max _ aMaxFloat ! !

!RangeFloatEntryPanel methodsFor: 'initialization' stamp: 'KenD 3/20/2022 16:02:44'!
initializeEntry

	entry _ SimpleNumberEntryMorph floatRangeFrom: min to: max maxNumChars: 10.
	entry acceptCancelReceiver: self! !

!RangeFloatEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 3/19/2022 11:41:15'!
checkValidity: aNumber between: min and: max
	(aNumber isKindOf: Number) ifFalse: [ self error: 'I require a Number ' , aNumber printString ].
	(aNumber between: min and: max) ifFalse: [
		self error: aNumber printString, ' is not in [ ', min printString, ' ; ', max printString, ' ]']
		! !

!RangeFloatEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 3/19/2022 11:38:55'!
open: aModel between: aMin and: aMax label: stringName
| panel |
	self checkValidity: aModel propertyValue between: aMin and: aMax.
	panel _ self basicNew :: 
		min: aMin max: aMax;
		initialize ;
		model: aModel;
		buildMorphicWindow.
	stringName ifNotNil: [panel setLabel: stringName].
	panel openInWorld.
	^ panel
		! !

!RangeFloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/19/2022 11:41:38'!
example1
"
	RangeFloatEntryPanel example1
"
	| model |
	model := SignMorph forObject: 0.15.
	model openInWorld.
	^ self open: model between: 0 and: 1 label: 'Edit a value in [0 ; 1]'! !

!RangeFloatEntryPanel class methodsFor: 'examples' stamp: 'KenD 3/19/2022 16:04:46'!
example2
"
	RangeFloatEntryPanel example2
"
	| model |
	model := SignMorph forObject: 1.15.
	model openInWorld.
	^ self open: model between: 0 and: 5 label: 'Edit a value in [0 ; 5]'! !

!RangeFloatEntryPanel class methodsFor: 'examples' stamp: 'KenD 3/21/2022 15:11:59'!
example3
"
	RangeFloatEntryPanel example3
"
	| model panel |
	model _ ValueHolder with: 3.1415.
	model inspect.
	panel _ self open: model between: 3 and: 4 label: 'Edit a value for pi'.
	model action: [ panel openInWorld]. "Panel is usually closed when property edited in the model, open it again"
	^ panel! !

!StringEntryPanel methodsFor: 'initialization' stamp: 'KenD 4/1/2022 12:27:41'!
initializeEntry

	entry := TextEntryMorph contents: '' .
	entry 
		layoutSpec: 
			(LayoutSpec 
				proportionalWidth: 1 
				fixedHeight: Preferences windowTitleFont lineSpacing );
		acceptCancelReceiver: self! !

!StringEntryPanel methodsFor: 'GUI building' stamp: 'hlsf 3/19/2022 10:19:10'!
newPane

	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		separation: self defaultSeparation;
		axisEdgeWeight: #rowLeft;
		addMorph: self entry ; "set in #initialize"
		color: Color transparent;
		borderColor: Color black.
	
	^ entryLayout ! !

!StringEntryPanel class methodsFor: 'examples' stamp: 'KenD 3/20/2022 16:05:08'!
example1
"
	StringEntryPanel example1 
"
	| model |
	model := SignMorph forObject: 'Cuis Smalltalk'.
	model openInWorld.
	"I use a SqueezeLabelMorph in my title"
	^ self open: model  label: 'The Smalltalk I use'! !

!StringEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/26/2022 11:24:25'!
example2
"
	StringEntryPanel example2
"
	| model |
	model := SignMorph forObject: 'Cuis Smalltalk'.
	model openInWorld.
	self openWide: model  label: 'The Smalltalk I use is...' .! !

!StringEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/26/2022 11:24:43'!
example3
"
	StringEntryPanel example3
"
	| model |
	model := ValueHolder with: 'a file name'.
	model action: [:value | Transcript show: value].
	self openWide: model  label: 'Name the sktech to keep, thiis is a long title'! !

!StringEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:55:39'!
checkValidity: aString
	(aString isKindOf: String) ifFalse: [ self error: 'I require a String: ' , aString printString ]! !

!TextEntryPanel methodsFor: 'initialization' stamp: 'hlsf 3/25/2022 10:28:31'!
initializeEntry

	entry := TextModelMorph withText: '' .
	entry 
		layoutSpec: 
			(LayoutSpec 
				proportionalWidth: 1 
				fixedHeight: Preferences windowTitleFont lineSpacing * 4 )! !

!TextEntryPanel methodsFor: 'initialization' stamp: 'hlsf 3/25/2022 10:46:01'!
model: aModel
	"Set my model and make me me a dependent of the given object."

	model ifNotNil: [model removeActionsWithReceiver: self].
	aModel ifNotNil: [aModel addDependent: self].
	model _ aModel	.
	entry ifNotNil: [:anEntry | anEntry scroller contents: aModel propertyValue]! !

!TextEntryPanel methodsFor: 'events' stamp: 'hlsf 3/25/2022 11:16:17'!
accept
	self delete.
	self model 		ifNotNil: [ :myModel | 			
		myModel propertyValue: entry scroller contents asString		].! !

!TextEntryPanel methodsFor: 'events' stamp: 'hlsf 3/25/2022 11:16:53'!
valueWhenDropped
	
	^ self model  
		ifNotNil: [ :m | 	m propertyValue: entry scroller contents asString ] 
		ifNil: [ entry scroller contents asString]! !

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

!WizardPanel class methodsFor: 'new-morph participation' stamp: 'KenD 3/13/2022 07:32:09'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
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

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 3/1/2022 21:48:15'!
applyButton
	^ (PluggableButtonMorph 
		model: wizard
		action: #apply
		label: 'Apply') enableSelector: #isReadyToApply! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 3/1/2022 21:47:54'!
cancelButton
	^ PluggableButtonMorph 
		model: wizard
		action: #cancel
		label: 'Cancel'! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 3/1/2022 21:48:01'!
nextButton
	^ PluggableButtonMorph 
		model: wizard
		action: #nextPage
		label: 'Next'! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 3/1/2022 21:48:07'!
previousButton
	^ PluggableButtonMorph 
		model: wizard
		action: #previousPage
		label: 'Previous'! !

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

!InnerTextMorph methodsFor: '*UI-Panel' stamp: 'hlsf 3/25/2022 11:16:07'!
contents
	^ model actualContents ! !
