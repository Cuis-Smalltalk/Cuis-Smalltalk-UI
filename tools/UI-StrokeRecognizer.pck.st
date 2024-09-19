'From Cuis7.1 [latest update: #6731] on 19 September 2024 at 11:54:07 am'!
'Description Single-stroke character recognizer designed for Palm Graffiti gestures.

The recognizer is original.  The gestures were from PalmOS.

https://en.wikipedia.org/wiki/Graffiti_(Palm_OS) states:
  "The original patent expired at the end of 2016"'!
!provides: 'UI-StrokeRecognizer' 1 13!
!requires: 'Cuis-Base' 71 6727 nil!
!requires: 'UI-Click-Select' 1 63 nil!
!requires: 'Graphics-Files-Additional' 1 29 nil!
SystemOrganization addCategory: #'UI-StrokeRecognizer'!


!classDefinition: #CompassTrainingMorph category: #'UI-StrokeRecognizer'!
LayoutMorph subclass: #CompassTrainingMorph
	instanceVariableNames: 'recognizer inputMorph sample result resultLabel button pointDirections strokeDirections'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer'!
!classDefinition: 'CompassTrainingMorph class' category: #'UI-StrokeRecognizer'!
CompassTrainingMorph class
	instanceVariableNames: ''!

!classDefinition: #EditorStrokeInputMorph category: #'UI-StrokeRecognizer'!
LayoutMorph subclass: #EditorStrokeInputMorph
	instanceVariableNames: 'recognizer inputMorph result resultLabel exemplarSelection nextIsCapitalized allCaps eventHandlerObject radioSelections'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer'!
!classDefinition: 'EditorStrokeInputMorph class' category: #'UI-StrokeRecognizer'!
EditorStrokeInputMorph class
	instanceVariableNames: 'eventHandlerObject'!

!classDefinition: #StrokeInputMorph category: #'UI-StrokeRecognizer'!
BorderedBoxMorph subclass: #StrokeInputMorph
	instanceVariableNames: 'points'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer'!
!classDefinition: 'StrokeInputMorph class' category: #'UI-StrokeRecognizer'!
StrokeInputMorph class
	instanceVariableNames: ''!

!classDefinition: #EditorwithStrokeInput category: #'UI-StrokeRecognizer'!
Morph subclass: #EditorwithStrokeInput
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer'!
!classDefinition: 'EditorwithStrokeInput class' category: #'UI-StrokeRecognizer'!
EditorwithStrokeInput class
	instanceVariableNames: ''!

!classDefinition: #EditorWithStrokeInput category: #'UI-StrokeRecognizer'!
TextEditor subclass: #EditorWithStrokeInput
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer'!
!classDefinition: 'EditorWithStrokeInput class' category: #'UI-StrokeRecognizer'!
EditorWithStrokeInput class
	instanceVariableNames: ''!

!classDefinition: #CompassExemplar category: #'UI-StrokeRecognizer'!
Object subclass: #CompassExemplar
	instanceVariableNames: 'name pattern'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer'!
!classDefinition: 'CompassExemplar class' category: #'UI-StrokeRecognizer'!
CompassExemplar class
	instanceVariableNames: ''!

!classDefinition: #CompassPattern category: #'UI-StrokeRecognizer'!
Object subclass: #CompassPattern
	instanceVariableNames: 'directionVector'
	classVariableNames: 'CloseDistance PeriodArray SampleSize'
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer'!
!classDefinition: 'CompassPattern class' category: #'UI-StrokeRecognizer'!
CompassPattern class
	instanceVariableNames: ''!

!classDefinition: #CompassRecognizer category: #'UI-StrokeRecognizer'!
Object subclass: #CompassRecognizer
	instanceVariableNames: 'exemplars'
	classVariableNames: 'BasePatterns NumberPatterns PunctuationPatterns'
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer'!
!classDefinition: 'CompassRecognizer class' category: #'UI-StrokeRecognizer'!
CompassRecognizer class
	instanceVariableNames: ''!


!CompassTrainingMorph commentStamp: '<historical>' prior: 0!
I am a Morph useful to try out stroke recognition and add new pattern exemplars to recognizer.

Feature require: 'StrokeRecognizer'.
CompassTrainingMorph new openInHand.
StrokeInputMorph strokeMorph openInHand. !

!EditorStrokeInputMorph commentStamp: '<historical>' prior: 0!
I am useful within a Text Editor to feed it synthesized KeyboardEvents.

I manage a StrokeInputMorph, which gives me events.

I allow the user to select between exemplar sets used by the recognizer.
  a - Base Alphabet (lower case)
  A - Base Alphabet (capitalized)
  5 - Numbes
  $ - Punctuation
  ... Extensions

I also display the result match value.!

!EditorwithStrokeInput commentStamp: '<historical>' prior: 0!
I am just a way of getting an EditorWithStrokeInput from the "New Morph.." Menu.!

!EditorWithStrokeInput commentStamp: '<historical>' prior: 0!
I am a Text Editor which has an added EditorStrokeInputMorph which feeds me keystrokes.

EditorWithStrokeInput open.!

!CompassExemplar commentStamp: '<historical>' prior: 0!
When a pattern matches my #pattern, then the #name has been recognized.
!

!CompassPattern commentStamp: '<historical>' prior: 0!
I contain a vector of 
	{<compassDirection>,<strokeDirection>,...,<compassDirection>}
from a set of points.

Points are resampled to a standard number, 
  the centroid found,
  directin is relative to centroid
  strokeDirection is 2nd point relative to first point as origin

One special case for Graffiti gestures: Period.
Period is known because all points close distance to centroid.
Rather than nil, a special pattern array is used for uniform processing.
!

!CompassRecognizer commentStamp: '<historical>' prior: 0!
This single stroke recognizer is based on Compass directions.
Point vectors are resampled to reduce noise.
Sample point directions are about centroid of Glyph.
           N
   NW    |    NE
        \   |   /
 W -- * -- E
        /   |   \
   SW    |    SE
            S
 Each sample point is assigned a closest compass point.
 Each pair of sample points in a stroke is assigned 
   a compass direction from earlier to later.
 This results in a vector #( sampleDir strokeDir sampleDir ...  strokeDir sampleDir).
 Recognition consists in comparing sampled CompassPattern with CompassExemplar s
    and choosing the best match.
 Period is recognized as a spacial case where all samples are close to centroid.

The intent is recognition of Palm Graffiti and related single stroke glyph input.

   https://en.wikipedia.org/wiki/Graffiti_(Palm_OS)
   https://strokeinput.com

This is an original strategy, but uses ideas from pror art: 

  Protractor: A Fast and Accurate Gesture Recognizer
         https://www.cs.ucf.edu/courses/cap6105/readings/li2010.pdf
  On-Line One Stroke Character Recognition Using Direction Features
          https://upcommons.upc.edu/bitstream/handle/2117/2765/839.pdf


!

!CompassTrainingMorph methodsFor: 'event handling' stamp: 'KenD 9/10/2024 15:48:27'!
saveStroke

	"Button request to save into recognizer.  Get a name for it"
	| name |
	name := 	StringRequestMorph
		request: 'What name for stroke pattern?'
		orCancel: [nil].
	name ifNotNil: [ :daName | 
		recognizer addExemplar: 
			(CompassExemplar name: daName asSymbol pattern: sample)
	].! !

!CompassTrainingMorph methodsFor: 'event handling' stamp: 'KenD 9/12/2024 13:10:09'!
strokeResult: points

	"Update view of user input"
	sample := CompassPattern fromPoints: points.
	result := recognizer bestMatch: sample.
	resultLabel contents: (result key printStringFractionDigits: 3), ' -> ', result value asString.
	pointDirections contents: sample directionsFromCentroid asString.
	strokeDirections contents: sample pointTravelDirections asString.	
	! !

!CompassTrainingMorph methodsFor: 'initialization' stamp: 'KenD 9/12/2024 21:51:47'!
initialize
	
	super initialize.
	recognizer := CompassRecognizer new.
	inputMorph := StrokeInputMorph new.
	self addMorph: inputMorph .

	pointDirections := TextParagraphMorph contents: '#()'.
	self addMorph: pointDirections. 
	
	self addMorph: self resultRegion.
	
	strokeDirections := TextParagraphMorph contents: '#()'.
	self addMorph: strokeDirections. 
	
	button := PluggableButtonMorph 
				model: self 
				stateGetter: nil 
				action: #saveStroke
				label: 'Save Stroke to Recognizer' ::
				color: Color yellow.
	self addMorph: button.			
	self separation: 20.
	self color: Color green.

	
	

	! !

!CompassTrainingMorph methodsFor: 'initialization' stamp: 'KenD 9/12/2024 21:44:17'!
resultRegion

	| upMsg downMsg msgLayout |
	resultLabel := LabelMorph new; contents: 'result goes here'.
	upMsg := TextParagraphMorph new; 
		contents: ' ^^ point ^^ ' , String newLineString, '    locations'.
	upMsg shrinkFromExtent: 1000@1000;
	           layoutSpec: LayoutSpec keepMorphExtent.
	downMsg := TextParagraphMorph new; 
		contents: '         stroke', String newLineString, ' vvv headings vvv '.
	downMsg shrinkFromExtent: 1000@1000;
	           layoutSpec: LayoutSpec keepMorphExtent.
	msgLayout := LayoutMorph newRow :: separation: 20; color: Color cyan.
	^msgLayout addMorph: upMsg; 
				addMorph: resultLabel; 
				addMorph: downMsg;
				layoutSpec: (LayoutSpec proportionalWidth: 0.4  proportionalHeight: 0.1 ).! !

!CompassTrainingMorph class methodsFor: 'instance creation' stamp: 'KenD 9/10/2024 17:55:41'!
new

	| newSelf |
	newSelf := self newColumn.
	newSelf morphExtent: newSelf minimumExtent.
	^newSelf! !

!CompassTrainingMorph class methodsFor: 'new-morph participation' stamp: 'KenD 9/18/2024 07:59:32'!
categoryInNewMorphMenu

	^ 'Stroke Input'! !

!CompassTrainingMorph class methodsFor: 'new-morph participation' stamp: 'KenD 9/18/2024 07:59:24'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!CompassTrainingMorph class methodsFor: 'new-morph participation' stamp: 'KenD 9/18/2024 07:59:10'!
initializedInstance

	^self new! !

!EditorStrokeInputMorph methodsFor: 'events' stamp: 'KenD 9/17/2024 16:56:50'!
informRadioSelection: whatSym
	"Radio Selection of Exemplar match set."

"Transcript log: 'informRadioSelection: ', whatSym asString."

	nextIsCapitalized := false.
	whatSym caseOf: {
		[#DownCaseLetters] -> [allCaps := false. recognizer useBaseExemplars].
		[#UpcaseLetters]      		-> [allCaps := true.   recognizer useBaseExemplars].
		[#Numbers] 	      -> [allCaps := false. recognizer useNumberExemplars].
		[#Punctuation] -> [allCaps := false. recognizer usePunctuationExemplars].
	}.! !

!EditorStrokeInputMorph methodsFor: 'events' stamp: 'KenD 9/17/2024 16:41:17'!
strokeResult: points

	"Update view of user input"
	result := recognizer bestMatch: (CompassPattern fromPoints: points).
	resultLabel contents: (result key printStringFractionDigits: 3), ' -> ', result value asString.

	(self resultIsUseful) 
		ifTrue: [ 
			self notifyEditorOfResult .
		].! !

!EditorStrokeInputMorph methodsFor: 'initialization' stamp: 'KenD 9/17/2024 16:52:19'!
exemplarSelectionMorph

	radioSelections := RadioGroup 
		fromList: #(#DownCaseLetters #UpcaseLetters #Numbers #Punctuation).
		
	radioSelections 
		when: #informRadioSelection 
		send: #informRadioSelection: 
		to: self.

	(radioSelections buttonFor: #DownCaseLetters) select.
	
	^ radioSelections layoutSpec: 
		(LayoutSpec proportionalWidth: 0.4 proportionalHeight: 0.2)! !

!EditorStrokeInputMorph methodsFor: 'initialization' stamp: 'KenD 9/17/2024 15:55:19'!
initialize

	super initialize.
	nextIsCapitalized := false.
	allCaps := false.
	result := 0 -> nil.
	resultLabel := LabelMorph new; contents: 'result goes here'.
	recognizer  := CompassRecognizer useBase. "AlphaBet"
	inputMorph := StrokeInputMorph new.
	self addMorph: self exemplarSelectionMorph;
		addMorph: inputMorph;
		addMorph: resultLabel;
		color: Color tan;
		padding: 10;
		gap: 10;
		axisEdgeWeight: 0;
		layoutSpec: (LayoutSpec proportionalWidth: 1 proportionalHeight: 0.2)
! !

!EditorStrokeInputMorph methodsFor: 'editor keystrokes' stamp: 'KenD 9/18/2024 12:43:27'!
notifyEditorOfResult

	"Propogate character as KeyboardEvent to eventHandlerObject .
	 Note: HandMorph>>generateKeyboardEvent: "
	|  resultString keyCharacter |
	resultString := result value asString.

	(resultString size = 1) 
	ifTrue: [
		keyCharacter := (resultString at: 1).
		(nextIsCapitalized or: [allCaps] ) ifFalse: [
			keyCharacter := keyCharacter asLowercase .
		].
		nextIsCapitalized := false.
	]
	ifFalse: [
		keyCharacter := nil. "marker for NO CHAR"
		result value caseOf: {
			[#Return] -> [keyCharacter := Character codePoint: 13].
			[#Space]  -> [keyCharacter := Character space].
			[#BackSpace] -> [keyCharacter := Character backspace].
			[#Period]      -> [keyCharacter := $. ].
			[#CharRight]-> [keyCharacter := Character codePoint: 29].
			[#CharLeft]   -> [keyCharacter := Character codePoint: 28]. 
			[#UpcaseNext] -> [nextIsCapitalized := true].
			[#Tab] -> [keyCharacter := Character codePoint: 9].
		} otherwise: [PopUpMenu inform: 'Unrecognized glyph type: ', resultString.]
	].
	keyCharacter ifNotNil: [ | keyEvent |
		keyEvent := KeyboardEvent new.
		keyEvent setType: #keystroke 
				  buttons: 0 
				  position: 0@0 
				  keyValue: keyCharacter codePoint
				  hand: self world activeHand 
				  stamp: DateAndTime now.	
		eventHandlerObject dispatchOn: keyEvent 
	].
! !

!EditorStrokeInputMorph methodsFor: 'testing' stamp: 'KenD 9/17/2024 12:06:47'!
resultIsUseful

	"Answer if input is well recognized glyph.
	  Any special case testing goes here..."

	"Answer match value above minimum threshold."
	^ (result key > 0.5) ! !

!EditorStrokeInputMorph methodsFor: 'accessing' stamp: 'KenD 9/17/2024 14:37:43'!
keyboardHandler: evtHandler

	eventHandlerObject := evtHandler! !

!EditorStrokeInputMorph class methodsFor: 'instance creation' stamp: 'KenD 9/17/2024 14:38:54'!
newFor: handlerObj
	| newSelf |
	newSelf := self newRow.
	newSelf keyboardHandler: handlerObj.
	newSelf morphExtent: newSelf minimumExtent.
	^newSelf! !

!EditorStrokeInputMorph class methodsFor: 'new-morph participation' stamp: 'KenD 9/18/2024 09:08:54'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!StrokeInputMorph methodsFor: 'drawing' stamp: 'KenD 9/9/2024 16:09:25'!
drawOn: aCanvas
	| curP lastP |
	super drawOn: aCanvas.
	2 to: points size do: [:i |
		lastP := points at: i - 1.
		curP := points at: i.
		aCanvas line: lastP to: curP width: 6 color: Color black].
! !

!StrokeInputMorph methodsFor: 'private' stamp: 'KenD 9/12/2024 12:24:40'!
isValidPoint: aPoint

	"Sampled points may contain NaN values or lay outside our extent."
	"Note: (NaN isNumber) --> true!!"
	(aPoint x) isNaN ifTrue: [ ^false ].
	(aPoint y) isNaN ifTrue: [ ^false ].
	^(0@0 extent: self morphExtent) containsPoint:  aPoint! !

!StrokeInputMorph methodsFor: 'events' stamp: 'KenD 9/9/2024 15:55:53'!
handlesMouseDown: evt

	^ true! !

!StrokeInputMorph methodsFor: 'events' stamp: 'KenD 9/9/2024 15:56:03'!
handlesMouseMove: anEvent 

	^ true! !

!StrokeInputMorph methodsFor: 'events' stamp: 'KenD 9/17/2024 21:21:01'!
mouseButton1Down: evt localPosition: position

	points := OrderedCollection new.
	(self isValidPoint: position) ifTrue: [ 	points add: position ].
! !

!StrokeInputMorph methodsFor: 'events' stamp: 'KenD 9/17/2024 21:20:22'!
mouseButton1Up: evt localPosition: position
	
	(self isValidPoint: position) ifTrue: [ 	points add: position ].
	self owner strokeResult: points.
	! !

!StrokeInputMorph methodsFor: 'events' stamp: 'KenD 9/12/2024 12:17:31'!
mouseMove: evt localPosition: position

	((evt mouseButton1Pressed) and: [ self isValidPoint: position ] )
		ifTrue: [ points add: position ]. 
	self redrawNeeded .
! !

!StrokeInputMorph methodsFor: 'initialization' stamp: 'KenD 9/11/2024 07:18:19'!
defaultExtent

	^ `100@100`! !

!StrokeInputMorph methodsFor: 'initialization' stamp: 'KenD 9/12/2024 11:13:55'!
initialize

	super initialize.
	points := OrderedCollection new.
	self morphExtent: 100@100;
		borderWidth: 8;
		borderColor: Color purple ;
		color: Color orange.
! !

!StrokeInputMorph class methodsFor: 'stroke morph' stamp: 'KenD 9/16/2024 11:31:57'!
strokeForm

"(Base64MimeConverter mimeEncode: ( '/home/kend/Downloads/256px-Palm_Graffiti_gestures.png' asFileEntry binaryContents readStream)) contents edit."

	^Form fromBinaryStream: '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
WQj0v4xNmzaRlpZWZG1AY+Dk5MRnn31GeHg4GzdufK5NTgvTmV1dXbGysnpuBCCTyejSpQsB
AQHY29tTo0aNQqtflYQ7d+7g4eFR6lwEYytcl1kFiI2NJTMz07C7pqWlER8fb5RxriRkZmai
VCoLFZcsLS0xMzMzqplmRkYGNjY2JaoK/yXs27ePbdu2MWfOHNxKU0GkEPj5+TFz5kwmT56M
j48PvXv3fmEIwNHREblc/sxavT2JBw8e8NVXXzFw4EBq1arFgwcPylRjIiUlxVBz8XmhUAKo
Vq0af/zxB19//TVmZmaMHz/eZK2iU1NTEQShUNG9oIiGMQSQlpaGtbW1SXTAjIwMEhIScHZ2
xt3dvczsWuCWex4+6rCwML7++mtGjx5dbHm00qBRo0Z8+OGHLFu2DA8PjzLtcqZGdnY2zs7O
qNXqCm/2WhhycnKYO3cu3t7ejBkzBktLS3Q6XaldrjqdjqysLGoUVQjzeRKAmZkZZmZmhgVW
3v5jjyIrK8tQJKMw0UokEhllAzCVBHDo0CFWr15taLccEhLCoEGDSv1h4uPjWbduHa+++mqp
C2CWF+Hh4Xz22We8+eab9OvXz6TX7tWrF3FxcYYuNaXVVytiAbq7u5OcnPzMJQCNRsOKFStI
TU1l2bJlhk2xLHEyBXUInncq8jN3oqalpWFvb19oFR+ZTIa5ublRzJ6ZmVkmI9eTotw333zD
K6+8wurVq5k5cyYajYYPPviAdevWGT3BLl68yLhx48jNza2QttolLf7JkyfTpUsXBg8ebHK/
uEgk4r333iMkJITPP/+czMzM5zZZC8qrOTk5IZVKn7mB8ueff+bYsWPMmjWr3CpWQUdrU26u
/woCSElJwcnJqUgx2dzc3CjjTlZWFk6PloQtA06ePImzszNvvPEGbm5uhIaGMmfOHGbMmMFf
f/3FRx99xK1bt4qdkL///jtTpkyhS5cufPHFF8/UKxEREcHkyZPp3LkzY8aMqTCXmLm5OR9/
/DGCIDxXz0ABAdjb22NnZ/dMyejIkSN89913TJs2rUSXXWkJ9j9FANnZ2cX6lu3t7UtUAbRa
LTk5OeUmgGvXrhEcHPzYwpFIJLRq1YpVq1bh5eXFuHHj+Pvvv5+yhCuVStauXcvy5cv58MMP
GT58+DP1SERERPDJJ5/QqVMnxo4dW+H+cEdHRz777DOuXr3Kxo0bn0uXZY1GQ05OjiEq8lkR
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
+f/d3cl5UJ93gsViyQqNWlhY1BlNJxKJUFpaiqqqKhgYGMDc3LyWVFVeTlr/fXwAc3PSPpGY
SHop5HknxGIxSktL8fbtW7x48QK9e/euFgMjFouxZ88e3LlzB97e3hg0aBD8/PwUphKXlpLz
vl07wMTk/9uMvL0BeXlg0vbg9RLA1z7d+Ph4PHz4EKmpqRAIBDA2Noavry+GDh1ab0lvsZjU
GePjSY+AFvM6GvGV73/fvn1Yu3YtmjVrpvZ1BAIBlixZgsGDB2PAgAFqXycnJwdGRkZK5c0X
FBRgy5YtyMrKgp+fnyyPYevWrRrlQ/wbQBAEJBJJtYApsViMp0+fwsHBAa6urlrvCKQyAXz9
sCKRSObjVTY+WyIhjYEMBmkQbIT2wWKxwOVytVJx5vPnzzA0NFSqJLy2wOVyERsbizdv3sDa
2hq9e/eWGwDUCO0RgMqmMWkFX1VBpZKiYyMaDmZmZipXqVEETSQIdaGvr49evXrVirxrRMOh
sd92IxrRSACNaEQj/i+CLqyqAr+iAsQ/kALciEY04h8AhQIeiwWJSARKhLMzYWBlpThNrxGN
aMT/HAFIRCKUf/6M/wfO60LYi3uG4QAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxMy0wNy0xOFQx
Mjo1NzoxMSswMDowMPmPxeQAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTMtMDctMThUMTI6NTc6
MTErMDA6MDCI0n1YAAAARnRFWHRzb2Z0d2FyZQBJbWFnZU1hZ2ljayA2LjYuOS03IDIwMTIt
MDgtMTcgUTE2IGh0dHA6Ly93d3cuaW1hZ2VtYWdpY2sub3JnnL25SAAAABh0RVh0VGh1bWI6
OkRvY3VtZW50OjpQYWdlcwAxp/+7LwAAABl0RVh0VGh1bWI6OkltYWdlOjpoZWlnaHQAMTIx
NqcdsesAAAAXdEVYdFRodW1iOjpJbWFnZTo6V2lkdGgANTc3OkxQ1QAAABl0RVh0VGh1bWI6
Ok1pbWV0eXBlAGltYWdlL3BuZz+yVk4AAAAXdEVYdFRodW1iOjpNVGltZQAxMzc0MTUyMjMx
QAk0QwAAABN0RVh0VGh1bWI6OlNpemUANTAuMktCQswrJiEAAAAzdEVYdFRodW1iOjpVUkkA
ZmlsZTovLy90bXAvbG9jYWxjb3B5X2RmNGY5MGU2YjUyMi0xLnBuZ1ADOAQAAAAASUVORK5C
YII='  base64Decoded readStream.! !

!StrokeInputMorph class methodsFor: 'stroke morph' stamp: 'KenD 9/16/2024 11:32:26'!
strokeMorph
"
	Answer Palm Graffiti Gentures ImageMorph.
	Original graphic and Creative Commons Licence at:
	  https://commons.wikimedia.org/wiki/File:Palm_Graffiti_gestures.png
	
	StrokeInputMorph strokeMorph openInHand.
"

	^ ImageMorph newWith: self strokeForm! !

!StrokeInputMorph class methodsFor: 'new-morph participation' stamp: 'KenD 9/18/2024 08:04:27'!
categoryInNewMorphMenu

	^ 'Stroke Input'! !

!StrokeInputMorph class methodsFor: 'new-morph participation' stamp: 'KenD 9/18/2024 08:04:35'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!StrokeInputMorph class methodsFor: 'new-morph participation' stamp: 'KenD 9/18/2024 08:04:55'!
initializedInstance

	^StrokeInputMorph strokeMorph! !

!EditorwithStrokeInput class methodsFor: 'new-morph participation' stamp: 'KenD 9/18/2024 09:53:21'!
categoryInNewMorphMenu

	^ 'Stroke Input'! !

!EditorwithStrokeInput class methodsFor: 'new-morph participation' stamp: 'KenD 9/18/2024 09:53:29'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!EditorwithStrokeInput class methodsFor: 'new-morph participation' stamp: 'KenD 9/18/2024 09:54:05'!
initializedInstance

	^EditorWithStrokeInput open! !

!EditorWithStrokeInput class methodsFor: 'instance creation' stamp: 'KenD 9/17/2024 16:39:05'!
open

	| newSelf textModelMorph innerTextMorph |
	newSelf := super open.
	textModelMorph := (newSelf layoutMorph submorphs at: 1).
	innerTextMorph := (textModelMorph submorphs at: 3).
	newSelf addMorph: (EditorStrokeInputMorph newFor: innerTextMorph editor). 
	newSelf morphExtent: (newSelf minimumExtent x @ newSelf morphExtent y + 40).
	^newSelf! !

!CompassExemplar methodsFor: 'accessing' stamp: 'KenD 9/9/2024 14:47:59'!
at: patternIndex 

	^pattern at: patternIndex ! !

!CompassExemplar methodsFor: 'accessing' stamp: 'KenD 9/9/2024 14:47:24'!
name 

	^name! !

!CompassExemplar methodsFor: 'accessing' stamp: 'KenD 9/9/2024 14:47:32'!
pattern 

	^pattern! !

!CompassExemplar methodsFor: 'initialization' stamp: 'KenD 9/15/2024 15:02:06'!
name: aStringOrSymbol pattern: aCompassPatternOrDIrectionArray

	name := aStringOrSymbol asSymbol.
	(aCompassPatternOrDIrectionArray class = CompassPattern) 
		ifTrue: [ pattern := aCompassPatternOrDIrectionArray pattern]
		ifFalse: [ 	pattern := aCompassPatternOrDIrectionArray 	].! !

!CompassExemplar methodsFor: 'comparing' stamp: 'KenD 9/9/2024 15:28:35'!
compare: aCompassPattern

	"Answer an association: float->name
	 where float is the number of exact matches with my pattern
	 divided by the size of the pattern."
	
	| numSame numElts |
	"Invariant: 1st point location from center MUST match!!"
	((pattern at: 1) = (aCompassPattern at: 1)) ifFalse: [ ^ 0->name ].
	
	numSame := 1.
	numElts := aCompassPattern pattern size.
	2 to: numElts do: [ :index |
			(pattern at: index) = (aCompassPattern at: index)
			ifTrue: [ numSame := numSame + 1 ]
	].

	^ (numSame / numElts) asFloat -> name! !

!CompassExemplar methodsFor: 'printing' stamp: 'KenD 9/15/2024 15:02:20'!
printOn: aStream
	
	aStream nextPutAll: '(CompassExemplar name: ';
	 	print: self name;
	 	nextPutAll: ' pattern: ';
	 	print: self pattern.
	aStream nextPut: $)! !

!CompassExemplar class methodsFor: 'instance creation' stamp: 'KenD 9/9/2024 14:07:25'!
name: aStringOrSymbol pattern: aCompassPattern

	^self new name: aStringOrSymbol pattern: aCompassPattern! !

!CompassPattern methodsFor: 'processing' stamp: 'KenD 9/9/2024 15:09:54'!
centroid: aPointCollection

	| sumX sumY numPoints |
	sumX := 0.
	sumY := 0.
	aPointCollection do: [ :pt |
		sumX := sumX + pt x.
		sumY := sumY + pt y.
	].
	numPoints := aPointCollection size.
	^(sumX / numPoints) @ (sumY / numPoints)! !

!CompassPattern methodsFor: 'processing' stamp: 'KenD 9/9/2024 13:42:16'!
pathLength: pointCollection
	"Answer culumative distance between Points in a Collection."

	| distance lastP currentP |
	distance := 0.
	lastP := pointCollection first.
	2 to: pointCollection size do: [:i |
		currentP := pointCollection at: i.
		distance := distance + (lastP dist: currentP).
		lastP := currentP.
	].

	^ distance! !

!CompassPattern methodsFor: 'processing' stamp: 'KenD 9/11/2024 16:26:45'!
resample: samplePointCollection with: desiredNumPoints
	"Take a Collection of Points and answer a collection 
	 resampled to length desiredNumPoints."
	
	| d newPoints dd q currentP ii lastP i |
	ii := (self pathLength: samplePointCollection) 
		/ (desiredNumPoints - 1) asFloat.
	dd := 0.
	newPoints := OrderedCollection with: samplePointCollection first.
	i := 2.
	[i <= samplePointCollection size] whileTrue: [
		lastP := samplePointCollection at: i - 1.
		currentP := samplePointCollection at: i.
		d := lastP dist: currentP.
		dd + d >= ii ifTrue: [
			q := lastP + (((ii - dd) / d) * (currentP - lastP)).
			newPoints add: q.
			samplePointCollection add: q beforeIndex: i.
			dd := 0]
		ifFalse: [
			dd := dd + d
		].
		i := i + 1].
	newPoints size = (desiredNumPoints - 1) 
		ifTrue: [newPoints add: samplePointCollection last].
"Transcript log: 'RESAMPLE ', newPoints printString."
	^ newPoints.! !

!CompassPattern methodsFor: 'processing' stamp: 'KenD 9/11/2024 16:26:51'!
translatePointsIn: aPointCollection toOrigin: newOrigin
" Translate point position from Morph sample position.
 *->x - -             --------
 |                |            |        y        |
 v               |            |        ^        |
 y               |  ==>  |        * > x  |
 |                |            |                   |             
 | ------            |--------
"
	| translated |
	translated := OrderedCollection new.
	aPointCollection do: [ :pt | | newPt |
		newPt := pt - newOrigin. "translate"
		" invert Y axis"
		translated add: ( newPt x @ (newPt y) negated )
	].
"Transcript log: 'TRANSLATED ', translated printString."
	^ translated! !

!CompassPattern methodsFor: 'initialization' stamp: 'KenD 9/11/2024 16:21:56'!
fromPoints: aPointCollection

	| sampleColl directionColl center prevPt isPeriod |
	sampleColl := self translatePointsIn: (self resample: aPointCollection 
											with: SampleSize)
	 				   toOrigin: (50@50).
	directionColl := OrderedCollection new.
	center := self centroid: sampleColl.
	prevPt := sampleColl at: 1.
	isPeriod := (center dist: prevPt) <= CloseDistance.
	2 to: sampleColl size do: [ :index | | currentPt |
		currentPt := sampleColl at: index.
		((center dist: prevPt) > CloseDistance) ifTrue: [isPeriod:= false].
		directionColl add: (center point2direction: prevPt).
		directionColl add: (prevPt point2direction: currentPt).
		prevPt := currentPt.
	].
	directionColl add: (center point2direction: sampleColl last).
	
	directionVector := (isPeriod) ifTrue: [PeriodArray] ifFalse: [directionColl asArray]
	! !

!CompassPattern methodsFor: 'accessing' stamp: 'KenD 9/9/2024 14:49:46'!
at: index

	"My pattern to match is my directionVector."
	^directionVector at: index! !

!CompassPattern methodsFor: 'accessing' stamp: 'KenD 9/10/2024 14:44:01'!
directionsFromCentroid
	"Answer array of direction names"

	| names |
	names := OrderedCollection new.
	1 to: directionVector size do: [ :index |
		(index odd) ifTrue: [ names add: (directionVector at: index)]
	].
	^ names asArray! !

!CompassPattern methodsFor: 'accessing' stamp: 'KenD 9/9/2024 14:49:25'!
pattern

	"My pattern to match is my directionVector."
	^directionVector ! !

!CompassPattern methodsFor: 'accessing' stamp: 'KenD 9/15/2024 14:07:55'!
pattern: directionSymbolVec

	"My pattern to match is my directionVector."
	directionVector := directionSymbolVec! !

!CompassPattern methodsFor: 'accessing' stamp: 'KenD 9/10/2024 14:45:11'!
pointTravelDirections
	"Answer array of direction names
	 (directions from one point to next)"

	| names |
	names := OrderedCollection new.
	1 to: directionVector size do: [ :index |
		(index even) ifTrue: [ names add: (directionVector at: index)]
	].
	^ names asArray! !

!CompassPattern class methodsFor: 'class initialization' stamp: 'KenD 9/10/2024 04:38:31'!
initialize
" self initialize "
	| patternArraySize |
	SampleSize := 16. "Noted from $1 Protractor"
	CloseDistance := 10. "Sensitive tuning parameter"
	patternArraySize := (2 * SampleSize) - 1.
	PeriodArray := Array new: patternArraySize.
	1 to: patternArraySize do: [ :index |
		PeriodArray 
			at: index 
			put: ((index odd) ifTrue: [#center] ifFalse: [#ignored])
		].! !

!CompassPattern class methodsFor: 'instance creation' stamp: 'KenD 9/9/2024 14:03:42'!
fromPoints: aPointCollection

	^self new fromPoints: aPointCollection! !

!CompassPattern class methodsFor: 'accessing' stamp: 'KenD 9/10/2024 04:41:40'!
periodArray

	^PeriodArray ! !

!CompassPattern class methodsFor: 'accessing' stamp: 'KenD 9/15/2024 14:11:56'!
periodPattern

	^ CompassPattern new :: pattern: PeriodArray ! !

!CompassRecognizer methodsFor: 'initialization' stamp: 'KenD 9/15/2024 14:13:46'!
initialize

	exemplars := OrderedCollection new.
	exemplars add: (CompassExemplar 
		name: 'Period' 
		pattern: CompassPattern periodPattern).! !

!CompassRecognizer methodsFor: 'testing' stamp: 'KenD 9/9/2024 15:31:01'!
bestMatch: aCompassPattern

	"Check sampled pattern against exemplars and find highest score"
	| bestMatch |
	bestMatch := 0->nil.
	exemplars do: [ :ex | | matchResult |
		matchResult := ex compare: aCompassPattern.
		(matchResult key > bestMatch key)
			ifTrue: [ bestMatch := matchResult ]
	].

	^ bestMatch! !

!CompassRecognizer methodsFor: 'updating' stamp: 'KenD 9/9/2024 14:55:40'!
addExemplar: aCompassExemplar

	(exemplars size isZero) 
		ifTrue: [ 	exemplars add: aCompassExemplar ]
		ifFalse: [ | pat | "Check for duplicates & warn"
			pat := aCompassExemplar pattern.
			exemplars do: [ :ex |
				(pat = ex pattern)
					ifTrue: [ self inform: 'Duplicate patterns ',
							ex name asString, ' and ',
							aCompassExemplar name asString
					].
			].
			self flag: #DuplicatesAllowed.
			"Add anyway.  REVISIT??"
			 exemplars add: aCompassExemplar
		]! !

!CompassRecognizer methodsFor: 'updating' stamp: 'KenD 9/16/2024 11:51:59'!
useBaseExemplars

	exemplars := CompassRecognizer basePatterns ! !

!CompassRecognizer methodsFor: 'updating' stamp: 'KenD 9/15/2024 15:05:49'!
useExemplars: aCompassExemplarOrderedCollection

	exemplars := aCompassExemplarOrderedCollection! !

!CompassRecognizer methodsFor: 'updating' stamp: 'KenD 9/16/2024 11:52:08'!
useNumberExemplars

	exemplars := CompassRecognizer numberPatterns ! !

!CompassRecognizer methodsFor: 'updating' stamp: 'KenD 9/16/2024 11:52:16'!
usePunctuationExemplars

	exemplars := CompassRecognizer punctuationPatterns ! !

!CompassRecognizer class methodsFor: 'accessing' stamp: 'KenD 9/11/2024 16:59:21'!
basePatterns
	
	^BasePatterns! !

!CompassRecognizer class methodsFor: 'accessing' stamp: 'KenD 9/11/2024 17:00:15'!
basePatterns: patternExemplars
	
	BasePatterns := patternExemplars! !

!CompassRecognizer class methodsFor: 'accessing' stamp: 'KenD 9/11/2024 16:59:32'!
numberPatterns
	
	^NumberPatterns! !

!CompassRecognizer class methodsFor: 'accessing' stamp: 'KenD 9/11/2024 17:08:01'!
numberPatterns: patternExemplars
	
	NumberPatterns := patternExemplars! !

!CompassRecognizer class methodsFor: 'accessing' stamp: 'KenD 9/11/2024 16:59:43'!
punctuationPatterns
	
	^PunctuationPatterns! !

!CompassRecognizer class methodsFor: 'accessing' stamp: 'KenD 9/18/2024 12:41:38'!
punctuationPatterns: patternExemplars
	
	PunctuationPatterns := patternExemplars! !

!CompassRecognizer class methodsFor: 'instance creation' stamp: 'KenD 9/15/2024 15:53:59'!
useBase

	^ self new :: useBaseExemplars ! !

!CompassRecognizer class methodsFor: 'instance creation' stamp: 'KenD 9/15/2024 15:53:48'!
useNumbers

	^ self new :: useNumberExemplars ! !

!CompassRecognizer class methodsFor: 'class initialization' stamp: 'KenD 9/18/2024 12:38:25'!
initBase

	BasePatterns :=
{ 
"Controls"
(CompassExemplar name: #Period pattern:  #(#center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center)) .
(CompassExemplar name: #Space pattern: #(#West #East #West #East #West #East #West #East #West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #East #East #East #East #East #East #East #East)).
(CompassExemplar name: #BackSpace pattern: #(#East #West #East #West #East #West #East #West #East #West #East #West #East #West #East #West #West #West #West #West #West #West #West #West #West #West #West #West #West #West #West)) .
(CompassExemplar name: #Return pattern: #(#NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest)).
(CompassExemplar name: #CharRight pattern: #(#West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #East #East #West #East #West #East #West #East #West #West #West #West #West #West #West #West)) .
(CompassExemplar name: #CharLeft pattern: #(#East #West #East #West #East #West #West #West #West #West #West #West #West #West #West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #East #East)).
(CompassExemplar name: #UpcaseNext pattern: #(#South #North #South #North #South #North #South #North #South #North #South #North #South #North #South #North #North #North #North #North #North #North #North #North #North #North #North #North #North #North #North)).
"Letters"
(CompassExemplar name: #A pattern: #(#SouthWest #North #SouthWest #North #SouthWest #North #West #North #West #North #NorthWest #North #North #North #North #East #North #South #North #South #NorthEast #South #East #South #East #South #SouthEast #South #SouthEast #SouthEast #SouthEast)) .
(CompassExemplar name: #B pattern: #(#North #South #West #South #SouthWest #North #SouthWest #North #NorthWest #North #North #East #North #SouthEast #NorthEast #SouthWest #NorthEast #West #West #East #West #East #East #SouthEast #East #SouthWest #South #West #South #West #SouthWest)).
 (CompassExemplar name: #C pattern: #(#NorthEast #NorthWest #North #NorthWest #North #West #North #SouthWest #North #South #North #South #NorthWest #South #West #South #West #South #SouthWest #South #South #SouthEast #South #East #South #East #South #NorthEast #South #NorthEast #SouthEast)) .
 (CompassExemplar name: #D pattern: #(#North #South #NorthWest #South #West #South #South #South #South #North #South #North #West #North #North #North #North #East #North #East #NorthEast #South #East #South #East #South #SouthEast #SouthWest #South #West #South)) .
 (CompassExemplar name: #E pattern: #(#NorthEast #NorthWest #North #West #North #SouthWest #North #South #NorthWest #SouthEast #NorthWest #East #North #East #East #West #NorthEast #West #West #SouthWest #SouthWest #South #South #South #South #East #South #East #South #NorthEast #SouthEast)). "expected E"
 (CompassExemplar name: #E pattern: #(#North #West #North #West #North #SouthWest #North #South #North #SouthEast #North #East #East #NorthWest #NorthEast #West #North #SouthWest #West #SouthWest #SouthWest #South #SouthWest #SouthEast #South #SouthEast #South #East #South #East #South)) . "ALt E"
 (CompassExemplar name: #F pattern: #(#South #North #South #North #South #North #South #North #South #North #South #North #SouthWest #North #West #North #NorthWest #North #North #North #North #East #North #East #North #East #North #East #NorthEast #East #NorthEast)). "Upward F"
 (CompassExemplar name: #F pattern: #(#NorthEast #West #NorthEast #West #North #West #North #West #North #West #North #South #North #South #North #South #NorthWest #South #SouthWest #South #South #South #South #South #South #South #South #South #South #South #South)). "Downward F"
 (CompassExemplar name: #G pattern: #(#North #West #North #West #North #West #North #SouthWest #NorthWest #South #West #South #West #South #SouthWest #SouthEast #South #East #South #East #South #North #SouthEast #West #South #East #South #East #SouthEast #East #East)).
(CompassExemplar name: #H pattern: #(#North #South #North #South #North #South #NorthWest #South #West #South #SouthWest #South #South #West #South #North #SouthWest #North #West #NorthEast #North #East #East #SouthEast #East #SouthEast #East #South #SouthEast #South #SouthEast)).
(CompassExemplar name: #I pattern: #(#North #South #North #South #North #South #North #South #North #South #North #South #North #South #North #South #South #South #South #South #South #South #South #South #South #South #South #South #South #South #South)).
(CompassExemplar name: #J pattern: #(#North #South #North #South #North #South #North #South #North #South #NorthEast #South #East #South #SouthEast #South #South #South #South #SouthWest #South #West #South #West #South #West #SouthWest #West #SouthWest #NorthWest #SouthWest)).
 (CompassExemplar name: #K pattern: #(#NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #East #SouthWest #South #West #SouthWest #West #West #NorthWest #West #North #West #East #West #East #NorthWest #East #North #SouthEast #East #SouthEast #SouthEast #South #SouthEast #South #SouthEast)).
 (CompassExemplar name: #L pattern: #(#North #South #North #South #North #South #North #South #North #South #NorthWest #South #West #South #SouthWest #South #South #South #South #South #South #East #South #East #South #East #SouthEast #East #SouthEast #East #SouthEast)) .
 (CompassExemplar name: #M pattern: #(#SouthWest #North #SouthWest #North #West #North #West #North #NorthWest #NorthEast #North #South #North #South #North #South #South #North #North #North #North #East #NorthEast #South #East #South #East #South #SouthEast #South #SouthEast)) .
 (CompassExemplar name: #N pattern: #(#SouthWest #North #West #North #West #North #NorthWest #North #North #South #NorthWest #SouthEast #NorthWest #South #South #South #South #South #South #North #South #North #SouthEast #North #East #North #NorthEast #North #NorthEast #North #NorthEast)) .
 (CompassExemplar name: #O pattern: #(#North #West #North #SouthWest #North #SouthWest #NorthWest #South #West #South #West #South #SouthWest #SouthEast #South #East #South #East #South #NorthEast #South #NorthEast #SouthEast #North #East #North #East #North #NorthEast #NorthWest #North)) .
 (CompassExemplar name: #P pattern: #(#North #South #NorthWest #South #SouthWest #South #South #South #South #North #South #North #South #North #West #North #North #North #North #East #North #East #NorthEast #South #NorthEast #South #East #SouthWest #SouthEast #West #South)) .
 (CompassExemplar name: #Q pattern: #(#North #West #North #SouthWest #NorthWest #SouthWest #West #South #SouthWest #South #SouthWest #SouthEast #South #East #South #NorthEast #South #North #SouthEast #North #East #North #NorthEast #NorthWest #North #East #North #East #NorthEast #East #NorthEast)) .
 (CompassExemplar name: #R pattern: #(#North #South #NorthWest #South #SouthWest #South #South #North #South #North #West #North #NorthWest #NorthEast #North #East #North #South #NorthEast #SouthWest #NorthWest #West #West #East #SouthEast #East #East #SouthEast #SouthEast #South #SouthEast)) .
 (CompassExemplar name: #S pattern: #(#North #West #North #West #North #SouthWest #North #South #NorthWest #SouthEast #NorthWest #East #North #East #East #East #East #South #SouthEast #South #SouthEast #SouthWest #South #West #South #NorthWest #South #NorthWest #SouthWest #North #West)) .
 (CompassExemplar name: #T pattern: #(#NorthWest #East #North #East #North #East #North #East #North #SouthEast #North #South #North #South #North #South #East #South #SouthEast #South #South #South #South #South #South #South #South #South #South #South #South)) .
 (CompassExemplar name: #U pattern: #(#NorthWest #South #NorthWest #South #West #South #West #South #SouthWest #South #SouthWest #South #South #East #South #East #South #NorthEast #South #North #SouthEast #North #East #North #East #North #NorthEast #North #NorthEast #North #NorthEast)) .
 (CompassExemplar name: #V pattern: #(#NorthWest #South #NorthWest #South #West #South #SouthWest #South #South #South #South #South #South #North #South #North #South #North #South #North #North #North #North #North #North #East #North #SouthEast #NorthEast #East #NorthEast)) .
 (CompassExemplar name: #W pattern: #(#NorthWest #South #West #South #West #South #West #East #SouthWest #East #South #North #SouthWest #North #North #South #North #South #South #South #South #East #SouthEast #East #SouthEast #North #East #North #East #North #NorthEast)) . "expected W"
 (CompassExemplar name: #W pattern: #(#North #South #NorthWest #South #West #South #West #South #West #South #SouthWest #East #South #NorthEast #South #East #South #South #South #East #South #NorthEast #SouthEast #NorthEast #East #North #East #North #NorthEast #North #NorthEast)) . "alt W"
 (CompassExemplar name: #X pattern: #(#NorthWest #SouthEast #NorthWest #SouthEast #NorthWest #SouthEast #South #SouthEast #South #SouthEast #SouthEast #North #SouthEast #North #East #North #NorthEast #North #North #North #North #South #North #SouthWest #North #South #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest)) .
 (CompassExemplar name: #Y pattern: #(#North #South #NorthWest #South #NorthWest #East #North #NorthEast #North #South #North #South #East #South #SouthEast #South #South #West #South #West #South #North #SouthWest #NorthEast #SouthWest #NorthEast #South #NorthEast #East #North #NorthEast)) . "Y"
 (CompassExemplar name: #Y pattern: #(#North #South #NorthWest #South #West #North #North #North #North #South #North #South #East #South #South #South #South #West #South #West #SouthWest #North #SouthWest #NorthEast #SouthWest #East #East #East #East #NorthEast #East)) . "alt Y"
 (CompassExemplar name: #Z pattern: #(#North #East #North #East #North #East #North #South #NorthEast #SouthWest #North #SouthWest #North #SouthWest #West #SouthWest #West #SouthWest #SouthWest #South #SouthWest #East #South #East #South #East #South #East #SouthEast #East #SouthEast)) .
} asOrderedCollection.

	! !

!CompassRecognizer class methodsFor: 'class initialization' stamp: 'KenD 9/19/2024 11:52:51'!
initNumbers

	NumberPatterns :=
{ 
"Controls"
(CompassExemplar name: #Period pattern:  #(#center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center)) .
(CompassExemplar name: #Space pattern: #(#West #East #West #East #West #East #West #East #West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #East #East #East #East #East #East #East #East)).
(CompassExemplar name: #BackSpace pattern: #(#East #West #East #West #East #West #East #West #East #West #East #West #East #West #East #West #West #West #West #West #West #West #West #West #West #West #West #West #West #West #West)) .
(CompassExemplar name: #Return pattern: #(#NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest)).
(CompassExemplar name: #CharRight pattern: #(#West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #East #East #West #East #West #East #West #East #West #West #West #West #West #West #West #West)) .
(CompassExemplar name: #CharLeft pattern: #(#East #West #East #West #East #West #West #West #West #West #West #West #West #West #West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #East #East)).
(CompassExemplar name: #UpcaseNext pattern: #(#South #North #South #North #South #North #South #North #South #North #South #North #South #North #South #North #North #North #North #North #North #North #North #North #North #North #North #North #North #North #North)).
"Number Digits"
(CompassExemplar name: #'0' pattern: #(#North #West #North #West #North #SouthWest #NorthWest #SouthWest #NorthWest #South #West #South #West #SouthEast #SouthWest #SouthEast #South #East #South #East #South #NorthEast #SouthEast #NorthEast #East #North #East #North #East #NorthWest #NorthEast)).
 (CompassExemplar name: #'1' pattern: #(#North #SouthWest #North #South #North #South #North #South #North #South #North #South #North #South #North #South #South #South #South #South #South #South #South #South #South #South #South #South #South #South #South)).
 (CompassExemplar name: #'2' pattern: #(#NorthWest #East #North #East #North #East #North #South #North #South #NorthEast #South #East #SouthWest #South #SouthWest #South #SouthWest #SouthWest #SouthWest #SouthWest #East #South #East #South #East #South #East #SouthEast #East #SouthEast)). 
(CompassExemplar name: #'2' pattern: #(#NorthWest #North #North #East #North #East #North #SouthEast #North #South #NorthEast #South #East #SouthWest #South #SouthWest #South #SouthWest #South #SouthWest #SouthWest #East #South #East #South #East #South #East #SouthEast #East #SouthEast)). 
(CompassExemplar name: #'2' pattern: #(#NorthWest #North #North #East #North #East #North #SouthEast #North #South #NorthEast #South #NorthEast #South #SouthEast #SouthWest #South #SouthWest #South #SouthWest #SouthWest #East #SouthWest #East #South #East #South #East #South #East #SouthEast)). 
(CompassExemplar name: #'3' pattern: #(#North #East #North #East #North #SouthEast #North #South #North #SouthWest #North #SouthWest #NorthWest #SouthEast #NorthWest #East #East #SouthEast #East #South #SouthEast #South #South #SouthWest #South #West #South #West #South #NorthWest #SouthWest)).
 (CompassExemplar name: #'3' pattern: #(#NorthWest #NorthEast #North #East #North #South #North #South #North #SouthWest #West #NorthEast #North #East #North #East #NorthEast #South #East #South #SouthEast #South #SouthEast #SouthWest #South #West #South #West #South #NorthWest #SouthWest)). 
(CompassExemplar name: #'4' pattern: #(#North #South #North #South #North #South #North #South #NorthWest #SouthWest #West #SouthWest #West #South #SouthWest #South #SouthWest #East #SouthWest #East #South #East #South #East #SouthEast #East #SouthEast #East #SouthEast #East #East)). 
(CompassExemplar name: #'5' pattern: #(#North #West #North #West #North #South #North #South #NorthWest #East #North #East #NorthEast #SouthEast #East #South #East #South #SouthEast #SouthWest #South #West #South #West #South #West #South #NorthWest #SouthWest #North #West)). 
(CompassExemplar name: #'5' pattern: #(#North #West #North #West #North #West #North #South #North #South #NorthWest #East #North #East #NorthEast #South #East #South #SouthEast #South #South #SouthWest #South #West #South #West #South #NorthWest #SouthWest #North #West)).
 (CompassExemplar name: #'5' pattern: #(#NorthEast #West #North #West #North #West #North #SouthWest #NorthWest #South #West #East #NorthWest #East #NorthEast #East #East #South #East #South #SouthEast #SouthWest #South #West #South #West #South #NorthWest #SouthWest #North #West)).
 (CompassExemplar name: #'6' pattern: #(#North #SouthWest #North #SouthWest #North #South #NorthWest #South #West #South #West #South #SouthWest #East #South #East #South #East #South #NorthEast #SouthEast #North #East #North #East #West #NorthEast #SouthWest #South #SouthWest #SouthWest)) .
(CompassExemplar name: #'6' pattern: #(#North #South #North #South #North #South #North #South #NorthWest #South #West #South #SouthWest #South #SouthWest #East #South #East #South #East #South #NorthEast #SouthEast #North #East #NorthWest #East #West #SouthEast #West #SouthWest)) .
(CompassExemplar name: #'7' pattern: #(#NorthWest #East #North #East #North #East #North #East #North #East #North #South #NorthEast #South #NorthEast #South #NorthEast #South #SouthEast #South #South #South #South #South #South #South #South #South #South #South #South)). 
(CompassExemplar name: #'8' pattern: #(#North #West #North #SouthWest #North #South #NorthWest #SouthEast #North #SouthEast #East #South #SouthEast #South #South #SouthWest #South #West #South #NorthWest #SouthWest #North #SouthWest #NorthEast #West #NorthEast #North #NorthEast #NorthEast #North #North)) . 
(CompassExemplar name: #'9' pattern: #(#NorthEast #NorthWest #North #West #North #West #North #SouthWest #NorthWest #South #West #South #West #SouthEast #SouthWest #East #South #NorthEast #East #North #NorthEast #South #East #South #SouthEast #South #South #South #South #South #South)). 
(CompassExemplar name: #'9' pattern: #(#West #NorthWest #West #North #NorthWest #North #North #NorthEast #North #East #North #SouthEast #North #SouthEast #NorthEast #South #NorthEast #South #East #South #SouthEast #South #South #SouthWest #South #South #South #South #South #North #South)). 
(CompassExemplar name: #'9' pattern: #(#North #NorthWest #North #West #North #SouthWest #NorthWest #South #West #South #West #East #SouthWest #NorthEast #South #NorthEast #East #NorthEast #NorthEast #North #NorthEast #South #East #South #South #South #South #South #South #South #South)) .
} asOrderedCollection.

	! !

!CompassRecognizer class methodsFor: 'class initialization' stamp: 'KenD 9/19/2024 11:53:58'!
initPunctuation

	PunctuationPatterns :=
	 {(CompassExemplar name: #Period pattern: #(#center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center #ignored #center)). 
(CompassExemplar name: #Space pattern: #(#West #East #West #East #West #East #West #East #West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #East #East #East #East #East #East #East #East)).
(CompassExemplar name: #BackSpace pattern: #(#East #West #East #West #East #West #East #West #East #West #East #West #East #West #East #West #West #West #West #West #West #West #West #West #West #West #West #West #West #West #West)) .
(CompassExemplar name: #Return pattern: #(#NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest)).
(CompassExemplar name: #CharRight pattern: #(#West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #East #East #West #East #West #East #West #East #West #West #West #West #West #West #West #West)) .
(CompassExemplar name: #CharLeft pattern: #(#East #West #East #West #East #West #West #West #West #West #West #West #West #West #West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #East #East)).

 (CompassExemplar name: #? pattern: #(#NorthWest #NorthEast #NorthWest #East #North #East #North #East #North #East #North #SouthEast #NorthEast #South #NorthEast #South #East #South #SouthEast #SouthWest #South #West #South #SouthWest #South #South #South #South #South #South #South)). 
 (CompassExemplar name: #, pattern: #(#North #SouthWest #North #SouthWest #North #South #North #South #North #South #North #South #North #South #NorthEast #SouthWest #South #SouthWest #South #South #South #South #South #South #South #South #South #SouthWest #South #South #South)). 
 (CompassExemplar name: #!! pattern: #(#South #North #South #North #South #North #South #North #South #North #South #North #South #North #South #North #North #North #North #North #North #North #North #North #North #North #North #North #North #North #North)). 
 (CompassExemplar name: #'''' pattern: #(#North #South #North #South #North #South #North #South #North #South #North #South #North #South #North #South #South #South #South #South #South #South #South #South #South #South #South #South #South #South #South)). 
 (CompassExemplar name: #'"' pattern: #(#West #North #West #North #West #North #NorthWest #NorthEast #NorthWest #SouthEast #North #South #North #South #West #South #South #SouthEast #South #SouthEast #South #East #SouthEast #North #SouthEast #North #East #North #East #North #East)). 
 (CompassExemplar name: #- pattern: #(#West #East #West #East #West #East #West #East #West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #East #East #East #East #East #East #East #East)). 
 (CompassExemplar name: #_ pattern: #(#West #East #West #East #West #East #West #East #East #East #East #East #East #East #East #NorthEast #East #West #East #West #East #West #East #West #West #West #West #West #West #West #West)). 
 (CompassExemplar name: #+ pattern: #(#North #SouthWest #North #SouthWest #North #South #North #South #SouthWest #SouthWest #SouthWest #West #SouthWest #North #West #North #West #NorthEast #NorthWest #SouthEast #North #SouthEast #North #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast)). 
 (CompassExemplar name: #* pattern: #(#NorthWest #South #NorthWest #South #West #SouthEast #SouthWest #SouthEast #South #East #SouthEast #East #East #NorthEast #East #North #East #NorthWest #NorthEast #West #NorthEast #SouthWest #North #SouthWest #West #SouthWest #SouthWest #SouthWest #SouthWest #South #SouthWest)). 
 (CompassExemplar name: #'(' pattern: #(#North #SouthWest #North #SouthWest #North #SouthWest #North #South #North #South #North #South #NorthWest #South #West #South #SouthWest #South #South #South #South #SouthEast #South #SouthEast #South #SouthEast #South #SouthEast #South #SouthEast #South)). 
 (CompassExemplar name: #')' pattern: #(#North #East #North #East #North #SouthEast #North #SouthEast #North #South #North #South #NorthEast #South #East #South #East #South #SouthEast #South #South #SouthWest #South #SouthWest #South #SouthWest #South #SouthWest #South #SouthWest #South)). 
 (CompassExemplar name: #'{' pattern: #(#North #West #North #West #North #SouthWest #North #South #NorthWest #SouthEast #North #East #North #East #East #West #NorthEast #West #West #SouthWest #SouthWest #South #South #South #South #SouthEast #South #East #South #East #South)). 
 (CompassExemplar name: #'}' pattern: #(#North #East #North #East #North #SouthEast #North #South #North #West #North #West #NorthWest #South #NorthWest #East #North #SouthEast #East #South #SouthEast #South #SouthEast #SouthWest #South #West #South #West #South #NorthWest #South)). 
 (CompassExemplar name: #'[' pattern: #(#SouthEast #West #South #SouthWest #South #West #South #West #South #North #SouthWest #North #SouthWest #NorthEast #SouthEast #East #East #West #North #NorthWest #NorthWest #NorthWest #NorthWest #North #North #NorthEast #North #East #North #East #North)). 
 (CompassExemplar name: #']' pattern: #(#South #East #South #East #South #NorthEast #South #North #SouthEast #North #SouthEast #West #SouthEast #West #SouthWest #NorthWest #West #NorthEast #North #NorthEast #NorthEast #North #North #NorthWest #North #North #North #West #North #West #North)). 
 (CompassExemplar name: #< pattern: #(#SouthEast #West #SouthEast #NorthWest #SouthEast #West #South #West #South #West #SouthWest #NorthWest #West #West #West #NorthWest #West #NorthEast #West #NorthEast #NorthWest #East #North #East #North #East #North #East #NorthEast #NorthEast #NorthEast)). 
 (CompassExemplar name: #> pattern: #(#South #NorthEast #South #NorthEast #South #NorthEast #South #NorthEast #South #NorthEast #SouthEast #NorthEast #East #NorthEast #East #North #East #West #NorthEast #West #NorthEast #West #North #West #North #West #North #NorthWest #NorthWest #West #NorthWest)). 
 (CompassExemplar name: #'^' pattern: #(#SouthWest #NorthEast #SouthWest #North #SouthWest #North #West #NorthEast #West #North #NorthWest #North #North #North #North #East #North #SouthEast #North #SouthEast #NorthEast #South #East #South #East #SouthEast #East #South #SouthEast #SouthEast #SouthEast)). 
 (CompassExemplar name: #@ pattern: #(#North #West #North #SouthWest #NorthWest #South #West #South #West #South #SouthWest #South #SouthWest #SouthEast #South #East #South #East #South #NorthEast #SouthEast #NorthEast #East #North #East #North #NorthEast #NorthWest #NorthEast #NorthWest #North)). 
 (CompassExemplar name: #= pattern: #(#NorthWest #East #North #East #North #East #North #East #North #SouthWest #North #SouthWest #North #SouthWest #West #SouthWest #SouthWest #SouthWest #SouthWest #SouthEast #SouthWest #East #South #East #South #East #South #East #SouthEast #East #SouthEast)). 
 (CompassExemplar name: #~ pattern: #(#East #South #East #South #East #South #East #West #SouthEast #West #SouthEast #West #SouthEast #NorthWest #South #NorthWest #West #NorthWest #NorthWest #North #NorthWest #West #NorthWest #West #West #SouthWest #West #SouthWest #West #South #West)). 
 (CompassExemplar name: #/ pattern: #(#SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #North #SouthWest #North #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #North #North #North #NorthEast #North #NorthEast #NorthEast #NorthEast #NorthEast #NorthEast #NorthEast #NorthEast #NorthEast #NorthEast #NorthEast)). 
 (CompassExemplar name: #\ pattern: #(#NorthWest #SouthEast #NorthWest #SouthEast #NorthWest #SouthEast #NorthWest #SouthEast #NorthWest #SouthEast #NorthWest #SouthEast #NorthWest #SouthEast #West #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast #SouthEast)). 
 (CompassExemplar name: #| pattern: #(#South #North #South #North #South #North #South #North #SouthEast #North #North #North #North #North #North #North #North #SouthWest #North #South #North #South #North #South #NorthWest #South #South #South #South #South #South)). 
 (CompassExemplar name: #'$' pattern: #(#North #NorthWest #North #West #North #SouthWest #North #South #North #South #NorthWest #SouthEast #NorthWest #SouthEast #NorthEast #East #East #SouthEast #East #South #SouthEast #South #South #SouthWest #South #West #South #NorthWest #South #North #South)). 
 (CompassExemplar name: #'#' pattern: #(#NorthWest #South #NorthWest #South #West #South #West #South #SouthWest #SouthEast #SouthWest #NorthEast #SouthWest #North #SouthWest #NorthEast #North #North #North #NorthEast #NorthEast #East #NorthEast #South #East #South #East #South #East #South #SouthEast)). 
 (CompassExemplar name: #& pattern: #(#North #West #North #West #North #South #NorthWest #South #NorthWest #SouthEast #SouthEast #SouthEast #SouthEast #South #SouthEast #SouthWest #South #West #South #West #South #North #SouthWest #NorthEast #SouthWest #NorthEast #SouthEast #North #NorthEast #North #North)). 
 (CompassExemplar name: #% pattern: #(#West #East #West #SouthEast #West #South #South #West #SouthWest #North #West #NorthEast #West #East #North #East #NorthEast #SouthEast #East #South #SouthEast #NorthWest #South #North #North #NorthEast #NorthEast #East #East #East #East)). 
 (CompassExemplar name: #Tab pattern: #(#South #North #South #North #South #North #South #North #South #North #SouthWest #North #West #North #NorthWest #North #North #North #North #East #North #East #North #East #North #East #NorthEast #East #NorthEast #East #NorthEast)). 
 (CompassExemplar name: #: pattern: #(#North #South #North #South #North #South #NorthWest #South #South #South #South #South #South #South #South #North #South #North #South #North #South #North #SouthEast #North #NorthEast #North #North #North #North #North #North)). 
 (CompassExemplar name: #';' pattern: #(#NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #South #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #SouthWest #NorthEast #NorthEast #NorthEast #NorthEast #NorthEast #NorthEast #NorthEast #NorthEast)). 
} asOrderedCollection.

! !

!CompassRecognizer class methodsFor: 'class initialization' stamp: 'KenD 9/18/2024 12:36:17'!
initialize
"
	self initialize.
"
	self initBase;
		initNumbers;
		initPunctuation.
	
	! !

!Point methodsFor: '*ui-strokerecognizer' stamp: 'KenD 9/11/2024 16:33:22'!
point2direction

	"Answer compass direction point is closest to, considering (0,0) as origin and (0,1) as North.
	 Compass directions are every 45 degrees or (pi/4 radians), 
	  so `close to direction` is within half of that."
	| absX absY absTangent whichThird |
	absX := self x abs.
	absY := self y abs.
	(absX isZero) ifTrue: [^(self y > 0) ifTrue: [#North] ifFalse: [#South]].
	(absY isZero) ifTrue: [^(self x > 0) ifTrue: [#East] ifFalse: [#West]].

	absTangent := absY / absX. "Map to 1st quadrant"
	(absTangent < (Float pi / 8)) 
		ifTrue: [ whichThird := #left ]
		ifFalse: [
			(absTangent < (3 * (Float pi / 8))) 
				ifTrue: [ whichThird := #middle ]
				ifFalse: [whichThird := #right ]
		].
	^(self x > 0) ifTrue: [
			(self y > 0) 
			ifTrue: ["quadrant 1"
				whichThird caseOf: 
				{[#left]->[#East].[#middle]->[#NorthEast].[#right]->[#North]}
			] 
			ifFalse: ["quadrant 2"
				whichThird caseOf: 
				{[#left]->[#East].[#middle]->[#SouthEast].[#right]->[#South]}
			]
		]
	  	ifFalse: [ "x < 0"
			(self y < 0) 
			ifTrue: ["quadrant 3"
				whichThird caseOf: 
				{[#left]->[#West].[#middle]->[#SouthWest].[#right]->[#South]}
			 ]
			ifFalse: ["quadrant 4"
				whichThird caseOf: 
				{[#left]->[#West].[#middle]->[#NorthWest].[#right]->[#North]}
			].
		].
	
	! !

!Point methodsFor: '*ui-strokerecognizer' stamp: 'KenD 9/11/2024 16:27:55'!
point2direction: outPoint

	"Answer compass direction point is closest to, considering self as origin"
	| offset |
	offset := outPoint - self.
	^offset point2direction! !
CompassPattern initialize!
CompassRecognizer initialize!
