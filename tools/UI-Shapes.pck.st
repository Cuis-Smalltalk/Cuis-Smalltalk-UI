'From Cuis 6.0 [latest update: #5057] on 2 February 2022 at 7:41:08 pm'!
'Description Bezier Curves et al'!
!provides: 'UI-Shapes' 1 13!
!requires: 'Morphic-MetaProperties' 1 106 nil!
!requires: 'VectorGraphics' 1 333 nil!
SystemOrganization addCategory: 'UI-Shapes'!


!classDefinition: #BezierQuadraticMorph category: 'UI-Shapes'!
PlacedMorph subclass: #BezierQuadraticMorph
	instanceVariableNames: 'lineColor lineWidth startPoint endPoint oneControlPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'BezierQuadraticMorph class' category: 'UI-Shapes'!
BezierQuadraticMorph class
	instanceVariableNames: ''!

!classDefinition: #BezierCubicMorph category: 'UI-Shapes'!
BezierQuadraticMorph subclass: #BezierCubicMorph
	instanceVariableNames: 'twoControlPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'BezierCubicMorph class' category: 'UI-Shapes'!
BezierCubicMorph class
	instanceVariableNames: ''!


!BezierQuadraticMorph commentStamp: '<historical>' prior: 0!
I present a Quadratic Bezier curve.

I have one control point.!

!BezierCubicMorph commentStamp: '<historical>' prior: 0!
I present a Cubic Bezier curve.

I have two control points.!

!BezierQuadraticMorph methodsFor: 'geometry testing' stamp: 'KenD 1/30/2022 13:01:45'!
yAxisPointsUp

	^true! !

!BezierQuadraticMorph methodsFor: 'initialization' stamp: 'KenD 1/30/2022 13:29:44'!
initialize

	"Harmless Values"
	super initialize.
	self 
		lineWidth: 6;
		lineColor: Color green;
		startPoint: -20 @ -20;
		endPoint:     50 @ -20;
		oneControlPoint: 15 @ 200! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 1/28/2022 13:29:45'!
endPoint

	^ endPoint! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 1/28/2022 13:28:07'!
endPoint: aPoint

	endPoint := aPoint! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 1/28/2022 13:30:25'!
lineColor 

	^ lineColor ! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 1/28/2022 13:30:43'!
lineColor: aColor

	lineColor := aColor! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 1/28/2022 13:31:02'!
lineWidth

	^ lineWidth! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 1/28/2022 13:31:29'!
lineWidth: positiveNumber

	lineWidth := positiveNumber ! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 1/28/2022 13:29:32'!
oneControlPoint

	^ oneControlPoint! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 1/28/2022 13:29:15'!
oneControlPoint: aPoint

	oneControlPoint := aPoint! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 1/28/2022 13:30:03'!
startPoint 

	^ startPoint ! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 1/28/2022 13:27:58'!
startPoint: aPoint

	startPoint := aPoint! !

!BezierQuadraticMorph methodsFor: 'drawing' stamp: 'KenD 1/30/2022 13:00:46'!
drawOn: aCanvas

	aCanvas strokeWidth: lineWidth color: lineColor do: [
		aCanvas 
			moveTo: startPoint;
			quadraticBezierTo: endPoint control: oneControlPoint 
	]! !

!BezierQuadraticMorph methodsFor: 'control points' stamp: 'KenD 2/2/2022 19:39:19'!
addOptionalHandlesTo: aHalo box: box
	"Control point is relative to my center.
	 Translate relative to aHalo"
	
	| haloCtlPt |
	haloCtlPt := aHalo internalizeFromWorld: self controlPointOneInWorld.
	(aHalo addControlHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doControlOne:with: .
		
	haloCtlPt := aHalo internalizeFromWorld: self startPointInWorld.
	(aHalo addPointHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doStartPoint:with: .
		
	haloCtlPt := aHalo internalizeFromWorld: self endPointInWorld.
	(aHalo addPointHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doEndPoint:with: .! !

!BezierQuadraticMorph methodsFor: 'control points' stamp: 'KenD 1/31/2022 14:52:41'!
controlPointOneInWorld
	"Answer control point one in World coordinates."

	^ self externalizeToWorld: oneControlPoint ! !

!BezierQuadraticMorph methodsFor: 'control points' stamp: 'KenD 1/31/2022 14:53:48'!
endPointInWorld
	"Answer end point in World coordinates."

	^ self externalizeToWorld: endPoint! !

!BezierQuadraticMorph methodsFor: 'control points' stamp: 'KenD 1/31/2022 14:54:09'!
startPointInWorld
	"Answer start point in World coordinates."

	^ self externalizeToWorld: startPoint! !

!BezierQuadraticMorph class methodsFor: 'class initialization' stamp: 'KenD 1/28/2022 13:47:38'!
initialize
	
	(Smalltalk includesKey: #MetaProperty )
		ifTrue: [ self initializeMetaProperties ].
	! !

!BezierQuadraticMorph class methodsFor: 'class initialization' stamp: 'KenD 1/31/2022 11:32:09'!
initializeMetaProperties
"
	Bezier1Morph initializeMetaProperties.
"
	| classDict propsDict |
	"Ensure named MetaProperties exist"
	MetaProperty initializeDictionaries.

	"Seed MetaProperties for known Morphs"
	propsDict := MetaProperty preDefinedPropsDict.
	
	classDict := MetaProperty metaPropsDictForClass: BezierQuadraticMorph.
	classDict at: #startPoint put: (propsDict at: #acceptsPoint). 
	classDict at: #endPoint put: (propsDict at: #acceptsPoint). 
	classDict at: #oneControlPoint put: (propsDict at: #acceptsPoint). 
	classDict at: #lineWidth put: (propsDict at: #acceptsPositiveNumber). 
	classDict at: #lineColor put: (propsDict at: #acceptsColor). 


	! !

!BezierCubicMorph methodsFor: 'drawing' stamp: 'KenD 1/30/2022 14:55:18'!
drawOn: aCanvas

	aCanvas strokeWidth: lineWidth color: lineColor do: [
		aCanvas 
			moveTo: startPoint;
			cubicBezierTo: endPoint 
				control1: oneControlPoint 
				control2: twoControlPoint 
	]! !

!BezierCubicMorph methodsFor: 'initialization' stamp: 'KenD 1/30/2022 14:59:51'!
initialize

	super initialize.
	self 
		lineColor: Color yellow ;
		oneControlPoint: 228@75 ;
		twoControlPoint: 25 @ 160.! !

!BezierCubicMorph methodsFor: 'accessing' stamp: 'KenD 1/30/2022 14:41:44'!
twoControlPoint

	^ twoControlPoint ! !

!BezierCubicMorph methodsFor: 'accessing' stamp: 'KenD 1/30/2022 14:41:38'!
twoControlPoint: aPoint

	twoControlPoint := aPoint ! !

!BezierCubicMorph methodsFor: 'control points' stamp: 'KenD 1/30/2022 15:07:09'!
addOptionalHandlesTo: aHalo box: box
	"Control point is relative to my center.
	 Translate relative to aHalo"
	
	| haloCtlPt |
	haloCtlPt := self controlPointTwoInWorld 
				- aHalo morphPositionInWorld.

	super addOptionalHandlesTo:  aHalo box: box.
	
	(aHalo addControlHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doControlTwo:with: .! !

!BezierCubicMorph methodsFor: 'control points' stamp: 'KenD 1/31/2022 14:55:49'!
controlPointTwoInWorld
	"Answer control point one in World coordinates"

	^self externalizeToWorld: twoControlPoint ! !

!BezierCubicMorph class methodsFor: 'class initialization' stamp: 'KenD 1/30/2022 14:55:53'!
initialize
	
	(Smalltalk includesKey: #MetaProperty )
		ifTrue: [ self initializeMetaProperties ].
	! !

!BezierCubicMorph class methodsFor: 'class initialization' stamp: 'KenD 1/31/2022 11:32:47'!
initializeMetaProperties
"
	Bezier2Morph initializeMetaProperties.
"
	| classDict propsDict |
	"Ensure named MetaProperties exist"
	MetaProperty initializeDictionaries.

	"Seed MetaProperties for known Morphs"
	propsDict := MetaProperty preDefinedPropsDict.
	
	classDict := MetaProperty metaPropsDictForClass: BezierCubicMorph. 
	"Note that MetaProperties are inherited.."
	classDict at: #twoControlPoint put: (propsDict at: #acceptsPoint).  


	! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 1/29/2022 16:40:25'!
addControlHandle: aPoint
	"Add a handle for the control point and return the handle."

	| handle  colorToUse form icon e |
	colorToUse _ Color green. "@@parameterize by theme@@"
	handle _ HaloHandleMorph new color: colorToUse.
	self addMorph: handle.
	e _ Preferences haloHandleSize asPoint.
	handle morphPosition: aPoint-(e//2) extent: e.
	form _ self class haloTargetIcon.
	(form extent = e) ifFalse: [ 
		form _ form  "Be as smooth as possible, these images are small."
				magnify: form boundingBox
				to: e
				smoothing: 2 
	].
	icon _ ImageMorph new
				image: form;
				color: colorToUse makeForegroundColor;
				lock.
	^handle 
		addMorphFront: icon position: `0@0`;
		mouseUpSelector: #endInteraction;
		setBalloonText: 'Shape control point';
		yourself
! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 1/30/2022 16:04:05'!
addPointHandle: aPoint
	"Add a handle for the control point and return the handle."

	| handle  colorToUse form icon e |
	colorToUse _ Color green. "@@parameterize by theme@@"
	handle _ HaloHandleMorph new color: colorToUse.
	self addMorph: handle.
	e _ Preferences haloHandleSize asPoint.
	handle morphPosition: aPoint-(e//2) extent: e.
	form _ self class haloPointIcon.
	(form extent = e) ifFalse: [ 
		form _ form  "Be as smooth as possible, these images are small."
				magnify: form boundingBox
				to: e
				smoothing: 2 
	].
	icon _ ImageMorph new
				image: form;
				color: colorToUse makeForegroundColor;
				lock.
	^handle 
		addMorphFront: icon position: `0@0`;
		mouseUpSelector: #endInteraction;
		setBalloonText: 'Shape control point';
		yourself
! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'jmv 2/2/2022 19:58:51'!
doControlOne: evt with: controlPointHandle
	"Enable Target Morph to follow control point one."

	evt hand obtainHalo: self.	
	
	self target oneControlPoint: (self target internalizeFromWorld: evt eventPosition).
	"Track the hand"
	controlPointHandle 
		morphPositionInWorld: evt eventPosition 
					- (controlPointHandle morphExtent // 2).	
	self redrawNeeded.! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'jmv 2/2/2022 19:59:16'!
doControlTwo: evt with: controlPointHandle
	"Enable Target Morph to follow control point one."

	evt hand obtainHalo: self.	

	self target twoControlPoint: (self target internalizeFromWorld: evt eventPosition).
	"Track the hand"
	controlPointHandle 
		morphPositionInWorld: evt eventPosition 
					- (controlPointHandle morphExtent // 2).	
	self redrawNeeded.! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'jmv 2/2/2022 19:59:33'!
doEndPoint: evt with: controlPointHandle
	"Enable Target Morph to follow control point one."

	evt hand obtainHalo: self.	
	
	self target endPoint: (self target internalizeFromWorld: evt eventPosition).
	"Track the hand"
	controlPointHandle 
		morphPositionInWorld: evt eventPosition 
					- (controlPointHandle morphExtent // 2).	
	self redrawNeeded.! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'jmv 2/2/2022 19:57:35'!
doStartPoint: evt with: controlPointHandle
	"Enable Target Morph to follow control point one."

	evt hand obtainHalo: self.	

	self target startPoint: (self target internalizeFromWorld: evt eventPosition).
	"Track the hand"
	controlPointHandle 
		morphPositionInWorld: evt eventPosition 
					- (controlPointHandle morphExtent // 2).	
	self redrawNeeded.! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 1/30/2022 15:07:17'!
startControlPoint: evt with: controlPointHandle
	"Initialize control point target."

	"Make sure the event's hand correlates with the receiver"
	evt hand obtainHalo: self.	
	"remove all other handles"
	self removeAllHandlesBut: controlPointHandle.  

! !

!HaloMorph class methodsFor: '*ui-shapes' stamp: 'KenD 1/30/2022 15:28:52'!
haloPointIcon

	^ self icons
		at: #haloPointIcon
		ifAbsentPut: [ VisualPropertyMenuItem pointIcon ]! !

!HaloMorph class methodsFor: '*ui-shapes' stamp: 'KenD 1/30/2022 15:29:09'!
haloTargetIcon

	^ self icons
		at: #haloTargetIcon
		ifAbsentPut: [ VisualPropertyMenuItem targetIcon ]! !
BezierQuadraticMorph initialize!
BezierCubicMorph initialize!
