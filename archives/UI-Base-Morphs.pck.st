'From Cuis 6.0 [latest update: #5772] on 23 April 2023 at 4:18:08 pm'!
'Description Various Morphs required to construct widgets and other UI affordances.'!
!provides: 'UI-Base-Morphs' 1 28!
!requires: 'Cuis-Base' 60 5031 nil!
SystemOrganization addCategory: 'UI-Base-Morphs'!


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

!classDefinition: #ListMultiModel category: 'UI-Base-Morphs'!
ListModel subclass: #ListMultiModel
	instanceVariableNames: 'listSelections'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Base-Morphs'!
!classDefinition: 'ListMultiModel class' category: 'UI-Base-Morphs'!
ListMultiModel class
	instanceVariableNames: ''!


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

!ListMultiModel commentStamp: '<historical>' prior: 0!
Several items from my collection can be selected.!

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

!PointerLineMorph class methodsFor: 'instance creation' stamp: 'KenD 9/15/2016 17:37:25'!
initializedInstance

	| newInst |
	newInst  := super initializedInstance.
	newInst updateEndPoint.
	^newInst! !

!PointerLineMorph class methodsFor: 'examples' stamp: 'KenD 12/20/2021 11:40:31'!
example1
"
  PointerLineMorph example1 openInWorld 
"
	^ super example1! !

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

!ListMultiModel methodsFor: 'private' stamp: 'hlsf 4/23/2023 15:35:24'!
clearSelections
	listSelections := Array new: collection size withAll: false.
	self listIndex: 0.
	self changed: #allSelections! !

!ListMultiModel methodsFor: 'copying' stamp: 'hlsf 4/21/2023 15:27:36'!
postCopy
	listSelections := listSelections copy! !
FrameMorph initialize!
