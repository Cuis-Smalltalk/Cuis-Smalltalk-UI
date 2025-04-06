'From Cuis7.3 [latest update: #7095] on 6 April 2025 at 4:43:35 pm'!
'Description Models and morphs for defining and displaying tables.'!
!provides: 'UI-Table' 1 6!
!requires: 'Cuis-Base' 73 7095 nil!
SystemOrganization addCategory: #'UI-Table'!


!classDefinition: #TableMorph category: #'UI-Table'!
LayoutMorph subclass: #TableMorph
	instanceVariableNames: 'model style maximumRowsHeight'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'TableMorph class' category: #'UI-Table'!
TableMorph class
	instanceVariableNames: ''!

!classDefinition: #AlignedLabelMorph category: #'UI-Table'!
LabelMorph subclass: #AlignedLabelMorph
	instanceVariableNames: 'alignment'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'AlignedLabelMorph class' category: #'UI-Table'!
AlignedLabelMorph class
	instanceVariableNames: ''!

!classDefinition: #Column category: #'UI-Table'!
Object subclass: #Column
	instanceVariableNames: 'table header cellValueBlock alignment'
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
	instanceVariableNames: 'color rowBackgroundColors font headerFont padding gap rowPadding'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'TableStyle class' category: #'UI-Table'!
TableStyle class
	instanceVariableNames: ''!


!TableMorph methodsFor: 'accessing' stamp: 'bp 4/5/2025 19:16:50'!
headerMorph
	^self submorphs second! !

!TableMorph methodsFor: 'accessing' stamp: 'bp 4/6/2025 11:59:03'!
maximumRowsHeight
	"Answer the value of maximumRowsHeight"

	^ maximumRowsHeight! !

!TableMorph methodsFor: 'accessing' stamp: 'bp 4/6/2025 12:04:51'!
maximumRowsHeight: anObject
	"Set the value of maximumRowsHeight"

	maximumRowsHeight := anObject.
	self update: #maximumRowsHeight! !

!TableMorph methodsFor: 'accessing' stamp: 'bp 8/29/2024 13:00:10'!
model
	^model! !

!TableMorph methodsFor: 'accessing' stamp: 'bp 3/30/2025 12:38:42'!
model: aTable
	self
		setModel: aTable;
		update: #model! !

!TableMorph methodsFor: 'accessing' stamp: 'bp 4/5/2025 17:27:51'!
rowsMorph
	^self vScrollPane scroller! !

!TableMorph methodsFor: 'accessing' stamp: 'bp 8/29/2024 13:00:35'!
style
	^ style! !

!TableMorph methodsFor: 'accessing' stamp: 'bp 3/30/2025 12:39:04'!
style: aTableStyle
	self
		setStyle: aTableStyle;
		update: #style! !

!TableMorph methodsFor: 'accessing' stamp: 'bp 4/5/2025 19:17:17'!
vScrollPane
	^self submorphs first! !

!TableMorph methodsFor: 'updating' stamp: 'bp 4/6/2025 12:04:31'!
update: aSymbol
	super update: aSymbol.
	aSymbol caseOf: {
		[#color] -> [self updateColor].
		[#padding] -> [self updatePadding].
		[#gap] -> [self updateGap].
		[#model] -> [self updateRows].
		[#items] -> [self updateRows].
		[#columns] -> [self updateRows].
		[#font] -> [self updateRows].
		[#style] -> [self updateRows].
		[#maximumRowsHeight] -> [self adjustExtent]}.
	self redrawNeeded! !

!TableMorph methodsFor: 'updating' stamp: 'bp 4/6/2025 13:48:53'!
updateColor
	self color: style color.
	self headerMorph color: style color.
	self rowsMorph color: style color.
	self rowsMorph submorphs withIndexDo: [:row :index | row color: (style rowBackgroundColor: index)]! !

!TableMorph methodsFor: 'updating' stamp: 'bp 4/6/2025 11:50:33'!
updateGap
	self gap: style yGap.
	self headerMorph gap: style xGap.
	self rowsMorph gap: style yGap.
	self rowsMorph submorphs do: [:each | each gap: style xGap].
	self adjustExtent! !

!TableMorph methodsFor: 'updating' stamp: 'bp 4/6/2025 14:59:00'!
updatePadding
	self padding: style padding.
	self headerMorph padding: style rowPadding.
	self rowsMorph submorphsDo: [:row | row padding: style rowPadding].
	self adjustExtent! !

!TableMorph methodsFor: 'updating' stamp: 'bp 4/6/2025 16:37:18'!
updateRows
	| columnWidths |
	self 
		color: style color;
		padding: style padding;
		gap: style yGap.		
	self headerMorph		
		color: style color;
		padding: style rowPadding;
		gap: style xGap;
		removeAllMorphs.
	self rowsMorph
		color: style color;
		gap: style yGap;
		removeAllMorphs.
	columnWidths := Dictionary new.
	model columns withIndexDo: [:column :index |
		| desiredWidth |
		desiredWidth := column desiredWidth: style.
		columnWidths at: column put: desiredWidth.
		(self headerMorph
			addMorph: (self headerMorphForColumn: column)
			layoutSpec: ((LayoutSpec morphHeightFixedWidth: desiredWidth) 
				offAxisEdgeWeight: 0.0))].
	model items withIndexDo: [:item :index |
		| row |
		row := LayoutMorph newRow
			color: (style rowBackgroundColor: index);
			padding: style rowPadding;
			gap: style xGap.
		model columns do: [:column |
			row
				addMorph: (self morphForColumn: column item: item)
				layoutSpec: ((LayoutSpec
					morphHeightFixedWidth: (columnWidths at: column))
						offAxisEdgeWeight: 0.0)].
		self rowsMorph addMorph: row].
	self adjustExtent! !

!TableMorph methodsFor: 'initialization' stamp: 'bp 4/6/2025 16:37:26'!
initialize
	| headerMorph rowsMorph vScrollPane |
	super initialize.
	maximumRowsHeight := Display extent y.
	headerMorph := LayoutMorph newRow.
	rowsMorph := LayoutMorph newColumn.
	vScrollPane := PluggableScrollPane new.
	vScrollPane
		padding: 0;
		scroller: rowsMorph.
	self
		addMorph: headerMorph;
		addMorph: vScrollPane! !

!TableMorph methodsFor: 'initialization' stamp: 'bp 4/6/2025 15:19:49'!
paddings
	| result |
	result := Dictionary new
		at: 'TableMorph' put: self padding;
		at: 'headerMorph' put: self headerMorph padding;
		at: 'vScrollPane' put: self vScrollPane padding;
		at: 'rowsMorph' put: self rowsMorph padding;
		yourself.
	self rowsMorph submorphs withIndexDo: [:row :index |
		result at: index put: row padding].
	^result! !

!TableMorph methodsFor: 'private' stamp: 'bp 4/6/2025 16:14:21'!
adjustExtent
	"Ensure extent is at least minimumExtent and rows at most maximumRowsHeight."
	| rowsExtent headerAndRowsExtent |
	rowsExtent := self rowsMorph minimumExtent + (2 * self vScrollPane padding).
	rowsExtent y > maximumRowsHeight ifTrue: [
		rowsExtent := rowsExtent x + ScrollBar scrollbarThickness @ rowsExtent y].
	rowsExtent := rowsExtent min: (rowsExtent x @ maximumRowsHeight).
	self vScrollPane morphExtent: rowsExtent.
	self headerMorph morphWidth: rowsExtent x.

	headerAndRowsExtent := rowsExtent x @ (rowsExtent y + self headerMorph morphHeight) 
		+ (2 * self padding).
	self morphExtent: headerAndRowsExtent! !

!TableMorph methodsFor: 'private' stamp: 'bp 4/6/2025 12:35:59'!
headerMorphForColumn: column
	^(AlignedLabelMorph contents: (column header ifNil: ['']) font: style headerFont) alignment: column alignment"; borderWidth: 1"! !

!TableMorph methodsFor: 'private' stamp: 'bp 4/6/2025 09:52:23'!
morphForColumn: column item: item
	^(AlignedLabelMorph contents: (column cellValue: item) font: style font) alignment: column alignment"; borderWidth: 1"
	"| text |
	text := (column cellValue: item) asText.
	text addAttribute: (TextAlignment perform: column alignment).
	text font: style font.
	^(TextParagraphMorph contents: text)
		color: style color;
		noBorder;
		setHeightOnContent"! !

!TableMorph methodsFor: 'private' stamp: 'bp 3/30/2025 12:37:20'!
setModel: aTable
	model ifNotNil: [model removeActionsWithReceiver: self].
	aTable ifNotNil: [aTable addDependent: self].
	model := aTable! !

!TableMorph methodsFor: 'private' stamp: 'bp 3/30/2025 12:39:37'!
setModel: aTable style: aTableStyle
	self
		setModel: aTable;
		setStyle: aTableStyle;
		update: #model! !

!TableMorph methodsFor: 'private' stamp: 'bp 3/30/2025 12:37:05'!
setStyle: aTableStyle
	style ifNotNil: [style removeActionsWithReceiver: self].
	aTableStyle ifNotNil: [aTableStyle addDependent: self].
	style := aTableStyle! !

!TableMorph methodsFor: 'debug and other' stamp: 'bp 4/6/2025 15:24:58'!
morphsDict
	| result |
	result := Dictionary new
		at: 'TableMorph' put: self;
		at: 'headerMorph' put: self headerMorph;
		at: 'vScrollPane' put: self vScrollPane;
		at: 'rowsMorph' put: self rowsMorph;
		yourself.
	self rowsMorph submorphs withIndexDo: [:row :index |
		result at: index put: row].
	^result! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 14:32:11'!
example
	"
	self example"
	"To show the dynamic nature do it step by step in a workspace."
	| table tableMorph tableStyle |
	table := Table new
		addColumn: [:item | item first] header: 'First name';
		addColumn: [:item | item second] header: 'Last name';
		items: #(('Alan' 'Kay') ('Adele' 'Goldberg')).

	tableMorph := (TableMorph model: table) openInWorld.
	
	table addItem: #('Dan' 'Ingalls').
	table addColumn: [:item | item first , ' ' , item second] header: 'Full name'.
	
	tableStyle := tableMorph style.
	tableStyle color: Color lightBlue.
	tableStyle padding: 10 @ 10.
	tableStyle gap: 15 @ 0.
	FontFamily readIfNeeded: DirectoryEntry trueTypeFontsDirectory / 'Cream'.
	tableStyle font: (FontFamily familyName: 'Parc Place Legacy' pointSize: 24).
	
	table addItem: #('Ted' 'Kaehler').
	table addItem: #('Someone' 'Withaverylonglongname').
	table addItems: #(('John' 'Maloney') ('Juan' 'Vuletich'))! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 12:08:02'!
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
		addColumn: [:array | array first] header: 'Initials';
		addColumn: [:array | array second] header: 'Name';
		addNumberColumn: [:array | authors occurrencesOf: array first ] header: 'Count';
		items: items.

	(TableMorph model: table)
		maximumRowsHeight: 500;
		openInWorld! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 12:02:43'!
exampleFiles
	"
	self exampleFiles"
	| table |
	table := Table new
		addColumn: [:fileEntry | fileEntry name] header: 'Name';
		addColumn: [:fileEntry | fileEntry modificationTime date yyyymmdd , 
			' ' , fileEntry modificationTime time print24] header: 'Modification';
		addNumberColumn: [:fileEntry | fileEntry fileSize] header: 'Size';
		items: ((DirectoryEntry cuisBaseDirectory / 'Packages' / 'Features') files 
			asSortedCollection: [:a :b | a modificationTime > b modificationTime]).

	(TableMorph model: table)
		maximumRowsHeight: 500;
		openInWorld! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 12:14:24'!
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
		addColumn: [:cls | cls name] header: 'Class';
		addNumberColumn: [:cls | loc at: cls ] header: 'LOC';
		items: items.

	(TableMorph model: table)
		maximumRowsHeight: 700;
		openInWorld! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 12:18:30'!
examplePackages
	"
	self examplePackages"
	| table |
	table := Table new
		addColumn: [:cp | cp hasUnsavedChanges ifTrue: ['*'] ifFalse: ['']];
		addColumn: [:cp | cp packageName] header: 'Package';
		addColumn: [:cp | String streamContents: [:stream | cp provides printVersionRevisionOn: stream]] header: 'Version';
		addColumn: [:cp | cp fullFileName] header: 'Package file';
		addNumberColumn: [:cp | cp linesOfCode] header: 'LOC';
		items: CodePackage installedPackages values.

	(TableMorph model: table) openInWorld! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 12:26:33'!
examplePreferences
	"
	self examplePreferences"
	| table |
	table := Table new
		addColumn: [:preference | preference name] header: 'Preference';
		addColumn: [:preference | preference category] header: 'Category';
		addColumn: [:preference | preference type printString] header: 'Type';
		addColumn: [:preference | preference value printString contractTo: 25] header: 'Value';
		items: (Preferences allPreferences asSortedCollection: [:a :b | a name < b name]).

	(TableMorph model: table)
		maximumRowsHeight: 700;
		openInWorld! !

!TableMorph class methodsFor: 'instance creation' stamp: 'bp 4/5/2025 19:19:33'!
model: aTable
	^self newColumn setModel: aTable style: TableStyle new! !

!TableMorph class methodsFor: 'instance creation' stamp: 'bp 4/5/2025 19:19:18'!
model: aTable style: aTableStyle
	^self newColumn setModel: aTable style: aTableStyle! !

!AlignedLabelMorph methodsFor: 'initialization' stamp: 'bp 4/6/2025 09:21:55'!
initialize
	super initialize.
	alignment := #leftFlush! !

!AlignedLabelMorph methodsFor: 'accessing' stamp: 'bp 8/30/2024 22:44:14'!
alignment: aSymbol
	alignment := aSymbol! !

!AlignedLabelMorph methodsFor: 'drawing' stamp: 'bp 8/30/2024 22:55:15'!
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

!Column methodsFor: 'initialization' stamp: 'bp 8/30/2024 22:55:48'!
initialize
	alignment := #leftFlush! !

!Column methodsFor: 'accessing' stamp: 'bp 8/30/2024 22:55:59'!
alignment
	^alignment! !

!Column methodsFor: 'accessing' stamp: 'bp 8/30/2024 22:56:07'!
alignment: aSelector
	alignment := aSelector! !

!Column methodsFor: 'accessing' stamp: 'bp 4/5/2025 15:43:12'!
cellValueBlock
	"Answer the value of cellValueBlock"

	^ cellValueBlock! !

!Column methodsFor: 'accessing' stamp: 'bp 4/5/2025 15:41:45'!
cellValueBlock: aBlock
	cellValueBlock := aBlock! !

!Column methodsFor: 'accessing' stamp: 'bp 4/5/2025 15:43:12'!
header
	"Answer the value of header"

	^ header! !

!Column methodsFor: 'accessing' stamp: 'bp 4/5/2025 15:43:12'!
header: anObject
	"Set the value of header"

	header := anObject! !

!Column methodsFor: 'accessing' stamp: 'bp 4/5/2025 15:43:12'!
table
	"Answer the value of table"

	^ table! !

!Column methodsFor: 'accessing' stamp: 'bp 4/5/2025 15:43:12'!
table: anObject
	"Set the value of table"

	table := anObject! !

!Column methodsFor: 'private' stamp: 'bp 8/30/2024 21:48:26'!
cellValue: anItem
	^cellValueBlock numArgs = 1
		ifTrue: [cellValueBlock value: anItem]
		ifFalse: [cellValueBlock value: anItem value: table]! !

!Column methodsFor: 'private' stamp: 'bp 4/6/2025 12:35:02'!
desiredWidth: style
	| headerWidth |
	headerWidth := header ifNil: [0] ifNotNil: [style headerFont widthOfString: header].
	table items ifEmpty: [^headerWidth].
	^headerWidth max: (table items max: [:each | style font widthOfString: (self cellValue: each)])! !

!Column methodsFor: 'private' stamp: 'bp 4/5/2025 15:40:19'!
setTable: aTable
	table := aTable! !

!Column class methodsFor: 'instance creation' stamp: 'bp 5/15/2022 14:34:33'!
table: aTable
	^self new setTable: aTable! !

!NumberColumn methodsFor: 'accessing' stamp: 'bp 8/30/2024 21:07:51'!
fractionDigits: anInteger
	fractionDigits := anInteger! !

!NumberColumn methodsFor: 'initialization' stamp: 'bp 8/30/2024 21:48:45'!
cellValue: anItem
	| cellValue |
	cellValue := super cellValue: anItem.
	(cellValue is: #String) ifTrue: [^cellValue].
	^String streamContents: [:stream | cellValue printOn: stream fractionDigits: fractionDigits]! !

!NumberColumn methodsFor: 'initialization' stamp: 'bp 8/30/2024 22:55:48'!
initialize
	super initialize.
	alignment := #rightFlush.
	fractionDigits := 0! !

!Table methodsFor: 'initialization' stamp: 'bp 5/15/2022 14:31:37'!
initialize
	columns := OrderedCollection new.
	items := OrderedCollection new! !

!Table methodsFor: 'accessing' stamp: 'bp 5/15/2022 15:40:53'!
columns
	 ^columns! !

!Table methodsFor: 'accessing' stamp: 'bp 5/15/2022 15:06:56'!
items
	 ^items! !

!Table methodsFor: 'accessing' stamp: 'bp 8/30/2024 18:55:45'!
items: aCollection
	items := aCollection asOrderedCollection.
	self changed: #items! !

!Table methodsFor: 'columns' stamp: 'bp 4/5/2025 16:47:24'!
addColumn: aBlock
	self addColumn: aBlock header: nil! !

!Table methodsFor: 'columns' stamp: 'bp 4/5/2025 15:45:15'!
addColumn: aBlock header: aString
	| column |
	column := (Column table: self)
		header: aString;
		cellValueBlock: aBlock.
	columns add: (column).
	self changed: #columns! !

!Table methodsFor: 'columns' stamp: 'bp 4/5/2025 16:48:07'!
addNumberColumn: cellValueBlock
	self addNumberColumn: cellValueBlock header: nil! !

!Table methodsFor: 'columns' stamp: 'bp 4/5/2025 16:47:48'!
addNumberColumn: cellValueBlock header: aString
	| column |
	column := (NumberColumn table: self)
		header: aString;
		cellValueBlock: cellValueBlock.
	columns add: (column).
	self changed: #columns! !

!Table methodsFor: 'items' stamp: 'bp 8/29/2024 21:51:50'!
addItem: anObject
	items add: anObject.
	self changed: #items! !

!Table methodsFor: 'items' stamp: 'bp 8/31/2024 13:01:15'!
addItems: aCollection
	items addAll: aCollection.
	self changed: #items! !

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

!TableStyle methodsFor: 'accessing' stamp: 'bp 4/6/2025 12:30:12'!
gap
	"Answer the value of gap"

	^ gap! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 3/30/2025 18:20:12'!
gap: anObject
	"Set the value of gap"

	gap := anObject.
	self changed: #gap! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 4/6/2025 12:30:12'!
headerFont
	"Answer the value of headerFont"

	^ headerFont! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 4/6/2025 13:25:31'!
headerFont: anObject
	"Set the value of headerFont"

	headerFont := anObject.
	self changed: #font! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 3/30/2025 18:19:04'!
padding
	"Answer the value of padding"

	^ padding! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 3/30/2025 18:20:00'!
padding: anObject
	"Set the value of padding"

	padding := anObject.
	self changed: #padding! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 4/6/2025 13:45:26'!
rowBackgroundColors
	"Answer the value of rowBackgroundColors"

	^ rowBackgroundColors! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 4/6/2025 13:45:35'!
rowBackgroundColors: anObject
	"Set the value of rowBackgroundColors"

	rowBackgroundColors := anObject.
	self changed: #color! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 4/6/2025 14:33:50'!
rowPadding
	"Answer the value of rowPadding"

	^ rowPadding! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 4/6/2025 14:35:47'!
rowPadding: anObject
	"Set the value of rowPadding"

	rowPadding := anObject.
	self changed: #padding! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 3/30/2025 18:24:51'!
xGap
	^gap isNumber
		ifTrue: [ gap ]
		ifFalse: [ gap x ]! !

!TableStyle methodsFor: 'accessing' stamp: 'bp 3/30/2025 18:24:57'!
yGap
	^gap isNumber
		ifTrue: [ gap ]
		ifFalse: [ gap y ]! !

!TableStyle methodsFor: 'initialization' stamp: 'bp 4/6/2025 16:37:51'!
initialize
	color := Color white.
	rowBackgroundColors := {Color white. (Color gray: 0.95)}.
	font := Preferences at: #standardListFont.
	headerFont := (Preferences at: #standardListFont) bold.
	padding := 5 @ 5.
	rowPadding := 5 @ 5.
	gap := 5 @ 0! !

!TableStyle methodsFor: 'private' stamp: 'bp 4/6/2025 14:35:13'!
rowBackgroundColor: index
	"Answer the value of alternating rowBackgroundColors for item at index"

	^ rowBackgroundColors at: ((index - 1 rem: rowBackgroundColors size) + 1)! !
