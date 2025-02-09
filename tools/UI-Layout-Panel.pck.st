'From Cuis7.3 [latest update: #7044] on 1 February 2025 at 11:46:44 am'!
'Description I supply LayourSpec and Layout editors'!
!provides: 'UI-Layout-Panel' 1 24!
!requires: 'Cuis-Base' 71 6722 nil!
!requires: 'UI-DragAndDrop' 1 4 nil!
!requires: 'UI-Click-Select' 1 63 nil!
!requires: 'UI-Shapes' 1 45 nil!
!requires: 'UI-Panel' 1 113 nil!
SystemOrganization addCategory: #'UI-Layout-Panel'!


!classDefinition: #LayoutMorphEditPanel category: #'UI-Layout-Panel'!
EditPanel subclass: #LayoutMorphEditPanel
	instanceVariableNames: 'directionArea edgeWeightArea separationArea colorArea axisRadio axisEntry'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Layout-Panel'!
!classDefinition: 'LayoutMorphEditPanel class' category: #'UI-Layout-Panel'!
LayoutMorphEditPanel class
	instanceVariableNames: ''!

!classDefinition: #LayoutSpecEditPanel category: #'UI-Layout-Panel'!
EditPanel subclass: #LayoutSpecEditPanel
	instanceVariableNames: 'widthArea heightArea paddingArea padRadio padEntry'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Layout-Panel'!
!classDefinition: 'LayoutSpecEditPanel class' category: #'UI-Layout-Panel'!
LayoutSpecEditPanel class
	instanceVariableNames: ''!


!LayoutMorphEditPanel commentStamp: '<historical>' prior: 0!
I am a simple editor for a LayoutMorph.

iVars:
  model (inherited) -- the LayoutMorph being 'edited'  -- unchanged until user OKs
  editModel (inherited) -- clone of theLayoutMorp; holds edit state until saved to original
  directionArea paddingArea separationArea colorArea -- are layouts for controls.

LayoutMorphEditPanel open: (LayoutMorph newRow).!

!LayoutSpecEditPanel commentStamp: '<historical>' prior: 0!
I am a simple editor for a LayoutSpec.

!

!LayoutMorphEditPanel methodsFor: 'GUI building' stamp: 'hlsf 7/28/2024 10:48:02'!
buildMorphicWindow
	super buildMorphicWindow.
	self setLabel: 'Layout: ', (self model printStringLimitedTo: 30).
	self titleMorph showButtonsNamed: #( close pin collapse showHalo )! !

!LayoutMorphEditPanel methodsFor: 'GUI building' stamp: 'KenD 9/14/2024 16:22:53'!
newPane
	| controlArea leftCol rightCol  |	
		
	directionArea := self newDirectionArea.
	edgeWeightArea := self newEdgeWeightArea.
	separationArea := self newSeparationtionArea.
	colorArea := self newColorArea.

	controlArea  := LayoutMorph newRow.  "A row of two columns"
	controlArea gap: 2; color: Color transparent.
		
	leftCol := LayoutMorph newColumn.
	leftCol 
		separation: self defaultSeparation;
		axisEdgeWeight: #columnTop;
		addMorph: directionArea;
		addMorph: edgeWeightArea;
		color: Color transparent.
	controlArea addMorph: leftCol.

	rightCol := LayoutMorph newColumn.
	rightCol 
		color: Color transparent;
		separation: self defaultSeparation;
		axisEdgeWeight: #columnTop;
		addMorph: separationArea ;
		addMorph: colorArea .
	controlArea addMorph: rightCol.
	
	^ controlArea

! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/16/2013 15:29'!
colorArea

	^ colorArea! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 12:26'!
colorArea: newColorArea

	colorArea := newColorArea! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/16/2013 15:29'!
directionArea

	^ directionArea! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 12:26'!
directionArea: newDirectonArea

	directionArea := newDirectonArea! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 9/14/2024 16:20:35'!
padEntry

	^ axisEntry! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 9/14/2024 16:20:54'!
padRadio

	^ axisRadio! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 9/14/2024 16:19:27'!
paddingArea

	^ edgeWeightArea! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 9/14/2024 16:19:27'!
paddingArea: newPaddingArea

	edgeWeightArea := newPaddingArea! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/16/2013 15:29'!
separationArea

	^ separationArea! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 12:27'!
separationArea: newSeparationArea

	separationArea := newSeparationArea! !

!LayoutMorphEditPanel methodsFor: 'private' stamp: 'KenD 3/26/2022 09:28:57'!
colorMorph
	"Answer a framed color swatch"
	
	| imageMorph frameMorph |
	imageMorph := DropColorMorph fromColor: self editModel color.
	imageMorph image: (self editModel color icon magnifyTo: 64@64). "NB: not resizable"
	imageMorph setProperty:  #'allowsMorphDrop' toValue: true.
	imageMorph setProperty: #dropAction 
				   toValue: [ :aMorph :colorValue |
								(colorValue isKindOf: Color)
									ifTrue: [ 
										self modelColor: colorValue.
										aMorph showAcceptAndDeleteSelf
									]
									ifFalse: [ aMorph showReject ].
							].
	frameMorph := FrameMorph new ::
		morphExtent: 68@68;
		borderColor: Color transparent; 
		borderWidth: 2; 
		yourself.
	frameMorph addMorph: imageMorph.
	imageMorph morphPosition: 2@2.
	
	"An imvisible FrameMorph is uses to make contained color swatch draggable"
	frameMorph setProperty: #allowsSubmorphDrag toValue: true.

	^ frameMorph
! !

!LayoutMorphEditPanel methodsFor: 'geometry' stamp: 'KenD 8/26/2015 14:43'!
fontPreferenceChanged
	"My size needs adjustment"

	self submorphsDo: [ :m | m fontPreferenceChanged ].
	self refreshView.
	self submorphsDo: [ :m | m fontPreferenceChanged ].
.	self morphExtent: self minimumExtent ! !

!LayoutMorphEditPanel methodsFor: 'geometry' stamp: 'KenD 3/9/2020 13:08:03'!
xxMminimumExtent
"Answer minimum extent to hold my submorphs"

	| width height |
	width := height := 0.
	self submorphsDo: [ :sm | | minExt |
		minExt := sm minimumExtent.
		width := width max: minExt x.
		height := height + minExt y.
	].
	^ width @ height! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 9/15/2024 04:46:44'!
modelBeColumn
	"My editModel should be a Column"

	self editModel beColumn.
	self refreshDirectionArea.
	self refreshEdgeWeightArea.
"	self editModel refreshExtent."! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 9/15/2024 08:40:36'!
modelBeRow
	"My editModel should be a Row"
	
	self editModel beRow.
	self refreshDirectionArea.
	self refreshEdgeWeightArea.
	"self editModel refreshExtent."! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 12/17/2013 12:35'!
modelColor: aColor
	
	self editModel color: aColor.
	self refreshColorArea.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 9/14/2024 16:18:28'!
modelEdgeWeight: numPixels
	
	self editModel axisEdgeWeight: numPixels.
	self refreshEdgeWeightArea.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 9/14/2024 16:13:21'!
modelGap: numPixels

	self editModel gap: numPixels.
	self refreshSeparationtionArea.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 9/15/2024 04:45:11'!
modelXPadding: numPixels

	self editModel padding: (numPixels @ editModel padding y).
	self refreshSeparationtionArea.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 9/15/2024 04:45:21'!
modelYPadding: numPixels

	self editModel padding: (editModel padding x @numPixels).
	self refreshSeparationtionArea.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 12/17/2013 14:18'!
newDirectionSelection: dirSymbol

	(dirSymbol = #Row)
		ifTrue: [ self modelBeRow ] 
		ifFalse: [ self modelBeColumn ]! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 9/14/2024 16:18:28'!
refreshView

	self refreshColorArea; 
		refreshDirectionArea; 
		refreshEdgeWeightArea; 
		refreshSeparationtionArea! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 7/27/2015 16:26'!
showHaloButtonClicked

	| aMorph |
	aMorph := self model.
	(aMorph isInWorld)
		ifTrue: [aMorph show; addHalo ]
		ifFalse: [
		(HoverHelpMorph 
			contents: aMorph printString , ' not shown in world')
				popUpForHand: self  world activeHand
	]! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 2/1/2025 11:45:56'!
updateMasterFromCopy
	"Update model from editModel"
	
	| original editCopy |
	original := self model.
	editCopy := self editModel.
	original direction: editCopy direction.
	original axisEdgeWeight: editCopy axisEdgeWeight.
	original gap: editCopy gap.
	original padding: editCopy padding.
	original color: editCopy color.
	original layoutSubmorphs; redrawNeeded.
	original owner ifNotNil: [ :container | 
		container respondsTo: #layoutSubmorphs :: ifTrue: [
			container layoutSubmorphs; redrawNeeded ]
	].
	self editModel: nil.
	original triggerEvent: #propertyChanged.
	
	self stayUp 
		ifFalse: [ self delete ] 
		ifTrue: [ self refreshView ]
! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 10/23/2020 08:37:13'!
newColorArea
	"Answer a FramedLayoutMorph showing color swatch and hex RGB entry"
	
	| newColorArea label  colorRGB hexEntry |
	newColorArea := LayoutMorph newColumn :: borderWidth: 2.
	label := LabelMorph contents: 'Color' ::
					  emphasis: AbstractFont boldCode.
	colorRGB := SimpleNumberEntryMorph hexRGBEntry.
	colorRGB layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: #center).
		
	hexEntry := LayoutMorph newRow.
	hexEntry
		separation: 2; axisEdgeWeight: #rowLeft;
		color: Color transparent;
		addMorph: (LabelMorph contents: '16r');
		addMorph: colorRGB;
		addMorph: (LabelMorph contents: 'hexRGB').
		
	"Setup"
	colorRGB valueAccessor: [ :someModel | | backgroundColor |
		backgroundColor := someModel color.
		( '16r',  backgroundColor hexStringRGB) asNumber
	].
	colorRGB valueUpdator: [ :integerRGB |
			self modelColor: (Color 
					r: ((integerRGB bitShift: -16) bitAnd: 255) / 255
					g: ((integerRGB bitShift: -8) bitAnd: 255) / 255
					b: (integerRGB bitAnd: 255) / 255)
	].
	colorRGB refreshValueFrom: self editModel.
		
	^ newColorArea
		color: Color  transparent;
		axisEdgeWeight: #columnTop;
		separation: self defaultSeparation + 6;
		addMorph: label;
		addMorph: self colorMorph;
		addMorph: hexEntry;
		yourself 
	
	! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 10/23/2020 08:35:27'!
newDirectionArea
	"Answer a FramedLayoutMorph with controls for Direction (Row,Column)"
	
	| dirArea label radio direction |
	dirArea := LayoutMorph newColumn :: borderWidth: 2.
	label := LabelMorph contents: 'Direction' ::
					 emphasis: AbstractFont boldCode.
	radio := RadioGroup fromList: #(Row Column).
		
	"Setup"
	direction := self editModel direction.
	(direction == #horizontal)
		ifTrue: [ (radio buttonFor: #Row) select ]
		ifFalse: [ (radio buttonFor: #Column) select ].

	radio when: #informRadioSelection send: #newDirectionSelection: to: self.
		
	^ dirArea
		color: Color  transparent ;
		separation: 2;
		addMorph: label;
		addMorph: radio;
		yourself 
	
	! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 9/14/2024 16:23:16'!
newEdgeWeightArea
	"Answer a FramedLayoutMorph with controls for AxisEdgeWeight"
	
	| edgeArea label direction |
	edgeArea := LayoutMorph newColumn :: borderWidth: 2.
	label := LabelMorph contents: 'EdgeWeight' ::
					 emphasis: AbstractFont boldCode.
	direction := self editModel direction.
	axisRadio := RadioGroup fromList: ( 
		(direction = #horizontal)
			ifTrue: [ #(Left Center Right Specify) ] 
			ifFalse: [ #(Top Center Bottom Specify) ]
	)..
	
	"Setup"
	axisEntry := SimpleNumberEntryMorph realFactor: 1.0 maxNumChars: 3.
	(axisRadio rowFor: #Specify) addMorph: axisEntry.
	axisEntry valueAccessor: [ :myModel | myModel axisEdgeWeight ].
	axisEntry valueUpdator: [ :newPad | self modelEdgeWeight: newPad ].
	axisEntry refreshValueFrom: self editModel.
	self setPadRadio: axisRadio fromPadFactor: axisEntry value.
	
	axisRadio when: #informRadioSelection send: #newEdgeWeightSelection: to: self.
		
	^ edgeArea
		color: Color transparent ;
		separation: 4;
		addMorph: label;
		addMorph: axisRadio;
		yourself 
	
	! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 9/14/2024 16:23:16'!
newEdgeWeightSelection: padSym

	| radio |
	radio := self padRadio.
	padSym caseOf: {
		[ #Left ] -> [ (radio buttons at: 1) select. self padEntry setValue: 0.0 ].
		[ #Top ] -> [ (radio buttons at: 1) select. self padEntry setValue: 0.0 ].
		[ #Center ] -> [ (radio buttons at: 2) select. self padEntry setValue: 0.5 ].
		[ #Right ] -> [ (radio buttons at: 3) select. self padEntry setValue: 1.0 ].
		[ #Bottom ] -> [ (radio buttons at: 3) select. self padEntry setValue: 1.0 ].
		[ #Specify ] ->  [ (radio buttons at: 4) select ].
	}.

! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 9/15/2024 04:55:10'!
newSeparationtionArea
	"Answer a FramedLayoutMorph with controls for gap and padding"
	
	| sepArea gapLabel padLabel xArea yArea gapArea gapEntry xPadEntry yPadEntry |
	sepArea := LayoutMorph newColumn :: borderWidth: 2.
	padLabel := LabelMorph contents: 'Frame Pad around Submorphs' ::
					 emphasis: AbstractFont boldCode.					
	"Setup"
	xPadEntry := SimpleNumberEntryMorph 
			integerRangeFrom: 0 
			to: DisplayScreen actualScreenSize x 
			maxNumChars: 5.
	xArea := LayoutMorph newRow.
	xArea 
		color: Color  transparent;
		gap: 2;
		addMorph: (LabelMorph contents: '  X ');
		addMorph: xPadEntry;
		addMorph: (LabelMorph contents: 'pixels').
		
	yPadEntry := SimpleNumberEntryMorph 
			integerRangeFrom: 0 
			to: DisplayScreen actualScreenSize y
			maxNumChars: 5.
	yArea := LayoutMorph newRow.
	yArea 
		color: Color  transparent;
		gap: 2;
		addMorph: (LabelMorph contents: '  Y ');
		addMorph: yPadEntry;
		addMorph: (LabelMorph contents: 'pixels').

	"Value flow"
	xPadEntry valueAccessor: [ :myModel | myModel padding x ].
	xPadEntry valueUpdator:   [ :newX | self modelXPadding: newX ].
	yPadEntry valueAccessor: [ :myModel | myModel padding y ].
	yPadEntry valueUpdator:   [ :newY | self modelYPadding: newY ].
	xPadEntry refreshValueFrom: self editModel.
	yPadEntry refreshValueFrom: self editModel.

	gapLabel := LabelMorph contents: 'Gap Between Morphs' ::
					 emphasis: AbstractFont boldCode.
	gapEntry := SimpleNumberEntryMorph 
			integerRangeFrom: 0 
			to: DisplayScreen actualScreenSize x 
			maxNumChars: 5.
	gapArea := LayoutMorph newRow :: 
		color: Color  transparent;
		gap: 2;
		addMorph: gapLabel;
		addMorph: gapEntry.
	gapEntry valueAccessor: [ :myModel | myModel gap ].
	gapEntry valueUpdator:   [ :newGap | self modelGap: newGap ].
	gapEntry refreshValueFrom: self editModel.

		
	 ^ sepArea
		color: Color  transparent ;
		gap: 2;
		addMorph: padLabel;
		addMorph: xArea;
		addMorph: yArea;
		addMorph: gapArea;
		yourself 
	
	! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 12/17/2013 12:30'!
refreshColorArea
	"Update my view"
	
	| oldArea newArea |
	oldArea := self colorArea.
	newArea := self newColorArea.
	self replaceArea: oldArea with: newArea.
	self colorArea: newArea 
	! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 12/17/2013 12:29'!
refreshDirectionArea
	"Update my view"
	
	| oldArea newArea |
	oldArea := self directionArea.
	newArea := self newDirectionArea.
	self replaceArea: oldArea with: newArea.
	self directionArea: newArea 
	! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 9/14/2024 16:22:53'!
refreshEdgeWeightArea
	"Update my view"
	
	| oldArea newArea |
	oldArea := self paddingArea.
	newArea := self newEdgeWeightArea.
	self replaceArea: oldArea with: newArea.
	self paddingArea: newArea 
	! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 12/17/2013 12:28'!
refreshSeparationtionArea
	"Update my view"
	
	| oldArea newArea |
	oldArea := self separationArea.
	newArea := self newSeparationtionArea.
	self replaceArea: oldArea with: newArea.
	self separationArea: newArea 
	! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 12/17/2013 14:29'!
setPadRadio: radio fromPadFactor: factor

	factor caseOf: {
		[0.0] -> [ (radio buttons at: 1) select ].
		[0.5] -> [ (radio buttons at: 2) select ].
		[1.0] -> [ (radio buttons at: 3) select ].
	} otherwise: [ (radio buttons at: 4) select ]! !

!LayoutSpecEditPanel methodsFor: 'entry morphs' stamp: 'KenD 9/5/2020 14:08:22'!
addFixedHeightEntryMorphTo: radio
	"Add entry field to #Fixed radioButton row"

	| fixEntry spec rowForFixed | 
	spec :=  self editModel.
	fixEntry := SimpleNumberEntryMorph 
						integerRangeFrom: 0 
						to: DisplayScreen actualScreenSize y 
						maxNumChars: 4.
	fixEntry valueAccessor: [ :myModel | myModel privateFixedHeight ].
	fixEntry valueUpdator: [ :newFixPix | spec fixedHeight: newFixPix ].
	fixEntry refreshValueFrom: spec.
	"Do layout surgery to make room for added field"
	rowForFixed := (radio rowFor: #Fixed).
	rowForFixed
			layoutSpec proportionalWidth: 0.4;
			offAxisEdgeWeight:  #leftOrTop.
	rowForFixed 
			addMorph: fixEntry.
! !

!LayoutSpecEditPanel methodsFor: 'entry morphs' stamp: 'KenD 6/1/2020 14:46:20'!
addFixedWidthEntryMorphTo: radio
	"Add entry field to #Fixed radioButton row"

	| fixEntry spec rowForFixed | 
	spec :=  self editModel.
	fixEntry := SimpleNumberEntryMorph 
						integerRangeFrom: 0 
						to: DisplayScreen actualScreenSize x 
						maxNumChars: 4.
	fixEntry valueAccessor: [ :myModel | myModel privateFixedWidth ].
	fixEntry valueUpdator: [ :newFixPix | spec fixedWidth: newFixPix ].
	fixEntry refreshValueFrom: spec.
	"Do layout surgery to make room for added field"
	rowForFixed := (radio rowFor: #Fixed).
	rowForFixed 
			layoutSpec proportionalWidth: 0.4;
			offAxisEdgeWeight:  #rowTop.
	rowForFixed
			addMorph: fixEntry.
! !

!LayoutSpecEditPanel methodsFor: 'entry morphs' stamp: 'KenD 10/30/2015 14:23'!
newProportionalHeightAuxArea
	"Add proportion factor and minSize fields"

	| aux |
	aux := LayoutMorph newColumn.
	^ aux
		color: Color transparent;
		separation: self defaultSeparation;
		addMorph: self propHeightPercent;
		addMorph: self propHeightMinimum;
		yourself! !

!LayoutSpecEditPanel methodsFor: 'entry morphs' stamp: 'KenD 10/30/2015 14:23'!
newProportionalWidthAuxArea
	"Add proportion factor and minSize fields"

	| aux |
	aux := LayoutMorph newColumn.
	^ aux
		color: Color transparent;
		separation: self defaultSeparation;
		addMorph: self propWidthPercent;
		addMorph: self propWidthMinimum;
		yourself! !

!LayoutSpecEditPanel methodsFor: 'entry morphs' stamp: 'KenD 4/28/2019 18:41:11'!
propHeightMinimum
	"proportion percent"

	| row minEntry |
	row := LayoutMorph newRow.
	minEntry := SimpleNumberEntryMorph 
						integerRangeFrom: 0 
						to: DisplayScreen actualScreenSize y 
						maxNumChars: 4.
	minEntry valueAccessor: [ :myModel | 
		myModel privateFixedHeight ifNil: [ 0 ] ifNotNil: [ :height | height rounded ]
	].
	minEntry valueUpdator: [ :newMinPixels | 
		self editModel proportionalHeight: self editModel privateProportionalHeight
						  minimum: newMinPixels ].
	minEntry refreshValueFrom: self editModel.
	^ row
		color: Color transparent;
		addMorph: (LabelMorph contents: 'minimum  ');
		addMorph: minEntry;
		addMorph: (LabelMorph contents: ' pixels');
		yourself! !

!LayoutSpecEditPanel methodsFor: 'entry morphs' stamp: 'KenD 4/28/2019 18:41:37'!
propHeightPercent
	"proportion percent"

	| row propEntry |
	row := LayoutMorph newRow.
	propEntry := SimpleNumberEntryMorph percentForRealFactor: 1.0.
	propEntry valueAccessor: [ :myModel | 
		myModel privateProportionalHeight ifNil: [ 0 ] ifNotNil: [ :height | height ]
	].
	propEntry valueUpdator: [ :newFactor | 
		self editModel proportionalHeight: newFactor 
						  minimum: self editModel privateFixedHeight ].
	propEntry refreshValueFrom: self editModel.
	^ row
		color: Color transparent;
		addMorph: (LabelMorph contents: '        ');
		addMorph: propEntry;
		addMorph: (LabelMorph contents: '%');
		yourself! !

!LayoutSpecEditPanel methodsFor: 'entry morphs' stamp: 'KenD 4/28/2019 18:42:05'!
propWidthMinimum
	"proportion percent"

	| row minEntry |
	row := LayoutMorph newRow.
	minEntry := SimpleNumberEntryMorph 
						integerRangeFrom: 0 
						to: DisplayScreen actualScreenSize y 
						maxNumChars: 4.
	minEntry valueAccessor: [ :myModel | 
		myModel privateFixedWidth ifNil: [ 0 ] ifNotNil: [ :width | width rounded ]
	].
	minEntry valueUpdator: [ :newMinPixels | 
		self editModel proportionalWidth: self editModel privateProportionalWidth
						  minimum: newMinPixels ].
	minEntry refreshValueFrom: self editModel.
	^ row
		color: Color transparent;
		addMorph: (LabelMorph contents: 'minimum  ');
		addMorph: minEntry;
		addMorph: (LabelMorph contents: ' pixels');
		yourself! !

!LayoutSpecEditPanel methodsFor: 'entry morphs' stamp: 'KenD 4/28/2019 18:42:30'!
propWidthPercent
	"proportion percent"

	| row propEntry |
	row := LayoutMorph newRow.
	propEntry := SimpleNumberEntryMorph percentForRealFactor: 1.0.
	propEntry valueAccessor: [ :myModel | 
		myModel privateProportionalWidth ifNil: [ 1.0 ] ifNotNil: [ :width | width ]
	].
	propEntry valueUpdator: [ :newFactor | 
		self editModel proportionalWidth: newFactor 
						  minimum: self editModel privateFixedWidth ].
	propEntry refreshValueFrom: self editModel.
	^ row
		color: Color transparent;
		addMorph: (LabelMorph contents: '        ');
		addMorph: propEntry;
		addMorph: (LabelMorph contents: '%');
		yourself! !

!LayoutSpecEditPanel methodsFor: 'GUI building' stamp: 'hlsf 7/28/2024 10:47:40'!
buildMorphicWindow
	super buildMorphicWindow.
	self setLabel: 'LayoutSpec: ', (self model morph printStringLimitedTo: 30).
	self titleMorph showButtonsNamed: #( close pin collapse showHalo ); layoutSubmorphs! !

!LayoutSpecEditPanel methodsFor: 'GUI building' stamp: 'KenD 7/25/2024 16:08:09'!
newPane
	| controlsArea |
		
	widthArea := self newWidthArea.
	heightArea := self newHeightArea.
	paddingArea := self newPaddingArea.
	
	controlsArea := LayoutMorph newRow.
	controlsArea 
		separation: self defaultSeparation;
		addMorph: widthArea;
		addMorph: heightArea;
		addMorph: paddingArea;
		color: Theme current textPane.
	^ controlsArea ! !

!LayoutSpecEditPanel methodsFor: 'geometry' stamp: 'KenD 8/26/2015 14:43'!
fontPreferenceChanged
	"My size needs adjustment"

	self submorphsDo: [ :m | m fontPreferenceChanged. ].
	self refreshView.
	self submorphsDo: [ :m | m fontPreferenceChanged. ] 
.	self morphExtent: self minimumExtent ! !

!LayoutSpecEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 19:50'!
heightArea

	^ heightArea! !

!LayoutSpecEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 19:51'!
heightArea: newHeightArea

	heightArea := newHeightArea! !

!LayoutSpecEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 19:49'!
padEntry

	^ padEntry! !

!LayoutSpecEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 19:48'!
padRadio

	^ padRadio! !

!LayoutSpecEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 19:49'!
paddingArea

	^ paddingArea! !

!LayoutSpecEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 19:49'!
paddingArea: newPaddingArea

	paddingArea := newPaddingArea! !

!LayoutSpecEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 19:50'!
widthArea

	^ widthArea! !

!LayoutSpecEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 19:51'!
widthArea: newWidthArea

	widthArea := newWidthArea ! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 12/18/2013 18:21'!
heightSelectionSymbol

	| fix prop |
	fix    := self editModel privateFixedHeight.
	prop := self editModel privateProportionalHeight.
	
	^ prop 
		ifNil: [
			fix ifNil: [ #'use morph height' ] 
				ifNotNil: [ #Fixed ]
		]
		ifNotNil: [ #Proportional ].! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 3/9/2020 13:56:10'!
newEmptyAuxArea

	| aux |
	aux := LayoutMorph newColumn.
	^ aux
		color: Color  transparent ; "
		layoutSpec: (LayoutSpec 
					proportionalWidth: 1.0 
					fixedHeight: self auxHeight
					minorDirectionPadding: #center);
		separation: self defaultSeparation;"
		yourself! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 10/23/2020 08:33:47'!
newHeightArea
	"Answer a FramedLayoutMorph with controls for Height"
	
	| heightRegion label spec radio selected |
	heightRegion := LayoutMorph newColumn :: borderWidth: 2.
	label := LabelMorph contents: 'Height' ::
					 emphasis: AbstractFont boldCode.
	radio := RadioGroup fromList: #( 'use morph height' Fixed Proportional ).
	selected := self heightSelectionSymbol.

	spec := LayoutSpec useAll.
	spec offAxisEdgeWeight: #leftOrTop.
		
	"Setup"
	self setRadioSelection: radio selectSym: selected.
	(selected == #Fixed) ifTrue: [ self addFixedHeightEntryMorphTo: radio ].
	"Nota Bene: be sure to setRadioSelection:selectSym: BEFORE when:send:to:"
	radio when: #informRadioSelection send: #newHeightSelection: to: self.
		
	^ heightRegion
		layoutSpec: spec;
		separation: 2;
		color: Color  transparent ;
		addMorph: label;
		addMorph: radio;
		addMorph: ((selected == #Proportional)
			ifTrue: [self newProportionalHeightAuxArea]
			ifFalse: [self newEmptyAuxArea]);
		yourself 
! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 10/23/2020 08:33:55'!
newPaddingArea
	"Answer a FramedLayoutMorph with controls for Padding"
	
	| padArea label spec row |
	padArea := LayoutMorph newColumn :: borderWidth: 2.
	label := LabelMorph contents: 'offAxis EdgeWeight' ::
					 emphasis: AbstractFont boldCode.
	padRadio := RadioGroup fromList:  #('Left/Top' Center 'Right/Bottom' Specify) .
	
	spec := LayoutSpec fixedHeight:
		(2 * padArea borderWidth)
		+ (label minimumExtent y)
		+ (padRadio naturalHeight)
		+ 20.
	spec offAxisEdgeWeight: #leftOrTop.
			
	"Setup"
	padEntry := SimpleNumberEntryMorph realFactor: 1.0 maxNumChars: 3.
	row := (padRadio rowFor: #Specify).
	row addMorph: padEntry.
	padEntry valueAccessor: [ :myModel | myModel offAxisEdgeWeight ].
	padEntry valueUpdator: [ :newPad | self modelPadding: newPad ].
	padEntry refreshValueFrom: self editModel.
	self setPadRadio: padRadio fromPadFactor: padEntry value.
	
	padRadio when: #informRadioSelection send: #newPaddingSelection: to: self.
		
	^ padArea
		layoutSpec: spec;
		color: Color  transparent ;
		separation: 2;
		addMorph: label;
		addMorph: padRadio;
		yourself 
! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 10/23/2020 08:34:06'!
newWidthArea
	"Answer a FramedLayoutMorph with controls for Width"
	
	| widthRegion label radio selected |
	widthRegion := LayoutMorph newColumn :: borderWidth: 2.
	label := LabelMorph contents: 'Width' ::
					 emphasis: AbstractFont boldCode.
	radio := RadioGroup fromList: #( 'use morph width' Fixed Proportional ).
	selected := self widthSelectionSymbol.
			
	"Setup"
	self setRadioSelection: radio selectSym: selected.	
	(selected == #Fixed) ifTrue: [ self addFixedWidthEntryMorphTo: radio ].
	"Nota Bene: be sure to setRadioSelection:selectSym: BEFORE when:send:to:"
	radio when: #informRadioSelection send: #newWidthSelection: to: self.
		
	^ widthRegion
		color: Color  transparent ;
		separation: 2;
		addMorph: label;
		addMorph: radio;
		addMorph: ((selected == #Proportional)
			ifTrue: [self newProportionalWidthAuxArea]
			ifFalse: [self newEmptyAuxArea]);
		yourself 
! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 3/9/2020 14:00:37'!
refreshHeightArea
	"Update my view"
	
	| oldArea newArea |
	oldArea := self heightArea.
	newArea := self newHeightArea.
	self replaceArea: oldArea with: newArea.
	self heightArea: newArea;
		 morphExtent: self minimumExtent 
	! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 3/9/2020 14:00:47'!
refreshPaddingArea
	"Update my view"
	
	| oldArea newArea |
	oldArea := self paddingArea.
	newArea := self newPaddingArea.
	self replaceArea: oldArea with: newArea.
	self paddingArea: newArea;
		 morphExtent: self minimumExtent 
	! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 3/9/2020 14:00:54'!
refreshWidthArea
	"Update my view"
	
	| oldArea newArea |
	oldArea := self widthArea.
	newArea := self newWidthArea.
	self replaceArea: oldArea with: newArea.
	self widthArea: newArea;
		 morphExtent: self minimumExtent 
	! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 12/17/2013 19:55'!
setPadRadio: radio fromPadFactor: factor

	factor caseOf: {
		[0.0] -> [ (radio buttons at: 1) select ].
		[0.5] -> [ (radio buttons at: 2) select ].
		[1.0] -> [ (radio buttons at: 3) select ].
	} otherwise: [ (radio buttons at: 4) select ]! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 12/18/2013 19:45'!
setRadioSelection: radio selectSym: newSelectSym

	(radio buttonFor: newSelectSym) select! !

!LayoutSpecEditPanel methodsFor: 'area layouts' stamp: 'KenD 12/18/2013 18:22'!
widthSelectionSymbol

	| fix prop |
	fix    := self editModel privateFixedWidth.
	prop := self editModel privateProportionalWidth.
	
	^ prop 
		ifNil: [
			fix ifNil: [ #'use morph width' ] 
				ifNotNil: [ #Fixed ]
		]
		ifNotNil: [ #Proportional ].! !

!LayoutSpecEditPanel methodsFor: 'event handling' stamp: 'KenD 6/5/2020 07:49:54'!
modelPadding: numPixels
	
	self editModel offAxisEdgeWeight: numPixels.
	self refreshPaddingArea.! !

!LayoutSpecEditPanel methodsFor: 'event handling' stamp: 'KenD 12/18/2013 19:44'!
newHeightSelection: selectSym

	| spec origFix origProp |
	spec := self editModel.
	origFix   := spec privateFixedHeight.
	origProp := spec privateProportionalHeight.
	
	selectSym caseOf: {
		[ #Fixed ] -> [ 
			spec fixedHeight: (origFix ifNil: [ 0 ] ifNotNil: [ origFix ]) 
		].
		[ #Proportional ] -> [ 
			spec setProportionalHeight: (origProp ifNil: [ 1.0 ] ifNotNil: [ origProp ])
		].
		[ #'use morph height' ] -> [ self editModel useMorphHeight ].
	}.	
	
	self refreshHeightArea ! !

!LayoutSpecEditPanel methodsFor: 'event handling' stamp: 'KenD 12/17/2013 20:24'!
newPaddingSelection: padSym

	| radio |
	radio := self padRadio.
	padSym caseOf: {
		[ #'Left/Top' ] -> [ (radio buttons at: 1) select. self padEntry setValue: 0.0 ].
		[ #Center ] -> [ (radio buttons at: 2) select. self padEntry setValue: 0.5 ].
		[ #'Right/Bottom' ] -> [ (radio buttons at: 3) select. self padEntry setValue: 1.0 ].
		[ #Specify ] ->  [ (radio buttons at: 4) select ].
	}.

! !

!LayoutSpecEditPanel methodsFor: 'event handling' stamp: 'KenD 12/18/2013 19:46'!
newWidthSelection: selectSym

	| spec origFix origProp |
	spec := self editModel.
	origFix   := spec privateFixedWidth.
	origProp := spec privateProportionalWidth.
	
	selectSym caseOf: {
		[ #Fixed ] -> [ 
			spec fixedWidth: (origFix ifNil: [ 0 ] ifNotNil: [ origFix ]) 
		].
		[ #Proportional ] -> [ 
			spec setProportionalWidth: (origProp ifNil: [ 1.0 ] ifNotNil: [ origProp ])
		].
		[ #'use morph width' ] -> [ self editModel useMorphWidth ].
	}.	
	
	self refreshWidthArea.
	
! !

!LayoutSpecEditPanel methodsFor: 'event handling' stamp: 'KenD 3/9/2020 13:58:10'!
refreshView

	self refreshHeightArea; 
		refreshPaddingArea;
		refreshWidthArea;
		morphExtent: self minimumExtent! !

!LayoutSpecEditPanel methodsFor: 'event handling' stamp: 'KenD 7/27/2015 16:27'!
showHalo

	| aMorph |
	aMorph := self model morph.
	(aMorph isInWorld) 
	ifTrue: [aMorph show; addHalo ]
	ifFalse: [
		(HoverHelpMorph 
			contents: aMorph printString , ' not shown in world')
				popUpForHand: self  world activeHand
	]! !

!LayoutSpecEditPanel methodsFor: 'event handling' stamp: 'KenD 7/4/2015 15:24'!
showHaloButtonClicked

	self showHalo! !

!LayoutSpecEditPanel methodsFor: 'event handling' stamp: 'KenD 12/14/2021 13:29:48'!
updateMasterFromCopy
	"Update model from editModel"
	
	| original editCopy |
	original := self model.
	editCopy := self editModel.
	(self model morph isKindOf: ImageMorph)
	ifTrue: [
		self inform: 'NOTE: ImageMorphs can''t be resized'
	] 
	ifFalse: [
		original proportionalHeight: editCopy privateProportionalHeight 
				  minimum: editCopy privateFixedHeight.
		original proportionalWidth: editCopy privateProportionalWidth 
				  minimum: editCopy privateFixedWidth
	].
	original offAxisEdgeWeight: editCopy offAxisEdgeWeight.
	self editModel: nil.
	"My containing LayoutMorph may need to recalculate & redisplay"
	original morph containingLayout 
		ifNotNil: [ :myLayoutMorph | myLayoutMorph layoutSubmorphs; redrawNeeded ].
	original triggerEvent: #propertyChanged.
	
	self stayUp 
		ifFalse: [ self delete ] 
		ifTrue: [ self refreshView ]! !

!Morph methodsFor: '*ui-layout-panel' stamp: 'KenD 9/17/2016 10:08:23'!
colorizeLayouts
	"debug"
	"Tinge rows red, columns blue"
	
	self submorphsDo: [ :s | s colorizeLayouts ].
	(self isKindOf: LayoutMorph) ifTrue: [
		(self direction = #horizontal)
		ifTrue:  [self color: (Color lightRed alpha: 0.5)] "Row"
		ifFalse: [self color: (Color skyBlue  alpha: 0.5)] "Column"
	]! !

!Morph methodsFor: '*ui-layout-panel' stamp: 'KenD 9/18/2016 08:59:03'!
containingLayout
	"Answer the LayoutMorph containing me or nil"
	
	| container |
	container := self owner.
	container 
		ifNil: [ ^ container ] 
		ifNotNil: [
			(container isKindOf: LayoutMorph) 
				ifTrue: [ ^ container ]
				ifFalse: [ ^ owner containingLayout ]
		]! !

!Morph methodsFor: '*ui-layout-panel' stamp: 'KenD 9/2/2024 19:49:42'!
frameLayouts: colors depth: depth
	"Display frames around LayoutMorphs, then erase"
	
	(self isKindOf: LayoutMorph)
	ifFalse:  [
		self submorphsDo: [ :m | m frameLayouts: colors depth: depth ]
	]
	ifTrue: [ | frame colorIndex |
	 	colorIndex := 1 + depth mod: (colors size - 1).
		frame := FrameMorph new 
			:: borderColor: (colors at: colorIndex); 
			borderWidth: 2;
			morphExtent: self extentInOwner;
			morphPosition: self positionInWorld;
			yourself.
		frame openInWorld.
		self submorphsDo: [ :m | m frameLayouts: colors depth: depth + 1 ].
	].! !

!Morph methodsFor: '*ui-layout-panel' stamp: 'KenD 9/2/2024 19:49:46'!
frameNonLayouts: colors depth: depth
	"Display frames around LayoutMorphs, then erase"
	
	(self isKindOf: LayoutMorph)
	ifTrue:  [
		self submorphsDo: [ :m | m frameNonLayouts: colors depth: depth ]
	]
	ifFalse: [ | frame colorIndex |
	 	colorIndex := 1 + depth mod: (colors size - 1).
		frame := FrameMorph new 
			:: borderColor: (colors at: colorIndex); 
			borderWidth: 2;
			morphExtent: self extentInOwner;
			morphPosition: self positionInWorld;
			yourself.
		frame openInWorld.
		self submorphsDo: [ :m | m frameNonLayouts: colors depth: depth + 1 ].
	].! !

!Morph methodsFor: '*ui-layout-panel' stamp: 'KenD 9/16/2016 15:16:18'!
shadowNonLayouts
	"debug"
	"Turn on dropShadows for submorphs' graphic elements"
	
	"Nota Bene: shadow submorphs FIRST or you will be recursively "
	" adding shadows to shadows to shadows to..."
	self submorphsDo: [ :s | s shadowNonLayouts ].
	(self isKindOf: LayoutMorph) ifFalse: [ self showDropShadow ]! !

!Morph methodsFor: '*ui-layout-panel' stamp: 'KenD 8/3/2023 13:37:11'!
showLayouts
	"debug"
	"Display frames around LayoutMorphs; then delete"
	| colors |
	colors := Color orange mix: Color blue shades: 12.
	self submorphsDo: [ :m | m frameLayouts: colors depth: 0 ].
	self redrawNeeded.
	self world displayWorldOn: self world mainCanvas.
	(Delay forSeconds: 5) wait.
	"Assume only my frames were added to World"
	self world submorphsDo: [ :s | (s isKindOf: FrameMorph) ifTrue: [ s delete ]].! !

!Morph methodsFor: '*ui-layout-panel' stamp: 'KenD 8/3/2023 13:38:31'!
showNonLayouts
	"debug"
	"Display frames around LayoutMorphs; then delete"
	| colors |
	colors := Color orange mix: Color blue shades: 12.
	self submorphsDo: [ :m | m frameNonLayouts: colors depth: 0 ].
	self redrawNeeded.
	self world displayWorldOn: self world mainCanvas.
	(Delay forSeconds: 5) wait.
	"Assume only my frames were added to World"
	self world submorphsDo: [ :s | (s isKindOf: FrameMorph) ifTrue: [ s delete ]].! !

!Morph methodsFor: '*ui-layout-panel' stamp: 'KenD 9/16/2016 15:14:17'!
unShadowNonLayouts
	"debug"
	"Remove submorph dropShadows"
	(self isKindOf: LayoutMorph) ifFalse: [ self hideDropShadow ].
	self submorphsDo: [ :s | s unShadowNonLayouts ].! !

!PlacedMorph methodsFor: '*ui-layout-panel' stamp: 'KenD 5/28/2022 10:57:11'!
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"Add morph-specific items to the given menu which was invoked by the given hand.  This method provides is invoked both from the halo-menu and from the control-menu regimes."

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu 
		"addLine;"
		add: 'edit my LayoutSpec' action: #editMyLayoutSpec! !

!PlacedMorph methodsFor: '*ui-layout-panel' stamp: 'KenD 9/14/2024 15:55:38'!
editMyLayoutSpec

	self layoutSpec ifNil: [ self layoutSpec: LayoutSpec keepMorphExtent ].
	self runningWorld activeHand releaseMouseFocus .
	LayoutSpecEditPanel open: self layoutSpec! !

!LayoutMorph methodsFor: '*ui-layout-panel' stamp: 'KenD 12/24/2013 15:22'!
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"Add morph-specific items to the given menu which was invoked by the given hand.  This method provides is invoked both from the halo-menu and from the control-menu regimes."

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu 
		"addLine;"
		add: 'edit me (a LayoutMorph)' action: #editMe! !

!LayoutMorph methodsFor: '*ui-layout-panel' stamp: 'KenD 12/24/2013 15:14'!
direction: horizOrVert

	self flag: #jmvVer. "Move to category #accessing"

	direction := horizOrVert! !

!LayoutMorph methodsFor: '*ui-layout-panel' stamp: 'KenD 9/14/2024 15:56:32'!
editMe

	self runningWorld activeHand releaseMouseFocus .
	LayoutMorphEditPanel open: self! !

!LayoutSpec methodsFor: '*ui-layout-panel' stamp: 'KenD 4/18/2015 20:18'!
morph
	"For #showHalo"
	^ morph! !

!LayoutSpec methodsFor: '*ui-layout-panel' stamp: 'KenD 12/24/2013 15:14'!
privateFixedHeight

	^ fixedHeight! !

!LayoutSpec methodsFor: '*ui-layout-panel' stamp: 'KenD 12/24/2013 15:15'!
privateFixedWidth

	^ fixedWidth! !

!LayoutSpec methodsFor: '*ui-layout-panel' stamp: 'KenD 12/24/2013 15:15'!
privateProportionalHeight

	^ proportionalHeight! !

!LayoutSpec methodsFor: '*ui-layout-panel' stamp: 'KenD 12/24/2013 15:15'!
privateProportionalWidth

	^ proportionalWidth ! !
