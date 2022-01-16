'From Cuis 6.0 [latest update: #5042] on 16 January 2022 at 10:58:02 am'!
'Description I supply simple click-select elements.'!
!provides: 'UI-Click-Select' 1 6!
!requires: 'Cuis-Base' 60 5031 nil!
!requires: 'UI-Base-Morphs' 1 11 nil!
SystemOrganization addCategory: 'UI-Click-Select'!


!classDefinition: #InnerListOfMorph category: 'UI-Click-Select'!
LayoutMorph subclass: #InnerListOfMorph
	instanceVariableNames: 'highlightedRow selectedRow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'InnerListOfMorph class' category: 'UI-Click-Select'!
InnerListOfMorph class
	instanceVariableNames: ''!

!classDefinition: #RadioGroup category: 'UI-Click-Select'!
LayoutMorph subclass: #RadioGroup
	instanceVariableNames: 'list font buttonOnLeft buttons'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'RadioGroup class' category: 'UI-Click-Select'!
RadioGroup class
	instanceVariableNames: ''!

!classDefinition: #PluggableListOfMorph category: 'UI-Click-Select'!
PluggableListMorph subclass: #PluggableListOfMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'PluggableListOfMorph class' category: 'UI-Click-Select'!
PluggableListOfMorph class
	instanceVariableNames: ''!

!classDefinition: #MultiSelectMenu category: 'UI-Click-Select'!
MenuMorph subclass: #MultiSelectMenu
	instanceVariableNames: 'choices seed result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'MultiSelectMenu class' category: 'UI-Click-Select'!
MultiSelectMenu class
	instanceVariableNames: ''!

!classDefinition: #RadioButtonMorph category: 'UI-Click-Select'!
EllipseMorph subclass: #RadioButtonMorph
	instanceVariableNames: 'isSelected'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Click-Select'!
!classDefinition: 'RadioButtonMorph class' category: 'UI-Click-Select'!
RadioButtonMorph class
	instanceVariableNames: ''!


!InnerListOfMorph commentStamp: '<historical>' prior: 0!
The morph that displays the list of Morph in a PluggableListOfMorph.!

!RadioGroup commentStamp: '<historical>' prior: 0!
I manage a RadioGroup -- a Group of RadioButtons, each with a label.

I am a columnMorph

Each of my submorphs is a row layoutMorph which contains a radio button and a label and may contain other, additional  morphs.

iVars:
 list  an Array of Symbols used as labels or an Array of Morphs displayed
 font - font for labels
 buttonOnLeft -- if True, button image then label else label then button image
 buttons - cached array of buttons
!

!PluggableListOfMorph commentStamp: 'hlsf 1/14/2022 11:01:29' prior: 0!
I am a vertical list of Morph. I have no horizontal scrollbar but I may have a vertical one.
My width is adjusted to the larger morph of my list.!

!MultiSelectMenu commentStamp: '<historical>' prior: 0!
I am used to relate a set of names to an integer incoding, where each  symbolic name is realated to a bit.

My instances present the selections to a user with Accept/Cancel.

Cancel returns the seed (which is used to set the initial values), Accept returns the new ORed value.

When the value ranked zero is selected, the other 'bits' are delselected.

For example, TextEmphasis codes are a bit ORing of values:
 2r00000000  0  normal
 2r00000001	 1	bold
 2r00000010	 2	itallic
 2r00000100	 4	underlined		
 2r00001000	 8	struck out       
 2r00010000	16 Superscript 
 2r00100000	32 Subscript      
 2r01000000	64 	with ST-80 Glyphs
 !

!RadioButtonMorph commentStamp: '<historical>' prior: 0!
I am a very simple radio button.!

!InnerListOfMorph methodsFor: 'initialization' stamp: 'hlsf 1/16/2022 10:25:28'!
initialize
	super initialize.
	self separation: 5@3.
	self morphWidth: 0.
	selectedRow _ highlightedRow _ nil! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 1/16/2022 10:32:30'!
drawBoundsForRow: row
"calculate the bounds that row should be drawn at.  This might be outside our bounds!!"
	^ (submorphs atLast: row) fullBoundsInOwner expandBy: 1
! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 1/16/2022 10:24:49'!
highlightedRow: n
	highlightedRow = n ifFalse: [
		highlightedRow ifNotNil: [
			self invalidateLocalRect: (self drawBoundsForRow: highlightedRow) ].
		highlightedRow _ n.
		highlightedRow ifNotNil: [
			self invalidateLocalRect: (self drawBoundsForRow: highlightedRow) ].
		].! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 1/16/2022 10:50:20'!
rowAtLocation: aPoint 
	| rect |
	rect _ aPoint corner: `2@2`.
	1 to: submorphs size do: [:row |
		((submorphs atLast: row) displayBoundsIntersects: rect)
			ifTrue: [ ^ row]
		]
	^ 0! !

!InnerListOfMorph methodsFor: 'list management' stamp: 'hlsf 1/16/2022 10:57:26'!
rowAtLocation: aPoint ifNone: aNoneBlock
	| rect |
	rect _ aPoint corner: `2@2`.
	1 to: submorphs size do: [:row |
		((submorphs atLast: row) displayBoundsIntersects: rect)
			ifTrue: [ ^ row]
		].
	^ aNoneBlock! !

!InnerListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/16/2022 09:20:28'!
adjustExtent
	self morphExtent: self minimumExtent ! !

!InnerListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/16/2022 09:46:38'!
fullHeight
"The complete height of the list, when fully viewable"
	^ submorphs 
		inject: self ySeparation * 2 
		into: [:totalHeight :morph | totalHeight  + morph fullBoundsInOwner height]! !

!InnerListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/16/2022 09:32:30'!
minimumWidth
	^ submorphs 
		ifEmpty: [0]
		ifNotEmpty: [submorphs max: [:morph | morph fullBoundsInOwner width + (self xSeparation * 2)]]! !

!InnerListOfMorph class methodsFor: 'new-morph participation' stamp: 'hlsf 1/14/2022 09:48:30'!
includeInNewMorphMenu
	^ false! !

!InnerListOfMorph class methodsFor: 'instance creation' stamp: 'hlsf 1/14/2022 11:10:50'!
new
	^ self newColumn! !

!RadioGroup methodsFor: 'accessing' stamp: 'KenD 11/24/2013 16:55'!
buttonFor: aSymbol
	"Return aRadioButton corresponding to selector"
	
	| symbols row |
	symbols := self list.
	row :=  submorphs at: ((symbols size) + 1 - (symbols indexOf: aSymbol ifAbsent: [ ^nil ])).
	^ row submorphs detect: [ :s | s class == RadioButtonMorph ] ifNone: [ nil ]! !

!RadioGroup methodsFor: 'accessing' stamp: 'KenD 11/19/2013 21:02'!
buttonOnLeft

	^ buttonOnLeft ! !

!RadioGroup methodsFor: 'accessing' stamp: 'KenD 11/20/2013 13:56'!
buttons

	^ buttons! !

!RadioGroup methodsFor: 'accessing' stamp: 'KenD 11/20/2013 13:56'!
buttons: arrayOfRadioButtons

	buttons := arrayOfRadioButtons.! !

!RadioGroup methodsFor: 'accessing' stamp: 'KenD 11/19/2013 19:46'!
font

	^ font! !

!RadioGroup methodsFor: 'accessing' stamp: 'KenD 11/19/2013 19:45'!
labelStrings

	^ self list collect: [ :each | each asString ]! !

!RadioGroup methodsFor: 'accessing' stamp: 'KenD 11/19/2013 19:45'!
list
	"Answer my array of label symbols"

	^ list! !

!RadioGroup methodsFor: 'accessing' stamp: 'KenD 10/28/2021 14:47:30'!
list: arrayOfSymbols
	"Set up my submorphs from arrayOfSymbols"

	| maxStringWidth labelLayout buttonList labelList |
	maxStringWidth := 0.
	self removeAllMorphs; "Don't keep old stuff."
		 setList: arrayOfSymbols.
	buttonList  := OrderedCollection new.
	labelList    := OrderedCollection new.
	arrayOfSymbols do: [ :labelSym | | newRow label button |
		newRow := LayoutMorph newRow.
		newRow separation: 3; color: Color transparent; axisEdgeWeight: #rowLeft.
		
		button := RadioButtonMorph 
				ofSize: RadioButtonMorph defaultDiameter.
		button layoutSpec: (LayoutSpec keepMorphExtent).
		"Make button react to label"
		label := LabelMorph contents: labelSym asString font: self font.
		label setProperty: #'handlesMouseDown:' toValue: [ :ignored | true ].
		label setProperty: #'mouseButton1Up:localPosition:'
			toValue: [ :event :position |  button select ].
		label setProperty: #'handlesMouseOver:' toValue: [ :ignored | true ].
		label setProperty: #'mouseEnter:' 
			toValue: [ :event | button mouseEnter: event ].
		label setProperty: #'mouseLeave:' 
			toValue: [ :event | button mouseLeave: event ].

		maxStringWidth := maxStringWidth max: (self font widthOfString: labelSym).
		(self buttonOnLeft)
			ifTrue: [ newRow  addMorph: button; addMorph: label ] 
			ifFalse: [ newRow addMorph: label; addMorph: button ].
		buttonList add: button.
		labelList add: label.
		self 
			addMorph: newRow

	].
	self buttons: buttonList asArray.
	self buttons do: [ :b | b when: #radioSelection send: #newSelection: to: self ].
	
	"Make all labels have same width"
	labelLayout := LayoutSpec 
			fixedWidth: maxStringWidth + 4
			fixedHeight: self font lineSpacing + 2
			offAxisEdgeWeight: #center.
	labelList do: [ :label | label layoutSpec: labelLayout ].

! !

!RadioGroup methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:18'!
rowFor: aSymbol
	"My rows are submorphs inversly ordered from my list"
	
	| symbols |
	symbols := self list.

	^ self submorphs at: ((symbols size) + 1 - (symbols indexOf: aSymbol ifAbsent: [ ^nil ]))! !

!RadioGroup methodsFor: 'accessing' stamp: 'KenD 11/20/2013 14:49'!
symbolForButton: radioButton

	^ self list at: (self buttons indexOf: radioButton)! !

!RadioGroup methodsFor: 'initialization' stamp: 'KenD 11/20/2013 15:05'!
buttonOnLeft: aBoolean

	buttonOnLeft := aBoolean ! !

!RadioGroup methodsFor: 'initialization' stamp: 'KenD 11/19/2013 19:48'!
fromList: arrayOfSymbols

	self list: arrayOfSymbols ! !

!RadioGroup methodsFor: 'initialization' stamp: 'KenD 10/31/2021 08:41:15'!
fromMorphDict: morphDict
	"Set up my submorphs from collectionOfMorphs"

	|  buttonList morphList |
	buttonList  := OrderedCollection new.
	morphList    := OrderedCollection new.
	morphDict keysAndValuesDo: [ :aName :aMorph | | newRow button |
		newRow := LayoutMorph newRow.
		newRow 
			separation: 3;
			color: Color transparent; 
			axisEdgeWeight: #rowLeft.
		
		button := RadioButtonMorph 
				ofSize: RadioButtonMorph defaultDiameter.
		button layoutSpec: (LayoutSpec keepMorphExtent).
		
		aMorph setBalloonText: aName.
		"Make button react to/with graphic"
		aMorph setProperty: #'handlesMouseDown:' 
			toValue: [ :ignored | true ].
		aMorph setProperty: #'mouseButton1Up:localPosition:'
			toValue: [ :event :position |  button select ].
		aMorph setProperty: #'handlesMouseOver:' 
			toValue: [ :ignored | true ].
		aMorph setProperty: #'mouseEnter:' 
			toValue: [ :event | button mouseEnter: event ].
		aMorph setProperty: #'mouseLeave:' 
			toValue: [ :event | button mouseLeave: event ].

		(self buttonOnLeft)
			ifTrue: [ newRow  addMorph: button; addMorph: aMorph ] 
			ifFalse: [ newRow addMorph: aMorph; addMorph: button ].
		buttonList add: button.
		morphList add: aName.
		self 
			addMorph: newRow

	].
	self buttons: buttonList asArray.
	self setList:   morphList asArray.
	
	self buttons do: [ :b | 
		b when: #radioSelection 
		   send: #newSelection: 
		   to: self 
	].
	
! !

!RadioGroup methodsFor: 'initialization' stamp: 'KenD 6/1/2020 15:05:24'!
initialize
	"Initialize self to harmless values"
	
	super initialize.
	self setList: #(); "see #list: setter"
		 setFont: Preferences standardButtonFont;
		 buttonOnLeft: true;
		 separation: 2@2;
		 color: Color transparent! !

!RadioGroup methodsFor: 'initialization' stamp: 'KenD 11/20/2013 15:06'!
setFont: aFont

	font := aFont ! !

!RadioGroup methodsFor: 'initialization' stamp: 'KenD 11/20/2013 15:06'!
setList: arrayOfSymbols

	list := arrayOfSymbols ! !

!RadioGroup methodsFor: 'geometry' stamp: 'KenD 10/27/2021 13:46:29'!
naturalHeight
	"Answer the combined heights of my elements"
	
	^ 4  + ((self list size) 
		* (2 + ((self font lineSpacing) max: (RadioButtonMorph defaultDiameter))))! !

!RadioGroup methodsFor: 'events-processing' stamp: 'KenD 10/28/2021 14:18:07'!
fontPreferenceChanged

	| labelStrings maxStringWidth labelLayoutSpec |
	super fontPreferenceChanged.
	self setFont: Preferences standardButtonFont.
	maxStringWidth := 3. "minimum"
	labelStrings := self labelStrings.
	labelStrings do: [ :str |
		maxStringWidth := maxStringWidth max:  (self font widthOfString: str)
	].
	labelLayoutSpec := 
			LayoutSpec 
					fixedWidth: maxStringWidth + 4
					fixedHeight: self font lineSpacing + 2
					offAxisEdgeWeight: #center. 
	self submorphsDo: [ :selectLine |
		selectLine submorphsDo: [ :aMorph |
			(aMorph respondsTo: #setFont:)
				ifTrue: [ aMorph setFont: Preferences standardButtonFont ].
			(aMorph respondsTo: #font:)
				ifTrue: [ aMorph font: Preferences standardButtonFont ].
			(aMorph respondsTo: #ofSize:)
				ifTrue: [aMorph ofSize: RadioButtonMorph defaultDiameter].
			((aMorph isKindOf: LabelMorph)
			  and: [labelStrings includes: aMorph contents])
				ifTrue: [ aMorph layoutSpec: labelLayoutSpec ].
		]
	].! !

!RadioGroup methodsFor: 'events-processing' stamp: 'KenD 11/20/2013 15:11'!
newSelection: radioButton

	"Unselect other buttons"
	self buttons do: [ :b | b == radioButton ifFalse: [ b isSelected: false ] ].
	self triggerEvent: #informRadioSelection with: (self symbolForButton: radioButton)
	! !

!RadioGroup methodsFor: 'events-processing' stamp: 'KenD 11/25/2013 19:29'!
unselectAll

	self buttons do: [ :b | b isSelected: false ].
	self redrawNeeded 
	! !

!RadioGroup class methodsFor: 'examples' stamp: 'KenD 10/31/2021 13:12:01'!
imageTestPallet
	"Answer a RadioGroup of images"
"
	RadioGroup imageTestPallet openInWorld.
"
	| pallet statusLabel radioSelection formsDict morphDict |
	statusLabel :=  LabelMorph initializedInstance.
	pallet := LayoutMorph newColumn.
	pallet addMorph: (WindowTitleMorph 
					title: 'Radio Graphic' ).
	formsDict := (Theme content 
						from: 'Theme' 
						get: {'16x16'. 'emotes'}
			      ) asDictionary.
	morphDict := Dictionary new.
	formsDict keysAndValuesDo: [ :aName :aForm |
		morphDict 
			at: aName 
			put: (ImageMorph new image: (aForm magnifyTo: 32@32))
	].
	radioSelection := RadioGroup fromMorphsDict: morphDict.
	statusLabel contents: 'unselected'.
	pallet addMorph: statusLabel.
	pallet addMorph: radioSelection.
	radioSelection 
		when: #informRadioSelection 
		send: #contents: 
		to:  statusLabel.
	
	^pallet! !

!RadioGroup class methodsFor: 'instance creation' stamp: 'KenD 11/19/2013 19:38'!
fromList: buttonLables
	"Add label list as array of symbols to a new instance of me"

	| listOfSymbols |
	listOfSymbols := OrderedCollection new.
	buttonLables do: [ :each | listOfSymbols add: each asSymbol ].
	
	^ self newColumn fromList: listOfSymbols asArray ! !

!RadioGroup class methodsFor: 'instance creation' stamp: 'KenD 10/31/2021 08:46:21'!
fromMorphsDict: aDictionaryOfMorphs
	"Add dict of (name->morph) to a new instance of me"

	^ self newColumn fromMorphDict: aDictionaryOfMorphs ! !

!RadioGroup class methodsFor: 'new-morph participation' stamp: 'KenD 12/6/2013 19:07'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!PluggableListOfMorph methodsFor: 'access' stamp: 'hlsf 1/16/2022 09:58:55'!
addToScroller: aMorph
	super addToScroller: aMorph.
	self suitedExtent .! !

!PluggableListOfMorph methodsFor: 'initialization' stamp: 'hlsf 1/14/2022 11:08:27'!
initialize
	super initialize.
	autoDeselect _ false.
	self hHideScrollBar.! !

!PluggableListOfMorph methodsFor: 'initialization' stamp: 'hlsf 1/8/2022 12:09:36'!
innerMorphClass
	^ InnerListOfMorph ! !

!PluggableListOfMorph methodsFor: 'testing' stamp: 'hlsf 1/8/2022 12:10:10'!
is: aSymbol
	^ aSymbol == #PluggableListOfMorph or: [ super is: aSymbol ]! !

!PluggableListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/16/2022 09:55:03'!
scrollDeltaHeight
	^ scroller submorphs min: [:item | item fullBoundsInOwner height]! !

!PluggableListOfMorph methodsFor: 'geometry' stamp: 'hlsf 1/16/2022 10:00:37'!
suitedExtent
	self morphHeight: (extent y min: scroller fullHeight max: 100).
	self morphWidth: self minimumExtent x + scroller minimumWidth! !

!PluggableListOfMorph class methodsFor: 'as yet unclassified' stamp: 'hlsf 1/14/2022 10:42:34'!
example1
"
	self example1 openInWorld
"
| list |
	list _ PluggableListOfMorph new.
	#(#addressBookIcon #chatIcon #closeIcon #dateIcon #copyIcon #deleteIcon) do: [:icon |
		list addToScroller: (ImageMorph new image: (Theme current perform: icon))].
	^ list! !

!MultiSelectMenu methodsFor: 'events-processing' stamp: 'KenD 12/17/2016 14:36:43'!
accept

	self modalSelection: self result! !

!MultiSelectMenu methodsFor: 'events-processing' stamp: 'KenD 12/17/2016 14:33:01'!
cancel

	self modalSelection: self seed! !

!MultiSelectMenu methodsFor: 'events-processing' stamp: 'KenD 12/17/2016 15:59:22'!
toggle: nameSymbol

	| index bit |
	index := self choices indexOf: nameSymbol.
	bit := index - 1.
	
	(index = 1)
	ifTrue:  [  
		self result: 0.
		self clearAllButZero.
	]
	ifFalse: [ | menuItem bitClear |
		menuItem := self itemFor: nameSymbol.
		bitClear := (self result bitAt: bit) isZero.
		bitClear 
			ifTrue: [ "Set bit"
				self result: (self result bitAt: bit put: 1).
				menuItem contents: ('<on>', menuItem contents).
			]
			ifFalse: [ "Clear bit"
				self result: (self result bitAt: bit put: 0).
				menuItem contents: ('<off>', menuItem contents).
			] 
	].
	
	self updateZeroMarker.! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 12/17/2016 13:31:57'!
choices

	^ choices ! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 12/17/2016 14:36:58'!
result

	^ result ! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 12/17/2016 14:37:13'!
result: newResult

	result := newResult ! !

!MultiSelectMenu methodsFor: 'accessing' stamp: 'KenD 12/17/2016 13:32:09'!
seed

	^ seed ! !

!MultiSelectMenu methodsFor: 'initialization' stamp: 'KenD 5/15/2018 00:10:12'!
choices: aSymbolCollection seed: initialValue

	super initialize.
	self stayUp: true.
	choices := aSymbolCollection.
	seed := initialValue.
	result := seed.
	"Add my selections" 
	self choices do: [ :nameSymbol |
		self add: (self tagFromSeedFor: nameSymbol)
			  target: self 
			  action: #toggle: 
			  argument: nameSymbol.
	].
	self updateZeroMarker.
		
	self addLine.
	
	self add: 'ACCEPT' 
		  target: self 
		  action: #accept.
	self add: 'CANCEL' 
		  target: self 
		  action: #cancel.
! !

!MultiSelectMenu methodsFor: 'initialization' stamp: 'KenD 12/17/2016 14:35:16'!
choices: aSymbolCollection seed: initialValue title: aString

	self choices: aSymbolCollection seed: initialValue.
	self addTitle: aString.! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 15:49:12'!
clearAllButZero
	"Set 'zero' selector to '<on>' => everyone else is '<off>'"

	| zeroName |
	zeroName := self choices at: 1.
	self submorphsDo: [ :item |
		((item isKindOf: MenuItemMorph) and: [ self choices includes: item contents ])
		ifTrue: [ (item contents = zeroName)
				ifFalse: [ item contents: '<off>', item contents ]
				ifTrue:  [ item contents: '<on>' , item contents ]. "zero marker"
		]
	]  
! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 15:12:07'!
clearForZero
	"Set 'zero' selector to '<on>'"

	| zeroName zeroItem |
	zeroName := self choices at: 1.
	zeroItem := self submorphs detect:
		[ :item | (item isKindOf: MenuItemMorph) and: [ item contents = zeroName ] ].
	zeroItem contents: '<off>' , zeroName asString.! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 15:34:11'!
itemFor: nameSymbol

	^ self submorphs detect: [ :item |
			(item isKindOf: MenuItemMorph) 
				and: [ item contents = nameSymbol ]
	  ]! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 15:12:15'!
setForZero
	"Set 'zero' selector to '<on>'"

	| zeroName zeroItem |
	zeroName := self choices at: 1.
	zeroItem := self submorphs detect:
		[ :item | (item isKindOf: MenuItemMorph) and: [ item contents = zeroName ] ].
	zeroItem contents: '<on>' , zeroName asString.! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 14:08:36'!
tagFromSeedFor: nameSymbol
	"Answer nameSymbol preceeded by '<on>' or '<off>'"

	| index bit |
	index := self choices indexOf: nameSymbol.
	bit := index - 1.
	
	^ ((seed bitAt: bit) isZero)
		ifTrue:   [ '<off>' , nameSymbol asString ]
		ifFalse:  [ '<on>'  , nameSymbol asString ]! !

!MultiSelectMenu methodsFor: 'private' stamp: 'KenD 12/17/2016 15:24:12'!
updateZeroMarker
	"If no choices checked, set zero'th choice, else clear it"

	(self result isZero)
		ifTrue:  [ self clearAllButZero ]
		ifFalse: [ self clearForZero ].! !

!MultiSelectMenu class methodsFor: 'instance creation' stamp: 'KenD 12/17/2016 14:01:56'!
choices: aSymbolCollection seed: initialValue
"
	(MultiSelectMenu choices: TextEmphasis choices seed: 3) openInHand.
"
	^ self new choices: aSymbolCollection seed: initialValue! !

!MultiSelectMenu class methodsFor: 'instance creation' stamp: 'KenD 12/17/2016 14:39:40'!
choices: aSymbolCollection seed: initialValue title: aString
"
	(MultiSelectMenu choices: TextEmphasis choices seed: 3 title: 'Text Emphasis') invokeModal inspect.
"
	^ self new choices: aSymbolCollection seed: initialValue title: aString ! !

!MultiSelectMenu class methodsFor: 'new-morph participation' stamp: 'KenD 12/23/2016 09:13:31'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!RadioButtonMorph methodsFor: 'initialization' stamp: 'hlsf 10/29/2021 10:45:24'!
defaultBorderWidth

	^ 3! !

!RadioButtonMorph methodsFor: 'initialization' stamp: 'hlsf 10/29/2021 10:44:31'!
defaultColor

	^ `Color gray lighter lighter`! !

!RadioButtonMorph methodsFor: 'initialization' stamp: 'KenD 10/28/2021 14:01:40'!
defaultDiameter

	^ self class defaultDiameter ! !

!RadioButtonMorph methodsFor: 'initialization' stamp: 'hlsf 10/29/2021 10:35:49'!
initialize

	super initialize.
	isSelected := false.
	self borderColor: self defaultColor.
	self ofSize: self defaultDiameter! !

!RadioButtonMorph methodsFor: 'initialization' stamp: 'KenD 10/28/2021 14:12:25'!
ofSize: numPixels

	| size scale |
	scale _  Preferences standardButtonFont pointSize / 14.0.
	size _ numPixels "* scale".
	self borderWidth: ((self defaultBorderWidth * scale) max: 1).
	self morphExtent: size @ size.
	self layoutSpec: (LayoutSpec 
							fixedWidth: size 
							fixedHeight: size
							offAxisEdgeWeight:  #center)! !

!RadioButtonMorph methodsFor: 'event handling testing' stamp: 'KenD 11/19/2013 20:22'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"
	^true! !

!RadioButtonMorph methodsFor: 'event handling testing' stamp: 'KenD 11/19/2013 20:22'!
handlesMouseOver: evt
	"Do I want to receive mouseEnter: and mouseLeave: when the button is up and the hand is empty?" 
	^true! !

!RadioButtonMorph methodsFor: 'accessing' stamp: 'KenD 9/25/2021 14:15:16'!
fillColor: aColor
	"My color is my fillColor"
	self color: aColor
	! !

!RadioButtonMorph methodsFor: 'accessing' stamp: 'KenD 11/19/2013 20:16'!
isSelected

	^ isSelected ! !

!RadioButtonMorph methodsFor: 'accessing' stamp: 'hlsf 10/29/2021 10:39:59'!
isSelected: aBoolean

	(isSelected := aBoolean)
		ifFalse: [self fillColor: self defaultColor] 
		ifTrue: [self fillColor: Color black. 
				 self triggerEvent: #radioSelection with: self 
		]
! !

!RadioButtonMorph methodsFor: 'accessing' stamp: 'KenD 11/24/2013 16:56'!
select
	"Select me if unselected"

	(self isSelected) ifFalse: [ self isSelected: true ]
! !

!RadioButtonMorph methodsFor: 'accessing' stamp: 'KenD 11/19/2013 20:26'!
toggleSelection

	self isSelected: self isSelected not
! !

!RadioButtonMorph methodsFor: 'event handling' stamp: 'KenD 9/28/2021 08:40:49'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	((self coversPixel: aMouseButtonEvent eventPosition) and: [self isSelected not])
		ifTrue: [ self isSelected: true ]
! !

!RadioButtonMorph methodsFor: 'event handling' stamp: 'hlsf 10/29/2021 10:43:47'!
mouseEnter: event
	"The mouse has entered the area of the receiver"

	self isSelected ifFalse: [ | baseColor | 
		baseColor _ self defaultColor.
		self fillColor: ( Color h: baseColor hue s: baseColor saturation * 1.3 v: baseColor brightness * 0.6)]! !

!RadioButtonMorph methodsFor: 'event handling' stamp: 'KenD 9/25/2021 14:16:00'!
mouseLeave: event
	"The mouse has left the area of the receiver"

	self isSelected ifFalse: [ self fillColor: self defaultColor ]! !

!RadioButtonMorph methodsFor: 'event handling' stamp: 'KenD 11/19/2013 20:57'!
update: aParameter

	self redrawNeeded! !

!RadioButtonMorph class methodsFor: 'accessing' stamp: 'KenD 10/28/2021 14:04:40'!
defaultDiameter

	^ Preferences standardButtonFont lineSpacing ! !

!RadioButtonMorph class methodsFor: 'new-morph participation' stamp: 'KenD 12/6/2013 19:06'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!RadioButtonMorph class methodsFor: 'instance creation' stamp: 'KenD 11/19/2013 20:05'!
ofSize: numPixels

	^ self new ofSize: numPixels! !
