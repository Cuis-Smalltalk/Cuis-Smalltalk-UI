'From Cuis7.9 [latest update: #8340] on 14 November 2026 at 12:44:25 pm'!
'Description Tools to create and investigate CompassRecognizer pattern exemplars.'!
!provides: 'UI-StrokeRecognizer-Tools' '1.3.1'!
!requires: 'Cuis-Base' '7.1.6792' '*.*.*'!
!requires: 'UI-StrokeRecognizer' '1.28.0' '*.*.*'!
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


!CompassSampleCompareMorph commentStamp: '<historical>'!
I am a Row of CompassSampleMorphs.

As the samples each gather stroke info, I generate a comparisonIndices array
of boolean values indicating which sample CompassPatterns compare 
the same across all valid samples.

I give this array back to the #samples so that they can display matches (in black)
and mismatches (in red).

This allows for comparing gesture variants and close gestures (e.g. P, B, R, D) to find
differences significant enough to recognize.  We also want to avoid "false positives".

!

!CompassSampleSizeMorph commentStamp: '<historical>'!
Compare input gesture at different sample size resolutions.

Useful to compare "close" distinctions, e.g. between $B $D $P $R.

What "sample resolution" gives crisp results?

Note: CompassTrainingMorph
!

!CompassTrainingMorph commentStamp: '<historical>'!
I am a Morph useful to try out stroke recognition and add new pattern exemplars to recognizer.

Feature require: 'StrokeRecognizer'.
CompassTrainingMorph new openInHand.
StrokeInputMorph strokeMorph openInHand. "Shows PalmOS Graffiti gestures"!

!CompassSampleMorph commentStamp: '<historical>'!
I am used to compare one of a number of stroke training samples.

I inform my owner of new samples and can colorize my results
to show matches and mis-matches.

See class CompassSampleCompareMorph.

!

!CompassSampleCompareMorph methodsFor: 'initialization' stamp: 'KenD 19/Oct/2024, 11:39:15 pm (UTC)'!
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

!CompassSampleCompareMorph methodsFor: 'event handling' stamp: 'KenD 20/Oct/2024, 7:00:26 pm (UTC)'!
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

!CompassSampleCompareMorph class methodsFor: 'access' stamp: 'KenD 15/Oct/2024, 10:03:40 pm (UTC)'!
matchColor

	"Answer text color for matchs" 
	^Color black! !

!CompassSampleCompareMorph class methodsFor: 'access' stamp: 'KenD 15/Oct/2024, 10:04:00 pm (UTC)'!
misMatchColor

	"Answer text color for non-matches" 
	^Color red! !

!CompassSampleCompareMorph class methodsFor: 'new-morph participation' stamp: 'KenD 19/Oct/2024, 6:40:05 pm (UTC)'!
categoryInNewMorphMenu

	^ 'Stroke Input'! !

!CompassSampleCompareMorph class methodsFor: 'new-morph participation' stamp: 'KenD 19/Oct/2024, 6:39:57 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!CompassSampleCompareMorph class methodsFor: 'new-morph participation' stamp: 'KenD 19/Oct/2024, 11:22:45 pm (UTC)'!
initializedInstance
" self initializedInstance openInWorld. "
	^self new! !

!CompassSampleCompareMorph class methodsFor: 'new-morph participation' stamp: 'KenD 19/Oct/2024, 11:23:03 pm (UTC)'!
new

	^self newRow! !

!CompassSampleSizeMorph methodsFor: 'event handling' stamp: 'KenD 19/Oct/2024, 11:08:52 pm (UTC)'!
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

!CompassSampleSizeMorph methodsFor: 'gui building' stamp: 'KenD 21/Sep/2024, 8:56:12 pm (UTC)'!
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

!CompassSampleSizeMorph methodsFor: 'initialization' stamp: 'KenD 14/Nov/2026, 8:40:41 pm (UTC)'!
initialize

	super initialize.
	resultsArray := Array new: 3.
	self
		addMorph: StrokeExemplarMorph new;
		addMorph: self resultsArea;
		color: Color green.! !

!CompassSampleSizeMorph methodsFor: 'accessing' stamp: 'KenD 21/Sep/2024, 8:09:08 pm (UTC)'!
sampleSizeArray

	^ `#(16 20 30)`! !

!CompassSampleSizeMorph class methodsFor: 'new-morph participation' stamp: 'KenD 21/Sep/2024, 8:40:09 pm (UTC)'!
categoryInNewMorphMenu

	^ 'Stroke Input'! !

!CompassSampleSizeMorph class methodsFor: 'new-morph participation' stamp: 'KenD 21/Sep/2024, 8:40:18 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!CompassSampleSizeMorph class methodsFor: 'new-morph participation' stamp: 'KenD 21/Sep/2024, 8:40:25 pm (UTC)'!
initializedInstance

	^self new! !

!CompassSampleSizeMorph class methodsFor: 'instance creation' stamp: 'KenD 21/Sep/2024, 8:39:10 pm (UTC)'!
new
	
	^self newColumn! !

!CompassSampleSizeMorph class methodsFor: 'instance creation' stamp: 'KenD 21/Sep/2024, 8:39:29 pm (UTC)'!
open
	
	^self newColumn openInWorld! !

!CompassTrainingMorph methodsFor: 'event handling' stamp: 'KenD 10/Sep/2024, 11:48:27 pm (UTC)'!
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

!CompassTrainingMorph methodsFor: 'event handling' stamp: 'KenD 19/Oct/2024, 11:09:13 pm (UTC)'!
strokeResult: points

	"Update view of user input"
	sample := CompassPattern fromPoints: points.
	result := recognizer bestMatch: sample.
	resultLabel contents: (result key printStringFractionDigits: 3), ' -> ', result value asString.
	pointDirections contents: sample directionsFromCentroid.
	strokeDirections contents: sample strokeTravelDirections.	
	! !

!CompassTrainingMorph methodsFor: 'initialization' stamp: 'KenD 14/Nov/2026, 8:40:46 pm (UTC)'!
initialize
	
	super initialize.
	recognizer := CompassRecognizer new.
	inputMorph := StrokeExemplarMorph new.
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

!CompassTrainingMorph methodsFor: 'initialization' stamp: 'KenD 13/Sep/2024, 5:44:17 am (UTC)'!
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

!CompassTrainingMorph methodsFor: 'accessing' stamp: 'KenD 17/Oct/2024, 9:34:37 pm (UTC)'!
pointDirections

	"Answer a TextParagraphMorph"
	^pointDirections ! !

!CompassTrainingMorph methodsFor: 'accessing' stamp: 'KenD 17/Oct/2024, 9:54:02 pm (UTC)'!
recognizer: aCompassRecognizer

	recognizer := aCompassRecognizer ! !

!CompassTrainingMorph methodsFor: 'accessing' stamp: 'KenD 17/Oct/2024, 9:34:31 pm (UTC)'!
strokeDirections
	
	"Answer a TextParagraphMorph"
	^strokeDirections ! !

!CompassTrainingMorph methodsFor: 'accessing' stamp: 'KenD 17/Oct/2024, 9:37:43 pm (UTC)'!
strokeSample

	"Answer a CompassPattern whose #pattern is 
	 an array of compass direction symbols."
	^sample ! !

!CompassTrainingMorph class methodsFor: 'instance creation' stamp: 'KenD 11/Sep/2024, 1:55:41 am (UTC)'!
new

	| newSelf |
	newSelf := self newColumn.
	newSelf morphExtent: newSelf minimumExtent.
	^newSelf! !

!CompassTrainingMorph class methodsFor: 'new-morph participation' stamp: 'KenD 18/Sep/2024, 3:59:32 pm (UTC)'!
categoryInNewMorphMenu

	^ 'Stroke Input'! !

!CompassTrainingMorph class methodsFor: 'new-morph participation' stamp: 'KenD 18/Sep/2024, 3:59:24 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!CompassTrainingMorph class methodsFor: 'new-morph participation' stamp: 'KenD 18/Sep/2024, 3:59:10 pm (UTC)'!
initializedInstance

	^self new! !

!CompassSampleMorph methodsFor: 'event handling' stamp: 'KenD 22/Oct/2024, 9:18:34 pm (UTC)'!
colorizeDirections: aBooleanVector

	"aBooleanVector elements are used to colorize"
	pointDirections contents: 
		(sample directionsFromCentroidMatched: aBooleanVector).
	strokeDirections contents: 
		(sample strokeTravelDirectionsMatched: aBooleanVector).	


	
	
	! !

!CompassSampleMorph methodsFor: 'event handling' stamp: 'KenD 19/Oct/2024, 11:36:52 pm (UTC)'!
strokeResult: points

	"Update view of user input"
	super strokeResult: points.
	self triggerEvent: #NewSample.
	
	! !

!CompassSampleMorph methodsFor: 'initialization' stamp: 'KenD 20/Oct/2024, 3:51:40 pm (UTC)'!
initialization

	super initialize.
	self separation: 10. "override"! !

!CompassSampleMorph class methodsFor: 'new-morph participation' stamp: 'KenD 17/Oct/2024, 9:48:13 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!CompassSampleMorph class methodsFor: 'accessing' stamp: 'KenD 17/Oct/2024, 9:49:59 pm (UTC)'!
matchColor

	"Answer text color for matches" 
	^Color black! !

!CompassSampleMorph class methodsFor: 'accessing' stamp: 'KenD 17/Oct/2024, 9:49:07 pm (UTC)'!
misMatchColor

	"Answer text color for non-matches" 
	^Color red! !
