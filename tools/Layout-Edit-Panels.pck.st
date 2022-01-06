'From Cuis 6.0 [latest update: #5031] on 31 December 2021 at 12:42:29 pm'!
'Description I supply LayourSpec and Layout editors'!
!provides: 'Layout-Edit-Panels' 1 8!
!requires: 'UI-Click-Select' 1 2 nil!
!requires: 'UI-Panel' 1 17 nil!
!requires: 'UI-DragAndDrop' 1 6 nil!
SystemOrganization addCategory: 'Layout-Edit-Panels'!


!classDefinition: #LayoutMorphEditPanel category: 'Layout-Edit-Panels'!
EditPanel subclass: #LayoutMorphEditPanel
	instanceVariableNames: 'directionArea paddingArea separationArea colorArea padRadio padEntry'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Layout-Edit-Panels'!
!classDefinition: 'LayoutMorphEditPanel class' category: 'Layout-Edit-Panels'!
LayoutMorphEditPanel class
	instanceVariableNames: ''!

!classDefinition: #LayoutSpecEditPanel category: 'Layout-Edit-Panels'!
EditPanel subclass: #LayoutSpecEditPanel
	instanceVariableNames: 'widthArea heightArea paddingArea padRadio padEntry'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Layout-Edit-Panels'!
!classDefinition: 'LayoutSpecEditPanel class' category: 'Layout-Edit-Panels'!
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

!LayoutMorphEditPanel methodsFor: 'GUI building' stamp: 'hlsf 12/30/2021 10:43:11'!
buildMorphicWindow
	super buildMorphicWindow.
	self setLabel: 'Layout: ', (self model printStringLimitedTo: 30).
	self titleMorph showButtonsNamed: #( close pin collapse showHalo ).
! !

!LayoutMorphEditPanel methodsFor: 'GUI building' stamp: 'hlsf 12/30/2021 10:30:09'!
newPane
	| controlArea leftCol rightCol  |	
		
	directionArea _ self newDirectionArea.
	paddingArea _ self newPaddingArea.
	separationArea _ self newSeparationtionArea.
	colorArea _ self newColorArea.

	controlArea  _ LayoutMorph newRow.  "A row of two columns"
	controlArea separation: 2.
		
	leftCol _ LayoutMorph newColumn.
	leftCol 
		separation: self defaultSeparation;
		axisEdgeWeight: #columnTop;
		addMorph: directionArea;
		addMorph: paddingArea.
	controlArea addMorph: leftCol.

	rightCol _ LayoutMorph newColumn.
	rightCol 
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

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 14:43'!
padEntry

	^ padEntry! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 14:34'!
padRadio

	^ padRadio! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/16/2013 15:29'!
paddingArea

	^ paddingArea! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 12:27'!
paddingArea: newPaddingArea

	paddingArea := newPaddingArea! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/16/2013 15:29'!
separationArea

	^ separationArea! !

!LayoutMorphEditPanel methodsFor: 'accessing' stamp: 'KenD 12/17/2013 12:27'!
separationArea: newSeparationArea

	separationArea := newSeparationArea! !

!LayoutMorphEditPanel methodsFor: 'private' stamp: 'KenD 12/13/2016 19:18:31'!
colorMorph
	"Answer a framed color swatch"
	
	| imageMorph frameMorph |
	imageMorph := DropColorMorph fromColor: self editModel color.
	imageMorph image: (self editModel color icon magnifyTo: 64@64). "NB: not resizable"
	imageMorph setProperty:  #'allowsMorphDrop' toValue: true.
	imageMorph setProperty: #dropAction 
				   toValue: [ :aMorph :colorValue |
								(colorValue isKindOf: Color)
									ifTrue: [ self modelColor: colorValue ]. 
									"else ignore"
							].
	frameMorph := FrameMorph new ::
		morphExtent: 68@68;
		borderColor: Color black; 
		borderWidth: 2; 
		yourself.
	frameMorph addMorph: imageMorph.
	imageMorph morphPosition: 2@2.
	
	"Make color swatch draggable"
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

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 2/26/2020 07:57:15'!
modelBeColumn
	"My editModel should be a Column"

	self editModel beColumn.
	self refreshDirectionArea.
	self refreshPaddingArea.
	self editModel refreshExtent.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 2/26/2020 07:57:26'!
modelBeRow
	"My editModel should be a Row"
	
	self editModel beRow.
	self refreshDirectionArea.
	self refreshPaddingArea.
	self editModel refreshExtent.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 12/17/2013 12:35'!
modelColor: aColor
	
	self editModel color: aColor.
	self refreshColorArea.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 5/22/2020 13:32:33'!
modelPadding: numPixels
	
	self editModel axisEdgeWeight: numPixels.
	self refreshPaddingArea.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 12/17/2013 12:36'!
modelXSeparation: numPixels

	self editModel separation: numPixels @ self editModel ySeparation.
	self refreshSeparationtionArea.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 12/17/2013 12:36'!
modelYSeparation: numPixels

	self editModel separation: (self editModel xSeparation @ numPixels).
	self refreshSeparationtionArea.! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 12/17/2013 14:18'!
newDirectionSelection: dirSymbol

	(dirSymbol = #Row)
		ifTrue: [ self modelBeRow ] 
		ifFalse: [ self modelBeColumn ]! !

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 4/19/2015 15:19'!
refreshView

	self refreshColorArea; 
		refreshDirectionArea; 
		refreshPaddingArea; 
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

!LayoutMorphEditPanel methodsFor: 'event handling' stamp: 'KenD 5/22/2020 13:26:01'!
updateMasterFromCopy
	"Update model from editModel"
	
	| original editCopy |
	original := self model.
	editCopy := self editModel.
	original direction: editCopy direction.
	original axisEdgeWeight: editCopy axisEdgeWeight.
	original separation: ( editCopy xSeparation @ editCopy ySeparation ).
	original color: editCopy color.
	original refreshExtent; layoutSubmorphs; redrawNeeded.
	original owner ifNotNil: [ :container | container layoutSubmorphs; redrawNeeded ].
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

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 10/23/2020 08:35:35'!
newPaddingArea
	"Answer a FramedLayoutMorph with controls for Padding"
	
	| padArea label direction |
	padArea := LayoutMorph newColumn :: borderWidth: 2.
	label := LabelMorph contents: 'EdgeWeight' ::
					 emphasis: AbstractFont boldCode.
	direction := self editModel direction.
	padRadio := RadioGroup fromList: ( 
		(direction = #horizontal)
			ifTrue: [ #(Left Center Right Specify) ] 
			ifFalse: [ #(Top Center Bottom Specify) ]
	)..
	
	"Setup"
	padEntry := SimpleNumberEntryMorph realFactor: 1.0 maxNumChars: 3.
	(padRadio rowFor: #Specify) addMorph: padEntry.
	padEntry valueAccessor: [ :myModel | myModel axisEdgeWeight ].
	padEntry valueUpdator: [ :newPad | self modelPadding: newPad ].
	padEntry refreshValueFrom: self editModel.
	self setPadRadio: padRadio fromPadFactor: padEntry value.
	
	padRadio when: #informRadioSelection send: #newPaddingSelection: to: self.
		
	^ padArea
		color: Color transparent ;
		separation: 4;
		addMorph: label;
		addMorph: padRadio;
		yourself 
	
	! !

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 12/17/2013 14:51'!
newPaddingSelection: padSym

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

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 10/23/2020 08:35:44'!
newSeparationtionArea
	"Answer a FramedLayoutMorph with controls for x & y separation"
	
	| sepArea label xArea yArea xSep ySep |
	sepArea := LayoutMorph newColumn :: borderWidth: 2.
	label := LabelMorph contents: 'Separation' ::
					 emphasis: AbstractFont boldCode.
		
	"Setup"
	xSep := SimpleNumberEntryMorph 
			integerRangeFrom: 0 
			to: DisplayScreen actualScreenSize x 
			maxNumChars: 5.
	xArea := LayoutMorph newRow.
	xArea 
		color: Color  transparent;
		separation: 2;
		addMorph: (LabelMorph contents: '  X ');
		addMorph: xSep;
		addMorph: (LabelMorph contents: 'pixels').
		
	ySep := SimpleNumberEntryMorph 
			integerRangeFrom: 0 
			to: DisplayScreen actualScreenSize y
			maxNumChars: 5.
	yArea := LayoutMorph newRow.
	yArea 
		color: Color  transparent;
		separation: 2;
		addMorph: (LabelMorph contents: '  Y ');
		addMorph: ySep;
		addMorph: (LabelMorph contents: 'pixels').

	"Value flow"
	xSep valueAccessor: [ :myModel | myModel xSeparation ].
	xSep valueUpdator:   [ :newX | self modelXSeparation: newX ].
	ySep valueAccessor: [ :myModel | myModel ySeparation ].
	ySep valueUpdator:   [ :newY | self modelYSeparation: newY ].
	xSep refreshValueFrom: self editModel.
	ySep refreshValueFrom: self editModel.
		
	 ^ sepArea
		color: Color  transparent ;
		separation: 2;
		addMorph: label;
		addMorph: xArea;
		addMorph: yArea;
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

!LayoutMorphEditPanel methodsFor: 'area layouts' stamp: 'KenD 12/17/2013 12:29'!
refreshPaddingArea
	"Update my view"
	
	| oldArea newArea |
	oldArea := self paddingArea.
	newArea := self newPaddingArea.
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

!LayoutSpecEditPanel methodsFor: 'GUI building' stamp: 'hlsf 12/30/2021 10:43:29'!
buildMorphicWindow
	super buildMorphicWindow.
	self setLabel: 'LayoutSpec: ', (self model morph printStringLimitedTo: 30).
	self titleMorph showButtonsNamed: #( close pin collapse showHalo ); layoutSubmorphs.
! !

!LayoutSpecEditPanel methodsFor: 'GUI building' stamp: 'hlsf 12/30/2021 10:42:31'!
newPane
	| controlsArea |
		
	widthArea _ self newWidthArea.
	heightArea _ self newHeightArea.
	paddingArea _ self newPaddingArea.
	
	controlsArea _ LayoutMorph newRow.
	controlsArea 
		separation: self defaultSeparation;
		addMorph: widthArea;
		addMorph: heightArea;
		addMorph: paddingArea.
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

!Morph methodsFor: '*layout-edit-panels' stamp: 'KenD 9/17/2016 10:08:23'!
colorizeLayouts
	"debug"
	"Tinge rows red, columns blue"
	
	self submorphsDo: [ :s | s colorizeLayouts ].
	(self isKindOf: LayoutMorph) ifTrue: [
		(self direction = #horizontal)
		ifTrue:  [self color: (Color lightRed alpha: 0.5)] "Row"
		ifFalse: [self color: (Color skyBlue  alpha: 0.5)] "Column"
	]! !

!Morph methodsFor: '*layout-edit-panels' stamp: 'KenD 9/18/2016 08:59:03'!
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

!Morph methodsFor: '*layout-edit-panels' stamp: 'KenD 12/24/2013 15:09'!
editMyLayoutSpec

	self layoutSpec ifNil: [ self layoutSpec: LayoutSpec keepMorphExtent ].
	LayoutSpecEditPanel open: self layoutSpec! !

!Morph methodsFor: '*layout-edit-panels' stamp: 'KenD 11/7/2021 14:13:03'!
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
			morphExtent: self morphExtentInOwner;
			morphPosition: self morphPositionInWorld;
			yourself.
		frame openInWorld.
		self submorphsDo: [ :m | m frameLayouts: colors depth: depth + 1 ].
	].! !

!Morph methodsFor: '*layout-edit-panels' stamp: 'KenD 11/7/2021 14:13:12'!
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
			morphExtent: self morphExtentInOwner;
			morphPosition: self morphPositionInWorld;
			yourself.
		frame openInWorld.
		self submorphsDo: [ :m | m frameNonLayouts: colors depth: depth + 1 ].
	].! !

!Morph methodsFor: '*layout-edit-panels' stamp: 'KenD 9/16/2016 15:16:18'!
shadowNonLayouts
	"debug"
	"Turn on dropShadows for submorphs' graphic elements"
	
	"Nota Bene: shadow submorphs FIRST or you will be recursively "
	" adding shadows to shadows to shadows to..."
	self submorphsDo: [ :s | s shadowNonLayouts ].
	(self isKindOf: LayoutMorph) ifFalse: [ self showDropShadow ]! !

!Morph methodsFor: '*layout-edit-panels' stamp: 'KenD 9/16/2016 15:12:54'!
showLayouts
	"debug"
	"Display frames around LayoutMorphs; then delete"
	| colors |
	colors := Color orange mix: Color blue shades: 12.
	self submorphsDo: [ :m | m frameLayouts: colors depth: 0 ].
	self redrawNeeded; refreshWorld.
	(Delay forSeconds: 5) wait.
	"Assume only my frames were added to World"
	self world submorphsDo: [ :s | (s isKindOf: FrameMorph) ifTrue: [ s delete ]].! !

!Morph methodsFor: '*layout-edit-panels' stamp: 'KenD 9/16/2016 15:13:33'!
showNonLayouts
	"debug"
	"Display frames around LayoutMorphs; then delete"
	| colors |
	colors := Color orange mix: Color blue shades: 12.
	self submorphsDo: [ :m | m frameNonLayouts: colors depth: 0 ].
	self redrawNeeded; refreshWorld.
	(Delay forSeconds: 5) wait.
	"Assume only my frames were added to World"
	self world submorphsDo: [ :s | (s isKindOf: FrameMorph) ifTrue: [ s delete ]].! !

!Morph methodsFor: '*layout-edit-panels' stamp: 'KenD 9/16/2016 15:14:17'!
unShadowNonLayouts
	"debug"
	"Remove submorph dropShadows"
	(self isKindOf: LayoutMorph) ifFalse: [ self hideDropShadow ].
	self submorphsDo: [ :s | s unShadowNonLayouts ].! !

!LayoutMorph methodsFor: '*layout-edit-panels' stamp: 'KenD 12/24/2013 15:22'!
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"Add morph-specific items to the given menu which was invoked by the given hand.  This method provides is invoked both from the halo-menu and from the control-menu regimes."

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu 
		"addLine;"
		add: 'edit me (a LayoutMorph)' action: #editMe! !

!LayoutMorph methodsFor: '*layout-edit-panels' stamp: 'KenD 12/24/2013 15:14'!
direction: horizOrVert

	self flag: #jmvVer. "Move to category #accessing"

	direction := horizOrVert! !

!LayoutMorph methodsFor: '*layout-edit-panels' stamp: 'KenD 12/24/2013 15:14'!
editMe

	LayoutMorphEditPanel open: self! !

!LayoutSpec methodsFor: '*layout-edit-panels' stamp: 'KenD 4/18/2015 20:18'!
morph
	"For #showHalo"
	^ morph! !

!LayoutSpec methodsFor: '*layout-edit-panels' stamp: 'KenD 12/24/2013 15:14'!
privateFixedHeight

	^ fixedHeight! !

!LayoutSpec methodsFor: '*layout-edit-panels' stamp: 'KenD 12/24/2013 15:15'!
privateFixedWidth

	^ fixedWidth! !

!LayoutSpec methodsFor: '*layout-edit-panels' stamp: 'KenD 12/24/2013 15:15'!
privateProportionalHeight

	^ proportionalHeight! !

!LayoutSpec methodsFor: '*layout-edit-panels' stamp: 'KenD 12/24/2013 15:15'!
privateProportionalWidth

	^ proportionalWidth ! !
