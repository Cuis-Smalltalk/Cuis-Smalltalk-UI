'From Cuis7.3 [latest update: #7115] on 3 May 2025 at 10:24:26 am'!
'Description Models and morphs for defining and displaying tables.

See class method category examples in TableMorph.'!
!provides: 'UI-Table' 1 7!
!requires: 'Cuis-Base' 73 7095 nil!
SystemOrganization addCategory: #'UI-Table'!


!classDefinition: #TableModel category: #'UI-Table'!
ActiveModel subclass: #TableModel
	instanceVariableNames: 'columns'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'TableModel class' category: #'UI-Table'!
TableModel class
	instanceVariableNames: ''!

!classDefinition: #PluggableTable category: #'UI-Table'!
TableModel subclass: #PluggableTable
	instanceVariableNames: 'itemsProvider itemsSelector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'PluggableTable class' category: #'UI-Table'!
PluggableTable class
	instanceVariableNames: ''!

!classDefinition: #Table category: #'UI-Table'!
TableModel subclass: #Table
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'Table class' category: #'UI-Table'!
Table class
	instanceVariableNames: ''!

!classDefinition: #TableMorph category: #'UI-Table'!
LayoutMorph subclass: #TableMorph
	instanceVariableNames: 'table style maximumRowsHeight'
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
	instanceVariableNames: 'header cellValueBlock alignment'
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

!classDefinition: #TableStyle category: #'UI-Table'!
Object subclass: #TableStyle
	instanceVariableNames: 'color rowBackgroundColors font headerFont padding gap rowPadding'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Table'!
!classDefinition: 'TableStyle class' category: #'UI-Table'!
TableStyle class
	instanceVariableNames: ''!


!TableModel commentStamp: 'bp 5/3/2025 09:35:56' prior: 0!
A TableModel is a model for a TableMorph used for displaying objects in a tabular way.

The main feature of this class is to manage the columns used for displaying the objects.

This is an abstract superclass. Its subclasses are responsible for providing the items for the TableMorph, i.e. the objects to display.

Related classes include Column and TableMorph.!

!PluggableTable commentStamp: 'bp 5/3/2025 09:35:10' prior: 0!
A PluggableTable is a model class for a TableMorph whose items are stored elsewhere.!

!Table commentStamp: 'bp 5/3/2025 09:34:01' prior: 0!
A Table is a model class which can hold a items for a TableMorph, i.e. the objects to display.!

!TableMorph commentStamp: 'bp 5/3/2025 10:24:04' prior: 0!
A TableMorph is a morph for displaying objects in a tabular way.

It has a TableModel for providing the items to show and the columns to use. The column widths are sized automatically to hold the largest cell value of all items of a column.

It has a TableStyle for customizing its look. When its TableStyle changes it updates its look accordingly.

See class method category examples.

The class TableMorph should be usable as it is now. However, it is still a work in progress. More features are planned:
- different selections strategies
- maxWidths for columns (right now the columns must make sure their cell values are not too wide)
- column hiding and reordering
- more styling parameters
- filtering
- performance optimization!

!AlignedLabelMorph commentStamp: 'bp 5/3/2025 09:57:41' prior: 0!
An AlignedLabelMorph is a kind of LabelMorph with an alignment.

The alignment can be one of the symbols #leftFlush, #centered, or #rightFlush. #leftFlush is the default.

It is used by NumberColumn.!

!Column commentStamp: 'bp 5/3/2025 09:55:26' prior: 0!
A Column is used by a TableModel to provide the value of a column for a given item.

It has a cellValueBlock which is evaluated with the item to display as a parameter.

It has an alignment which can be one of the symbols #leftFlush, #centered, or #rightFlush. #leftFlush is the default.

It can have an optional header.

Related classes include TableModel, TableMorph, and AlignedLabelMorph.!

!NumberColumn commentStamp: 'bp 5/3/2025 09:54:42' prior: 0!
A NumberColumn is a kind of Column for displaying numbers.

It has a number of fraction digits to show.

It alignment is #rightFlush by default.!

!TableStyle commentStamp: 'bp 5/3/2025 10:06:58' prior: 0!
A TableStyle holds parameters for customizing the look of TableMorphs. The same TableStyle can be used for multiple TableMorphs. When a parameter changes the TableMorphs are informed in order to update their look.

Instance variables:
color - the background color of the TableMorph itself
rowBackgroundColors - an Array of colors used alternating for rows
font - the font used for displaying the cells
headerFont - the font used for displaying the header
padding - the padding of the TableMorph itself
gap - a number or a Point for the gap between the cells
rowPadding - the padding of the row morphs!

!TableModel methodsFor: 'initialization' stamp: 'bp 4/6/2025 18:42:47'!
initialize
	columns := OrderedCollection new! !

!TableModel methodsFor: 'accessing' stamp: 'bp 5/15/2022 15:40:53'!
columns
	 ^columns! !

!TableModel methodsFor: 'columns' stamp: 'bp 4/5/2025 16:47:24'!
addColumn: aBlock
	self addColumn: aBlock header: nil! !

!TableModel methodsFor: 'columns' stamp: 'bp 4/6/2025 20:23:10'!
addColumn: aBlock header: aString
	| column |
	column := Column new
		header: aString;
		cellValueBlock: aBlock.
	columns add: (column).
	self changed: #columns! !

!TableModel methodsFor: 'columns' stamp: 'bp 4/5/2025 16:48:07'!
addNumberColumn: cellValueBlock
	self addNumberColumn: cellValueBlock header: nil! !

!TableModel methodsFor: 'columns' stamp: 'bp 4/6/2025 20:48:44'!
addNumberColumn: cellValueBlock header: aString
	| column |
	column := NumberColumn new
		header: aString;
		cellValueBlock: cellValueBlock.
	columns add: (column).
	self changed: #columns! !

!PluggableTable methodsFor: 'private' stamp: 'bp 4/6/2025 21:05:12'!
setItemsProvider: anItemsProvider itemsSelector: aSelector
	itemsProvider := anItemsProvider.
	itemsSelector := aSelector! !

!PluggableTable methodsFor: 'accessing' stamp: 'bp 4/6/2025 23:32:12'!
items
	^itemsProvider perform: itemsSelector ! !

!PluggableTable class methodsFor: 'instance creation' stamp: 'bp 4/6/2025 18:49:18'!
on: itemsProvider itemsSelector: aSelector
	^self new setItemsProvider: itemsProvider itemsSelector: aSelector! !

!Table methodsFor: 'accessing' stamp: 'bp 4/6/2025 18:40:07'!
items
	 ^items! !

!Table methodsFor: 'accessing' stamp: 'bp 4/6/2025 18:40:14'!
items: aCollection
	items := aCollection asOrderedCollection.
	self changed: #items! !

!Table methodsFor: 'items' stamp: 'bp 4/6/2025 18:41:21'!
addItem: anObject
	items add: anObject.
	self changed: #items! !

!Table methodsFor: 'items' stamp: 'bp 4/6/2025 18:41:39'!
addItems: aCollection
	items addAll: aCollection.
	self changed: #items! !

!Table methodsFor: 'initialization' stamp: 'bp 4/6/2025 18:42:08'!
initialize
	super initialize.
	items := OrderedCollection new! !

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

!TableMorph methodsFor: 'updating' stamp: 'bp 4/6/2025 20:26:04'!
update: aSymbol
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

!TableMorph methodsFor: 'updating' stamp: 'bp 4/6/2025 20:07:01'!
updateRows
	| items columnWidths |
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
	items := table items.
	table columns withIndexDo: [:column :index |
		| desiredWidth |
		desiredWidth := column desiredWidth: items style: style.
		columnWidths at: column put: desiredWidth.
		(self headerMorph
			addMorph: (self headerMorphForColumn: column)
			layoutSpec: ((LayoutSpec morphHeightFixedWidth: desiredWidth) 
				offAxisEdgeWeight: 0.0))].
	items withIndexDo: [:item :index |
		| row |
		row := LayoutMorph newRow
			color: (style rowBackgroundColor: index);
			padding: style rowPadding;
			gap: style xGap.
		table columns do: [:column |
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

!TableMorph methodsFor: 'private' stamp: 'bp 3/30/2025 12:37:05'!
setStyle: aTableStyle
	style ifNotNil: [style removeActionsWithReceiver: self].
	aTableStyle ifNotNil: [aTableStyle addDependent: self].
	style := aTableStyle! !

!TableMorph methodsFor: 'private' stamp: 'bp 4/6/2025 18:30:21'!
setTable: aTable
	table ifNotNil: [table removeActionsWithReceiver: self].
	aTable ifNotNil: [aTable addDependent: self].
	table := aTable! !

!TableMorph methodsFor: 'private' stamp: 'bp 4/6/2025 18:30:36'!
setTable: aTable style: aTableStyle
	self
		setTable: aTable;
		setStyle: aTableStyle;
		update: #model! !

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

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 18:38:29'!
example
	"
	self example"
	"To show the dynamic nature do it step by step in a workspace."
	| table tableMorph tableStyle |
	table := Table new
		addColumn: [:item | item first] header: 'First name';
		addColumn: [:item | item second] header: 'Last name';
		items: #(('Alan' 'Kay') ('Adele' 'Goldberg')).

	tableMorph := (TableMorph table: table) openInWorld.
	
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

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 18:38:41'!
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

	(TableMorph table: table)
		maximumRowsHeight: 500;
		openInWorld! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 18:38:45'!
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

	(TableMorph table: table)
		maximumRowsHeight: 500;
		openInWorld! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 18:38:49'!
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

	(TableMorph table: table)
		maximumRowsHeight: 700;
		openInWorld! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 23:27:00'!
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

	(TableMorph table: table) openInWorld! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/7/2025 18:28:17'!
examplePackagesPluggable
	"
	self examplePackagesPluggable.
	Feature require: 'JSON'"
	| codePackageList table |
	codePackageList := CodePackageList new.
	table := (PluggableTable on: codePackageList itemsSelector: #packages)
		addColumn: [:cp | cp hasUnsavedChanges ifTrue: ['*'] ifFalse: ['']];
		addColumn: [:cp | cp packageName] header: 'Package';
		addColumn: [:cp | String streamContents: [:stream | cp provides printVersionRevisionOn: stream]] header: 'Version';
		addColumn: [:cp | cp fullFileName] header: 'Package file'.
	
	codePackageList when: #changed: evaluate: [:aspectSymbol | #packageNames == aspectSymbol ifTrue: [table changed: #items]].
	
	(TableMorph table: table) openInWorld! !

!TableMorph class methodsFor: 'examples' stamp: 'bp 4/6/2025 18:38:59'!
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

	(TableMorph table: table)
		maximumRowsHeight: 700;
		openInWorld! !

!TableMorph class methodsFor: 'instance creation' stamp: 'bp 4/6/2025 18:34:15'!
table: aTable
	^self table: aTable style: TableStyle new! !

!TableMorph class methodsFor: 'instance creation' stamp: 'bp 4/6/2025 18:31:31'!
table: aTable style: aTableStyle
	^self newColumn setTable: aTable style: aTableStyle! !

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

!Column methodsFor: 'private' stamp: 'bp 4/6/2025 20:21:59'!
cellValue: anItem
	^cellValueBlock value: anItem! !

!Column methodsFor: 'private' stamp: 'bp 4/6/2025 20:06:16'!
desiredWidth: items style: style
	| headerWidth |
	headerWidth := header ifNil: [0] ifNotNil: [style headerFont widthOfString: header].
	items ifEmpty: [^headerWidth].
	^headerWidth max: (items max: [:each | style font widthOfString: (self cellValue: each)])! !

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
