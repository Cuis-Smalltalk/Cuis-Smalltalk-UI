'From Cuis 6.0 [latest update: #5087] on 23 February 2022 at 8:15:07 pm'!
'Description Widgets for general use.'!
!provides: 'UI-Widgets' 1 7!
!requires: 'Cuis-Base' 60 5032 nil!
!requires: 'Collections-CompactArrays' 1 13 nil!
!requires: 'Graphics-Files-Additional' 1 24 nil!
SystemOrganization addCategory: 'UI-Widgets'!


!classDefinition: #WheelMorph category: 'UI-Widgets'!
BoxedMorph subclass: #WheelMorph
	instanceVariableNames: 'target actionSelector factor circular old angle maxAngle lastRedraw isHorizontal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Widgets'!
!classDefinition: 'WheelMorph class' category: 'UI-Widgets'!
WheelMorph class
	instanceVariableNames: ''!

!classDefinition: #ChevronMorph category: 'UI-Widgets'!
PlacedMorph subclass: #ChevronMorph
	instanceVariableNames: 'isPressed mouseIsOver icon model aperture innerRadius radius center vertices actionSelector stateSelector argument toolbar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Widgets'!
!classDefinition: 'ChevronMorph class' category: 'UI-Widgets'!
ChevronMorph class
	instanceVariableNames: ''!

!classDefinition: #DropDownChevronMorph category: 'UI-Widgets'!
ChevronMorph subclass: #DropDownChevronMorph
	instanceVariableNames: 'activated chevron subtoolbar height gap'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Widgets'!
!classDefinition: 'DropDownChevronMorph class' category: 'UI-Widgets'!
DropDownChevronMorph class
	instanceVariableNames: ''!

!classDefinition: #CircularToolbarMorph category: 'UI-Widgets'!
PlacedMorph subclass: #CircularToolbarMorph
	instanceVariableNames: 'buttonSize aperture innerRadius dropDownHeight dropDownGap extent color selectedColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Widgets'!
!classDefinition: 'CircularToolbarMorph class' category: 'UI-Widgets'!
CircularToolbarMorph class
	instanceVariableNames: ''!

!classDefinition: #CircularSubToolbarMorph category: 'UI-Widgets'!
CircularToolbarMorph subclass: #CircularSubToolbarMorph
	instanceVariableNames: 'dropDown'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Widgets'!
!classDefinition: 'CircularSubToolbarMorph class' category: 'UI-Widgets'!
CircularSubToolbarMorph class
	instanceVariableNames: ''!

!classDefinition: #WaitSpinner category: 'UI-Widgets'!
Object subclass: #WaitSpinner
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'nil'
	category: 'UI-Widgets'!
!classDefinition: 'WaitSpinner class' category: 'UI-Widgets'!
WaitSpinner class
	instanceVariableNames: 'spinners isSpinnerRunning process'!


!WheelMorph commentStamp: 'hlsf 1/5/2022 12:29:58' prior: 0!
A wheel widget control. I can be used in two different ways:
- I send a message directly to a target with a quantity, each time I am rolled,
- I send a mouse scroll event to a target, each time I am rolled.!

!ChevronMorph commentStamp: '<historical>' prior: 0!
I am a button for a circular morph. I look like a truncated section of a circle, I am nammed chevron as a shorter name.
I  am inserted in a cicular toolbar of the given radius.

- model I request action or state to
- actionSelector message to the model for action
- stateSelector message to the model for state
- argument optional argument for the model state

- aperture is the angle (radian) between the two straight lines of the chevron
- shift is the rotation angle (radian) of the chevron starting from the vertical centered position. With shift == 0, the chevron is centered at the top of the circular toolbar. The angle is clock-wise oriented. A shift value of pi/2 put the chevron at the right of the circular toolbar.
- corners: points 1 to 4 are the four corners of the chevron. The points 5, 6 and 7 are computed to ensure a better bounding box. The point 8 contains the decoration center if any.
- center: center of the shape in local coordinates for positionning, ie icon, owner position!

!DropDownChevronMorph commentStamp: '<historical>' prior: 0!
I am a small drop down chevron. The user clicks me to open a sub toolbar.
- activated: true when I have been clicked, those a sub circular toolbar should show up
- chevron: the chevron I am positionned close to
- height: drop down chevron height
- gap: the gap between my chevron and me!

!CircularToolbarMorph commentStamp: '<historical>' prior: 0!
I am circular toolbar.
- buttonSize: computed extent from the icon size (square)
- aperture: the chevron angle as seen from the toolbar center
- innerRadius: interior size of the toolbar
- extent: an integer representing the extent of our encompassing square. This square encompasses the inner circle, the chevrons and the drop drown chevrons!

!CircularSubToolbarMorph commentStamp: '<historical>' prior: 0!
I am circular sub-toolbar. I am triggerred from a drop down chevron attached to a parent circular toolbar (the main one)
- dropDown : the drop down chevron I was opened from!

!WaitSpinner commentStamp: '' prior: 0!
I animate a spinnig graphic at the front/top center of screen to show activity.
See my Class side:

	WaitSpinner start.  "Show animated WaitSpinner"
	WaitSpinner stop.   "Remove animated WaitSpinner"
 !

!WheelMorph methodsFor: 'accessing'!
actionSelector
	^ actionSelector
! !

!WheelMorph methodsFor: 'accessing' stamp: 'HilaireFernandes 11/5/2017 12:27:56'!
actionSelector: aSymbol
	actionSelector _ aSymbol.

! !

!WheelMorph methodsFor: 'accessing'!
angle
	^angle! !

!WheelMorph methodsFor: 'accessing' stamp: 'HilaireFernandes 11/5/2017 11:09:00'!
angle: aNumber
	angle _ aNumber! !

!WheelMorph methodsFor: 'accessing' stamp: 'HilaireFernandes 11/5/2017 16:42:45'!
color: aColor
	super color: aColor.
	self borderColor: aColor muchDarker! !

!WheelMorph methodsFor: 'accessing'!
factor
	^factor! !

!WheelMorph methodsFor: 'accessing' stamp: 'HilaireFernandes 11/5/2017 11:09:05'!
factor: aFloat
	factor _ aFloat! !

!WheelMorph methodsFor: 'accessing' stamp: 'KenD 4/26/2020 06:44:34'!
isHorizontal
	^ isHorizontal ! !

!WheelMorph methodsFor: 'accessing'!
maxAngle
	^maxAngle! !

!WheelMorph methodsFor: 'accessing' stamp: 'HilaireFernandes 11/5/2017 11:09:10'!
maxAngle: aNumber
	maxAngle _ aNumber! !

!WheelMorph methodsFor: 'accessing'!
target
	^target! !

!WheelMorph methodsFor: 'accessing' stamp: 'HilaireFernandes 11/5/2017 11:09:16'!
target: aTargetObject
	target _ aTargetObject! !

!WheelMorph methodsFor: 'private' stamp: 'hlsf 2/10/2022 17:34:57'!
addAngle: aNumber
	| new adjusted|
	adjusted _ self isVertical ifTrue: [aNumber negated] ifFalse: [aNumber].
	new _ self angle + adjusted.
	self isCircular ifTrue: [new _ new \\ self maxAngle].
	self angle: new.
	lastRedraw _ lastRedraw + adjusted.
	(lastRedraw abs > 2) ifTrue: [
		lastRedraw _ 0.
		self changed.
		self redrawNeeded]! !

!WheelMorph methodsFor: 'properties' stamp: 'HilaireFernandes 11/5/2017 11:10:42'!
beCircular
	circular _ true! !

!WheelMorph methodsFor: 'properties' stamp: 'KenD 4/26/2020 06:55:42'!
beHorizontal
	self isHorizontal
		ifFalse: [
			isHorizontal := true.
			self morphExtent: (self morphExtent transposed).
			self redrawNeeded.
			].
		! !

!WheelMorph methodsFor: 'properties' stamp: 'HilaireFernandes 11/5/2017 11:11:02'!
beLinear
	circular _ false! !

!WheelMorph methodsFor: 'properties' stamp: 'KenD 4/26/2020 06:55:55'!
beVertical
	self isHorizontal
		ifTrue: [
			isHorizontal := false. 
			self morphExtent: (self morphExtent transposed).
			self redrawNeeded] ! !

!WheelMorph methodsFor: 'properties' stamp: 'KenD 4/26/2020 06:48:13'!
defaultExtent

	^100@23! !

!WheelMorph methodsFor: 'properties'!
isCircular
	^circular! !

!WheelMorph methodsFor: 'properties'!
isLinear
	^circular not! !

!WheelMorph methodsFor: 'properties'!
isVertical
	^self isHorizontal not! !

!WheelMorph methodsFor: 'event handling' stamp: 'hlsf 2/10/2022 17:31:29'!
doTargetAction: cursorPoint
	| new delta |
	self isHorizontal
		ifTrue: [ "left lower, right higher"
				new _ cursorPoint x. 
				delta _ new - old
		]
		ifFalse: [ "down lower, up higher"
				new _ cursorPoint y. 
				delta _ old - new
		].
	
	delta isZero ifTrue: [^self].
	self addAngle: delta.
	(target ~~ nil and: [actionSelector ~~ nil]) ifTrue: [
		Cursor normalCursor showWhile: [
			target perform: actionSelector withArguments: (Array with: (delta * self factor))]].
	old _ new.
! !

!WheelMorph methodsFor: 'event handling'!
handlesMouseDown: evt
	^true
! !

!WheelMorph methodsFor: 'event handling' stamp: 'HilaireFernandes 11/5/2017 12:12:54'!
mouseButton1Down: evt localPosition: position
	self isHorizontal
		ifTrue: [old _ position x]
		ifFalse: [old _ position y].! !

!WheelMorph methodsFor: 'event handling' stamp: 'hlsf 1/5/2022 12:35:35'!
mouseMove: evt localPosition: position
	evt anyButtonPressed
		ifTrue: [
			self isSendingScrollEvent 
				ifTrue:  [self sendScrollEvent: position ]
				ifFalse: [	self doTargetAction: position] ]
			! !

!WheelMorph methodsFor: 'event handling' stamp: 'hlsf 2/10/2022 17:28:13'!
sendScrollEvent: cursorPoint
	| new delta mouseScrollDirection |
	self isHorizontal
		ifTrue: [ "left lower, right higher"
				new _ cursorPoint x. 
				delta _ new - old.
				(delta < 0)
					ifTrue:   [ mouseScrollDirection := #left ] 
					ifFalse:  [ mouseScrollDirection := #right ] 
		]
		ifFalse: [ "down lower, up higher"
				new _ cursorPoint y. 
				delta _ old - new.
				(delta < 0)
					ifTrue:   [ mouseScrollDirection := #down ] 
					ifFalse:  [ mouseScrollDirection := #up ] 
		].
	
	delta isZero ifTrue: [^self].
	self addAngle: delta.
	old _ new.
		
	(target ~~ nil) ifTrue: [ | scrollEvent wheelPosition |
		wheelPosition := self morphPosition + (self morphExtent // 2). "wheel center"
		scrollEvent := MouseScrollEvent new
						setType: #mouseScroll
						position: wheelPosition
						direction: mouseScrollDirection
						buttons: InputSensor mouseButton1
						hand: self activeHand
						stamp: Time localMillisecondClock.

		Cursor normalCursor showWhile: [ "Send a scrollEvent for each 'tick' "
			1 to: (delta abs) do: [ :count | scrollEvent sendEventTo: target ]
		]
	]

! !

!WheelMorph methodsFor: 'drawing' stamp: 'hlsf 2/23/2022 20:14:35'!
drawOn: aCanvas
	| interval delta frame x0 x1 y0 y1 deltaX deltaY  |
	super drawOn: aCanvas.		"border & background"
	frame := self morphLocalBounds insetBy: 2.
	aCanvas frameRectangle: frame color: color borderWidth: 1 borderStyleSymbol: #raised.
	frame := frame insetBy: 1.
	x0 := frame origin x.
	x1 := frame corner x.
	y0 := frame origin y.
	y1 := frame corner y.
	deltaX := (x1 - x0) / 2.
	deltaY := (y1 - y0) / 2.
	interval := 7.
	delta := self angle \\ interval.
	1 to: (self maxAngle / (2 * interval)) rounded do: [ :i |
		| x y |
		self isHorizontal ifTrue: [
			x := x0 + deltaX - (((i * interval + delta) * (2 * Float pi / 360.0)) cos * deltaX).
			aCanvas fillRectangle: (Rectangle origin: (x-1)@y0 corner: x@y1) color: borderColor]
		ifFalse: [
			y := y0 + deltaY - (((i * interval + delta) * (2 * Float pi / 360.0)) cos * deltaY).
			aCanvas fillRectangle: (Rectangle origin: x0@(y-1) corner: x1@y) color: borderColor]
	]! !

!WheelMorph methodsFor: 'initialization' stamp: 'KenD 4/26/2020 06:47:54'!
initialize
	super initialize.
	self angle: 0.
	self maxAngle: 360.
	self factor: 1.0.
	self morphExtent: self defaultExtent.
	isHorizontal := true.
	self beCircular.
	self color: Color lightGray.
	lastRedraw := 0.! !

!WheelMorph methodsFor: 'testing' stamp: 'hlsf 1/5/2022 12:34:26'!
isSendingScrollEvent
	^ actionSelector isNil! !

!WheelMorph class methodsFor: 'instance creation' stamp: 'hlsf 1/5/2022 12:31:39'!
target: aTarget
"Use me to emit mouse scroll event to the target"
	^ self new :: target: aTarget
! !

!WheelMorph class methodsFor: 'instance creation' stamp: 'hlsf 1/5/2022 12:31:21'!
target: aTarget actionSelector: aSymbol
"Use me to send message directly to the target"
	^ self new :: target: aTarget; actionSelector: aSymbol
! !

!WheelMorph class methodsFor: 'examples' stamp: 'hlsf 1/4/2022 08:49:15'!
example1
"
	self example1 openInWorld
"
	| w |
	w := WheelMorph new.
	w color: Color red.
	w target: Transcript; actionSelector: #print:.
	^ w! !

!WheelMorph class methodsFor: 'examples' stamp: 'hlsf 1/5/2022 12:24:46'!
example2
"
	self example2 openInWorld
"
	| ed model wheel |
	ed := TextEditor openTextEditor.
	"paste a bunch of text to get scrollbar"
	model := ed layoutMorph submorphs first. "TextModelMorph"
	wheel := WheelMorph target: model.
	wheel beVertical.
	^ wheel! !

!ChevronMorph methodsFor: 'drawing' stamp: 'hlsf 12/9/2021 15:39:04'!
drawMyShapeOn: canvas with: background
	canvas strokeWidth: 2 color:  toolbar color muchDarker fillColor: background  do: [: engine |
		engine moveTo: (self vertices floatAt: 1) @ (vertices floatAt: 2);
	 		lineTo: (vertices floatAt: 3) @ (vertices floatAt: 4);
			arcTo: (vertices floatAt: 5) @ (vertices floatAt: 6) 
				radius: radius  angleOfXAxis: aperture largeFlag: false sweepFlag: false;
			lineTo: (vertices floatAt: 7) @ (vertices floatAt: 8);
			arcTo: (vertices floatAt: 1) @ (vertices floatAt: 2) 
				radius: innerRadius angleOfXAxis: aperture largeFlag: false sweepFlag: true]! !

!ChevronMorph methodsFor: 'drawing' stamp: 'hlsf 12/9/2021 15:39:14'!
drawOn: canvas
	mouseIsOver | self getState 
		ifTrue:  [self drawMyShapeOn: canvas with: toolbar selectedColor]
		ifFalse: [self drawMyShapeOn: canvas with: toolbar color].
	icon ifNotNil: [canvas imageUnrotated: icon at: self center - (icon extent // 2)]! !

!ChevronMorph methodsFor: 'accessing' stamp: 'hlsf 10/1/2021 11:21:03'!
action: aSymbol
	actionSelector _ aSymbol ! !

!ChevronMorph methodsFor: 'accessing' stamp: 'hlsf 10/3/2021 16:20:02'!
argument: aSymbol
	argument _ aSymbol ! !

!ChevronMorph methodsFor: 'accessing' stamp: 'hlsf 12/31/2020 12:59:19'!
dropDown
"Do I have any associated drop down chevron?"
	^ owner ifNotNil: [
		owner submorphs 
			detect: [:morph | morph isDropDownChevron and: [morph chevron == self]]
			ifNone: [nil]]! !

!ChevronMorph methodsFor: 'accessing' stamp: 'hlsf 10/10/2021 11:45:07'!
getState
	^ stateSelector 
		ifNil: [false]
		ifNotNil: [model perform: stateSelector withPossiblyWrongSizedArguments: {argument}]! !

!ChevronMorph methodsFor: 'accessing' stamp: 'hlsf 10/1/2021 10:14:39'!
icon: aForm
	icon _ aForm ! !

!ChevronMorph methodsFor: 'accessing' stamp: 'hlsf 10/3/2021 16:02:26'!
model: anObject
	model ifNotNil: [model removeDependent: self].
	anObject ifNotNil: [anObject addDependent: self].
	model _ anObject! !

!ChevronMorph methodsFor: 'accessing' stamp: 'hlsf 1/7/2021 21:16:36'!
radius: number
	radius _ number! !

!ChevronMorph methodsFor: 'accessing' stamp: 'hlsf 10/3/2021 16:08:31'!
state: aSymbol
	stateSelector _ aSymbol ! !

!ChevronMorph methodsFor: 'accessing' stamp: 'hlsf 12/9/2021 15:42:25'!
toolbar
"Access to the top level toolbar. 
Depend on where I am on a the toolbar or one if its circular toolbar"
	^ toolbar! !

!ChevronMorph methodsFor: 'accessing' stamp: 'hlsf 12/9/2021 15:35:33'!
toolbar: aCircularToolbarMorph
"Set the top level toolbar"
	toolbar _ aCircularToolbarMorph ! !

!ChevronMorph methodsFor: 'initialization' stamp: 'hlsf 12/9/2021 15:38:05'!
addDropDown
"Decorate me with a drop down chevron"
| newDropDown |
	newDropDown _ DropDownChevronMorph
		aperture: aperture 
		shift: self rotation 
		radius: radius + toolbar dropDownGap + toolbar dropDownHeight 
		innerRadius: radius + toolbar dropDownGap. 
	newDropDown toolbar: toolbar; 		chevron: self.
	toolbar addMorphBack: newDropDown.
	^ newDropDown 
	! !

!ChevronMorph methodsFor: 'initialization' stamp: 'hlsf 12/9/2021 16:02:16'!
aperture: float1 shift: float2 radius: integer1 innerRadius: integer2 
	vertices _ center _ nil.
	aperture _ float1.
	radius _ integer1.
	innerRadius _ integer2.
	self rotation: float2.
	self dropDown ifNotNil: [:dropDown | 
		dropDown 
			aperture: float1 
			shift: float2 
			radius: radius + toolbar dropDownGap + toolbar dropDownHeight 
			innerRadius: radius + toolbar dropDownGap ]! !

!ChevronMorph methodsFor: 'initialization' stamp: 'hlsf 12/9/2021 15:36:37'!
initialize
	super initialize.
	mouseIsOver _ isPressed _ false.
	self initializeMouseEvents ! !

!ChevronMorph methodsFor: 'initialization' stamp: 'hlsf 10/10/2021 11:57:04'!
initializeMouseEvents
	" Handle mouse down events "
	self setProperty: #handlesMouseDown toValue: true.
	self setProperty: #'mouseButton1Down:localPosition:'  toValue: [:event :localPosition |
		isPressed _ true.
		self redrawNeeded].
	self setProperty: #mouseButton1Up:localPosition:  toValue: [:event :localPosition |
		isPressed _ false.
		(self coversPixel: event eventPosition) ifTrue: [self performAction].
		self redrawNeeded ].
	" Handle mouse over event "	
	self setProperty: #handlesMouseOver: toValue: true.
	self setProperty: #mouseEnter: toValue: [:event |
		mouseIsOver _ true.
		self redrawNeeded].
	self setProperty: #mouseLeave:  toValue: [:event |
		mouseIsOver _ false.
		self redrawNeeded]! !

!ChevronMorph methodsFor: 'geometry' stamp: 'hlsf 1/3/2021 13:00:29'!
center
"Position to center an icon"
	^ center ifNil: [ 
		center _ Point rho: radius + innerRadius // 2 theta: Float halfPi negated]! !

!ChevronMorph methodsFor: 'geometry' stamp: 'hlsf 1/3/2021 13:11:02'!
vertices
	| angle |
	"Vertices are computed relatatively to the center of the circular toolbar (0;0). 
	The default oriention, when not rotated, is centered at the top"
	vertices ifNotNil: [^ vertices ].
	vertices _ Float32PointArray new: 4.
	angle _ Float halfPi negated + (aperture / 2). "(oy) reversed direction"
	vertices
		at: 1 put: (Point rho: innerRadius theta: angle) ;
		at: 2 put: (Point rho: radius theta: angle) .
	angle _ angle - aperture. "(oy) reversed direction"
	vertices
		at: 3 put: (Point rho: radius theta: angle);
		at: 4 put: (Point rho: innerRadius theta: angle).
	^ vertices
	! !

!ChevronMorph methodsFor: 'testing' stamp: 'hlsf 6/7/2020 13:32:45'!
isChevron
	^ true! !

!ChevronMorph methodsFor: 'testing' stamp: 'hlsf 6/7/2020 13:32:57'!
isDropDownChevron
	^ false! !

!ChevronMorph methodsFor: 'testing' stamp: 'hlsf 6/15/2020 21:50:36'!
isOnSubToolbar
	^ owner isSubToolbar ! !

!ChevronMorph methodsFor: 'action' stamp: 'hlsf 10/10/2021 12:05:32'!
performAction
"Am I a chevron on sub toolbar? 
If so I become the chevron my sub toolbar was attached too"
	actionSelector ifNotNil: [
		model perform: actionSelector].
	self isOnSubToolbar ifTrue: [ | target |
		"Not a complete replacement, so do it by hand"
		target _ owner dropDown chevron.
		target icon: icon;
			model: model;
			action: actionSelector;
			state: stateSelector;
			argument: argument .
		self valueOfProperty: #balloonText ifPresentDo: [:txt | target setBalloonText: txt]].
	self toolbar closeAllSubToolbars;
		redrawNeeded.! !

!ChevronMorph class methodsFor: 'instance creation' stamp: 'hlsf 1/3/2021 16:50:11'!
aperture: float1 shift: float2 radius: integer1 innerRadius: integer2 
	^ self new 
		aperture: float1 shift: float2 radius: integer1 innerRadius: integer2;
		yourself
! !

!ChevronMorph class methodsFor: 'new-morph participation' stamp: 'hlsf 1/10/2021 09:55:42'!
includeInNewMorphMenu
	^ false! !

!DropDownChevronMorph methodsFor: 'accessing' stamp: 'hlsf 6/7/2020 13:55:38'!
chevron
	^ chevron! !

!DropDownChevronMorph methodsFor: 'accessing' stamp: 'hlsf 6/7/2020 13:55:49'!
chevron: aChevron
	chevron _ aChevron ! !

!DropDownChevronMorph methodsFor: 'accessing' stamp: 'hlsf 12/9/2021 16:03:57'!
subtoolbar
	^ subtoolbar ifNil: [
		subtoolbar _ CircularSubToolbarMorph new
			color: toolbar color lighter;
			dropDown: self;
			extent: (toolbar extent / 2 + toolbar buttonSize + (toolbar dropDownGap * 2) + toolbar dropDownHeight) * 2;
			rotation: self rotation;
			privateButtonSize: toolbar buttonSize.
		subtoolbar ]! !

!DropDownChevronMorph methodsFor: 'action' stamp: 'hlsf 10/1/2021 11:17:29'!
performAction
	activated
		ifTrue: [ self closeSubToolbar ]
		ifFalse: [ self openSubToolbar ].! !

!DropDownChevronMorph methodsFor: 'drawing' stamp: 'hlsf 12/9/2021 15:39:27'!
drawMyShapeOn: canvas with: background
	canvas strokeWidth: 2 color: toolbar color muchDarker fillColor: background  do: [: engine |
		engine moveTo: (self vertices floatAt: 1) @ (vertices floatAt: 2);
			arcTo: (vertices floatAt: 3) @ (vertices floatAt: 4) 
				radius: innerRadius angleOfXAxis: aperture largeFlag: false sweepFlag: true;
			lineTo: (vertices floatAt: 5) @ (vertices floatAt: 6);
			lineTo: (vertices floatAt: 1) @ (vertices floatAt: 2)]	! !

!DropDownChevronMorph methodsFor: 'drawing' stamp: 'hlsf 12/9/2021 15:39:35'!
drawOn: canvas
	activated 
		ifTrue: [self drawMyShapeOn: canvas with: toolbar selectedColor]
		ifFalse: [super drawOn: canvas]! !

!DropDownChevronMorph methodsFor: 'events' stamp: 'hlsf 12/9/2021 15:34:32'!
closeSubToolbar
	self subtoolbar delete.
	activated _ false! !

!DropDownChevronMorph methodsFor: 'events' stamp: 'hlsf 1/3/2021 17:17:27'!
dropDownClicked
	activated
		ifTrue: [ self closeSubToolbar ]
		ifFalse: [ self openSubToolbar ].! !

!DropDownChevronMorph methodsFor: 'events' stamp: 'hlsf 12/9/2021 16:04:48'!
openSubToolbar
	toolbar closeAllSubToolbars.
	owner addMorphBack: self subtoolbar.
	activated _ true.! !

!DropDownChevronMorph methodsFor: 'geometry' stamp: 'hlsf 1/4/2021 11:46:00'!
center
	self shouldNotHappen ! !

!DropDownChevronMorph methodsFor: 'geometry' stamp: 'hlsf 1/3/2021 13:22:10'!
vertices
	| angle |
	vertices ifNotNil: [^ vertices].
	vertices _ Float32PointArray new: 3.
	angle _ Float halfPi negated.
	vertices at: 3 put: (Point rho: radius theta: angle).
	angle _ angle + (aperture / 2).
	vertices at: 2 put: (Point rho: innerRadius theta: angle).
	angle _ angle - aperture.
	vertices at: 1 put: (Point rho: innerRadius theta: angle).
	^ vertices! !

!DropDownChevronMorph methodsFor: 'initialization' stamp: 'hlsf 10/1/2021 10:28:12'!
initialize
	super initialize.
	activated _ false.
	self model: self! !

!DropDownChevronMorph methodsFor: 'testing' stamp: 'hlsf 6/12/2020 14:58:03'!
isActivated
	^ activated ! !

!DropDownChevronMorph methodsFor: 'testing' stamp: 'hlsf 6/7/2020 13:33:06'!
isChevron
	^ false! !

!DropDownChevronMorph methodsFor: 'testing' stamp: 'hlsf 6/7/2020 13:33:14'!
isDropDownChevron
	^ true! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 12/9/2021 15:37:04'!
addButton: icon
"To add a button to a circular toolbar takes some work, let the toolbar compute the math internally,
then return the button to adjust the model and action" 
	| button |
	button _ ChevronMorph 
		aperture: self aperture 
		shift: self chevronCount * (self aperture + self gap) 
		radius: extent // 2 
		innerRadius: self innerRadius.
	button toolbar: self;
		icon: icon.
	self addMorphBack: button.
	^ button! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 5/26/2020 16:51:54'!
aperture
"a very clever computation..."
	^ aperture ifNil: [aperture _ ((buttonSize / 2.0) arcTan: self innerRadius) * 2]! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 6/7/2020 18:14:42'!
buttonSize
	^ buttonSize! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 12/14/2021 21:11:33'!
buttonSize: integer
	buttonSize _ integer * 1.2. "We need some gap to fit in the icon on the chevron area"
 	aperture _ nil! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 6/7/2020 13:39:59'!
chevronCount
	^ self chevrons size! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 10/10/2021 12:26:37'!
chevrons
	^ self submorphsSatisfying: [:each | 
		[each isChevron] on: MessageNotUnderstood do:[false]]! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 10/2/2021 11:37:33'!
color
	^ color! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 9/30/2021 17:52:10'!
color: aColor
	color _ aColor.
	self submorphsDo: [:each | each color: aColor]! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 10/10/2021 12:27:24'!
dropDownChevronsDo: aBlock
	self submorphs 
		select: [:each | [each isDropDownChevron] on: MessageNotUnderstood do: [false]] 
		thenDo: [:aDropDownChevron | aBlock value: aDropDownChevron ]! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 1/7/2021 21:30:46'!
dropDownGap
	^ dropDownGap! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 1/7/2021 21:31:00'!
dropDownGap: number
	dropDownGap _ number ! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 1/7/2021 21:30:36'!
dropDownHeight
	^ dropDownHeight! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 1/7/2021 21:31:12'!
dropDownHeight: number
	dropDownHeight _ number ! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 9/30/2021 17:58:33'!
extent
	^extent! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 9/30/2021 17:51:53'!
extent: aSmallInteger 
	extent _ aSmallInteger! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 6/12/2020 11:53:20'!
gap
"Angle gap between the chevron button"
	^ `5 degreesToRadians`! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 12/31/2020 16:42:11'!
innerRadius
	^ innerRadius ifNil: [innerRadius _ extent // 2 - buttonSize]! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 6/7/2020 18:15:42'!
privateButtonSize: anInteger
	buttonSize _ anInteger! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 12/9/2021 15:15:03'!
selectedColor
	^ selectedColor! !

!CircularToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 12/9/2021 15:15:48'!
selectedColor: aColor
	selectedColor _ aColor! !

!CircularToolbarMorph methodsFor: 'testing' stamp: 'hlsf 6/12/2020 12:02:53'!
isSubToolbar
	^ false! !

!CircularToolbarMorph methodsFor: 'drawing' stamp: 'hlsf 12/4/2021 21:03:53'!
drawOn: aCanvas
	aCanvas ellipseCenterX: 0 y: 0 rx: self innerRadius ry: self innerRadius 
		borderWidth: 0 borderColor: color  fillColor: (color muchLighter alpha: 0.5)! !

!CircularToolbarMorph methodsFor: 'initialization' stamp: 'hlsf 12/9/2021 15:56:31'!
closeAllSubToolbars
	self dropDownChevronsDo: [:dropDown | 
		dropDown isActivated ifTrue: [dropDown closeSubToolbar ]]! !

!CircularToolbarMorph methodsFor: 'initialization' stamp: 'hlsf 12/9/2021 15:15:20'!
initialize
	super initialize.
	extent _ 350.
	dropDownHeight _ 15.
	dropDownGap _ 5.
	self buttonSize: 30.
	color _ Color green darker alpha: 0.8.
	selectedColor _ Color red  alpha: 0.8.
	self isSubToolbar ifFalse: [ 
		| closeButton |
		closeButton _ PluggableButtonMorph model: self action: #delete.
		closeButton icon: Theme current closeIcon..		
		self addMorph: closeButton.
		closeButton morphPosition: closeButton morphExtent // -2] 
	! !

!CircularToolbarMorph methodsFor: 'initialization' stamp: 'hlsf 10/2/2021 12:16:46'!
openInWorld: aWorld
	super openInWorld: aWorld.
	self startStepping: #comeToFront stepTime: 10.! !

!CircularToolbarMorph methodsFor: 'change reporting' stamp: 'hlsf 10/10/2021 12:06:25'!
addedMorph: aMorph
	self redrawNeeded ! !

!CircularToolbarMorph class methodsFor: 'new-morph participation' stamp: 'hlsf 1/10/2021 09:55:33'!
includeInNewMorphMenu
	^ false! !

!CircularToolbarMorph class methodsFor: 'examples' stamp: 'hlsf 1/4/2022 09:13:57'!
example1
"
	self example1 openInWorld
"
	| tools |
	Feature require: 'VectorGraphics'.
	tools := CircularToolbarMorph new buttonSize: 16; extent: 100.
	tools color: (Color orange alpha: 0.8);
		addButton: Theme current newIcon;
		addButton: Theme current openIcon;
		addButton: Theme current saveIcon;
		addButton: Theme current copyIcon ;
		addButton: Theme current pasteIcon ;
		addButton: Theme current undoIcon;
		addButton: Theme current redoIcon ;
		addButton: Theme current closeIcon ;
		addButton: Theme current quitIcon.
	^ tools! !

!CircularSubToolbarMorph methodsFor: 'testing' stamp: 'hlsf 6/12/2020 12:02:31'!
isChevron
"sub toolbar are added too to toolbar so we need to sort out"
	^ false! !

!CircularSubToolbarMorph methodsFor: 'testing' stamp: 'hlsf 6/12/2020 12:02:38'!
isDropDownChevron
"sub toolbar are added too to toolbar so we need to sort out"
	^ false! !

!CircularSubToolbarMorph methodsFor: 'testing' stamp: 'hlsf 6/12/2020 12:03:13'!
isSubToolbar
	^ true! !

!CircularSubToolbarMorph methodsFor: 'drawing' stamp: 'hlsf 6/12/2020 11:52:13'!
drawOn: aCanvas
"We don't draw anything, not inner central disc for circular sub toolbar"! !

!CircularSubToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 6/12/2020 12:10:11'!
dropDown
	^ dropDown! !

!CircularSubToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 6/12/2020 12:08:10'!
dropDown: aDropDownChevron
	dropDown _ aDropDownChevron ! !

!CircularSubToolbarMorph methodsFor: 'accessing' stamp: 'hlsf 6/12/2020 11:53:08'!
gap
	^ `1 degreesToRadians`! !

!CircularSubToolbarMorph methodsFor: 'initialization' stamp: 'hlsf 12/9/2021 16:01:09'!
closeAllSubToolbars
"Ask to the main toolbar, not to a subtoolbar"
	owner closeAllSubToolbars ! !

!CircularSubToolbarMorph class methodsFor: 'examples' stamp: 'hlsf 1/4/2022 09:19:14'!
example1
"
	self example1 openInWorld
"
	| tools icons someIcons |
	Feature require: 'VectorGraphics'.
	tools _ CircularToolbarMorph new 
		extent: 150;
		buttonSize: 20; 
		dropDownHeight: 15; 
		dropDownGap: 5.
	tools color: (Color black alpha: 0.7).
	someIcons _ {Theme current newIcon. Theme current openIcon .
		Theme current saveIcon. Theme current copyIcon.}.
	icons _ {Theme current newIcon. Theme current openIcon .Theme current saveIcon. 
		Theme current copyIcon. Theme current pasteIcon. Theme current undoIcon. 
		Theme current redoIcon. Theme current closeIcon. Theme current quitIcon}.
	icons do: [:icon | | button drop |	
		button _ tools addButton: icon.
		button setBalloonText: 'test'.
		drop _ button addDropDown.
		someIcons do: [: icn | 
			(drop subtoolbar addButton: icn) setBalloonText: 'I''am a button in a circular sub toolbar']
	].
	^ tools! !

!WaitSpinner class methodsFor: 'accessing' stamp: 'hlsf 4/21/2020 21:49:19'!
isSpinnerRunning 
	^ isSpinnerRunning ifNil: [isSpinnerRunning _ false]! !

!WaitSpinner class methodsFor: 'accessing' stamp: 'hlsf 4/21/2020 21:39:08'!
start
	self isSpinnerRunning ifTrue: [ self stop ].
	isSpinnerRunning _ true.
	process _ [
		[1 to: self spinnerQty do: [ :i | 
			| form |
			form _ self at: i.
			form displayAt: Display center - (form extent // 2).
			(Delay forMilliseconds: 100) wait ]] repeat 
	] newProcess.
	process resume! !

!WaitSpinner class methodsFor: 'accessing' stamp: 'hlsf 4/21/2020 21:49:11'!
stop
	isSpinnerRunning ifTrue:[
		process terminate.
		isSpinnerRunning _ false.
		self runningWorld ifNotNil: [:w | w restoreDisplay]]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:27:03'!
at: integer
	^ spinners at: integer! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:49:31'!
decorate: form
	|newForm|
	newForm _ Form extent: form extent + 10 depth: 32.
	newForm fillWhite.
	form displayOn: newForm at: newForm center - (form extent / 2).
	newForm  borderWidth: 2 borderHeight: 2 fillColor: Color veryLightGray.
	^ newForm! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:24:06'!
spinner10Contents
^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 31 73 68 65 84 120 94 133 83 203 114 195 32 12 212 64 20 5 225 16 147 224 131 147 118 166 255 255 149 69 22 174 49 56 233 94 44 208 234 181 194 208 128 217 195 49 244 222 48 27 53 90 191 227 185 38 32 187 134 80 60 219 7 219 20 145 121 35 204 203 161 75 225 86 130 218 45 80 6 80 2 115 220 197 106 199 94 234 46 4 183 142 226 92 113 68 163 131 72 10 163 76 9 140 69 148 220 17 163 88 88 134 247 115 62 121 228 191 81 114 222 174 43 113 71 83 201 212 12 142 109 72 78 184 19 215 107 209 126 23 7 199 96 21 161 21 78 1 240 245 173 24 59 97 21 255 19 222 148 240 165 196 214 203 233 99 207 224 198 231 121 95 97 47 220 109 74 105 170 47 68 254 77 152 199 43 165 244 122 52 194 49 207 133 50 100 247 100 115 218 75 105 212 200 178 100 151 165 78 74 207 81 172 27 209 201 132 96 214 117 203 130 22 194 125 88 38 64 162 17 208 90 148 77 213 15 102 197 72 132 74 200 79 110 238 159 100 32 202 125 40 193 49 119 63 14 12 116 53 43 161 252 3 59 156 137 68 169 66 56 120 247 63 116 129 141 0 120 80 3 106 194 91 120 107 155 208 95 137 155 13 250 175 184 235 210 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:25:47'!
spinner11Contents
^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 33 73 68 65 84 120 94 133 83 219 114 132 32 12 117 8 151 33 184 10 211 125 161 91 118 219 105 255 255 27 23 12 168 68 157 158 23 49 57 147 235 201 192 128 232 134 115 144 93 32 10 122 112 191 197 184 39 40 180 140 80 61 219 71 241 16 1 113 35 196 229 231 16 194 54 2 189 57 84 105 128 8 136 97 239 241 158 218 40 121 23 130 109 173 216 37 142 78 233 23 168 145 18 66 16 179 36 13 52 20 245 147 82 250 155 202 171 54 239 98 182 187 156 178 181 226 191 50 197 40 94 17 134 117 90 234 81 130 112 127 215 200 116 79 208 13 30 21 223 137 62 91 77 129 212 4 201 7 71 24 134 207 59 97 62 12 150 240 63 225 34 133 171 41 182 90 212 85 145 53 34 220 166 62 67 191 78 61 26 51 238 13 89 16 184 169 78 122 99 140 239 138 88 54 17 43 101 206 238 241 59 27 159 181 14 81 150 85 118 89 243 24 115 131 194 253 0 176 206 90 215 214 109 177 10 239 53 211 250 1 52 9 70 245 130 89 11 133 28 167 73 78 157 72 18 96 106 162 181 251 22 26 94 0 110 149 125 56 202 94 2 200 238 112 184 238 35 60 251 211 19 231 39 44 240 202 115 121 254 111 248 165 14 102 123 116 206 202 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:25:52'!
spinner12Contents
^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 43 73 68 65 84 120 94 133 83 127 111 132 32 12 37 69 184 180 220 169 68 182 139 187 53 102 217 190 255 103 60 126 169 128 154 245 15 17 222 163 45 237 171 104 140 200 136 115 211 42 124 129 8 226 22 90 252 206 63 37 65 17 54 132 145 121 220 9 126 81 173 139 95 254 86 27 97 38 58 228 32 153 95 43 193 127 241 152 165 99 238 51 129 200 150 200 48 196 165 103 118 137 128 235 83 48 250 153 156 251 208 225 231 198 172 5 128 48 57 67 176 169 40 248 233 156 123 118 254 105 127 50 185 52 179 63 55 138 182 167 12 95 158 50 214 105 5 216 110 213 194 123 112 210 226 213 141 238 229 116 185 55 164 218 158 76 245 118 135 85 159 172 45 45 36 19 226 113 75 166 27 156 178 253 79 184 8 97 114 136 61 23 184 74 50 239 123 169 234 8 117 221 186 69 202 165 60 240 130 160 221 39 106 41 165 174 174 196 78 204 153 50 121 120 153 195 181 124 0 161 89 161 151 57 142 199 251 216 86 223 93 131 104 214 118 35 101 225 209 4 169 252 254 60 10 70 213 130 41 26 104 54 201 169 163 36 147 80 19 1 203 39 172 102 99 192 44 123 123 148 253 62 49 32 78 117 15 52 215 163 7 231 35 12 116 133 92 142 255 27 198 51 14 251 200 3 212 240 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:25:15'!
spinner1Contents
^  #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 33 73 68 65 84 120 94 117 83 237 118 131 32 12 245 4 41 35 233 166 174 217 58 183 246 253 95 115 129 128 53 160 249 33 38 185 220 124 50 88 241 143 199 199 112 44 183 152 190 238 249 116 89 133 214 255 201 223 123 128 199 216 0 38 230 233 5 0 68 223 82 124 241 111 220 0 30 177 203 225 194 124 173 0 33 136 125 150 119 230 177 0 16 23 115 247 146 143 145 249 79 1 17 81 139 136 153 103 12 225 154 107 159 153 111 222 57 79 37 67 88 16 41 157 111 33 132 89 76 241 174 84 3 173 98 39 73 180 150 114 121 23 136 179 173 73 238 101 51 193 36 136 159 214 111 10 241 115 48 51 32 244 212 84 57 90 245 229 6 175 210 78 7 84 104 112 69 26 6 105 166 202 6 192 51 192 73 8 218 66 244 89 29 169 210 70 4 27 193 142 51 181 221 12 112 69 220 221 208 182 27 210 108 90 161 178 151 182 87 3 164 97 37 210 18 167 254 164 53 160 24 169 142 59 93 44 107 65 218 126 177 67 10 237 237 194 236 6 72 10 16 206 181 95 73 93 84 5 68 196 238 225 12 75 14 168 128 162 180 4 96 142 216 1 214 29 78 18 130 227 39 12 120 230 169 162 155 190 147 127 215 208 13 219 203 127 1 212 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:25:10'!
spinner2Contents 
^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 35 73 68 65 84 120 94 117 147 209 118 131 48 8 134 123 136 9 35 108 174 158 121 81 187 178 174 221 251 191 227 146 144 180 6 43 23 42 240 9 63 24 15 189 209 249 60 28 94 219 0 249 26 230 57 20 215 217 252 21 223 214 192 93 190 13 16 16 195 19 112 34 119 91 226 29 63 224 1 220 228 226 45 48 34 126 54 224 40 130 91 149 39 68 175 128 191 200 95 167 95 7 243 136 71 5 80 68 135 32 42 87 231 174 165 161 67 28 40 4 26 69 230 236 195 20 35 167 59 255 56 231 66 18 8 167 177 78 116 75 15 236 99 140 85 233 144 8 55 114 167 40 167 39 104 30 127 37 226 215 230 105 29 128 224 186 193 57 122 54 83 82 239 62 211 12 106 246 133 71 56 86 3 147 111 241 7 64 123 192 78 139 109 152 247 68 182 33 122 17 96 90 230 181 79 235 192 210 201 214 181 119 69 75 104 129 86 189 174 189 5 96 97 45 90 251 180 135 4 50 19 49 215 175 152 95 172 199 130 117 253 41 14 185 181 111 253 137 204 7 100 5 82 205 101 123 36 161 52 82 128 54 155 79 54 149 134 10 84 199 22 128 238 70 27 96 89 113 73 16 188 254 133 33 238 101 154 233 73 95 217 63 178 66 14 153 183 139 109 50 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:25:04'!
spinner3Contents
^  #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 39 73 68 65 84 120 94 125 146 127 115 194 32 12 134 123 73 105 15 98 153 61 163 119 184 177 121 186 125 255 175 56 32 180 5 170 230 143 86 94 30 243 230 71 187 58 96 154 84 247 60 52 197 167 29 71 155 142 67 123 111 240 187 4 38 62 52 64 143 216 111 192 192 60 181 41 126 16 105 5 46 124 213 45 160 16 79 11 240 193 124 220 87 121 67 4 1 244 149 207 85 107 32 47 196 65 128 35 179 52 113 72 149 146 49 115 66 44 162 6 107 161 103 254 140 231 191 135 247 9 116 198 24 21 10 164 91 158 209 233 210 199 70 188 247 156 61 2 97 234 170 213 61 92 63 182 74 117 76 82 2 191 222 127 141 165 66 202 64 9 12 254 110 155 46 169 62 110 187 32 144 104 128 110 149 77 14 104 238 23 125 5 244 43 224 133 197 94 166 183 53 199 73 64 237 80 91 194 28 22 82 10 174 42 59 76 73 182 209 213 146 131 109 206 105 159 139 0 142 36 105 246 89 126 4 144 72 107 162 188 151 248 71 201 32 95 124 210 33 90 171 197 95 87 149 6 153 4 8 57 221 254 147 132 100 36 128 222 77 62 196 156 12 5 200 135 54 1 84 47 189 3 92 193 117 234 137 71 153 232 77 196 86 170 248 7 162 137 15 60 93 182 179 128 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:24:59'!
spinner4Contents
^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 32 73 68 65 84 120 94 117 83 203 114 195 32 12 244 136 168 10 82 236 196 49 153 14 77 123 204 255 255 98 1 97 3 198 222 67 76 208 34 173 94 67 11 49 6 134 99 72 250 69 99 48 29 166 189 221 178 175 9 31 186 239 8 192 12 133 48 17 125 246 46 102 230 66 184 210 216 73 9 46 236 74 248 34 50 189 74 100 22 37 192 72 183 230 173 122 19 102 84 130 33 210 36 158 207 108 152 65 19 97 17 68 65 162 71 252 111 94 206 45 241 224 57 188 141 101 192 44 236 114 13 58 150 183 115 238 189 233 75 10 235 178 140 193 252 186 87 101 138 2 42 124 59 247 243 168 223 8 114 147 248 226 198 203 97 47 10 163 24 64 177 35 132 124 19 166 129 51 118 165 53 127 138 223 141 96 207 8 39 33 166 45 196 137 72 233 7 6 218 222 182 33 33 76 195 92 95 248 70 118 168 82 238 70 123 229 161 212 57 245 115 189 0 47 234 52 199 89 15 169 221 214 138 228 190 196 135 234 193 202 54 48 105 118 113 141 111 109 55 114 58 220 172 59 112 52 180 74 176 93 229 183 177 207 235 49 231 232 253 226 148 143 237 8 190 226 13 200 39 59 12 124 102 89 17 83 105 240 15 76 208 14 94 194 124 25 106 0 0 0 0 73 69 78 68 174 66 96 130] ! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:24:53'!
spinner5Contents
^  #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 32 73 68 65 84 120 94 125 83 219 146 131 48 8 205 128 145 9 177 142 206 246 161 238 54 181 157 157 254 255 47 54 145 172 185 233 242 162 9 39 112 128 131 170 140 217 170 99 147 123 96 134 237 71 215 126 195 75 14 120 226 87 5 136 158 248 209 136 207 58 196 204 156 0 15 196 134 138 119 153 63 64 135 56 182 44 117 40 96 3 88 196 181 120 43 188 45 179 22 192 136 40 69 172 107 116 204 32 133 132 16 160 0 177 223 42 25 136 186 240 179 176 127 27 56 105 136 37 63 2 143 137 136 166 157 223 198 48 79 251 246 238 161 207 218 20 8 100 118 35 186 32 228 141 214 156 31 85 71 111 125 56 139 132 72 14 16 171 0 166 23 235 20 71 131 18 208 95 197 190 119 128 57 3 156 164 232 246 20 39 36 199 86 48 5 9 116 84 148 9 94 13 115 126 241 114 238 62 229 93 138 211 72 25 174 206 185 23 166 62 111 243 92 98 22 88 60 24 127 61 228 39 42 93 106 12 227 182 198 88 27 231 66 119 231 36 130 177 165 96 116 108 155 166 225 88 114 62 230 210 74 50 23 173 105 58 95 203 94 14 255 44 14 52 179 241 87 197 234 233 131 28 229 242 158 90 179 254 31 178 93 14 174 214 254 40 176 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:24:47'!
spinner6Contents
^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 24 73 68 65 84 120 94 133 83 219 110 195 32 12 69 80 82 217 116 52 153 88 165 116 181 122 153 246 255 191 56 192 52 4 231 178 243 2 196 39 62 190 42 1 68 167 214 193 223 53 162 230 139 180 3 142 115 130 69 16 132 98 169 135 149 46 6 196 74 24 243 99 225 2 222 4 190 75 216 148 0 19 16 135 230 95 142 216 37 221 76 128 119 42 44 20 13 131 230 68 146 11 205 204 20 200 221 152 172 20 35 66 155 202 96 75 242 110 140 47 232 140 49 221 20 159 140 202 61 162 249 126 152 149 73 36 158 236 126 94 116 103 177 41 46 152 135 94 237 69 101 84 131 102 8 130 246 12 171 176 64 120 244 71 198 199 68 128 45 194 134 132 157 36 54 130 60 44 7 166 9 162 11 125 163 169 7 209 192 75 8 215 243 188 74 165 27 85 225 59 132 112 233 106 157 115 63 199 162 98 158 62 138 124 69 202 169 116 157 115 76 237 118 0 206 19 189 210 187 191 134 192 30 192 181 3 243 34 50 217 208 127 174 143 156 189 209 83 237 14 237 145 168 87 187 99 255 67 55 187 187 56 134 232 180 32 52 171 23 232 119 125 133 245 162 239 234 191 245 255 3 169 222 15 73 159 10 166 100 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:24:39'!
spinner7Contents
^  #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 22 73 68 65 84 120 94 133 147 235 110 195 32 12 133 17 212 161 152 134 150 201 171 148 174 213 222 255 45 7 216 185 0 65 243 159 224 240 225 203 193 168 198 16 189 58 55 254 175 17 53 47 218 125 135 203 17 0 116 13 32 59 251 7 218 16 17 113 7 150 226 116 33 220 10 240 186 53 200 13 48 128 24 171 179 92 177 207 121 11 224 214 86 156 147 141 168 185 145 28 66 51 153 15 70 17 37 85 132 144 87 32 205 251 37 121 30 112 107 37 197 237 170 202 219 81 31 100 106 26 135 246 72 10 88 137 235 57 105 127 23 39 174 215 108 45 0 108 90 161 88 115 125 96 196 254 7 6 41 244 150 98 80 36 244 3 83 229 8 214 84 126 150 189 186 192 171 181 243 116 84 9 27 97 224 97 173 189 134 93 231 34 251 34 81 167 231 37 37 185 37 228 46 147 206 178 231 235 14 214 134 11 209 156 125 51 91 43 99 225 183 129 49 159 143 81 51 81 201 175 205 111 55 114 5 112 47 122 170 193 208 22 64 61 136 238 234 124 236 25 80 223 244 26 60 28 1 38 162 175 14 40 79 79 0 245 67 230 252 9 175 192 208 224 253 14 245 159 63 14 38 13 186 43 109 220 91 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:24:33'!
spinner8Contents
^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 32 73 68 65 84 120 94 133 147 221 110 195 32 12 133 17 196 113 49 43 74 180 220 164 155 219 85 83 223 255 21 7 49 249 193 164 154 111 2 246 103 131 15 142 81 70 20 204 185 137 223 18 89 89 232 184 167 249 8 0 121 5 148 200 254 1 93 98 36 218 129 121 217 52 37 252 10 200 90 27 228 6 4 32 26 171 92 185 113 200 231 46 128 95 91 241 190 4 70 43 141 228 18 86 200 156 56 22 81 210 141 8 242 10 74 243 97 78 187 0 180 181 146 234 54 183 202 225 209 30 100 82 141 131 78 73 5 43 113 131 28 218 190 197 201 54 88 49 157 176 185 169 152 109 132 21 251 31 120 115 68 235 86 192 201 192 84 46 112 177 202 200 178 87 15 120 119 206 117 71 149 72 9 99 251 68 220 97 215 57 203 14 79 39 142 120 73 17 120 36 228 179 76 186 200 254 197 220 119 195 208 1 226 107 225 18 81 198 98 169 30 153 39 211 79 83 111 94 136 113 57 58 86 147 57 49 71 1 236 21 47 237 72 58 102 52 2 24 135 216 55 192 47 127 195 10 152 15 188 106 165 6 230 193 108 64 68 124 40 224 197 79 179 3 102 192 159 243 95 120 5 222 154 191 221 186 218 243 7 48 94 14 167 128 25 78 150 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:24:22'!
spinner9Contents
^  #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 32 0 0 0 32 8 3 0 0 0 68 164 138 198 0 0 3 0 80 76 84 69 255 255 255 58 60 139 249 249 251 208 208 226 236 236 243 242 242 246 217 218 232 154 155 195 176 177 208 246 246 249 234 234 242 251 251 252 170 170 204 160 161 199 231 231 240 199 199 221 180 181 210 239 239 244 191 192 217 226 227 237 105 107 166 124 125 177 131 132 182 153 154 194 186 187 214 240 240 245 114 116 172 140 142 187 67 69 144 58 60 139 216 216 231 211 211 228 223 224 235 91 93 158 130 131 181 81 82 152 116 117 173 194 194 217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 88 37 121 0 0 1 0 116 82 78 83 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 255 1 110 23 0 0 1 33 73 68 65 84 120 94 133 147 219 110 195 32 12 64 17 14 137 48 109 218 104 94 37 150 210 85 138 246 255 191 88 136 33 23 147 118 126 9 216 199 247 160 132 32 58 117 44 172 215 136 154 15 210 110 209 111 1 131 86 0 217 178 126 140 12 49 32 174 128 159 47 85 8 91 0 62 75 49 169 1 6 16 135 157 47 87 236 82 222 25 176 165 21 107 179 97 208 220 72 10 161 153 76 142 67 30 74 172 8 77 58 153 220 188 243 241 230 12 46 173 196 184 85 85 201 60 232 205 152 68 227 70 186 196 128 187 225 58 78 90 239 226 224 234 52 139 116 88 212 152 69 87 131 101 249 31 120 147 162 86 247 31 107 86 166 187 195 62 195 126 112 215 41 132 105 171 240 187 170 90 10 33 80 43 6 135 232 51 50 70 243 244 23 231 125 203 140 121 104 222 101 206 19 194 189 75 139 56 17 125 25 0 163 1 158 101 65 51 112 26 231 14 26 162 81 245 93 215 171 103 164 54 63 76 145 145 168 97 192 1 60 234 95 178 37 186 42 6 84 15 208 84 192 55 253 216 2 168 95 0 57 169 11 209 69 45 64 172 85 62 12 160 155 90 1 213 130 63 126 194 5 120 43 250 124 22 143 242 5 159 241 14 245 151 37 96 90 0 0 0 0 73 69 78 68 174 66 96 130]! !

!WaitSpinner class methodsFor: 'spinner' stamp: 'hlsf 4/21/2020 21:26:38'!
spinnerQty
	^ 12! !

!WaitSpinner class methodsFor: 'class initialization'!
formFromPNG: anArray
	^ PNGReadWriter formFromStream: anArray asByteArray readStream
! !

!WaitSpinner class methodsFor: 'class initialization' stamp: 'hlsf 8/1/2021 12:30:09'!
initialize
	spinners _ Array new: self spinnerQty.
	1 to: self spinnerQty do: [:i | |form|
		form _ self formFromPNG: (self perform: ('spinner', i asString, 'Contents') asSymbol).
		spinners at: i put: (self decorate: form)].
	isSpinnerRunning _ false! !
WaitSpinner initialize!
