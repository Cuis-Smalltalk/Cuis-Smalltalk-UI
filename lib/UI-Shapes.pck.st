'From Cuis7.9 [latest update: #8296] on 28 October 2026 at 2:29:26 pm'!
'Description Various Vector Graphic Morph Examples'!
!provides: 'UI-Shapes' '1.48.0'!
!requires: 'UI-Core' '1.11.0' '1.*.*'!
SystemOrganization addCategory: #'UI-Shapes'!


!classDefinition: #EllipseMorph category: #'UI-Shapes'!
BorderedBoxMorph subclass: #EllipseMorph
	instanceVariableNames: 'borderStyle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'EllipseMorph class' category: #'UI-Shapes'!
EllipseMorph class
	instanceVariableNames: ''!

!classDefinition: #PointerLineMorph category: #'UI-Shapes'!
LineMorph subclass: #PointerLineMorph
	instanceVariableNames: 'endPointMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'PointerLineMorph class' category: #'UI-Shapes'!
PointerLineMorph class
	instanceVariableNames: ''!

!classDefinition: #ArrowMorph category: #'UI-Shapes'!
PlacedMorph subclass: #ArrowMorph
	instanceVariableNames: 'tipPoint headLength tailLength tailHeight borderColor borderWidth fillColor headWingLength'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'ArrowMorph class' category: #'UI-Shapes'!
ArrowMorph class
	instanceVariableNames: ''!

!classDefinition: #BezierQuadraticMorph category: #'UI-Shapes'!
PlacedMorph subclass: #BezierQuadraticMorph
	instanceVariableNames: 'lineColor lineWidth startPoint endPoint oneControlPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'BezierQuadraticMorph class' category: #'UI-Shapes'!
BezierQuadraticMorph class
	instanceVariableNames: ''!

!classDefinition: #BezierCubicMorph category: #'UI-Shapes'!
BezierQuadraticMorph subclass: #BezierCubicMorph
	instanceVariableNames: 'twoControlPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'BezierCubicMorph class' category: #'UI-Shapes'!
BezierCubicMorph class
	instanceVariableNames: ''!

!classDefinition: #CircleShapeMorph category: #'UI-Shapes'!
PlacedMorph subclass: #CircleShapeMorph
	instanceVariableNames: 'center radius fillColor lineColor lineWidth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'CircleShapeMorph class' category: #'UI-Shapes'!
CircleShapeMorph class
	instanceVariableNames: ''!

!classDefinition: #CurvedArrow category: #'UI-Shapes'!
PlacedMorph subclass: #CurvedArrow
	instanceVariableNames: 'points strokeWidth color dashedStrokeBits dashBitLength dashOffset'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'CurvedArrow class' category: #'UI-Shapes'!
CurvedArrow class
	instanceVariableNames: ''!

!classDefinition: #LineShapeMorph category: #'UI-Shapes'!
PlacedMorph subclass: #LineShapeMorph
	instanceVariableNames: 'startPoint endPoint lineColor lineWidth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'LineShapeMorph class' category: #'UI-Shapes'!
LineShapeMorph class
	instanceVariableNames: ''!

!classDefinition: #RectangleShapeMorph category: #'UI-Shapes'!
PlacedMorph subclass: #RectangleShapeMorph
	instanceVariableNames: 'origin corner fillColor lineColor lineWidth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Shapes'!
!classDefinition: 'RectangleShapeMorph class' category: #'UI-Shapes'!
RectangleShapeMorph class
	instanceVariableNames: ''!


!EllipseMorph commentStamp: '<historical>' prior: 0!
A round bordered Morph. Supports borderWidth and borderColor. 

EllipseMorph new borderWidth:10; borderColor: Color green; openInWorld.
!

!PointerLineMorph commentStamp: '<historical>' prior: 0!
I am a LineMorph which has a "pointer" morph which I maintain in position at my endpoint.!

!ArrowMorph commentStamp: '<historical>' prior: 0!
I am a vector graphic arrow. Rotate and scale me.

ArrowMorph new openInWorld.
(ArrowMorph label: 'Me Be Arrow') openInWorld.
ArrowMorph exampleClickMe.

          Wing -->  | \
     ---------   \
     |                           \   Tip
     |                           / 
     ---------   /
                            | /
          Tail            Head!

!BezierQuadraticMorph commentStamp: '<historical>' prior: 0!
I present a Quadratic Bezier curve.

I have one control point.!

!BezierCubicMorph commentStamp: '<historical>' prior: 0!
I present a Cubic Bezier curve.

I have two control points.!

!CircleShapeMorph commentStamp: '<historical>' prior: 0!
I present a vector-based Circle!

!LineShapeMorph commentStamp: '<historical>' prior: 0!
I present a vector-graphic line!

!RectangleShapeMorph commentStamp: '<historical>' prior: 0!
I present a vector-graphic rectangle

To move my sides:
  Control point one is rightCenter
  Control point two is bottomCenter!

!EllipseMorph methodsFor: 'visual properties' stamp: 'KenD 31/Dec/2021, 8:07:32 pm (UTC)'!
borderStyle

	^ borderStyle! !

!EllipseMorph methodsFor: 'visual properties' stamp: 'KenD 31/Dec/2021, 8:08:14 pm (UTC)'!
borderStyle: aSymbol

	( #(simple raised inset) includes: aSymbol )
		ifFalse: [ self error: 'Border Style must be one of #simple #raised or #inset; got: ', aSymbol printString ].
		
	borderStyle := aSymbol! !

!EllipseMorph methodsFor: 'visual properties' stamp: 'jmv 11/Mar/2018, 5:24:29 am (UTC)'!
defaultColor
	"Return the default fill style for the receiver"
	^ `Color yellow`! !

!EllipseMorph methodsFor: 'drawing' stamp: 'hlsf 16/Dec/2021, 4:38:39 pm (UTC)'!
drawOn: aCanvas 
	| radius |
	radius _ extent // 2.
	aCanvas ellipseCenter: radius radius: radius borderWidth: borderWidth borderColor: borderColor fillColor: color! !

!EllipseMorph methodsFor: 'drawing' stamp: 'KenD 19/Jul/2023, 6:18:40 pm (UTC)'!
requiresVectorCanvas

	^true! !

!EllipseMorph methodsFor: 'geometry testing' stamp: 'jmv 8/Oct/2009, 6:21:00 am (UTC)'!
isOrthoRectangularMorph
	^false! !

!EllipseMorph methodsFor: 'geometry testing' stamp: 'KenD 9/Feb/2022, 12:32:49 am (UTC)'!
knowsOwnLocalBounds

	^false! !

!EllipseMorph methodsFor: 'geometry testing' stamp: 'pb 3/Sep/2024, 2:44:24 am (UTC)'!
morphContainsPoint: aLocalPoint

	| radius other delta xOverY |
	(self localBounds containsPoint: aLocalPoint) ifFalse: [^ false].  "quick elimination"
	extent > `1@1`
		ifFalse: [^ true].  "Degenerate case -- code below fails by a bit"

	radius := extent y asFloat / 2.
	other := extent x asFloat / 2.
	delta := aLocalPoint - (other@radius).
	xOverY := extent x asFloat / extent y asFloat.
	^ (delta x asFloat / xOverY) squared + delta y squared <= radius squared! !

!EllipseMorph methodsFor: 'initialization' stamp: 'dgd 15/Feb/2003, 5:37:00 am (UTC)'!
defaultBorderWidth
	"answer the default border width for the receiver"
	^ 1! !

!EllipseMorph class methodsFor: 'new-morph participation' stamp: 'pb 9/Jun/2017, 6:50:14 am (UTC)'!
categoryInNewMorphMenu
	^ 'Basic'! !

!EllipseMorph class methodsFor: 'examples' stamp: 'KenD 20/Dec/2021, 5:57:45 pm (UTC)'!
example1
"
  EllipseMorph example1 openInWorld 
"
	^ self new morphExtent: 50@20! !

!EllipseMorph class methodsFor: 'examples' stamp: 'KenD 20/Dec/2021, 5:58:03 pm (UTC)'!
example2
"
  EllipseMorph example2 openInWorld 
"
	^ self new morphExtent: 50@80;
		borderWidth: 4;
		borderColor: Color red muchDarker;
		color: Color red;
		morphPosition: 0@0! !

!PointerLineMorph methodsFor: 'geometry' stamp: 'KenD 15/Sep/2016, 11:28:43 pm (UTC)'!
morphExtent: newExtent

	super morphExtent: newExtent.
	self updateEndPoint.! !

!PointerLineMorph methodsFor: 'geometry' stamp: 'KenD 12/Dec/2016, 10:21:19 pm (UTC)'!
setPointSelectorsFromStartPoint: startPoint endPoint: endPoint

	super setPointSelectorsFromStartPoint: startPoint endPoint: endPoint.
	self updateEndPoint ! !

!PointerLineMorph methodsFor: 'geometry' stamp: 'KenD 19/Dec/2021, 3:17:41 pm (UTC)'!
submorphsMightProtrude
	"My pointer morph sticks out"
	
	^ true! !

!PointerLineMorph methodsFor: 'geometry' stamp: 'KenD 3/Sep/2024, 2:45:01 am (UTC)'!
updateEndPoint
	"Place my pointer morph at my endpoint, centered"
	
	| pointMorphCenter endPointOffset |
	pointMorphCenter := (self endPointMorph extentInOwner) / 2.
	endPointOffset := (self rect perform: endPointSelector) + (self lineWidth / 2).
	self endPointMorph morphPosition: endPointOffset - pointMorphCenter.! !

!PointerLineMorph methodsFor: 'initialization' stamp: 'KenD 15/Sep/2016, 11:40:58 pm (UTC)'!
initialize

	super initialize.
	self endPointMorph:
		(BorderedBoxMorph new 
			:: color: Color yellow; 
			borderColor: Color red; 
			borderWidth: 3; 
			morphExtent: 16@16; 
			yourself).
	self updateEndPoint.! !

!PointerLineMorph methodsFor: 'accessing' stamp: 'KenD 15/Sep/2016, 11:25:30 pm (UTC)'!
endPointMorph
	
	^ endPointMorph! !

!PointerLineMorph methodsFor: 'accessing' stamp: 'KenD 25/Jan/2026, 10:24:41 pm (UTC)'!
endPointMorph: aMorph
	
	| newMorph |
	(aMorph is: #Form)
		ifTrue: [newMorph := ImageMorph newWith: aMorph ]
		ifFalse: [newMorph :=  aMorph ].
	self endPointMorph ifNotNil: [ :pointer | self removeMorph: pointer ].
	endPointMorph := newMorph.
	self addMorphFront: newMorph.
	self updateEndPoint.
! !

!PointerLineMorph class methodsFor: 'instance creation' stamp: 'KenD 16/Sep/2016, 12:37:25 am (UTC)'!
initializedInstance

	| newInst |
	newInst  := super initializedInstance.
	newInst updateEndPoint.
	^newInst! !

!PointerLineMorph class methodsFor: 'examples' stamp: 'KenD 20/Dec/2021, 6:40:31 pm (UTC)'!
example1
"
  PointerLineMorph example1 openInWorld 
"
	^ super example1! !

!ArrowMorph methodsFor: 'geometry testing' stamp: 'KenD 10/Jun/2024, 8:47:47 pm (UTC)'!
minimumExtent
	"This returns the minimum extent that the morph may be shrunk to.
	It is expressed in the morph own coordinates, like morphExtent."

	^ `20@20`! !

!ArrowMorph methodsFor: 'geometry testing' stamp: 'KenD 17/May/2023, 3:36:29 am (UTC)'!
yAxisPointsUp

	^ true! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 10:03:17 pm (UTC)'!
defaultBorderColor

	^ Color yellow! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 10:03:37 pm (UTC)'!
defaultBorderWidth

	^ 2! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 9:47:39 pm (UTC)'!
defaultColor

	^ Color yellow! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 11:06:15 pm (UTC)'!
defaultFillColor

	^ Color green! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 9:49:03 pm (UTC)'!
defaultHeadHeight

	^ 2 + self defaultTailHeight! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 9:50:47 pm (UTC)'!
defaultHeadLength

	^ 3! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 9:57:53 pm (UTC)'!
defaultHeadSholder

	^ 2 ! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 10:02:20 pm (UTC)'!
defaultHeadWingLength
	"Answer how far the arrow head extends from the tail height"
	^ 2 ! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 9:48:30 pm (UTC)'!
defaultTailHeight

	^ 2! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 9:48:13 pm (UTC)'!
defaultTailLength

	^ 5! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 17/May/2023, 2:24:51 pm (UTC)'!
defaultTipPoint
	"Arrow points to the right, so tip is at right end"
	
	^ 0@0! !

!ArrowMorph methodsFor: 'initialization' stamp: 'KenD 16/May/2023, 11:06:15 pm (UTC)'!
initialize

	| patternScale |
	patternScale := 6.  "scale the pattern"
	super initialize.
	tailLength := patternScale * self defaultTailLength.
	tailHeight  := patternScale * self defaultTailHeight.
	headLength  := patternScale * self defaultHeadLength.
	headWingLength := patternScale * self defaultHeadWingLength.
	tipPoint := self defaultTipPoint.
	borderColor := self defaultBorderColor.
	borderWidth := self defaultBorderWidth.
	fillColor := self defaultFillColor.! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 16/May/2023, 11:27:45 pm (UTC)'!
borderColor

	^ borderColor! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 17/May/2023, 3:33:42 am (UTC)'!
borderColor: newColor

	borderColor := newColor.
	self redrawNeeded! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 17/May/2023, 2:41:56 pm (UTC)'!
borderWidth

	^ borderWidth! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 17/May/2023, 2:41:47 pm (UTC)'!
borderWidth: newWidth

	borderWidth := newWidth.
	self redrawNeeded! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 16/May/2023, 11:28:37 pm (UTC)'!
fillColor

	^ fillColor! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 17/May/2023, 3:33:53 am (UTC)'!
fillColor: newColor

	fillColor := newColor.
	self redrawNeeded! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 16/May/2023, 10:00:53 pm (UTC)'!
headHeight

	^ (2 * headWingLength) + tailHeight! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 16/May/2023, 11:24:41 pm (UTC)'!
headLength

	^ headLength! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 17/May/2023, 3:32:26 am (UTC)'!
headLength: newLength

	headLength := newLength.
	self redrawNeeded! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 16/May/2023, 11:27:12 pm (UTC)'!
headWingLength
	"The arrow head extends from the tail height by this amount in either direction"
	
	^ headWingLength! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 17/May/2023, 3:32:14 am (UTC)'!
headWingLength: newLength

	"The arrow head extends from the tail height by this amount in either direction"
	headWingLength := newLength.
	self redrawNeeded! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 16/May/2023, 10:05:48 pm (UTC)'!
height

	^ tailHeight + (2 * headWingLength)! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 16/May/2023, 10:05:11 pm (UTC)'!
length

	^ headLength + tailLength! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 17/May/2023, 2:42:31 pm (UTC)'!
tailHeight

	^ tailHeight! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 17/May/2023, 2:42:54 pm (UTC)'!
tailHeight: newHeight

	tailHeight := newHeight.
	self redrawNeeded! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 16/May/2023, 11:25:37 pm (UTC)'!
tailLength

	^ tailLength! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 17/May/2023, 3:32:01 am (UTC)'!
tailLength: newLength

	tailLength := newLength.
	self redrawNeeded! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 16/May/2023, 9:47:09 pm (UTC)'!
tipPoint
	"Answer point at the tip of me".
	
	^ tipPoint ! !

!ArrowMorph methodsFor: 'accessing' stamp: 'KenD 17/May/2023, 3:34:32 am (UTC)'!
tipPoint:  aPoint

	tipPoint := aPoint.
	self redrawNeeded ! !

!ArrowMorph methodsFor: 'drawing' stamp: 'KenD 16/May/2023, 11:18:14 pm (UTC)'!
drawOn: aCanvas
	"Draw me an Arrow"
	| p1 p2 p3 p4 p5 p6 |
	p1 := tipPoint - (headLength @ (headWingLength + (tailHeight / 2))).
	p2 := p1 + (0 @ headWingLength).
	p3 := p2 - (tailLength @ 0).
	p4 := p3 + (0 @ tailHeight).
	p5 := p4 + (tailLength @ 0).
	p6 := p5 + (0 @ headWingLength).
	
	aCanvas strokeWidth: borderWidth color: borderColor fillColor: fillColor do: [
		aCanvas
			pathSequence: {
				0. (tipPoint x). (tipPoint y).
				1. (p1 x). (p1 y).
				1. (p2 x). (p2 y).
				1. (p3 x). (p3 y).
				1. (p4 x). (p4 y).
				1. (p5 x). (p5 y).
				1. (p6 x). (p6 y).
				1. (tipPoint x). (tipPoint y).
				} asFloat32Array .
		].! !

!ArrowMorph methodsFor: 'geometry' stamp: 'KenD 16/May/2023, 10:11:07 pm (UTC)'!
rotationCenter

	^ tipPoint! !

!ArrowMorph methodsFor: 'private' stamp: 'KenD 17/May/2023, 5:09:43 pm (UTC)'!
boxExtent
	"Answer the extent to offset a label. See ArrowMorph>>labelMorph: " 
	 
	| e |
	e := (Preferences at: #windowTitleFont) lineSpacing.
	^e@e! !

!ArrowMorph class methodsFor: 'instance creation' stamp: 'KenD 17/May/2023, 5:34:15 pm (UTC)'!
label: aString
	| newSelf embeddedLabel desiredLabelExtent |
	newSelf := self new.
	embeddedLabel := LabelMorph contents: aString.
	desiredLabelExtent := embeddedLabel minimumExtent.
	"fit it"
	newSelf tailHeight: (newSelf tailHeight max: 10 + desiredLabelExtent y).
	newSelf tailLength: (newSelf tailLength max: desiredLabelExtent x).
	newSelf   addMorphFront: embeddedLabel 
			position: (newSelf headLength + desiredLabelExtent x - 6) negated 
						@ ((desiredLabelExtent y) / 2 - 1) .
	^ newSelf
	
	! !

!ArrowMorph class methodsFor: 'examples' stamp: 'KenD 17/May/2023, 5:31:25 pm (UTC)'!
exampleClickMe
"      Create and show an ArrowMorph which reacts to a mouse click.

	ArrowMorph exampleClickMe.
"
	| newSelf |
	newSelf := self label: 'Click Me!!'.
	newSelf setProperty: #'handlesMouseDown:' toValue: true.
	newSelf setProperty: #mouseButton1Up:localPosition: 
		      toValue: [ :ignoreEvent :ignoredPosition | 
					newSelf flash. 
					newSelf inform: 'Thanks!!!!'.
					newSelf flash. 
			].
	newSelf openInWorld.
	^ newSelf! !

!BezierQuadraticMorph methodsFor: 'geometry testing' stamp: 'KenD 9/Feb/2022, 12:33:40 am (UTC)'!
knowsOwnLocalBounds

	^false! !

!BezierQuadraticMorph methodsFor: 'geometry testing' stamp: 'KenD 10/Jul/2024, 9:01:25 pm (UTC)'!
minimumExtent
	"This returns the minimum extent that the morph may be shrunk to.
	It is expressed in the morph own coordinates, like morphExtent."

	^ `20@20`! !

!BezierQuadraticMorph methodsFor: 'geometry testing' stamp: 'KenD 30/Jan/2022, 8:01:45 pm (UTC)'!
yAxisPointsUp

	^true! !

!BezierQuadraticMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 9:44:11 pm (UTC)'!
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

!BezierQuadraticMorph methodsFor: 'control points' stamp: 'KenD 31/Jan/2022, 9:52:41 pm (UTC)'!
controlPointOneInWorld
	"Answer control point one in World coordinates."

	^ self externalizeToWorld: oneControlPoint ! !

!BezierQuadraticMorph methodsFor: 'control points' stamp: 'KenD 31/Jan/2022, 9:53:48 pm (UTC)'!
endPointInWorld
	"Answer end point in World coordinates."

	^ self externalizeToWorld: endPoint! !

!BezierQuadraticMorph methodsFor: 'control points' stamp: 'KenD 31/Jan/2022, 9:54:09 pm (UTC)'!
startPointInWorld
	"Answer start point in World coordinates."

	^ self externalizeToWorld: startPoint! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 28/Jan/2022, 8:29:45 pm (UTC)'!
endPoint

	^ endPoint! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 28/Jan/2022, 8:28:07 pm (UTC)'!
endPoint: aPoint

	endPoint := aPoint! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 28/Jan/2022, 8:30:25 pm (UTC)'!
lineColor 

	^ lineColor ! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 28/Jan/2022, 8:30:43 pm (UTC)'!
lineColor: aColor

	lineColor := aColor! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 28/Jan/2022, 8:31:02 pm (UTC)'!
lineWidth

	^ lineWidth! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 28/Jan/2022, 8:31:29 pm (UTC)'!
lineWidth: positiveNumber

	lineWidth := positiveNumber ! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 28/Jan/2022, 8:29:32 pm (UTC)'!
oneControlPoint

	^ oneControlPoint! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 28/Jan/2022, 8:29:15 pm (UTC)'!
oneControlPoint: aPoint

	oneControlPoint := aPoint! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 28/Jan/2022, 8:30:03 pm (UTC)'!
startPoint 

	^ startPoint ! !

!BezierQuadraticMorph methodsFor: 'accessing' stamp: 'KenD 28/Jan/2022, 8:27:58 pm (UTC)'!
startPoint: aPoint

	startPoint := aPoint! !

!BezierQuadraticMorph methodsFor: 'drawing' stamp: 'KenD 30/Jan/2022, 8:00:46 pm (UTC)'!
drawOn: aCanvas

	aCanvas strokeWidth: lineWidth color: lineColor do: [
		aCanvas 
			moveTo: startPoint;
			quadraticBezierTo: endPoint control: oneControlPoint 
	]! !

!BezierQuadraticMorph methodsFor: 'initialization' stamp: 'KenD 5/Feb/2022, 9:08:52 pm (UTC)'!
initialize

	"Harmless Values"
	super initialize.
	self 
		lineWidth: 6;
		lineColor: Color green;
		startPoint: -20 @ -20;
		endPoint:     50 @ -120;
		oneControlPoint: 15 @ 200! !

!BezierQuadraticMorph class methodsFor: 'examples' stamp: 'hlsf 6/Feb/2022, 10:30:56 pm (UTC)'!
example1
"
	self example1 openInWorld
"
	^ self new! !

!BezierQuadraticMorph class methodsFor: 'examples' stamp: 'hlsf 6/Feb/2022, 10:36:54 pm (UTC)'!
example2
"
	self example2 openInWorld
"
	^ self new ::
		lineWidth: 6;
		lineColor: Color orange;
		startPoint: 0 @ 0;
		endPoint:     100 @ 100;
		oneControlPoint: 100 @ 0! !

!BezierCubicMorph methodsFor: 'accessing' stamp: 'KenD 30/Jan/2022, 9:41:44 pm (UTC)'!
twoControlPoint

	^ twoControlPoint ! !

!BezierCubicMorph methodsFor: 'accessing' stamp: 'KenD 30/Jan/2022, 9:41:38 pm (UTC)'!
twoControlPoint: aPoint

	twoControlPoint := aPoint ! !

!BezierCubicMorph methodsFor: 'initialization' stamp: 'KenD 30/Jan/2022, 9:59:51 pm (UTC)'!
initialize

	super initialize.
	self 
		lineColor: Color yellow ;
		oneControlPoint: 228@75 ;
		twoControlPoint: 25 @ 160.! !

!BezierCubicMorph methodsFor: 'drawing' stamp: 'KenD 30/Jan/2022, 9:55:18 pm (UTC)'!
drawOn: aCanvas

	aCanvas strokeWidth: lineWidth color: lineColor do: [
		aCanvas 
			moveTo: startPoint;
			cubicBezierTo: endPoint 
				control1: oneControlPoint 
				control2: twoControlPoint 
	]! !

!BezierCubicMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 9:44:28 pm (UTC)'!
addOptionalHandlesTo: aHalo box: box
	"Control point is relative to my center.
	 Translate relative to aHalo"
	
	| haloCtlPt |
	haloCtlPt := aHalo internalizeFromWorld: self controlPointTwoInWorld.

	super addOptionalHandlesTo:  aHalo box: box.
	
	(aHalo addControlHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doControlTwo:with: .! !

!BezierCubicMorph methodsFor: 'control points' stamp: 'KenD 31/Jan/2022, 9:55:49 pm (UTC)'!
controlPointTwoInWorld
	"Answer control point one in World coordinates"

	^self externalizeToWorld: twoControlPoint ! !

!BezierCubicMorph class methodsFor: 'examples' stamp: 'hlsf 6/Feb/2022, 10:35:51 pm (UTC)'!
example1
"
	self example1 openInWorld
"
	^ self new! !

!BezierCubicMorph class methodsFor: 'examples' stamp: 'hlsf 6/Feb/2022, 10:37:48 pm (UTC)'!
example2
"
	self example2 openInWorld
"
	^ self new ::
		lineWidth: 6;
		lineColor: Color orange;
		startPoint: 0 @ 0;
		endPoint:     100 @ 100;
		oneControlPoint: 50 @ 0;
		twoControlPoint: 100 @ 50! !

!BezierCubicMorph class methodsFor: 'examples' stamp: 'hlsf 6/Feb/2022, 10:38:34 pm (UTC)'!
example3
"
	self example3 openInWorld
"
	^ self new ::
		lineWidth: 6;
		lineColor: Color orange;
		startPoint: 0 @ 0;
		endPoint:     100 @ 100;
		oneControlPoint: 100 @ 0;
		twoControlPoint: 100 @ 0! !

!CircleShapeMorph methodsFor: 'geometry testing' stamp: 'KenD 9/Feb/2022, 12:34:53 am (UTC)'!
knowsOwnLocalBounds

	^false! !

!CircleShapeMorph methodsFor: 'geometry testing' stamp: 'KenD 10/Jun/2024, 8:46:10 pm (UTC)'!
minimumExtent
	"This returns the minimum extent that the morph may be shrunk to.
	It is expressed in the morph own coordinates, like morphExtent."

	^ `20@20`! !

!CircleShapeMorph methodsFor: 'control points' stamp: 'KenD 19/Jul/2023, 7:35:26 pm (UTC)'!
addOptionalHandlesTo: aHalo box: box
	"Control point is relative to my center.
	 Translate relative to aHalo"
	
	| haloCtlPt |
	haloCtlPt := aHalo internalizeFromWorld: self startPointInWorld.
	(aHalo addPointHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doStartPoint:with: .

	haloCtlPt := aHalo internalizeFromWorld: self controlPointOneInWorld.
	(aHalo addHorizLineHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doControlOne:with: .
		

		
! !

!CircleShapeMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 8:50:49 pm (UTC)'!
controlPointOneInWorld
	"Answer radius control point in World coordinates."

	^ self externalizeToWorld: self oneControlPoint ! !

!CircleShapeMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 8:47:54 pm (UTC)'!
oneControlPoint
	"Answer radius control at 90 drgrees."

	^ (center x + radius) @ (center y) ! !

!CircleShapeMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 8:47:22 pm (UTC)'!
oneControlPoint: aPoint
	"Set radius from x"

	radius := aPoint x - center x! !

!CircleShapeMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 8:48:41 pm (UTC)'!
startPoint

	^ center! !

!CircleShapeMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 8:48:57 pm (UTC)'!
startPoint: aPoint

	center := aPoint! !

!CircleShapeMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 8:44:23 pm (UTC)'!
startPointInWorld
	"Answer start point in World coordinates."

	^ self externalizeToWorld: center! !

!CircleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:41:06 pm (UTC)'!
center

	^center! !

!CircleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:41:22 pm (UTC)'!
center: aPoint

	center := aPoint! !

!CircleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:42:51 pm (UTC)'!
fillColor

	^ fillColor! !

!CircleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:42:57 pm (UTC)'!
fillColor: aColor

	fillColor := aColor! !

!CircleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:43:03 pm (UTC)'!
lineColor

	^ lineColor ! !

!CircleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:43:09 pm (UTC)'!
lineColor: aColor

	lineColor := aColor! !

!CircleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:43:15 pm (UTC)'!
lineWidth

	^ lineWidth ! !

!CircleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:43:22 pm (UTC)'!
lineWidth: posiriveNumber

	lineWidth := posiriveNumber! !

!CircleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:41:42 pm (UTC)'!
radius

	^radius ! !

!CircleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:42:24 pm (UTC)'!
radius: aPositiveDistance

	radius := aPositiveDistance! !

!CircleShapeMorph methodsFor: 'drawing' stamp: 'KenD 5/Feb/2022, 8:59:25 pm (UTC)'!
drawOn: aCanvas
 
	aCanvas 
		strokeWidth: lineWidth 
		color: lineColor 
		fillColor: fillColor do: [
			aCanvas circleCenter: center radius: radius
	]! !

!CircleShapeMorph methodsFor: 'initialization' stamp: 'KenD 5/Feb/2022, 9:10:25 pm (UTC)'!
initialize

	super initialize.
	lineColor := Color red.
	fillColor := lineColor alpha: 0.4.
	lineWidth := 6.
	center := 0@0.
	radius := 80.! !

!CircleShapeMorph methodsFor: 'geometry' stamp: 'KenD 8/Feb/2022, 8:12:13 pm (UTC)'!
rotationCenter
	"Smooth rotation around the origin."

	^ 0@0! !

!CircleShapeMorph methodsFor: 'geometry' stamp: 'KenD 5/Feb/2022, 9:31:30 pm (UTC)'!
yAxisPointsUp
	"Math coordiated rather than graphics."

	^ true! !

!CircleShapeMorph class methodsFor: 'examples' stamp: 'hlsf 6/Feb/2022, 10:45:16 pm (UTC)'!
example1
"
	self example1 openInWorld
"
	^ self new ::
		center: 0 @0;
		radius: 100;
		lineWidth: 5;
		lineColor: Color black;
		fillColor: (Color black muchLighter alpha: 0.6)
		! !

!CurvedArrow methodsFor: 'initialization' stamp: 'jmv 3/Nov/2025, 5:30:23 pm (UTC)'!
initializeDefaults
	points := {100@100 . 200@100 . 300@300 . 600@300}.
	strokeWidth := 4.
	color := Color magenta.
	dashedStrokeBits := 2r111110000.
	dashBitLength := 2.
	dashOffset := 0.! !

!CurvedArrow methodsFor: 'initialization' stamp: 'jmv 22/Oct/2025, 10:43:45 pm (UTC)'!
points: aCollection strokeWidth: aNumber dashedStrokeBits: bits dashedBitLength: l color: aColor
	"
	CurvedArrow new openInWorld
	"
	points := aCollection.
	strokeWidth := aNumber.
	dashedStrokeBits := bits.
	dashBitLength := l.
	color := aColor.! !

!CurvedArrow methodsFor: 'drawing' stamp: 'jmv 3/Nov/2025, 5:30:08 pm (UTC)'!
drawOn: aCanvas
	"
	CurvedArrow allInstancesDo: [ :a | a delete ]
	CurvedArrow new openInWorld
	"
	| p4 d d1 d2 p5 |
	aCanvas strokeWidth: strokeWidth color: color dashedStrokeBits: dashedStrokeBits dashBitLength: dashBitLength dashBitOffset: dashOffset do: [
		aCanvas cubicBezier: points ].
	p4 := points fourth.
	d := (p4 - points third) normalized * strokeWidth * 8.
	d1 := d rotatedBy: Float pi / 10 negated + Float pi.
	d2:= d rotatedBy: Float pi / 10 + Float pi.
	p5 := p4 + d.
	
	aCanvas strokeWidth: 3 color: color fillColor: color do: [
		aCanvas moveTo: p5;
			lineTo: p5 + d1;
			lineTo: p5 + d2;
			lineTo: p5 ]
	! !

!CurvedArrow methodsFor: 'stepping' stamp: 'jmv 3/Nov/2025, 6:07:16 pm (UTC)'!
step
	dashOffset := dashOffset - 1.
	self redrawNeeded.! !

!CurvedArrow methodsFor: 'stepping' stamp: 'jmv 3/Nov/2025, 7:27:25 pm (UTC)'!
stepTime
	^300! !

!CurvedArrow methodsFor: 'stepping' stamp: 'jmv 3/Nov/2025, 7:27:11 pm (UTC)'!
wantsSteps

	^ true! !

!CurvedArrow class methodsFor: 'instance creation' stamp: 'jmv 22/Oct/2025, 10:45:10 pm (UTC)'!
new
	"
	CurvedArrow new openInWorld
	"
	^super new initializeDefaults! !

!CurvedArrow class methodsFor: 'instance creation' stamp: 'jmv 22/Oct/2025, 10:55:17 pm (UTC)'!
points: aCollection strokeWidth: aNumber color: aColor
	"
	(CurvedArrow
		points: {100@100 . 200@100 . 300@300 . 600@300}
		strokeWidth: 6
		color: Color red)
			openInWorld
	"
	^self new points: aCollection strokeWidth: aNumber dashedStrokeBits: 0 dashedBitLength: 0 color: aColor! !

!CurvedArrow class methodsFor: 'instance creation' stamp: 'jmv 22/Oct/2025, 10:55:45 pm (UTC)'!
points: aCollection strokeWidth: aNumber dashedStrokeBits: bits dashedBitLength: l color: aColor
	"
	(CurvedArrow
		points: {100@100 . 200@100 . 300@300 . 600@300}
		strokeWidth: 6
		dashedStrokeBits: 2r1110000 dashedBitLength: 4
		color: Color red)
			openInWorld
	"
	^self new points: aCollection strokeWidth: aNumber dashedStrokeBits: bits dashedBitLength: l color: aColor! !

!CurvedArrow class methodsFor: 'new-morph participation' stamp: 'KenD 28/Oct/2026, 9:28:26 pm (UTC)'!
initializedInstance

	^self new! !

!LineShapeMorph methodsFor: 'geometry testing' stamp: 'KenD 10/Jun/2024, 8:50:16 pm (UTC)'!
minimumExtent
	"This returns the minimum extent that the morph may be shrunk to.
	It is expressed in the morph own coordinates, like morphExtent."

	^ `10@10`! !

!LineShapeMorph methodsFor: 'drawing' stamp: 'KenD 5/Feb/2022, 9:29:28 pm (UTC)'!
drawOn: aCanvas

	aCanvas strokeWidth: lineWidth color: lineColor do: [
		aCanvas
				moveTo: startPoint;
				lineTo: endPoint
	]! !

!LineShapeMorph methodsFor: 'initialization' stamp: 'KenD 5/Feb/2022, 9:34:46 pm (UTC)'!
initialize

	super initialize.
	lineColor := Color orange.
	startPoint := 0@0.
	endPoint := 84@175.
	lineWidth := 6.! !

!LineShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 9:22:17 pm (UTC)'!
endPoint

	^ endPoint! !

!LineShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 9:22:23 pm (UTC)'!
endPoint: aPoint

	endPoint := aPoint! !

!LineShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 9:22:31 pm (UTC)'!
lineColor 

	^ lineColor ! !

!LineShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 9:22:36 pm (UTC)'!
lineColor: aColor

	lineColor := aColor! !

!LineShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 9:22:42 pm (UTC)'!
lineWidth

	^ lineWidth! !

!LineShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 9:22:48 pm (UTC)'!
lineWidth: positiveNumber

	lineWidth := positiveNumber ! !

!LineShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 9:22:58 pm (UTC)'!
startPoint 

	^ startPoint ! !

!LineShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 9:23:04 pm (UTC)'!
startPoint: aPoint

	startPoint := aPoint! !

!LineShapeMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 9:43:21 pm (UTC)'!
addOptionalHandlesTo: aHalo box: box
	"Control point is relative to my center.
	 Translate relative to aHalo"
	
	| haloCtlPt |
	
	haloCtlPt := aHalo internalizeFromWorld: self startPointInWorld.
	(aHalo addPointHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doStartPoint:with: .
		
	haloCtlPt := aHalo internalizeFromWorld: self endPointInWorld.
	(aHalo addPointHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doEndPoint:with: .! !

!LineShapeMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 9:24:58 pm (UTC)'!
endPointInWorld
	"Answer end point in World coordinates."

	^ self externalizeToWorld: endPoint! !

!LineShapeMorph methodsFor: 'control points' stamp: 'KenD 5/Feb/2022, 9:25:04 pm (UTC)'!
startPointInWorld
	"Answer start point in World coordinates."

	^ self externalizeToWorld: startPoint! !

!LineShapeMorph methodsFor: 'geometry' stamp: 'KenD 9/Feb/2022, 12:35:06 am (UTC)'!
knowsOwnLocalBounds

	^false! !

!LineShapeMorph methodsFor: 'geometry' stamp: 'KenD 5/Feb/2022, 9:30:10 pm (UTC)'!
rotationCenter
	"Smooth rotation around the origin.
	(Optional. See what happens if you delete this method)"

	^ startPoint! !

!LineShapeMorph methodsFor: 'geometry' stamp: 'KenD 5/Feb/2022, 9:31:07 pm (UTC)'!
yAxisPointsUp
	"Math coordiated rather than graphics."

	^ true! !

!LineShapeMorph class methodsFor: 'examples' stamp: 'hlsf 6/Feb/2022, 10:47:45 pm (UTC)'!
example1
"
	self example1 openInWorld
"
	^ self new ::
		startPoint: 0@0;
		endPoint: 100@100;
		lineWidth: 10;
		lineColor: Color black! !

!RectangleShapeMorph methodsFor: 'as yet unclassified' stamp: 'KenD 10/Jun/2024, 8:50:29 pm (UTC)'!
minimumExtent
	"This returns the minimum extent that the morph may be shrunk to.
	It is expressed in the morph own coordinates, like morphExtent."

	^ `20@20`! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 19/Jul/2023, 7:37:29 pm (UTC)'!
addOptionalHandlesTo: aHalo box: box
	"Control point is relative to my center.
	 Translate relative to aHalo"
	
	| haloCtlPt |
	haloCtlPt := aHalo internalizeFromWorld: self startPointInWorld.
	(aHalo addPointHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doStartPoint:with: .
		
	haloCtlPt := aHalo internalizeFromWorld: self endPointInWorld.
	(aHalo addPointHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doEndPoint:with: .

	haloCtlPt := aHalo internalizeFromWorld: self controlPointOneInWorld.
	(aHalo addHorizLineHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doControlOne:with: .
		
	haloCtlPt := aHalo internalizeFromWorld: self controlPointTwoInWorld.
	(aHalo addVertLineHandle: haloCtlPt)
		mouseDownSelector: #startControlPoint:with: ;
		mouseMoveSelector: #doControlTwo:with: .
		
! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 4/Feb/2022, 6:46:12 pm (UTC)'!
controlPointOneInWorld
	"Answer control point one in World coordinates."

	^ self externalizeToWorld: self rightCenter ! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 4/Feb/2022, 6:51:08 pm (UTC)'!
controlPointTwoInWorld
	"Answer control point one in World coordinates"

	^self externalizeToWorld: self bottomCenter ! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 4/Feb/2022, 6:53:43 pm (UTC)'!
endPointInWorld
	"Answer end point in World coordinates."

	^ self externalizeToWorld: corner! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 4/Feb/2022, 8:42:20 pm (UTC)'!
oneControlPoint
	"Answer control point one line grab right."

	^ self rightCenter ! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 4/Feb/2022, 8:45:12 pm (UTC)'!
oneControlPoint: aPoint
	"Reset my right line"

	corner := aPoint x @ corner y! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 4/Feb/2022, 6:35:13 pm (UTC)'!
startPoint

	^ origin! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 4/Feb/2022, 6:35:05 pm (UTC)'!
startPoint: aPoint

	origin := aPoint! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 4/Feb/2022, 6:53:55 pm (UTC)'!
startPointInWorld
	"Answer start point in World coordinates."

	^ self externalizeToWorld: origin! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 4/Feb/2022, 8:42:58 pm (UTC)'!
twoControlPoint
	"Answer control point one line grab botton."

	^ self bottomCenter ! !

!RectangleShapeMorph methodsFor: 'control points' stamp: 'KenD 4/Feb/2022, 8:44:21 pm (UTC)'!
twoControlPoint: aPoint
	"Reset my bottom line"

	corner := corner x @ aPoint y! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 4/Feb/2022, 8:37:06 pm (UTC)'!
bottomCenter

	^(origin x + ((corner x - origin x) // 2) @ corner y)! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:08:04 pm (UTC)'!
corner

	^ corner! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:08:19 pm (UTC)'!
corner: aPoint

	corner := aPoint! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 4/Feb/2022, 6:36:00 pm (UTC)'!
endPoint

	^ corner! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 4/Feb/2022, 6:36:16 pm (UTC)'!
endPoint: aPoint

	corner := aPoint! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:29:34 pm (UTC)'!
fillColor

	^ fillColor! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:29:34 pm (UTC)'!
fillColor: aColor

	fillColor := aColor! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 4/Feb/2022, 6:38:03 pm (UTC)'!
lineColor

	^ lineColor ! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 4/Feb/2022, 6:40:14 pm (UTC)'!
lineColor: aColor

	lineColor := aColor! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 4/Feb/2022, 6:37:49 pm (UTC)'!
lineWidth

	^ lineWidth ! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 4/Feb/2022, 6:40:43 pm (UTC)'!
lineWidth: posiriveNumber

	lineWidth := posiriveNumber! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:08:28 pm (UTC)'!
origin

	^ origin! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 5/Feb/2022, 8:08:37 pm (UTC)'!
origin: aPoint

	origin := aPoint! !

!RectangleShapeMorph methodsFor: 'accessing' stamp: 'KenD 4/Feb/2022, 8:32:53 pm (UTC)'!
rightCenter

	^(corner x @ (corner y - ((corner y - origin y) // 2)))! !

!RectangleShapeMorph methodsFor: 'geometry' stamp: 'KenD 9/Feb/2022, 12:35:18 am (UTC)'!
knowsOwnLocalBounds

	^false! !

!RectangleShapeMorph methodsFor: 'geometry' stamp: 'KenD 4/Feb/2022, 7:19:24 pm (UTC)'!
rotationCenter
	"Smooth rotation around the origin.
	(Optional. See what happens if you delete this method)"

	^ origin! !

!RectangleShapeMorph methodsFor: 'geometry' stamp: 'KenD 4/Feb/2022, 7:39:05 pm (UTC)'!
yAxisPointsUp
	"By default, most morphs assume the usual convention in 2d computer graphics:
	- x points to the right (i.e. increasing x values move from left to right)
	- y points down (i.e. increasing y values move from top to bottom)
	Subclasses wanting to follow the standard math convention, making increasing y values move upwards
	should redefine this method to answer true."

	^ true! !

!RectangleShapeMorph methodsFor: 'drawing' stamp: 'KenD 5/Feb/2022, 8:29:34 pm (UTC)'!
drawOn: aCanvas

	aCanvas 
		frameAndFillRectangle:
			(Rectangle origin: origin corner: corner) 
		fillColor: fillColor 
		borderWidth: lineWidth 
		borderColor: lineColor! !

!RectangleShapeMorph methodsFor: 'initialization' stamp: 'KenD 5/Feb/2022, 10:35:49 pm (UTC)'!
initialize

	super initialize.
	origin := 0@0. 
	corner :=  150@90.
	lineColor := Color cyan.
	lineWidth := 6.
	fillColor := lineColor alpha: 0.4. ! !

!RectangleShapeMorph class methodsFor: 'examples' stamp: 'hlsf 6/Feb/2022, 10:51:32 pm (UTC)'!
example1
"
	self example1 openInWorld
"
	^ self new ::
		origin: 0@0;
		corner: 100@100;
		lineWidth: 6;
		lineColor: Color orange;
		fillColor: (Color orange muchLighter alpha: 0.6)! !

!Theme methodsFor: '*ui-shapes' stamp: 'KenD 19/Jul/2023, 6:57:54 pm (UTC)'!
endPointIcon
	"Answer a `sun`"
	^ self fetch: #( '16x16' 'status' 'weather-clear'  )! !

!Theme methodsFor: '*ui-shapes' stamp: 'KenD 19/Jul/2023, 7:05:19 pm (UTC)'!
moveHorizIcon
	"Answer horizontal move"
	^ self fetch: #( '16x16' 'actions' 'go-last'  )! !

!Theme methodsFor: '*ui-shapes' stamp: 'KenD 19/Jul/2023, 7:05:46 pm (UTC)'!
moveVertIcon
	"Answer vertical move"
	^ self fetch: #( '16x16' 'actions' 'go-bottom'  )! !

!Theme methodsFor: '*ui-shapes' stamp: 'KenD 19/Jul/2023, 7:27:26 pm (UTC)'!
targetIcon
	"Answer concentric circles"
	^ self fetch: #( '16x16' 'emblems' 'emblem-important'  )! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 3/Sep/2024, 2:57:45 am (UTC)'!
addControlHandle: aPoint
	"Add a handle for the control point and return the handle."

	| handle  colorToUse form icon e |
	colorToUse := Color green. "@@parameterize by theme@@"
	handle := HaloHandleMorph new color: colorToUse.
	self addMorph: handle.
	e := Preferences haloHandleSize asPoint.
	handle position: aPoint-(e//2) extent: e.
	form := self class haloTargetIcon.
	(form extent = e) ifFalse: [ 
		form := form  "Be as smooth as possible, these images are small."
				magnify: form boundingBox
				to: e
				smoothing: 2 
	].
	icon := ImageMorph new
				image: form;
				color: colorToUse makeForegroundColor;
				lock.
	^handle 
		addMorphFront: icon position: `0@0`;
		mouseUpSelector: #endInteraction;
		setBalloonText: 'Shape control point';
		yourself
! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 3/Sep/2024, 2:57:48 am (UTC)'!
addHorizLineHandle: aPoint
	"Add a handle for the control point and return the handle."

	| handle  colorToUse form icon e |
	colorToUse := Color green. "@@parameterize by theme@@"
	handle := HaloHandleMorph new color: colorToUse.
	self addMorph: handle.
	e := Preferences haloHandleSize asPoint.
	handle position: aPoint-(e//2) extent: e.
	form := self class haloGrabLineHorizIcon.
	(form extent = e) ifFalse: [ 
		form := form  "Be as smooth as possible, these images are small."
				magnify: form boundingBox
				to: e
				smoothing: 2 
	].
	icon := ImageMorph new
				image: form;
				color: colorToUse makeForegroundColor;
				lock.
	^handle 
		addMorphFront: icon position: `0@0`;
		mouseUpSelector: #endInteraction;
		setBalloonText: 'Shape control point';
		yourself
! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 3/Sep/2024, 2:57:52 am (UTC)'!
addPointHandle: aPoint
	"Add a handle for the control point and return the handle."

	| handle  colorToUse form icon e |
	colorToUse := Color green. "@@parameterize by theme@@"
	handle := HaloHandleMorph new color: colorToUse.
	self addMorph: handle.
	e := Preferences haloHandleSize asPoint.
	handle position: aPoint-(e//2) extent: e.
	form := self class haloPointIcon.
	(form extent = e) ifFalse: [ 
		form := form  "Be as smooth as possible, these images are small."
				magnify: form boundingBox
				to: e
				smoothing: 2 
	].
	icon := ImageMorph new
				image: form;
				color: colorToUse makeForegroundColor;
				lock.
	^handle 
		addMorphFront: icon position: `0@0`;
		mouseUpSelector: #endInteraction;
		setBalloonText: 'Shape control point';
		yourself
! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 3/Sep/2024, 2:57:57 am (UTC)'!
addVertLineHandle: aPoint
	"Add a handle for the control point and return the handle."

	| handle  colorToUse form icon e |
	colorToUse := Color green. "@@parameterize by theme@@"
	handle := HaloHandleMorph new color: colorToUse.
	self addMorph: handle.
	e := Preferences haloHandleSize asPoint.
	handle position: aPoint-(e//2) extent: e.
	form := self class haloGrabLineVertIcon.
	(form extent = e) ifFalse: [ 
		form := form  "Be as smooth as possible, these images are small."
				magnify: form boundingBox
				to: e
				smoothing: 2 
	].
	icon := ImageMorph new
				image: form;
				color: colorToUse makeForegroundColor;
				lock.
	^handle 
		addMorphFront: icon position: `0@0`;
		mouseUpSelector: #endInteraction;
		setBalloonText: 'Shape control point';
		yourself
! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 5/Feb/2022, 8:18:51 pm (UTC)'!
doControlOne: evt with: controlPointHandle
	"Enable Target Morph to follow control point one."

	evt hand obtainHalo: self.	
	
	self target oneControlPoint: 
		(self target internalizeFromWorld: evt eventPosition).
		
	"Track the hand"
	controlPointHandle 
		positionInWorld: evt eventPosition 
					- (controlPointHandle morphExtent // 2).	

	self redrawNeeded.! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 5/Feb/2022, 8:19:48 pm (UTC)'!
doControlTwo: evt with: controlPointHandle
	"Enable Target Morph to follow control point two."

	evt hand obtainHalo: self.	
	
	self target twoControlPoint: 
		(self target internalizeFromWorld: evt eventPosition).
		
	"Track the hand"
	controlPointHandle 
		positionInWorld: evt eventPosition 
					- (controlPointHandle morphExtent // 2).	

	self redrawNeeded.! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 5/Feb/2022, 8:24:23 pm (UTC)'!
doEndPoint: evt with: controlPointHandle
	"Enable Target Morph to follow endPoint control point."

	evt hand obtainHalo: self.	
	
	self target endPoint: 
		(self target internalizeFromWorld: evt eventPosition).
		
	"Track the hand"
	controlPointHandle 
		positionInWorld: evt eventPosition 
					- (controlPointHandle morphExtent // 2).	

	self redrawNeeded.! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 5/Feb/2022, 8:24:04 pm (UTC)'!
doStartPoint: evt with: controlPointHandle
	"Enable Target Morph to follow startPoint control point."

	evt hand obtainHalo: self.	
	
	self target startPoint: 
		(self target internalizeFromWorld: evt eventPosition).
		
	"Track the hand"
	controlPointHandle 
		positionInWorld: evt eventPosition 
					- (controlPointHandle morphExtent // 2).	

	self redrawNeeded.! !

!HaloMorph methodsFor: '*ui-shapes' stamp: 'KenD 5/Feb/2022, 8:24:45 pm (UTC)'!
startControlPoint: evt with: controlPointHandle
	"Initialize control point target."

	"Make sure the event's hand correlates with the receiver"
	evt hand obtainHalo: self.	
	
	"remove all other handles"
	self removeAllHandlesBut: controlPointHandle.  

! !

!HaloMorph class methodsFor: '*ui-shapes' stamp: 'KenD 19/Jul/2023, 7:08:28 pm (UTC)'!
haloGrabLineHorizIcon

	^ self icons
		at: #haloGrabLineHorizIcon
		ifAbsentPut: [ Theme current  moveHorizIcon ]! !

!HaloMorph class methodsFor: '*ui-shapes' stamp: 'KenD 19/Jul/2023, 7:08:51 pm (UTC)'!
haloGrabLineVertIcon

	^ self icons
		at: #haloGrabLineVertIcon
		ifAbsentPut: [ Theme current moveVertIcon ]! !

!HaloMorph class methodsFor: '*ui-shapes' stamp: 'KenD 19/Jul/2023, 7:09:15 pm (UTC)'!
haloPointIcon

	^ self icons
		at: #haloPointIcon
		ifAbsentPut: [ Theme current endPointIcon ]! !

!HaloMorph class methodsFor: '*ui-shapes' stamp: 'KenD 19/Jul/2023, 7:09:37 pm (UTC)'!
haloTargetIcon

	^ self icons
		at: #haloTargetIcon
		ifAbsentPut: [ Theme current targetIcon ]! !
