'From Cuis7.1 [latest update: #6792] on 22 October 2024 at 1:23:49 pm'!
'Description Tools to create and investigate CompassRecognizer pattern exemplars.'!
!provides: 'UI-StrokeRecognizer-Tools' 1 3!
!requires: 'Cuis-Base' 71 6792 nil!
!requires: 'UI-StrokeRecognizer' 1 28 nil!
SystemOrganization addCategory: #'UI-StrokeRecognizer-Tools'!


!classDefinition: #CompassSampleCompareMorph category: #'UI-StrokeRecognizer-Tools'!
LinearLayoutMorph subclass: #CompassSampleCompareMorph
	instanceVariableNames: 'samples comparisonIndices'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer-Tools'!
!classDefinition: 'CompassSampleCompareMorph class' category: #'UI-StrokeRecognizer-Tools'!
CompassSampleCompareMorph class
	instanceVariableNames: ''!

!classDefinition: #CompassSampleSizeMorph category: #'UI-StrokeRecognizer-Tools'!
LinearLayoutMorph subclass: #CompassSampleSizeMorph
	instanceVariableNames: 'recognizer sample resultsArray'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer-Tools'!
!classDefinition: 'CompassSampleSizeMorph class' category: #'UI-StrokeRecognizer-Tools'!
CompassSampleSizeMorph class
	instanceVariableNames: ''!

!classDefinition: #CompassTrainingMorph category: #'UI-StrokeRecognizer-Tools'!
LinearLayoutMorph subclass: #CompassTrainingMorph
	instanceVariableNames: 'recognizer inputMorph sample result resultLabel button pointDirections strokeDirections'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer-Tools'!
!classDefinition: 'CompassTrainingMorph class' category: #'UI-StrokeRecognizer-Tools'!
CompassTrainingMorph class
	instanceVariableNames: ''!

!classDefinition: #CompassSampleMorph category: #'UI-StrokeRecognizer-Tools'!
CompassTrainingMorph subclass: #CompassSampleMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-StrokeRecognizer-Tools'!
!classDefinition: 'CompassSampleMorph class' category: #'UI-StrokeRecognizer-Tools'!
CompassSampleMorph class
	instanceVariableNames: ''!


!CompassSampleCompareMorph commentStamp: '<historical>' prior: 0!
I am a Row of CompassSampleMorphs.

As the samples each gather stroke info, I generate a comparisonIndices array
of boolean values indicating which sample CompassPatterns compare 
the same across all valid samples.

I give this array back to the #samples so that they can display matches (in black)
and mismatches (in red).

This allows for comparing gesture variants and close gestures (e.g. P, B, R, D) to find
differences significant enough to recognize.  We also want to avoid "false positives".

!

!CompassSampleSizeMorph commentStamp: '<historical>' prior: 0!
Compare input gesture at different sample size resolutions.

Useful to compare "close" distinctions, e.g. between $B $D $P $R.

What "sample resolution" gives crisp results?

Note: CompassTrainingMorph
!

!CompassTrainingMorph commentStamp: '<historical>' prior: 0!
I am a Morph useful to try out stroke recognition and add new pattern exemplars to recognizer.

Feature require: 'StrokeRecognizer'.
CompassTrainingMorph new openInHand.
StrokeInputMorph strokeMorph openInHand. "Shows PalmOS Graffiti gestures"!

!CompassSampleMorph commentStamp: '<historical>' prior: 0!
I am used to compare one of a number of stroke training samples.

I inform my owner of new samples and can colorize my results
to show matches and mis-matches.

See class CompassSampleCompareMorph.

!

!CompassSampleCompareMorph methodsFor: 'initialization' stamp: 'KenD 10/19/2024 15:39:15'!
initialize

	| sharedRecognizer |
	super initialize.
	sharedRecognizer := CompassRecognizer new. 
	1 to: 3 do: [ :idx | | sampler |
		sampler := CompassSampleMorph new.
		sampler recognizer: sharedRecognizer.
		sampler when: #NewSample send: #newSample to: self.
		self addMorph: sampler.
	].! !

!CompassSampleCompareMorph methodsFor: 'event handling' stamp: 'KenD 10/20/2024 11:00:26'!
newSample

	"Compare across all samples to colorize match/misMatch."
	
	| validSamples booleanCompareArray |
	validSamples := OrderedCollection new.
	self submorphsDo: [ :sample | 
		sample strokeSample ifNotNil: [validSamples add: sample].
	].
	booleanCompareArray := 
		CompassPattern matchArrayFromSamples: validSamples.

	validSamples do: [ :compassSampleToColorize | 
		compassSampleToColorize colorizeDirections: booleanCompareArray.
	"Transcript log: compassSampleToColorize printString."
	].
	
	! !

!CompassSampleCompareMorph class methodsFor: 'access' stamp: 'KenD 10/15/2024 14:03:40'!
matchColor

	"Answer text color for matchs" 
	^Color black! !

!CompassSampleCompareMorph class methodsFor: 'access' stamp: 'KenD 10/15/2024 14:04:00'!
misMatchColor

	"Answer text color for non-matches" 
	^Color red! !

!CompassSampleCompareMorph class methodsFor: 'new-morph participation' stamp: 'KenD 10/19/2024 10:40:05'!
categoryInNewMorphMenu

	^ 'Stroke Input'! !

!CompassSampleCompareMorph class methodsFor: 'new-morph participation' stamp: 'KenD 10/19/2024 10:39:57'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!CompassSampleCompareMorph class methodsFor: 'new-morph participation' stamp: 'KenD 10/19/2024 15:22:45'!
initializedInstance
" self initializedInstance openInWorld. "
	^self new! !

!CompassSampleCompareMorph class methodsFor: 'new-morph participation' stamp: 'KenD 10/19/2024 15:23:03'!
new

	^self newRow! !

!CompassSampleSizeMorph methodsFor: 'event handling' stamp: 'KenD 10/19/2024 15:08:52'!
strokeResult: points

	"Update view of user input"
	| someResult |
	sample := points.
	1 to: 3 do: [ :index |
		someResult := CompassPattern 
							fromPoints: sample 
							sizeWanted: (self sampleSizeArray at: index).
		((resultsArray at: index) at: 1) contents:
 			someResult directionsFromCentroid.
		((resultsArray at: index) at: 2) contents:
			someResult strokeTravelDirections.	
	].
! !

!CompassSampleSizeMorph methodsFor: 'gui building' stamp: 'KenD 9/21/2024 12:56:12'!
resultsArea

	| resultsLayout col1 col2 col3 resultCols |
	resultsLayout := LayoutMorph newRow :: color: Color transparent.
	col1 := LayoutMorph newColumn :: color:  Color transparent.
	col2 := LayoutMorph newColumn :: color:  Color transparent.
	col3 := LayoutMorph newColumn :: color:  Color transparent.
	resultsLayout 
		addMorph: col1;
		addMorph: col2;
		addMorph: col3.
	1 to: 3 do: [ :rIndex |
		resultsArray at: rIndex
					put: {  TextParagraphMorph contents: '#()'.  
						     TextParagraphMorph contents: '#()'. }
	].
	resultCols := { col1. col2. col3. }.
	1 to: 3 do: [ :cIndex |
		(resultCols at: cIndex) 
			addMorph: 
					(LabelMorph contents: (self sampleSizeArray at: cIndex) asString);
			addMorph: ((resultsArray at: cIndex) at: 1);
			addMorph: (LabelMorph contents: '^point location^  vv stroke direction vv ');
			addMorph: ((resultsArray at: cIndex) at: 2).
	].

	^resultsLayout

	
	! !

!CompassSampleSizeMorph methodsFor: 'initialization' stamp: 'KenD 9/21/2024 12:44:32'!
initialize

	super initialize.
	resultsArray := Array new: 3.
	self
		addMorph: StrokeInputMorph new;
		addMorph: self resultsArea;
		color: Color green.! !

!CompassSampleSizeMorph methodsFor: 'accessing' stamp: 'KenD 9/21/2024 12:09:08'!
sampleSizeArray

	^ `#(16 20 30)`! !

!CompassSampleSizeMorph class methodsFor: 'new-morph participation' stamp: 'KenD 9/21/2024 12:40:09'!
categoryInNewMorphMenu

	^ 'Stroke Input'! !

!CompassSampleSizeMorph class methodsFor: 'new-morph participation' stamp: 'KenD 9/21/2024 12:40:18'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!CompassSampleSizeMorph class methodsFor: 'new-morph participation' stamp: 'KenD 9/21/2024 12:40:25'!
initializedInstance

	^self new! !

!CompassSampleSizeMorph class methodsFor: 'instance creation' stamp: 'KenD 9/21/2024 12:39:10'!
new
	
	^self newColumn! !

!CompassSampleSizeMorph class methodsFor: 'instance creation' stamp: 'KenD 9/21/2024 12:39:29'!
open
	
	^self newColumn openInWorld! !

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

!CompassTrainingMorph methodsFor: 'event handling' stamp: 'KenD 10/19/2024 15:09:13'!
strokeResult: points

	"Update view of user input"
	sample := CompassPattern fromPoints: points.
	result := recognizer bestMatch: sample.
	resultLabel contents: (result key printStringFractionDigits: 3), ' -> ', result value asString.
	pointDirections contents: sample directionsFromCentroid.
	strokeDirections contents: sample strokeTravelDirections.	
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

!CompassTrainingMorph methodsFor: 'accessing' stamp: 'KenD 10/17/2024 13:34:37'!
pointDirections

	"Answer a TextParagraphMorph"
	^pointDirections ! !

!CompassTrainingMorph methodsFor: 'accessing' stamp: 'KenD 10/17/2024 13:54:02'!
recognizer: aCompassRecognizer

	recognizer := aCompassRecognizer ! !

!CompassTrainingMorph methodsFor: 'accessing' stamp: 'KenD 10/17/2024 13:34:31'!
strokeDirections
	
	"Answer a TextParagraphMorph"
	^strokeDirections ! !

!CompassTrainingMorph methodsFor: 'accessing' stamp: 'KenD 10/17/2024 13:37:43'!
strokeSample

	"Answer a CompassPattern whose #pattern is 
	 an array of compass direction symbols."
	^sample ! !

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

!CompassSampleMorph methodsFor: 'event handling' stamp: 'KenD 10/22/2024 13:18:34'!
colorizeDirections: aBooleanVector

	"aBooleanVector elements are used to colorize"
	pointDirections contents: 
		(sample directionsFromCentroidMatched: aBooleanVector).
	strokeDirections contents: 
		(sample strokeTravelDirectionsMatched: aBooleanVector).	


	
	
	! !

!CompassSampleMorph methodsFor: 'event handling' stamp: 'KenD 10/19/2024 15:36:52'!
strokeResult: points

	"Update view of user input"
	super strokeResult: points.
	self triggerEvent: #NewSample.
	
	! !

!CompassSampleMorph methodsFor: 'initialization' stamp: 'KenD 10/20/2024 07:51:40'!
initialization

	super initialize.
	self separation: 10. "override"! !

!CompassSampleMorph class methodsFor: 'new-morph participation' stamp: 'KenD 10/17/2024 13:48:13'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!CompassSampleMorph class methodsFor: 'accessing' stamp: 'KenD 10/17/2024 13:49:59'!
matchColor

	"Answer text color for matches" 
	^Color black! !

!CompassSampleMorph class methodsFor: 'accessing' stamp: 'KenD 10/17/2024 13:49:07'!
misMatchColor

	"Answer text color for non-matches" 
	^Color red! !
