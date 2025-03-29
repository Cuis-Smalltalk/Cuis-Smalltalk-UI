'From Cuis7.3 [latest update: #7092] on 29 March 2025 at 1:14:46 pm'!
'Description Models and morphs for defining and displaying tables.'!
!provides: 'UI-Table' 1 6!
!requires: 'Cuis-Base' 60 5166 nil!
SystemOrganization addCategory: #'UI-Table'!


!classDefinition: #AlignedLabelMorph category: #'UI-Table'!
LabelMorph subclass: #AlignedLabelMorph
	instanceVariableNames: 'alignment'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'AlignedLabelMorph class' category: #'UI-Table'!
AlignedLabelMorph class
	instanceVariableNames: ''!

!classDefinition: #TableMorph category: #'UI-Table'!
ColoredBoxMorph subclass: #TableMorph
	instanceVariableNames: 'model style maximumExtent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'TableMorph class' category: #'UI-Table'!
TableMorph class
	instanceVariableNames: ''!

!classDefinition: #Column category: #'UI-Table'!
Object subclass: #Column
	instanceVariableNames: 'table cellValueBlock alignment'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'Column class' category: #'UI-Table'!
Column class
	instanceVariableNames: ''!

!classDefinition: #NumberColumn category: #'UI-Table'!
Column subclass: #NumberColumn
	instanceVariableNames: 'fractionDigits'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'NumberColumn class' category: #'UI-Table'!
NumberColumn class
	instanceVariableNames: ''!

!classDefinition: #Table category: #'UI-Table'!
Object subclass: #Table
	instanceVariableNames: 'columns items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'Table class' category: #'UI-Table'!
Table class
	instanceVariableNames: ''!

!classDefinition: #TableStyle category: #'UI-Table'!
Object subclass: #TableStyle
	instanceVariableNames: 'color font separation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'TableStyle class' category: #'UI-Table'!
TableStyle class
	instanceVariableNames: ''!


!AlignedLabelMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 22:43:50'!
alignment
	alignment := #left! !

!AlignedLabelMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 22:44:14'!
alignment: aSymbol
	alignment := aSymbol! !

!AlignedLabelMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 22:55:15'!
drawOn: aCanvas
	| leftOffset |
	leftOffset := alignment caseOf: {
		[#leftFlush] -> [0].
		[#rightFlush] -> [self morphWidth - self measureContents x].
		[#centered] -> [(self morphWidth - self measureContents x) / 2]}.
	aCanvas
		drawString: (contents ifNil: [ '' ])
		at: (borderWidth + leftOffset)@borderWidth
		font: self fontToUse
		color: color.
	(borderWidth > 0) ifTrue: [
		aCanvas
			frameRectangle: (`0@0` extent: extent)
			color: borderColor
			borderWidth: borderWidth
			borderStyleSymbol: #simple ]! !

!AlignedLabelMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 22:50:43'!
initialize
	super initialize.
	alignment := #left! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 3/29/2025 13:14:42'!
adjustExtent
	| minimumExtent adjustedExtent |
	minimumExtent := self layoutMorph minimumExtent + (self scrollPane padding * 2).
	minimumExtent y > maximumExtent y ifTrue: [
		minimumExtent := minimumExtent x + ScrollBar scrollbarThickness @ minimumExtent y].
	adjustedExtent := minimumExtent min: maximumExtent.
	self scrollPane morphExtent: adjustedExtent.
	self morphExtent: adjustedExtent! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'KenD 9/5/2024 13:42:31'!
initialize
	| layoutMorph scrollPane |
	super initialize.
	maximumExtent := Display extent.
	layoutMorph := LayoutMorph newColumn.
	scrollPane := PluggableScrollPane new.
	scrollPane scroller: layoutMorph.
	self
		addMorph: scrollPane;
		color: Color green;
		style: TableStyle new;
		morphExtent: `400@300`! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'KenD 9/5/2024 13:46:32'!
layoutMorph
	^self scrollPane scroller! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 21:02:05'!
maximumExtent
	^maximumExtent! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 21:05:54'!
maximumExtent: aPoint
	maximumExtent := aPoint.
	self update: #maximumExtent! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 19:08:53'!
maximumHeight: aNumber
	self maximumExtent: maximumExtent x @ aNumber! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 19:08:47'!
maximumWidth: aNumber
	self maximumExtent: aNumber @ maximumExtent y! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 13:00:10'!
model
	^model! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 12:56:15'!
model: aTable
	model ifNotNil: [model removeActionsWithReceiver: self].
	aTable ifNotNil: [aTable addDependent: self].
	model := aTable.
	self update: #model! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 22:57:11'!
morphForColumn: column item: item
	^(AlignedLabelMorph contents: (column cellValue: item) font: style font) alignment: column alignment
	"| text |
	text := (column cellValue: item) asText.
	text addAttribute: (TextAlignment perform: column alignment).
	text font: style font.
	^(TextParagraphMorph contents: text)
		color: style color;
		noBorder;
		setHeightOnContent"! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 13:27:24'!
scrollPane
	^self firstSubmorph! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 13:00:35'!
style
	^ style! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 18:50:30'!
style: aTableStyle
	style ifNotNil: [style removeActionsWithReceiver: self].
	aTableStyle ifNotNil: [aTableStyle addDependent: self].
	style := aTableStyle.
	self layoutMorph color: style color! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 12:21:57'!
update: aSymbol
	super update: aSymbol.
	aSymbol caseOf: {
		[#color] -> [self updateColor].
		[#separation] -> [self updateSeparation].
		[#model] -> [self updateRows].
		[#items] -> [self updateRows].
		[#columns] -> [self updateRows].
		[#font] -> [self updateRows].
		[#maximumExtent] -> [self adjustExtent]}.
	self redrawNeeded! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 20:57:41'!
updateColor
	self layoutMorph color: style color.
	self layoutMorph submorphsDo: [:row | row color: style color]! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 22:58:06'!
updateRows
	| columnWidths strangeDelta |
	strangeDelta := 1. self flag: 'find out why this is needed'.
	self layoutMorph
		color: style color;
		separation: 0 @ style ySeparation;
		removeAllMorphs.
	columnWidths := Dictionary new.
	model columns do: [:column |
		columnWidths at: column put: (column desiredWidth: style font)].
	model items do: [:item |
		| row |
		row := LayoutMorph newRow
			color: style color;
			separation: style xSeparation @ 0.
		model columns do: [:column |
			row
				addMorph: (self morphForColumn: column item: item)
				layoutSpec: ((LayoutSpec
					morphHeightFixedWidth: (columnWidths at: column) + strangeDelta)
						offAxisEdgeWeight: 0.0)].
		row morphExtent: row minimumExtent.
		self layoutMorph addMorph: row layoutSpec: LayoutSpec keepMorphExtent].
	self adjustExtent! !

!TableMorph methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 13:07:31'!
updateSeparation
	self layoutMorph separation: 0 @ style ySeparation.
	self layoutMorph submorphsDo: [:row | row separation: style xSeparation @ 0].
	self adjustExtent! !

!TableMorph class methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 13:21:04'!
example
	"
	self example"
	"To show the dynamic behavior do it step by step in a workspace."
	| table tableMorph tableStyle |
	table := Table new
		addColumn: [:item | item first];
		addColumn: [:item | item second];
		items: #(('Alan' 'Kay') ('Adele' 'Goldberg')).

	tableMorph := (TableMorph model: table) openInWorld.
	
	table addItem: #('Dan' 'Ingalls').
	table addColumn: [:item | item first , ' ' , item second].
	
	tableStyle := tableMorph style.
	tableStyle color: Color lightBlue.
	tableStyle separation: 5 @ 3.
	tableStyle font: self fontParcPlaceLegacy12.
	
	table addItem: #('Ted' 'Kaehler').
	table addItem: #('Someone' 'Withaverylonglonglongname').
	table addItems: #(('John' 'Maloney') ('Juan' 'Vuletich'))! !

!TableMorph class methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 12:44:14'!
exampleAuthors
	"
	self exampleAuthors"
	| table authors items |
	authors := Bag new.
	CompiledMethod allInstances
		do: [:cm | authors add: cm author]
		displayingProgress: 'Analyzing contributions'.
	items := Smalltalk knownInitialsAndNames asSortedCollection: [:a :b |
		(authors occurrencesOf: a first) > (authors occurrencesOf: b first)].
	table := Table new
		addColumn: [:array | array first];
		addColumn: [:array | array second];
		addNumberColumn: [:array | authors occurrencesOf: array first ];
		items: items.

	(TableMorph model: table)
		maximumHeight: 500;
		openInWorld! !

!TableMorph class methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 12:42:25'!
exampleFiles
	"
	self exampleFiles"
	| table |
	table := Table new
		addColumn: [:fileEntry | fileEntry name];
		addColumn: [:fileEntry | fileEntry modificationTime date yyyymmdd , 
			' ' , fileEntry modificationTime time print24];
		addNumberColumn: [:fileEntry | fileEntry fileSize];
		items: ((DirectoryEntry cuisBaseDirectory / 'Packages' / 'Features') files 
			asSortedCollection: [:a :b | a modificationTime > b modificationTime]).

	(TableMorph model: table)
		maximumExtent: `1000@500`;
		openInWorld! !

!TableMorph class methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 12:43:57'!
exampleLOC
	"
	self exampleLOC"
	| loc items table |
	loc := Dictionary new.
	Smalltalk allClasses
		do: [:cls | loc at: cls put: cls linesOfCode]
		displayingProgress: 'Analyzing LOC'.
	items := Smalltalk allClasses asSortedCollection: [:a :b |
		(loc at: a) > (loc at: b)].
	table := Table new
		addColumn: [:cls | cls name];
		addNumberColumn: [:cls | loc at: cls ];
		items: items.

	(TableMorph model: table)
		maximumHeight: 500;
		openInWorld! !

!TableMorph class methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 12:44:35'!
examplePackages
	"
	self examplePackages"
	| table |
	table := Table new
		addColumn: [:cp | cp hasUnsavedChanges ifTrue: ['*'] ifFalse: ['']];
		addColumn: [:cp | cp packageName];
		addColumn: [:cp | String streamContents: [:stream | cp provides printVersionRevisionOn: stream]];
		addColumn: [:cp | cp fullFileName];
		addNumberColumn: [:cp | cp linesOfCode];
		items: CodePackage installedPackages values.

	(TableMorph model: table) openInWorld! !

!TableMorph class methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 13:03:03'!
examplePeople
	"
	self examplePeople"
	"To show the dynamic nature do it step by step in a workspace."
	| table tableMorph tableStyle |
	table := Table new
		addColumn: [:item | item first];
		addColumn: [:item | item second];
		items: #(('Alan' 'Kay') ('Adele' 'Goldberg')).

	tableMorph := (TableMorph model: table) openInWorld.
	
	table addItem: #('Dan' 'Ingalls').
	table addColumn: [:item | item first , ' ' , item second].
	
	tableStyle := tableMorph style.
	tableStyle color: Color lightBlue.
	tableStyle separation: 5 @ 3.
	tableStyle font: (FontFamily familyName: 'Parc Place Legacy' pointSize: 12).
	
	table addItem: #('Ted' 'Kaehler').
	table addItem: #('Someone' 'Withaverylonglonglongname').
	table addItems: #(('John' 'Maloney') ('Juan' 'Vuletich'))! !

!TableMorph class methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 12:43:18'!
examplePreferences
	"
	self examplePreferences"
	| table |
	table := Table new
		addColumn: [:preference | preference name];
		addColumn: [:preference | preference category];
		addColumn: [:preference | preference type printString];
		addColumn: [:preference | preference value printString];
		items: (Preferences allPreferences asSortedCollection: [:a :b | a name < b name]).

	(TableMorph model: table)
		maximumExtent: `1000@500`;
		openInWorld! !

!TableMorph class methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 13:19:13'!
fontParcPlaceLegacy12
	FontFamily readIfNeeded: DirectoryEntry trueTypeFontsDirectory / 'Cream'.
	^FontFamily familyName: 'Parc Place Legacy' pointSize: 12! !

!TableMorph class methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 12:58:36'!
model: aTable
	^self new model: aTable! !

!Column methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 22:55:59'!
alignment
	^alignment! !

!Column methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 22:56:07'!
alignment: aSelector
	alignment := aSelector! !

!Column methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 21:48:26'!
cellValue: anItem
	^cellValueBlock numArgs = 1
		ifTrue: [cellValueBlock value: anItem]
		ifFalse: [cellValueBlock value: anItem value: table]! !

!Column methodsFor: 'as yet unclassified' stamp: 'bp 5/15/2022 14:35:36'!
cellValueBlock: aBlock
	cellValueBlock _ aBlock! !

!Column methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 12:11:54'!
desiredWidth: font
	table items ifEmpty: [^0].
	^table items max: [:each | font widthOfString: (self cellValue: each)]! !

!Column methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 22:55:48'!
initialize
	alignment := #leftFlush! !

!Column methodsFor: 'as yet unclassified' stamp: 'bp 5/15/2022 14:34:48'!
setTable: aTable
	table _ aTable! !

!Column class methodsFor: 'as yet unclassified' stamp: 'bp 5/15/2022 14:34:33'!
table: aTable
	^self new setTable: aTable! !

!NumberColumn methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 21:48:45'!
cellValue: anItem
	| cellValue |
	cellValue := super cellValue: anItem.
	(cellValue is: #String) ifTrue: [^cellValue].
	^String streamContents: [:stream | cellValue printOn: stream fractionDigits: fractionDigits]! !

!NumberColumn methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 21:07:51'!
fractionDigits: anInteger
	fractionDigits := anInteger! !

!NumberColumn methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 22:55:48'!
initialize
	super initialize.
	alignment := #rightFlush.
	fractionDigits := 0! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 21:09:05'!
addColumn: aBlock
	| column |
	column := (Column table: self) cellValueBlock: aBlock.
	columns add: (column).
	self changed: #columns! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 21:16:00'!
addColumn: cellValueBlock config: configBlock
	| column |
	column := (Column table: self) cellValueBlock: cellValueBlock.
	configBlock value: column.
	columns add: (column).
	self changed: #columns! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 8/29/2024 21:51:50'!
addItem: anObject
	items add: anObject.
	self changed: #items! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 8/31/2024 13:01:15'!
addItems: aCollection
	items addAll: aCollection.
	self changed: #items! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 23:01:00'!
addNumberColumn: cellValueBlock
	| column |
	column := (NumberColumn table: self) cellValueBlock: cellValueBlock.
	columns add: (column).
	self changed: #columns! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 21:16:35'!
addNumberColumn: cellValueBlock config: configBlock
	| column |
	column := (NumberColumn table: self) cellValueBlock: cellValueBlock.
	configBlock value: column.
	columns add: (column).
	self changed: #columns! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 5/15/2022 15:40:53'!
columns
	 ^columns! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 5/15/2022 14:31:37'!
initialize
	columns := OrderedCollection new.
	items := OrderedCollection new! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 5/15/2022 15:06:56'!
items
	 ^items! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 18:55:45'!
items: aCollection
	items := aCollection asOrderedCollection.
	self changed: #items! !

!Table methodsFor: 'as yet unclassified' stamp: 'bp 8/30/2024 12:46:58'!
previousItem: anItem
	| index |
	index := items indexOf: anItem.
	index = 1 ifTrue: [^nil].
	^items at: index - 1! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 5/15/2022 16:53:33'!
color
	"Answer the value of color"

	^ color! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 5/15/2022 17:13:56'!
color: anObject
	"Set the value of color"

	color := anObject.
	self changed: #color! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 5/15/2022 16:53:33'!
font
	"Answer the value of font"

	^ font! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 5/15/2022 17:14:34'!
font: anObject
	"Set the value of font"

	font := anObject.
	self changed: #font! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 5/5/2024 19:03:56'!
initialize
	color := Color white.
	font := Preferences at: #standardListFont.
	separation := 5 @ 1! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 5/15/2022 16:53:33'!
separation
	"Answer the value of separation"

	^ separation! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 5/15/2022 17:14:11'!
separation: anObject
	"Set the value of separation"

	separation := anObject.
	self changed: #separation! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 5/15/2022 17:30:16'!
xSeparation
	^separation isNumber
		ifTrue: [ separation ]
		ifFalse: [ separation x ]! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 5/15/2022 17:30:25'!
ySeparation
	^separation isNumber
		ifTrue: [ separation ]
		ifFalse: [ separation y ]! !
