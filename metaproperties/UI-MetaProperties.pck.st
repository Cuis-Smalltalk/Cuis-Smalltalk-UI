'From Cuis7.9 [latest update: #8266] on 13 October 2026 at 1:13:14 pm'!
'Description MetaProperties describe and define public visual properties of Morphs.  They are used in Morph Menus.  Visual menu properties are purple and can be edited (one click) or dragged onto another menu (Drag ''n Drop),'!
!provides: 'UI-MetaProperties' 1 152!
!requires: 'Cuis-Base' 79 8266 nil!
!requires: 'UI-Components' 1 6 nil!
!requires: 'UI-Shapes' 1 38 nil!
!requires: 'Complex' 1 0 nil!
!requires: 'UI-Packager' 1 0 nil!
!requires: 'UI-Layout-Panel' 1 10 nil!
!requires: 'UI-Color-Panel' 1 3 nil!
SystemOrganization addCategory: #'UI-MetaProperties'!


!classDefinition: #VisualPropertyMenuItem category: #'UI-MetaProperties'!
UpdatingMenuItemMorph subclass: #VisualPropertyMenuItem
	instanceVariableNames: 'metaProperty name prevValue targetMorph accessProc updateProc'
	classVariableNames: 'BlankIcon BoolIcon CharIcon ChronIcon ClassIcon ClosureIcon CollectIcon CpxIcon FalseIcon FileIcon FloatIcon FolderIcon FontIcon FracIcon GrabLineHorizIcon GrabLineVertIcon ImageIcon IntIcon LayoutIcon NilIcon ObjIcon OneOfIcon PtIcon RngIcon StrIcon StreamIcon SymIcon TargetIcon TrueIcon WindowIcon'
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'VisualPropertyMenuItem class' category: #'UI-MetaProperties'!
VisualPropertyMenuItem class
	instanceVariableNames: ''!

!classDefinition: #OrdinaryPropertyMenuItem category: #'UI-MetaProperties'!
MenuItemMorph subclass: #OrdinaryPropertyMenuItem
	instanceVariableNames: 'accessKind name targetMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'OrdinaryPropertyMenuItem class' category: #'UI-MetaProperties'!
OrdinaryPropertyMenuItem class
	instanceVariableNames: ''!

!classDefinition: #MorphMessageBox category: #'UI-MetaProperties'!
WorkspaceWindow subclass: #MorphMessageBox
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'MorphMessageBox class' category: #'UI-MetaProperties'!
MorphMessageBox class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyTests category: #'UI-MetaProperties'!
TestCase subclass: #MetaPropertyTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'MetaPropertyTests class' category: #'UI-MetaProperties'!
MetaPropertyTests class
	instanceVariableNames: ''!

!classDefinition: #MetaProperty category: #'UI-MetaProperties'!
Object subclass: #MetaProperty
	instanceVariableNames: 'kind editProc'
	classVariableNames: 'PreDefinedPropsDict'
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'MetaProperty class' category: #'UI-MetaProperties'!
MetaProperty class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyFrom category: #'UI-MetaProperties'!
MetaProperty subclass: #MetaPropertyFrom
	instanceVariableNames: 'minValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'MetaPropertyFrom class' category: #'UI-MetaProperties'!
MetaPropertyFrom class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyOneOf category: #'UI-MetaProperties'!
MetaProperty subclass: #MetaPropertyOneOf
	instanceVariableNames: 'choiceCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'MetaPropertyOneOf class' category: #'UI-MetaProperties'!
MetaPropertyOneOf class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyMultiSelect category: #'UI-MetaProperties'!
MetaPropertyOneOf subclass: #MetaPropertyMultiSelect
	instanceVariableNames: 'maxValue encodeProc decodeProc'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'MetaPropertyMultiSelect class' category: #'UI-MetaProperties'!
MetaPropertyMultiSelect class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyRange category: #'UI-MetaProperties'!
MetaProperty subclass: #MetaPropertyRange
	instanceVariableNames: 'minValue maxValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'MetaPropertyRange class' category: #'UI-MetaProperties'!
MetaPropertyRange class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyTransducer category: #'UI-MetaProperties'!
MetaProperty subclass: #MetaPropertyTransducer
	instanceVariableNames: 'kinds transformProc'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'MetaPropertyTransducer class' category: #'UI-MetaProperties'!
MetaPropertyTransducer class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyViaTest category: #'UI-MetaProperties'!
MetaProperty subclass: #MetaPropertyViaTest
	instanceVariableNames: 'testClosure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-MetaProperties'!
!classDefinition: 'MetaPropertyViaTest class' category: #'UI-MetaProperties'!
MetaPropertyViaTest class
	instanceVariableNames: ''!


!VisualPropertyMenuItem commentStamp: '<historical>' prior: 0!
My instances display a menu selection for a Morph visual property.  
See documentation method: MetaProperty class>>whyMe

ivars:
  metaProperty -- a PropertyMetaVisualPropertyMenuItem
  name -- property name (a symbol)
  prevValue -- cached previous property value (used for undo)
  targetMorph -- changes to me are reflected in this specific morph
  accessProc -- a closure of 0 args which returns a value
  updateProc -- a closure which takes 1 value
!

!OrdinaryPropertyMenuItem commentStamp: '<historical>' prior: 0!
My instances supply menu iterms which can have their values dragged for DragNDrop.

My accessKind is either #property #instanceVar.!

!MorphMessageBox commentStamp: '<historical>' prior: 0!
I am a Workspace specialized to send a message to a Morph.!

!MetaPropertyTests commentStamp: '<historical>' prior: 0!
Unit tests for MetaProeprties!

!MetaProperty commentStamp: '<historical>' prior: 0!
I am the parent class for Morph meta-properties.  

My instances are immutable and may be shared.  See class side for common MetaProperties.

I maintain PreDefinedPropsDict, which contains metaPropName->metaProp for sharing.  These pre-defined MetaProperties are typically added in my class and subclass #initialize methods.
e.g.
   MetaProperty metaPropNamed: #acceptsColor.

My instances are used to allow generation of PropertyEditors for Morphs.

See method #whyMe in the class side for documentation.


"Simple Class test"
(MetaProperty kind: String) accepts: #symbol.

"OneOf choice"
(MetaPropertyOneOf kind: Symbol choices: #(fee fie fo fum)) accepts: #fee.

"Number Range"
(MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 1.2.

"Point Range"
(MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 1@5.

"Positive Point"
(MetaPropertyFrom kind: Point minValue: 0@0) accepts: 23@47.

"Pattern Match"
(MetaPropertyViaTest kind: String test: [ :s | '*baz*' match: s ]) accepts: 'mombazzi'.

!

!MetaPropertyFrom commentStamp: '<historical>' prior: 0!
I accept  minValue <= newValue!

!MetaPropertyOneOf commentStamp: '<historical>' prior: 0!
I only accept values which are included in choiceCollection.!

!MetaPropertyMultiSelect commentStamp: '<historical>' prior: 0!
I use a MultiSelectMenu and arbitrate between a user friendly view and an internal encoding.

The encoding is assumed to map between my choiceCollection (ordered collection of symbols) and internal encoding bits.

The first choice encodes as zero.  Other encodings each add a bit.  See MultiSelectMenu class for details.

encodeProc takes a value which may be a code, symbol, string, or whatever and returns nil or an encoded value.

decodeProc takes an encoded value (an Integer) and reutrnd a String for the UI to display to the user.
!

!MetaPropertyRange commentStamp: '<historical>' prior: 0!
I accept values in a range where:  minValue <= newValue <= maxValue.
!

!MetaPropertyTransducer commentStamp: '<historical>' prior: 0!
I can accept various kinds of objects and translate them into what I really want.!

!MetaPropertyViaTest commentStamp: '<historical>' prior: 0!
I test via  (aClosure value: newValue).

aClosure should take one argument and return a boolean.!

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 18/Sep/2019, 11:05:00 pm (UTC)'!
displayString

	| propValue propString |
	propValue := self propertyValue.
	propString :=
		(propValue is: Number) 
		ifTrue: [propValue printStringFractionDigits: 4] 
		ifFalse: [(propValue isPoint) 
			ifTrue: [propValue printStringFractionDigits: 2]
			ifFalse: [propValue printString]].
	^ name asString , ': ', propString! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:29:00 pm (UTC)'!
metaProperty

	^ metaProperty! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:29:00 pm (UTC)'!
name

	^ name! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:29:00 pm (UTC)'!
prevValue

	^ prevValue! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:30:00 pm (UTC)'!
propertyDescriptor

	^ self metaProperty! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 12/Dec/2016, 9:38:00 pm (UTC)'!
propertyValue
	"Getter"

	^ accessProc value! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 22/Dec/2016, 11:50:00 pm (UTC)'!
propertyValue: newValue
	"Setter"

	updateProc value: newValue.
	self update! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:35:00 pm (UTC)'!
targetMorph

	^ targetMorph ! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 3/Mar/2022, 7:42:00 pm (UTC)'!
acceptDroppingMorph: aMorph event: evt
	"This message is sent when a morph is dropped onto 
	 a morph that has agreed to accept the dropped morph 
	 by responding 'true' to the wantsDroppedMorph:event: message."
	
	self dropAction: aMorph! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 28/Nov/2016, 11:38:00 pm (UTC)'!
allowsMorphDrop
	"Answer whether we accept dropping morphs. Redefined to answer true."

	^ true! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 3/Mar/2022, 7:45:00 pm (UTC)'!
processDropMorph: aDropEvent
	"I have already expressed a desire for the drop. Just do it."
	
	| dropedMorph |
	dropedMorph := aDropEvent contents.
	aDropEvent wasHandled: true.
	self propertyValue: dropedMorph valueWhenDropped.
	dropedMorph showAcceptAndDeleteSelf.! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 7/Dec/2016, 9:55:00 pm (UTC)'!
processMouseDown: evt localPosition: localEventPosition
	"Do nothing upon mouse-down except inform the hand to watch for a 
	click; wait until an ensuing #click: message gets dispatched"
"
	Transcript newLine; show: (self name , ' got #processMouseDown:localPosition:').  
"
	evt wasHandled: true.
	evt hand waitForClicksOrDrag: self
				event: evt
				dragSel: #dragEvent:localPosition:
				clkSel: #mouseButton1Down:localPosition:

! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 3/Mar/2022, 7:18:00 pm (UTC)'!
wantsDroppedMorph: aMorph event: evt
	"Return true if the receiver wishes to accept the given morph, which is being dropped by a hand in response to the given event. Note that for a successful drop operation both parties need to agree. The symmetric check is done automatically via aMorph wantsToBeDroppedInto: self."

	^ self allowsValue: aMorph valueWhenDropped
	
! !

!VisualPropertyMenuItem methodsFor: 'editing' stamp: 'KenD 18/Dec/2016, 8:05:00 pm (UTC)'!
edit

	self metaProperty edit: self targetMorph menuItem: self.
	self update ! !

!VisualPropertyMenuItem methodsFor: 'editing' stamp: 'KenD 28/Nov/2016, 11:35:00 pm (UTC)'!
undo
	"Reset value from remembered value"

	self targetMorph setProperty: self name  toValue: self prevValue! !

!VisualPropertyMenuItem methodsFor: 'events-processing' stamp: 'KenD 14/Apr/2019, 10:27:00 pm (UTC)'!
update

	self updateContents.
	self targetMorph redrawNeeded.! !

!VisualPropertyMenuItem methodsFor: 'initialization' stamp: 'KenD 11/Mar/2022, 11:14:00 pm (UTC)'!
propName: aSymbol morph: aMorph propMeta: aPropertyDescriptor accessProc: getterClosure updateProc: setterClosure

	super initialize.
	name := aSymbol.
	targetMorph := aMorph.
	metaProperty := aPropertyDescriptor.
	prevValue := getterClosure value.	
	accessProc := getterClosure.
	updateProc := setterClosure.
	self
		contents: ( self displayStringForWidth: (self owner 
							ifNil: [60] 
							ifNotNil: [(self owner morphWidth) - 30]) );
		setIcon: prevValue icon;
		target: self selector: #edit arguments: nil;
		"Show menuItems are special by text color"
		color: DropColorMorph swatchBorderColor 
! !

!VisualPropertyMenuItem methodsFor: 'testing' stamp: 'KenD 28/Nov/2016, 11:37:00 pm (UTC)'!
allowsValue: aValue

	^ self metaProperty accepts: aValue! !

!VisualPropertyMenuItem methodsFor: 'testing' stamp: 'KenD 13/Apr/2019, 9:30:00 pm (UTC)'!
is: aSymbol
	^ aSymbol == #VisualPropertyMenuItem or: [ super is: aSymbol ]! !

!VisualPropertyMenuItem methodsFor: 'private' stamp: 'KenD 10/Jan/2026, 7:42:52 pm (UTC)'!
displayStringForWidth: maxWidth
	"Answer a string which fits in maxwidth"
	|  myString count stringWidth  |
	myString := self displayString.
	(myString size <= 0) ifTrue: [ ^ '' ].
	font ifNil: [ font := FontFamily defaultFamilyAndPointSize ].
	stringWidth := font widthOfString: '..'.
	count := 1.
	1 to: myString size do: [ :index | 
		stringWidth := stringWidth + (font widthOf: (myString at: index)).
		(stringWidth < maxWidth) ifTrue: [count := index]
	].

	(myString size <= count)
		ifTrue: [ ^myString ] "fits"
		ifFalse: [ ^(myString truncateTo: count) , '..' ] 
	! !

!VisualPropertyMenuItem methodsFor: 'private' stamp: 'KenD 14/Apr/2019, 11:12:00 pm (UTC)'!
updateContents
	"(re)set my content string and icon"

	| myWidth |
	myWidth := self owner ifNil: [60] ifNotNil: [self owner morphWidth - 10 ].
	self morphWidth: myWidth.
	self contents: ( self displayStringForWidth: (myWidth - 20) ). "space for icon + border"
	self setIcon: (self propertyValue icon)! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:21:00 pm (UTC)'!
blankIcon

	^BlankIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:21:00 pm (UTC)'!
booleanIcon

	^BoolIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:21:00 pm (UTC)'!
charIcon

	^CharIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:21:00 pm (UTC)'!
chronIcon

	^ChronIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:21:00 pm (UTC)'!
classIcon

	^ClassIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:22:00 pm (UTC)'!
closureIcon

	^ClosureIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:22:00 pm (UTC)'!
collectionIcon

	^CollectIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:22:00 pm (UTC)'!
complexIcon

	^CpxIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:22:00 pm (UTC)'!
falseIcon

	^FalseIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:22:00 pm (UTC)'!
fileIcon

	^FileIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:22:00 pm (UTC)'!
floatIcon

	^FloatIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:22:00 pm (UTC)'!
folderIcon

	^FolderIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:22:00 pm (UTC)'!
fontIcon

	^FontIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:22:00 pm (UTC)'!
fractionIcon

	^FracIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 3/Feb/2022, 10:41:00 pm (UTC)'!
grabLineHorizIcon

	^GrabLineHorizIcon ! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 3/Feb/2022, 10:40:00 pm (UTC)'!
grabLineVertIcon

	^GrabLineVertIcon ! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 14/Dec/2021, 7:40:00 pm (UTC)'!
imageIcon

	^ImageIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:22:00 pm (UTC)'!
integerIcon

	^IntIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 14/Dec/2021, 7:40:00 pm (UTC)'!
layoutIcon

	^LayoutIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:23:00 pm (UTC)'!
nilIcon

	^NilIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:23:00 pm (UTC)'!
objectIcon

	^ObjIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:23:00 pm (UTC)'!
oneOfIcon

	^OneOfIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:23:00 pm (UTC)'!
pointIcon

	^PtIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:23:00 pm (UTC)'!
rangeIcon

	^RngIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:23:00 pm (UTC)'!
streamIcon

	^StreamIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:23:00 pm (UTC)'!
stringIcon

	^StrIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:23:00 pm (UTC)'!
symbolIcon

	^SymIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 30/Jan/2022, 10:19:00 pm (UTC)'!
targetIcon

	^TargetIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:23:00 pm (UTC)'!
trueIcon

	^TrueIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2016, 11:23:00 pm (UTC)'!
windowIcon

	^WindowIcon! !

!VisualPropertyMenuItem class methodsFor: 'class initialization' stamp: 'KenD 3/Feb/2022, 10:44:00 pm (UTC)'!
initialize
"
	VisualPropertyMenuItem initialize.
"
	| dirName |
	dirName :=  ((self package) fullFileName upToLastPathSeparator), '/icons/'.

	BlankIcon := ImageReadWriter formFromFileNamed: dirName , 'Blank.png'.
	BoolIcon := ImageReadWriter formFromFileNamed: dirName , 'Bool.png'.
	CharIcon := ImageReadWriter formFromFileNamed: dirName , 'Char.png'.
	ChronIcon := ImageReadWriter formFromFileNamed: dirName , 'Chron.png'.
	ClassIcon := ImageReadWriter formFromFileNamed: dirName , 'Class.png'.
	ClosureIcon := ImageReadWriter formFromFileNamed: dirName , 'Closure.png'.
	CollectIcon := ImageReadWriter formFromFileNamed: dirName , 'Collect.png'.
	CpxIcon := ImageReadWriter formFromFileNamed: dirName , 'Cpx.png'.
	FalseIcon := ImageReadWriter formFromFileNamed: dirName , 'False.png'.
	FileIcon := ImageReadWriter formFromFileNamed: dirName , 'File.png'.
	FloatIcon := ImageReadWriter formFromFileNamed: dirName , 'Float.png'.
	FolderIcon := ImageReadWriter formFromFileNamed: dirName , 'Folder.png'.
	FontIcon := ImageReadWriter formFromFileNamed: dirName , 'Font.png'.
	FracIcon := ImageReadWriter formFromFileNamed: dirName , 'Frac.png'.
	GrabLineHorizIcon := ImageReadWriter formFromFileNamed: dirName , 'LineGrabHoriz.png'.
	GrabLineVertIcon := ImageReadWriter formFromFileNamed: dirName , 'LineGrabVert.png'.
	ImageIcon := ImageReadWriter formFromFileNamed: dirName , 'Graphic.png'.
	IntIcon := ImageReadWriter formFromFileNamed: dirName , 'Int.png'.
	LayoutIcon := (ImageReadWriter formFromFileNamed: dirName , 'Effect.png') magnifyTo: 16@16.
	NilIcon := ImageReadWriter formFromFileNamed: dirName , 'Nil.png'.
"	ObjIcon := ImageReadWriter formFromFileNamed: dirName , 'Obj.png'."
	ObjIcon := ImageReadWriter formFromFileNamed: dirName , 'mushroom.png'.
	OneOfIcon := ImageReadWriter formFromFileNamed: dirName , 'OneOf.png'.
	PtIcon := ImageReadWriter formFromFileNamed: dirName , 'Pt.png'.
	RngIcon := ImageReadWriter formFromFileNamed: dirName , 'Rng.png'.
	StrIcon := ImageReadWriter formFromFileNamed: dirName , 'Str.png'.
	StreamIcon := ImageReadWriter formFromFileNamed: dirName , 'Stream.png'.
	SymIcon := ImageReadWriter formFromFileNamed: dirName , 'Sym.png'.
	TargetIcon := ImageReadWriter formFromFileNamed: dirName , 'targetIcon.png'.
	TrueIcon := ImageReadWriter formFromFileNamed: dirName , 'True.png'.
	WindowIcon := ImageReadWriter formFromFileNamed: dirName , 'Window.png'.
	
! !

!VisualPropertyMenuItem class methodsFor: 'class initialization' stamp: 'KenD 7/Dec/2016, 10:07:00 pm (UTC)'!
propName: aSymbol morph: aMorph

	^ self propName: aSymbol morph: aMorph propMeta: MetaProperty default
! !

!VisualPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 12/Dec/2016, 9:39:00 pm (UTC)'!
ivarName: aSymbol morph: aMorph propMeta: aPropertyDescriptor
	"Instance Variable based accessor"
	
	^ self 
		propName: aSymbol 
		morph: aMorph 
		propMeta: aPropertyDescriptor 
		accessProc: [ ^ aMorph instVarNamed: aSymbol ] 
		updateProc: [ :newValue | aMorph instVarNamed: aSymbol put: newValue ] ! !

!VisualPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 23/Dec/2016, 2:59:00 am (UTC)'!
propName: aSymbol morph: aMorph propMeta: aPropertyDescriptor
	"Selector based accessor"
	
	| setterSym isEncoded getterProc setterProc |
	setterSym := (aSymbol , ':') asSymbol.
	isEncoded := (aPropertyDescriptor isKindOf: MetaPropertyMultiSelect)
					or: [ aPropertyDescriptor isKindOf: MetaPropertyTransducer ].
	getterProc := [ aMorph perform: aSymbol ] .
	setterProc := [ :newValue | aMorph perform: setterSym with: newValue ].
	^ self 
		propName: aSymbol 
		morph: aMorph 
		propMeta: aPropertyDescriptor 
		accessProc:
			(isEncoded 
				ifFalse: [ getterProc ]
				ifTrue: [ [ aPropertyDescriptor decodeProc value: (getterProc value) ] ])
		updateProc: 
			(isEncoded 
				ifFalse: [ setterProc ]
				ifTrue: [ [ :newValue |  setterProc value: (aPropertyDescriptor encodeProc value: newValue) ] ])
			! !

!VisualPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 12/Dec/2016, 9:39:00 pm (UTC)'!
propName: aSymbol 
morph: aMorph 
propMeta: aPropertyDescriptor 
accessProc: getterClosure 
updateProc: setterClosure 

	"Generalized value accessor"
	^ self new propName: aSymbol 
				morph: aMorph
				propMeta: aPropertyDescriptor 
				accessProc: getterClosure 
				updateProc: setterClosure ! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 13/May/2018, 2:45:00 am (UTC)'!
icon

	^icon! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 13/May/2018, 2:45:00 am (UTC)'!
icon: anIcon

	self setIcon: anIcon! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 2/Dec/2016, 11:07:00 pm (UTC)'!
name

	^ name! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 2/Dec/2016, 11:15:00 pm (UTC)'!
targetMorph

	^ targetMorph! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 2/Dec/2016, 11:22:00 pm (UTC)'!
value
	"Answer value of my targetMorph's property or instance variable"

	^ (accessKind = #property)
		ifTrue:  [ targetMorph valueOfProperty: name ]
		ifFalse: [ targetMorph instVarNamed:     name ]! !

!OrdinaryPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 11/Dec/2016, 8:53:00 pm (UTC)'!
allowsMorphDrop
	"We don't allow editing by Drop, but answer true here to visually reject and delete dropped morph."

	^ true! !

!OrdinaryPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 2/Dec/2016, 11:05:00 pm (UTC)'!
processMouseDown: evt localPosition: localEventPosition
	"Do nothing upon mouse-down except inform the hand to watch for a 
	click; wait until an ensuing #click: message gets dispatched"
"
	Transcript newLine; show: (self name , ' got #processMouseDown:localPosition:').  
"
	evt wasHandled: true.
	evt hand waitForClicksOrDrag: self
				event: evt
				dragSel: #dragEvent:localPosition:
				clkSel: #mouseButton1Down:localPosition:

! !

!OrdinaryPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 9/Feb/2026, 4:24:48 pm (UTC)'!
showReject: aMorph
	"Draw and erase a red X"

	| leftStroke rightStroke mPos mExtent |
	mPos := aMorph positionInWorld.
	mExtent := aMorph extentInOwner.
	leftStroke   := LineMorph 
						startPoint: mPos - (10@10) 
						endPoint: (mPos + mExtent + (10@10)) 
						width: 6
						color: Color red.
	rightStroke := LineMorph 
						startPoint: mPos + (-10 @ (mExtent y + 10))
						endPoint: (mPos + ((10 + mExtent x) @ -10)) 
						width: 6
						color: Color red.
	leftStroke   setProperty:  #layerNumber toValue: 1.
	rightStroke setProperty:  #layerNumber toValue: 1.
	leftStroke   openInWorld.
	rightStroke openInWorld.
	
	"NB: Keep Morph when rejected"
	leftStroke   addAlarm: #delete after: 400.	
	rightStroke addAlarm: #delete after: 400.
	
	PopUpMenu inform: 'You can''t set this'
	! !

!OrdinaryPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 3/Mar/2022, 7:40:00 pm (UTC)'!
wantsDroppedMorph: aMorph event: evt
	"Return true if the receiver wishes to accept the given morph, which is being dropped by a hand in response to the given event. Note that for a successful drop operation both parties need to agree. The symmetric check is done automatically via aMorph wantsToBeDroppedInto: self."

"	self showReject: aMorph."
	
	"Rejecting the drop adds aMorph to its old owner at 0@0."
	^ false  "Reject the drop"! !

!OrdinaryPropertyMenuItem methodsFor: 'initialization' stamp: 'KenD 2/Dec/2016, 11:03:00 pm (UTC)'!
itemForIVar: aName targetMorph: aMorph

	accessKind := #instanceVariable.
	targetMorph := aMorph.
	name := aName.! !

!OrdinaryPropertyMenuItem methodsFor: 'initialization' stamp: 'KenD 2/Dec/2016, 11:02:00 pm (UTC)'!
itemForProperty: aName targetMorph: aMorph

	accessKind := #property.
	targetMorph := aMorph.
	name := aName.! !

!OrdinaryPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 2/Dec/2016, 11:00:00 pm (UTC)'!
itemForIVar: aName targetMorph: aMorph

	^self new itemForIVar: aName targetMorph: aMorph! !

!OrdinaryPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 2/Dec/2016, 11:01:00 pm (UTC)'!
itemForProperty: aName targetMorph: aMorph

	^self new itemForProperty: aName targetMorph: aMorph! !

!MorphMessageBox methodsFor: 'geometry' stamp: 'KenD 17/May/2023, 5:06:00 pm (UTC)'!
boxExtent
	"answer the extent to use in all the buttons. 
	 
	the label height is used to be proportional to the fonts preferences"
	| e |
	e := (Preferences at: #windowTitleFont) lineSpacing.
	^e@e! !

!MorphMessageBox methodsFor: 'geometry' stamp: 'KenD 1/Oct/2016, 12:06:00 am (UTC)'!
minimumExtent

	^ 700@(self boxExtent y * 2.3)! !

!MorphMessageBox methodsFor: 'initialization' stamp: 'KenD 30/Sep/2016, 10:28:00 pm (UTC)'!
initialize

	super initialize.
	self morphExtent: self minimumExtent.! !

!MorphMessageBox class methodsFor: 'instance creation' stamp: 'KenD 30/Sep/2016, 11:59:00 pm (UTC)'!
openForMorph: aMorph
"
	MorphMessageBox openForMorph: EllipseMorph initializedInstance.
"
	| morphName win work textModelMorph |
	morphName := aMorph nameForWorkspace.
	work := Workspace new contents: ''.
	win := self editText: work label: 'Message for ', morphName wrap: false.
	textModelMorph := win layoutMorph submorphs at: 1.
	win morphExtent: win minimumExtent.
	textModelMorph editor afterSelectionInsertAndSelect: morphName , ' '; 
	afterSelectionInsertAndSelect: ' '.
		"deselectAndPlaceCursorAt: (morphName size + 2) ."
	(win model  bindingOf: morphName) value: aMorph.
	win changed: #actualContents.
	win activateAndSendTopToBack: true.
	self runningWorld activeHand newMouseFocus: win.
	^win! !

!MetaPropertyTests methodsFor: 'testing' stamp: 'KenD 24/Nov/2022, 9:34:00 pm (UTC)'!
testAccepts

	self assert: ((MetaProperty kind: CharacterSequence) accepts: 'aString').
	self deny: ((MetaProperty kind: CharacterSequence) accepts: 2@3).
	self assert: ((MetaProperty kind: CharacterSequence) accepts: #symbol).

	"OneOf choice"
	self assert: ((MetaPropertyOneOf kind: Symbol choices: #(fee fie fo fum)) accepts: #fie).
	self deny: ((MetaPropertyOneOf kind: Symbol choices: #(fee fie fo fum)) accepts: #bogus).
	self deny: ((MetaPropertyOneOf kind: Symbol choices: #(fee fie fo fum)) accepts: 4@5).
	self deny: ((MetaPropertyOneOf kind: Boolean choices: #(true false)) accepts: nil).
	self assert: ((MetaPropertyOneOf kind: Boolean choices: #(true false)) accepts: true).
	self assert: ((MetaPropertyOneOf kind: Boolean choices: #(true false)) accepts: false).
	self deny: ((MetaPropertyOneOf kind: Boolean choices: #(true false)) accepts: #bogus).

	"Number Range"
	self assert: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 1.2).
	self deny: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 0.7).
	self deny: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 7).
	self deny: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 4).
	self deny: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 2@3).
	self deny: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: #bogus).
		
	"Point Range"
	self assert: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 1@4).
	self assert: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 4@3).
	self deny: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 1@5).
	self deny: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 5@1).
	self deny: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: -1@1).
	self assert: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 0.3@1).


	"Positive Point"
	self assert: ((MetaPropertyFrom kind: Point minValue: 0@0) accepts: 23@47).
	self deny: ((MetaPropertyFrom kind: Point minValue: 0@0) accepts: -23@47).
	self deny: ((MetaPropertyFrom kind: Point minValue: 0@0) accepts: -23@ -47).
	self deny: ((MetaPropertyFrom kind: Point minValue: 0@0) accepts: 1@ -1).

	"Pattern Match"
	self assert: ((MetaPropertyViaTest kind: CharacterSequence test: [ :s | '*baz*' match: s ]) accepts: 'mombazzi').
	self deny: ((MetaPropertyViaTest kind: CharacterSequence test: [ :s | '*baz*' match: s ]) accepts: 'bamboozle').
	self deny: ((MetaPropertyViaTest kind: CharacterSequence test: [ :s | '*baz*' match: s ]) accepts: 43).
! !

!MetaPropertyTests methodsFor: 'testing' stamp: 'KenD 5/Dec/2016, 8:55:00 pm (UTC)'!
testCreationGuards

	"Kind must be a Class"
	self should: [ MetaProperty kind: 37 ] raise: Error.
	self should: [ MetaProperty kind: Color blue ] raise: Error.
	
	"Values must be of right kind"
	self should: [ MetaPropertyFrom kind: Point minValue: Color red ] raise: Error.
	self should: [ MetaPropertyFrom kind: Number minValue: 3@4 ] raise: Error.
	self should: [ MetaPropertyOneOf kind: Number choices: #(fee fie fo fum) ] raise: Error.
	self should: [ MetaPropertyOneOf kind: Number choices: Color green ] raise: Error.
	self should: [ MetaPropertyRange kind: Number minValue: 1@2 maxValue: 3 ] raise: Error.
	self should: [ MetaPropertyRange kind: Number minValue: 1 maxValue: 2@3 ] raise: Error.
	self should: [ MetaPropertyViaTest kind: Number test: Color white ] raise: Error.
	self should: [ MetaPropertyViaTest kind: Number test: [ :a :b | a + b ] ] raise: Error.
	self should: [ MetaPropertyViaTest kind: 34 test: [ :a :b | a + b ] ] raise: Error.! !

!MetaPropertyTests methodsFor: 'testing' stamp: 'KenD 5/Dec/2016, 8:22:00 pm (UTC)'!
testPredefinedMProps

	self assert: ((MetaProperty metaPropNamed: #acceptsString) accepts: 'aString').
	self assert: ((MetaProperty metaPropNamed: #acceptsColor) accepts: Color blue).
	self assert: ((MetaProperty metaPropNamed: #acceptsPositivePoint) accepts: 2@3).
	self assert: ((MetaProperty metaPropNamed: #acceptsPositiveNumber) accepts: 0.1).
	
	self deny: ((MetaProperty metaPropNamed: #acceptsPositivePoint) accepts: -2@3).
	self deny: ((MetaProperty metaPropNamed: #acceptsPositiveNumber) accepts: -1).! !

!MetaProperty methodsFor: 'testing' stamp: 'KenD 14/Aug/2022, 8:29:00 pm (UTC)'!
accepts: newValue

	^ (MetaProperty classTestFor: kind) value: newValue ! !

!MetaProperty methodsFor: 'editing' stamp: 'KenD 22/Dec/2016, 9:38:00 pm (UTC)'!
edit: myMorph menuItem: item

	(self editProc) 
	 	ifNil: [  (HoverHelpMorph contents: 'Need editor for ' , item name asString)
			popUpForHand: myMorph world activeHand ]
		ifNotNil: [ :closure | closure value: myMorph value: self value: item ]! !

!MetaProperty methodsFor: 'accessing' stamp: 'KenD 14/Dec/2016, 5:52:00 pm (UTC)'!
editProc

	^ editProc ! !

!MetaProperty methodsFor: 'accessing' stamp: 'KenD 4/Dec/2016, 9:33:00 pm (UTC)'!
kind

	^ kind! !

!MetaProperty methodsFor: 'initialization' stamp: 'KenD 4/Dec/2016, 9:20:00 pm (UTC)'!
initialize

	kind := Object "default"! !

!MetaProperty methodsFor: 'initialization' stamp: 'KenD 4/Dec/2016, 9:19:00 pm (UTC)'!
kind: aClass

	(aClass isKindOf: Class)
	ifTrue:  [ kind := aClass ]
	ifFalse: [ self error: 'Expected a class: ', aClass printString ].! !

!MetaProperty methodsFor: 'initialization' stamp: 'KenD 14/Dec/2016, 5:51:00 pm (UTC)'!
kind: aClass editProc: aClosure

	(aClass isKindOf: Class)
	ifTrue:  [ kind := aClass ]
	ifFalse: [ self error: 'Expected a class: ', aClass printString ].
	
	(aClosure isKindOf: BlockClosure)
		ifFalse:  [ self error: 'Expected a closure for editing: ', aClosure printString ].
	(aClosure numArgs = 3)
		ifFalse: [ self error: 'Expected closure w 3 args [ :morph :metaProp :procName | ..] ', 
							  aClosure printString ].
	editProc := aClosure ! !

!MetaProperty class methodsFor: 'class initialization' stamp: 'KenD 28/Jan/2026, 8:10:36 pm (UTC)'!
addPredefinedMetaProperties

	"Does nothing -- method inherited by subclasses which do not override it"! !

!MetaProperty class methodsFor: 'class initialization' stamp: 'KenD 28/Jan/2026, 8:09:28 pm (UTC)'!
initialize
	"Add typical usages to dictionary for sharing."
"
	MetaProperty initialize.
"
	
	self initializePreDefinedPropsDict
! !

!MetaProperty class methodsFor: 'class initialization' stamp: 'KenD 28/Jan/2026, 8:10:36 pm (UTC)'!
initializePreDefinedPropsDict
	"Add typical usages to dictionary for sharing."
"
	PreDefinedPropsDict := nil.
	MetaProperty initializeDictionaries.
"
	| props |
	PreDefinedPropsDict 
		ifNil: [  PreDefinedPropsDict := IdentityDictionary new ].
	
	props := self preDefinedPropsDict.
	props at: #acceptsString 
			put: (MetaProperty 
			kind: CharacterSequence
			editProc: [ :morph :metaProp :menuItem | 
						StringEntryPanel 
								open: menuItem
								label: (menuItem name asString) ::						
								morphPosition: morph positionInWorld 
												+ morph extentInOwner;
							    fitInWorld
							 ]).
	props at: #acceptsSymbol 
			put: (MetaProperty 
					kind: CharacterSequence
					editProc: [ :morph :metaProp :menuItem | 
						StringEntryPanel 
								open: menuItem
								label: (menuItem name asString) ::
								morphPosition: morph positionInWorld 
												+ morph extentInOwner;
								fitInWorld ]).
	props at: #acceptsCharacter 
			put: (MetaProperty 
					kind: Character
					editProc: [ :morph :metaProp :menuItem | 
						CharacterEntryPanel 
								open: menuItem
								label: (menuItem name asString) ::
								morphPosition: morph positionInWorld 
												+ morph extentInOwner; fitInWorld
						]).
	props at: #acceptsNumber put: (MetaProperty kind: Number).
	props at: #acceptsColor 
		    put: (MetaProperty 
				kind: Color
				editProc: [ :morph :metaProp :menuItem |
					| origColor |
					origColor := menuItem propertyValue.
					Color colorSelectionMenu: origColor 
						    updateProc: [: aColor |
								menuItem propertyValue: aColor ].
					] ).
	props at: #acceptsPoint 
		    put: (MetaProperty 
				kind: Point
				editProc: [ :morph :metaProp :menuItem | 
						PointEntryPanel 
								open: menuItem 
								label: (menuItem name asString) ::
								morphPosition: morph positionInWorld 
												+ morph extentInOwner; fitInWorld ]).
	props at: #acceptsRectangle put: (MetaProperty kind: Rectangle).
	props at: #acceptsBoolean put: (MetaProperty kind: Boolean).
	props at: #acceptsMorph put: (MetaProperty kind: Morph).
	props at: #acceptsNil put: (MetaProperty kind: UndefinedObject).
	props at: #acceptsClass put: (MetaProperty kind: Class).
	props at: #acceptsInteger put: (MetaProperty kind: Integer).
	props at: #acceptsFraction put: (MetaProperty kind: Fraction ).
	props at: #acceptsFloat put: (MetaProperty kind: Float).
	props at: #acceptsCollection put: (MetaProperty kind: Collection ).
	props at: #acceptsArray put: (MetaProperty kind: Array ).
	props at: #acceptsDictionary put: (MetaProperty kind: Dictionary).
	props at: #acceptsFileEntry put: (MetaProperty kind: FileEntry ).
	props at: #acceptsText put: (MetaProperty kind: Text).
	props at: #acceptsFont 
		    put: (MetaProperty 
				kind: AbstractFont
				editProc: [ :morph :metaProp :menuItem |
					| oldFont fontFamily fontSize newFont |
					oldFont := menuItem propertyValue.
					fontSize := oldFont pointSize.
					fontFamily := FontFamily promptUser. 
					fontSize := FontFamily promptUserForSize: fontSize fontFamily: fontFamily.
					newFont := fontFamily atPointSize: fontSize.
					newFont ifNotNil: [ :f | menuItem propertyValue: f. morph redrawNeeded ] ]  ).
	props at: #acceptsForm put: (MetaProperty kind: Form).
	props at: #acceptsLocation put: (MetaProperty kind: Point).
	props at: #acceptsLayoutSpec 
			put: (MetaProperty 
					kind: LayoutSpec
					editProc: [ :morph :metaProp :menuItem | 
								 morph editMyLayoutSpec ] ).
	props at: #acceptsLabelMorph put: (MetaProperty kind: LabelMorph).

	self allSubclassesDo: [ :subclass | subclass addPredefinedMetaProperties ].
	
	! !

!MetaProperty class methodsFor: 'instance creation' stamp: 'KenD 4/Dec/2016, 9:24:00 pm (UTC)'!
kind: aClass

	^ self new kind: aClass! !

!MetaProperty class methodsFor: 'instance creation' stamp: 'KenD 14/Dec/2016, 5:46:00 pm (UTC)'!
kind: aClass editProc: aClosure

	^ self new kind: aClass editProc: aClosure! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 5/Dec/2016, 2:39:00 pm (UTC)'!
metaPropNamed: metaPropName

	^ PreDefinedPropsDict at: metaPropName ifAbsent: [ nil ]
	! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 25/Jan/2026, 9:41:07 pm (UTC)'!
metaPropsForMorph: aMorph
	"Answer a combined Dictionary of name->metaProp by collecting all inherited MetaProps"
	
	| morphSupers metaPropDict |
	morphSupers := aMorph class allSuperclasses.
	metaPropDict := OrderedDictionary new.
	"Elide {Morph. Object. ProtoObject}"
	(morphSupers copyFrom: 1 to: (morphSupers size - 3)) reverseDo: 
		[ :aSuper | aSuper addLocalMetaPropsTo: metaPropDict ].
	aMorph class addLocalMetaPropsTo: metaPropDict.
	(aMorph owner is:#LayoutMorph) ifFalse: [metaPropDict removeKey: #layoutSpec ifAbsent:nil].
	
	^ metaPropDict! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 14/Dec/2016, 9:09:00 pm (UTC)'!
preDefinedPropsDict

	^ PreDefinedPropsDict ! !

!MetaProperty class methodsFor: 'documentation' stamp: 'KenD 28/Jan/2026, 8:07:33 pm (UTC)'!
whyMe

^
'
The basic idea here is to allow authors of Morph classes to attach MetaProperties so that a Morph''s visual instance variables and properties show up in a Morph''s Menu.  

To remove walls, a morph''s visual properties  can be updated by Click (fill-in/select/edit) 
or DragNDrop for example from a Color, Font or some other Palette or selected from a menu select list.

Note that these visual properties may be virtual.  The idea being that changing a property value may store a value into an instance variable, a #property, or invoke a bit of code that does the right thing and maintains some invariant.

MetaProperties are immutable and may be shared.  They are associated with Morph classes and are inherited by Morph subclasses.
'! !

!MetaProperty class methodsFor: 'testing' stamp: 'KenD 14/Aug/2022, 8:33:00 pm (UTC)'!
classTestFor: aClass
	"Answer a predicate test for class, 
	 where Symbol and UnicodeSymbol use #isSymbol
	 so that either kind of Symbol is OK."
	(`{Symbol. UnicodeSymbol.}` includes: aClass) 
		ifTrue:  [ ^[ :elt | elt isSymbol ] ]
		ifFalse: [ ^[ :elt | elt isKindOf: aClass ] ]
	
	! !

!MetaPropertyFrom methodsFor: 'testing' stamp: 'KenD 4/Dec/2016, 9:57:00 pm (UTC)'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ minValue <= newValue ]! !

!MetaPropertyFrom methodsFor: 'initialization' stamp: 'KenD 4/Dec/2016, 9:58:00 pm (UTC)'!
kind: aClass minValue: min

	super kind: aClass.
	(min  isKindOf: aClass) ifFalse: [ self error: 'minValue must be aKindOf: ',  aClass printString ].
	minValue := min.! !

!MetaPropertyFrom methodsFor: 'accessing' stamp: 'KenD 4/Dec/2016, 9:56:00 pm (UTC)'!
minValue

	^ minValue! !

!MetaPropertyFrom methodsFor: 'accessing' stamp: 'KenD 22/Dec/2016, 10:52:00 pm (UTC)'!
minValue: aValue

	minValue := aValue ! !

!MetaPropertyFrom class methodsFor: 'class initialization' stamp: 'KenD 28/Jan/2026, 8:10:36 pm (UTC)'!
addPredefinedMetaProperties
	"Add typical usages to dictionary for sharing."
"
	MetaPropertyFrom addToInitialDictionaries.
"
	| props |
	props := self preDefinedPropsDict.

	props at: #acceptsPositivePoint     
		put: (MetaPropertyFrom 
			  kind: Point 
			  minValue: 0@0
			  editProc: [ :morph :metaProp :menuItem | 
						PointEntryPanel 
								open: menuItem
								label: (menuItem name asString) ::
								morphPosition: morph positionInWorld 
												+ morph extentInOwner
								; fitInWorld ]).
	props at: #acceptsPositiveNumber 
		  put: (MetaPropertyFrom 
				kind: Number 
				minValue: 0
				editProc: [ :morph :metaProp :menuItem | 
					PositiveFloatEntryPanel
						open: menuItem
						label: (menuItem name asString) ::
						morphPosition: morph positionInWorld 
											+ morph extentInOwner;
						fitInWorld ]).
	props at: #acceptsPositiveInteger
		    put: (MetaPropertyFrom 
					kind: Integer 
					minValue: 0
					editProc: [ :morph :metaProp :menuItem | 
						PositiveIntegerEntryPanel 
								open: menuItem
								label: (menuItem name asString) ::
								morphPosition: morph positionInWorld 
												+ morph extentInOwner;
								fitInWorld ]).
	! !

!MetaPropertyFrom class methodsFor: 'class initialization' stamp: 'KenD 28/Jan/2026, 8:10:36 pm (UTC)'!
initialize

	self preDefinedPropsDict ifNil: [ PreDefinedPropsDict := IdentityDictionary new].
	self addPredefinedMetaProperties.! !

!MetaPropertyFrom class methodsFor: 'instance creation' stamp: 'KenD 4/Dec/2016, 9:59:00 pm (UTC)'!
kind: aClass minValue: min

	^ self new kind: aClass minValue: min! !

!MetaPropertyFrom class methodsFor: 'instance creation' stamp: 'KenD 22/Dec/2016, 10:53:00 pm (UTC)'!
kind: aClass minValue: min editProc: editProc

	^ self new kind: aClass editProc: editProc :: minValue: min! !

!MetaPropertyFrom class methodsFor: 'instance creation' stamp: 'KenD 4/Dec/2016, 9:59:00 pm (UTC)'!
minValue: min

	^ self new kind: Object minValue: min! !

!MetaPropertyOneOf methodsFor: 'testing' stamp: 'KenD 4/Dec/2016, 9:29:00 pm (UTC)'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ choiceCollection includes: newValue ]! !

!MetaPropertyOneOf methodsFor: 'accessing' stamp: 'KenD 4/Dec/2016, 9:34:00 pm (UTC)'!
choices

	^ choiceCollection! !

!MetaPropertyOneOf methodsFor: 'editing' stamp: 'KenD 24/Dec/2016, 10:59:00 pm (UTC)'!
edit: myMorph menuItem: item

	| menu selectIndex |
	menu := PopUpMenu labelArray: (self choices collect: [ :elt | elt printString]).
	selectIndex := menu startUpWithCaption: 'Set ', item name asString, ' to:'.
	item propertyValue: ( self choices at: selectIndex ). 
	myMorph redrawNeeded.! !

!MetaPropertyOneOf methodsFor: 'initialization' stamp: 'Install-Morphic-MetaProperties 14/Aug/2022, 8:17:00 pm (UTC)'!
kind: aClass choices: aCollection
	| classTest |
	super kind: aClass.
	classTest := MetaProperty classTestFor: aClass.
	(aCollection isCollection)
		ifFalse: [ self error: 'Expected a collection of value choices: ', aCollection printString ].
		
	(aCollection allSatisfy: classTest)
		ifFalse: [ self error: 'Expected collection of ', aClass printString,' got: ', aCollection printString ].
	
	choiceCollection := aCollection.
! !

!MetaPropertyOneOf class methodsFor: 'testing' stamp: 'KenD 18/Dec/2016, 4:49:00 pm (UTC)'!
accepts: newValue

	(newValue isKindOf: Integer)
	ifTrue: [
		self notYetImplemented 
	].
	
	(newValue isKindOf: String)
	ifTrue: [
		self notYetImplemented 
	].
	
	"test decodeProc"! !

!MetaPropertyOneOf class methodsFor: 'class initialization' stamp: 'KenD 28/Jan/2026, 8:10:36 pm (UTC)'!
addPredefinedMetaProperties
	"Add typical usages to dictionary for sharing."
"
	MetaPropertyOneOf addToInitialDictionaries.
"
	| props |
	props := self preDefinedPropsDict.
	
	props at: #acceptsBoolean       put: (MetaPropertyOneOf kind: Boolean choices: #(true false)).
	props at: #acceptsBorderStyle put: (MetaPropertyOneOf kind: CharacterSequence choices: #(inset raised simple)).
	props at: #acceptsAlignment 
		  put: (MetaPropertyOneOf kind: CharacterSequence 
									choices: #(leftFlush rightFlush centered justified)).
	props at: #acceptsButtonStyle
		  put: (MetaPropertyOneOf kind: Symbol 	
									choices: #(none theme round  rectangular)).
! !

!MetaPropertyOneOf class methodsFor: 'class initialization' stamp: 'KenD 28/Jan/2026, 8:10:36 pm (UTC)'!
initialize

	self addPredefinedMetaProperties.! !

!MetaPropertyOneOf class methodsFor: 'instance creation' stamp: 'KenD 4/Dec/2016, 9:40:00 pm (UTC)'!
choices: aCollection

	^ self new kind: Object choices: aCollection! !

!MetaPropertyOneOf class methodsFor: 'instance creation' stamp: 'KenD 4/Dec/2016, 9:30:00 pm (UTC)'!
kind: aClass choices: aCollection

	^ self new kind: aClass choices: aCollection! !

!MetaPropertyMultiSelect methodsFor: 'testing' stamp: 'KenD 9/Feb/2022, 2:14:00 pm (UTC)'!
accepts: newValue

	| encoding  |
	((super accepts: newValue)
		or: [self encodingInRange: newValue])
		ifTrue: [ ^ true ]. "single choice or already encoded"
	
	"test via decodeProc"
	[ 
		encoding := encodeProc value: newValue.
		^ self encodingInRange: encoding 
	]
	on: Error do: [ ^ false ]! !

!MetaPropertyMultiSelect methodsFor: 'testing' stamp: 'KenD 18/Dec/2016, 7:54:00 pm (UTC)'!
encodingInRange: encoded

	(encoded isKindOf: Integer)
		ifTrue: [  "Already encoded"
			^ ((0 <= encoded)
				and: [ encoded <= maxValue ])
		]
		ifFalse: [ ^ false ]! !

!MetaPropertyMultiSelect methodsFor: 'accessing' stamp: 'KenD 18/Dec/2016, 10:10:00 pm (UTC)'!
decodeProc
	"Answer a closure which takes an integer and answers a string"

	^ decodeProc ! !

!MetaPropertyMultiSelect methodsFor: 'accessing' stamp: 'KenD 18/Dec/2016, 10:09:00 pm (UTC)'!
encodeProc
	"Answer a closure which takes a value and encodes it into an integer"

	^ encodeProc ! !

!MetaPropertyMultiSelect methodsFor: 'editing' stamp: 'KenD 9/Feb/2022, 9:36:00 pm (UTC)'!
edit: myMorph menuItem: item

	| menu encodedResult |
	menu := (MultiSelectMenu 
					choices: choiceCollection
					seed: (self encodeProc value: item propertyValue)
					title: item name asString).
	encodedResult := menu invokeModal.
	item propertyValue: encodedResult. 
	myMorph redrawNeeded.! !

!MetaPropertyMultiSelect methodsFor: 'initialization' stamp: 'KenD 9/Dec/2022, 8:21:00 pm (UTC)'!
multiChoiceFrom: aCollection encodeProc: encoder decodeProc: decoder

	self multiChoiceFrom: aCollection kind: Object encodeProc: encoder decodeProc: decoder

! !

!MetaPropertyMultiSelect methodsFor: 'initialization' stamp: 'KenD 9/Feb/2022, 2:25:00 pm (UTC)'!
multiChoiceFrom: aCollection kind: aClass encodeProc: encoder decodeProc: decoder

	super kind: aClass choices: aCollection.
	encodeProc := encoder.
	decodeProc := decoder.
	maxValue := (1 bitShift: (aCollection size)) - 1. "bitMask"
	
	((encoder isKindOf: BlockClosure) and: [ encoder numArgs = 1 ])
		ifFalse: [ self error: 'Encoder should be a closure of 1 argument: ', encoder printString ].
	((decoder isKindOf: BlockClosure) and: [ decoder numArgs = 1 ])
		ifFalse: [ self error: 'Decoder should be a closure of 1 argument: ', decoder printString ].

! !

!MetaPropertyMultiSelect class methodsFor: 'class initialization' stamp: 'KenD 28/Jan/2026, 8:10:36 pm (UTC)'!
addPredefinedMetaProperties
	"Add typical usages to dictionary for sharing."
"
	MetaPropertyMultiSelect addToInitialDictionaries.
"
	| props |
	props := self preDefinedPropsDict.
	
	props  at: #acceptsEmphasis 
			put: (MetaPropertyMultiSelect 
				multiChoiceFrom: TextEmphasis choices 
				kind: CharacterSequence
				encodeProc:
				 [ :intOrString |
					(intOrString isKindOf: Integer) 
						ifTrue: [ intOrString ]
						ifFalse: [ (intOrString isKindOf: CharacterSequence ) 
									ifTrue:  [ TextEmphasis codeForChoice: intOrString ]
									ifFalse: [ 0 ]
								]
				]
				decodeProc: [ :encoded | 
					TextEmphasis stringForCode: ((encoded isKindOf: Integer) 
								ifTrue:[encoded]  ifFalse:[0])
				]
				).! !

!MetaPropertyMultiSelect class methodsFor: 'instance creation' stamp: 'KenD 18/Dec/2016, 4:13:00 pm (UTC)'!
multiChoiceFrom: aCollection encodeProc: encoder decodeProc: decoder

	^ self new multiChoiceFrom: aCollection encodeProc: encoder decodeProc: decoder! !

!MetaPropertyMultiSelect class methodsFor: 'instance creation' stamp: 'KenD 9/Feb/2022, 2:24:00 pm (UTC)'!
multiChoiceFrom: aCollection kind: aClass encodeProc: encoder decodeProc: decoder

	^ self new multiChoiceFrom: aCollection kind: aClass encodeProc: encoder decodeProc: decoder! !

!MetaPropertyRange methodsFor: 'testing' stamp: 'KenD 4/Dec/2016, 9:43:00 pm (UTC)'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ minValue <= newValue ]
			and: [ newValue <= maxValue ]! !

!MetaPropertyRange methodsFor: 'initialization' stamp: 'KenD 4/Dec/2016, 9:45:00 pm (UTC)'!
kind: aClass minValue: min maxValue: max

	super kind: aClass.
	(min  isKindOf: aClass) ifFalse: [ self error: 'minValue must be aKindOf: ',  aClass printString ].
	(max isKindOf: aClass) ifFalse: [ self error: 'maxValue must be aKindOf: ', aClass printString ].
	minValue := min.
	maxValue := max.! !

!MetaPropertyRange methodsFor: 'accessing' stamp: 'KenD 4/Dec/2016, 9:42:00 pm (UTC)'!
maxValue

	^ maxValue! !

!MetaPropertyRange methodsFor: 'accessing' stamp: 'KenD 4/Dec/2016, 9:42:00 pm (UTC)'!
minValue

	^ minValue! !

!MetaPropertyRange class methodsFor: 'instance creation' stamp: 'KenD 4/Dec/2016, 9:41:00 pm (UTC)'!
kind: aClass minValue: min maxValue: max

	^ self new kind: aClass minValue: min maxValue: max! !

!MetaPropertyRange class methodsFor: 'instance creation' stamp: 'KenD 4/Dec/2016, 9:41:00 pm (UTC)'!
minValue: min maxValue: max

	^ self new kind: Object minValue: min maxValue: max! !

!MetaPropertyTransducer methodsFor: 'testing' stamp: 'KenD 23/Dec/2016, 3:16:00 am (UTC)'!
accepts: newValue

	^ (self kinds anySatisfy: [ :class | newValue isKindOf: class ])! !

!MetaPropertyTransducer methodsFor: 'accessing' stamp: 'KenD 23/Dec/2016, 2:58:00 am (UTC)'!
decodeProc
	"Emulate multiselect protocol"
	^ [ :value | value ] "identity/pass-through"! !

!MetaPropertyTransducer methodsFor: 'accessing' stamp: 'KenD 23/Dec/2016, 2:58:00 am (UTC)'!
encodeProc
	"Emulate multiselect protocol"
	^ transformProc ! !

!MetaPropertyTransducer methodsFor: 'accessing' stamp: 'KenD 23/Dec/2016, 2:37:00 am (UTC)'!
kinds

	^ kinds! !

!MetaPropertyTransducer methodsFor: 'accessing' stamp: 'KenD 23/Dec/2016, 2:37:00 am (UTC)'!
transformProc

	^ transformProc ! !

!MetaPropertyTransducer methodsFor: 'initialization' stamp: 'KenD 23/Dec/2016, 2:43:00 am (UTC)'!
kinds: classCollection transformProc: aClosure

	(classCollection allSatisfy: [ :c | c isKindOf: Class ])
		ifFalse: [ self error: 'Expected a collection of classes: ', classCollection printString ].
	
	(aClosure isKindOf: BlockClosure)
		ifFalse:  [ self error: 'Expected a closure for transforming a value: ', aClosure printString ].
	(aClosure numArgs = 1)
		ifFalse: [ self error: 'Expected a closure for transforming a value: ', aClosure printString ].
	transformProc := aClosure.
	kinds := classCollection.! !

!MetaPropertyTransducer class methodsFor: 'class initialization' stamp: 'KenD 28/Jan/2026, 8:10:36 pm (UTC)'!
addPredefinedMetaProperties
	"Add typical usages to dictionary for sharing."
"
	MetaPropertyTransducer addToInitialDictionaries.
"
	| props |
	props := self preDefinedPropsDict.

	"Override"
	props at: #acceptsMorph
		    put: (MetaPropertyTransducer 
					kinds: { Morph. Form. String. } 
					transformProc: [ :newVal |
						(newVal isKindOf: Morph)
						ifTrue: [ newVal ]
						ifFalse: [ (newVal isKindOf: String)
							ifTrue: [ LabelMorph contents: newVal ]
							ifFalse: [ (newVal isKindOf: Form)
								ifTrue:  [ ImageMorph new image: newVal ]
								ifFalse: [ self error: 'Expected a Morph/Form/String got: ',
										newVal printString ].
							]
						]
					]
				).

! !

!MetaPropertyTransducer class methodsFor: 'instance creation' stamp: 'KenD 23/Dec/2016, 2:44:00 am (UTC)'!
kinds: classCollection transformProc: aClosure

	^ self new kinds: classCollection transformProc: aClosure! !

!MetaPropertyViaTest methodsFor: 'testing' stamp: 'KenD 4/Dec/2016, 10:19:00 pm (UTC)'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ testClosure value: newValue ]! !

!MetaPropertyViaTest methodsFor: 'initialization' stamp: 'KenD 4/Dec/2016, 10:18:00 pm (UTC)'!
kind: aClass test: aClosure

	super kind: aClass.
	(aClosure isKindOf: BlockClosure) 
		ifFalse: [ self error: 'Expected a BlockClosure: ', aClosure printString ].
	(aClosure argumentCount = 1) 
		ifFalse: [ self error: 'Test should take one argument and answer a boolean: ',
					aClosure printString ].
	testClosure := aClosure.! !

!MetaPropertyViaTest methodsFor: 'accessing' stamp: 'KenD 4/Dec/2016, 10:18:00 pm (UTC)'!
test

	^ testClosure! !

!MetaPropertyViaTest methodsFor: 'accessing' stamp: 'KenD 4/Dec/2016, 10:18:00 pm (UTC)'!
testClosure

	^ testClosure! !

!MetaPropertyViaTest class methodsFor: 'class initialization' stamp: 'KenD 28/Jan/2026, 8:11:33 pm (UTC)'!
addPredefinedMetaProperties
	"Add typical usages to dictionary for sharing."
"
	MetaPropertyViaTest addPredefinedMetaProperties.
"
"
	| props |
	props := self preDefinedPropsDict.
"! !

!MetaPropertyViaTest class methodsFor: 'instance creation' stamp: 'KenD 4/Dec/2016, 10:21:00 pm (UTC)'!
kind: aClass test: aClosure

	^ self new kind: aClass test: aClosure! !

!MetaPropertyViaTest class methodsFor: 'instance creation' stamp: 'KenD 4/Dec/2016, 10:21:00 pm (UTC)'!
test: aClosure

	^ self new kind: Object test: aClosure! !

!ProtoObject methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:11:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem blankIcon! !

!Object methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:10:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem objectIcon ! !

!Object methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:10:00 pm (UTC)'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ SignMorph forObject: self
! !

!Form methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:47:00 pm (UTC)'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ ImageMorph new image: self
! !

!AbstractFont methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:35:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem fontIcon ! !

!AbstractFont methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:35:00 pm (UTC)'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ FontMorph font: self
! !

!Timespan methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:14:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem chronIcon ! !

!Collection methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:39:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem collectionIcon ! !

!CharacterSequence methodsFor: '*ui-metaproperties' stamp: 'KenD 9/Dec/2022, 8:06:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem stringIcon ! !

!Symbol methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:13:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem symbolIcon ! !

!UnicodeSymbol methodsFor: '*ui-metaproperties' stamp: 'KenD 9/Dec/2022, 8:07:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem symbolIcon ! !

!Stream methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:12:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem streamIcon ! !

!BlockClosure methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:37:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem closureIcon ! !

!Boolean methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:38:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem booleanIcon ! !

!False methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:44:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem falseIcon ! !

!True methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:45:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem trueIcon ! !

!Magnitude methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:06:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem integerIcon ! !

!Time methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:14:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem chronIcon ! !

!Float methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:47:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem floatIcon ! !

!Fraction methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:48:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem fractionIcon ! !

!Integer methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:01:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem integerIcon ! !

!Color methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:40:00 pm (UTC)'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ DropColorMorph fromColor: self! !

!UndefinedObject methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:15:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem nilIcon ! !

!Character methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:38:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem charIcon ! !

!Point methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:11:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem pointIcon ! !

!Morph methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 9:38:58 pm (UTC)'!
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"Add morph-specific items to the given menu which was invoked by the given hand.  This method provides is invoked both from the halo-menu and from the control-menu regimes."

	(Smalltalk includesKey: #MetaProperty)
		ifTrue: [ aCustomMenu addVisualProperties;
				addLine;
				add: 'show my morph''s halo' action: #addHalo; 
				add: 'Save me as a Package' action: #saveAsPackage
		]
		ifFalse: [ aCustomMenu  addLine;
				 add: 'edit my layoutSpec' action: #editMyLayoutSpec
		]! !

!Morph methodsFor: '*ui-metaproperties' stamp: 'KenD 6/Mar/2022, 2:52:00 pm (UTC)'!
messageWindow

	^ MorphMessageBox openForMorph: self! !

!Morph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:09:00 pm (UTC)'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ (self world == self)
		ifTrue: [ SignMorph forObject: self ] "World"
		ifFalse: [ self ]
	
	
! !

!Morph methodsFor: '*ui-metaproperties' stamp: 'KenD 6/Mar/2022, 2:52:00 pm (UTC)'!
nameForWorkspace
	"Answer a name suitable for a Workspace variable"
	| displayName |
	displayName := self name.
	^ displayName 
		ifNotNil: [ | name |
			name := displayName asIdentifier: false.
			(name size < 1)
			ifTrue: [ self class name asLowercase , self identityHash asString ]
			ifFalse: [ name at: 1 put:  (name at: 1) asLowercase. name ]
		] 
		ifNil: [ self class name asLowercase , self identityHash asString ]! !

!Morph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:09:00 pm (UTC)'!
propertiesDict
	"Private - could export a #propertiesDo: method"

	^ properties ! !

!Morph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:09:00 pm (UTC)'!
valueWhenDropped
	"Subclasses which wrap values should override (e.g. SignMorph, DropColorMorph)"
	
	^ self copy! !

!Morph class methodsFor: '*ui-metaproperties' stamp: 'KenD 26/Jan/2026, 6:54:51 pm (UTC)'!
addLocalMetaPropsTo: aDict

	"Used by any Morph with Visual MetaProperties.
	 Note that MetaProperties are immutable and 
	typically shared via 
		MetaProperty class>preDefinedPropsDict
	 Note also MetaProperty>>metaProps ForMorph: "
	
	^ aDict ifNotNil: [aDict] ifNil: [Dictionary new] "Base Case"! !

!PlacedMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:06:24 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #layoutSpec   put: (predefinedPropsDict at: #acceptsLayoutSpec). 
	aDict at: #morphPosition put: (predefinedPropsDict at: #acceptsPoint). 
	aDict! !

!BoxMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:07:13 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #morphExtent   put: (predefinedPropsDict at: #acceptsPositivePoint). 
	aDict! !

!ColoredBoxMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:07:42 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #color   put: (predefinedPropsDict at: #acceptsColor). 
	aDict! !

!BorderedBoxMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:08:05 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #borderColor  put: (predefinedPropsDict at: #acceptsColor). 
	aDict at: #borderWidth put: (predefinedPropsDict at: #acceptsPositiveNumber).
	aDict at: #padding        put: (predefinedPropsDict at: #acceptsPoint). 
	aDict! !

!LayoutMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:44:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem layoutIcon ! !

!LinearLayoutMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:08:53 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #gap   put: (predefinedPropsDict at: #acceptsPositiveInteger). 
	aDict! !

!WindowTitleMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 9:03:25 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #titleString   put: (predefinedPropsDict at: #acceptsString). 
	aDict! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:06:00 pm (UTC)'!
aboutToGrab: aMorph
	"submorph is being grabbed by a hand.
	Perform necessary adjustments (if any) and return the actual morph
	that should be added to the hand.
	Answer nil to reject the drag."
"
	Transcript show: 'MenuMorph aboutToGrab: ', aMorph printString ; newLine.
"
	| valueToDrag |
	(aMorph isKindOf: VisualPropertyMenuItem)
		ifTrue: [ valueToDrag := aMorph propertyValue copy ].
	(aMorph isKindOf: OrdinaryPropertyMenuItem)
		ifTrue: [ valueToDrag := aMorph value copy ].
	
	valueToDrag isNil
	ifTrue:  [^ self ] "Title selected. User wants to move me. Pick me up"
	ifFalse: [ ^ valueToDrag morphForDrag ]
! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 9:29:11 pm (UTC)'!
addVisualProperties

	| theMorphOfInterest morphMetaPropDict |
	theMorphOfInterest := self targetMorph.
	morphMetaPropDict := MetaProperty metaPropsForMorph: theMorphOfInterest.
	
	self setProperty: #metaProps 
		 toValue: morphMetaPropDict.
		
	morphMetaPropDict keysAndValuesDo: [ :aName :aMetaProp | 
		[ | menuItem |
			menuItem := VisualPropertyMenuItem 
						propName:  aName 
						morph: theMorphOfInterest 
						propMeta: aMetaProp.

			menuItem  target: menuItem
					  selector: #edit
					  arguments: nil.
					
			self addMorphBack: menuItem
		] value
	].
	"#propertyChanged triggered by #propertyValue:"
	theMorphOfInterest when: #propertyChanged send: #refreshView to: self. 
	! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:06:00 pm (UTC)'!
allowsSubmorphDrag
	"Answer whether our morphs can just be grabbed with the hand, instead of requiring the use of the halo. Redefined to answer true."

	^ true! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:07:00 pm (UTC)'!
edit: propName
"
	Remove
	Rename
	Edit Value
	Reset  to old Value
	Cancel
"
	"@@@FIXME: NYI @@@"
	(HoverHelpMorph contents: 'Need editor for ' , propName asString)
		popUpForHand: self targetMorph world activeHand! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:07:00 pm (UTC)'!
fontPreferenceChanged

	super fontPreferenceChanged.
	self refreshView.! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:07:00 pm (UTC)'!
metaPropNames
	"Answer an alpha-sorted collection of MetaProperty names"

	| metaPropNames |
	metaPropNames := SortedCollection sortBlock: [ :sym1 :sym2 | sym1 < sym2 ].
	self metaProps keysDo: [ :mpName |  metaPropNames add: mpName ].

	^ metaPropNames ! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:07:00 pm (UTC)'!
metaProps

	^ self valueOfProperty: #metaProps ifAbsent: [ Dictionary new ].! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:07:00 pm (UTC)'!
morphSelectorProperties
	"Answer a collection of names of properties accessed via selector"

	^ #(morphPosition morphExtent)! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:07:00 pm (UTC)'!
refreshView "of visual properties"

	self items do: [ :item |
		(item is: #VisualPropertyMenuItem)
			ifTrue: [ item redrawNeeded ]
	]
! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 15/Sep/2024, 3:05:00 pm (UTC)'!
showTargetHalo
	"Show my targetMorph's halo"
	| aMorph |
	aMorph := self targetMorph.
	aMorph isInWorld 
		ifTrue: [ aMorph show; addHalo. aMorph runningWorld activeHand releaseMouseFocus ]
		ifFalse: [
"			(HoverHelpMorph 
			contents: aMorph printString , ' not shown in world')
				popUpForHand: self  world activeHand
"			aMorph openInWorld; 
				show;
				morphPosition: 200@100;
				addHalo   
		]! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:07:00 pm (UTC)'!
targetMorph
	"My defaultTarget is the morph of interest"
	
	^ defaultTarget! !

!MenuMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:07:00 pm (UTC)'!
valueWhenDropped

	^nil! !

!ImageMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:45:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem imageIcon ! !

!ImageMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Oct/2026, 7:34:58 pm (UTC)'!
image

	^ self imageForm! !

!ImageMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Oct/2026, 7:35:48 pm (UTC)'!
valueWhenDropped
	"Answer my form (image)"
	
	^ self imageForm! !

!ImageMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:09:38 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #image   put: (predefinedPropsDict at: #acceptsForm). 
	aDict! !

!LabelMorph methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:03:00 pm (UTC)'!
emphasis

	^ emphasis! !

!LabelMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:10:08 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #contents put: (predefinedPropsDict at: #acceptsString).
	aDict at: #font 	      put: (predefinedPropsDict at: #acceptsFont).
	aDict at: #emphasis put: (predefinedPropsDict at: #acceptsEmphasis). 
	aDict! !

!PluggableButtonMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:10:48 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #label put: (predefinedPropsDict at: #acceptsString).
	aDict at: #font 	put: (predefinedPropsDict at: #acceptsFont).
	aDict at: #icon   put: (predefinedPropsDict at: #acceptsForm). 
	aDict at: #iconName   put: (predefinedPropsDict at: #acceptsSymbol).
	aDict at: #iconDrawSelector put: (predefinedPropsDict at: #acceptsSymbol).
	aDict at: #buttonStyle put:  (predefinedPropsDict at: #acceptsButtonStyle).
	aDict! !

!SystemWindow methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:13:00 pm (UTC)'!
labelString

	^ self label! !

!SystemWindow methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:13:00 pm (UTC)'!
labelString: aString

	self setLabel: aString! !

!SystemWindow class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 9:06:23 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #labelString put: (predefinedPropsDict at: #acceptsString).
	aDict! !

!Panel methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:10:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem windowIcon ! !

!Panel class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 8:05:47 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #widgetsColor put: (predefinedPropsDict at: #acceptsColor). 
	aDict at: #stayUp 		put: (predefinedPropsDict at: #acceptsBoolean). 
	aDict! !

!FrameMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:54:16 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #borderStyle put: (predefinedPropsDict at: #acceptsBorderStyle).
	aDict! !

!FontMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 8:56:51 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #labelMorph put: (predefinedPropsDict at: #acceptsLabelMorph). 
	aDict at: #string 	    put: (predefinedPropsDict at: #acceptsString).
	aDict at: #font 		    put: (predefinedPropsDict at: #acceptsFont).
	aDict at: #emphasis     put: (predefinedPropsDict at: #acceptsEmphasis). 
	aDict! !

!TextEntryMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 9:04:55 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #contents 			put: (predefinedPropsDict at: #acceptsString).
	aDict at: #font 				put: (predefinedPropsDict at: #acceptsFont).
	aDict at: #emphasis 		put: (predefinedPropsDict at: #acceptsEmphasis).
	aDict at: #backgroundColor put: (predefinedPropsDict at: #acceptsColor).
	aDict! !

!LineMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:28:09 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict .
	aDict at: #startPoint put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #endPoint   put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #color 		 put: (predefinedPropsDict at: #acceptsColor). 
	aDict at: #lineWidth put: (predefinedPropsDict at: #acceptsPositiveInteger). 
	aDict! !

!PointerLineMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:58:23 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict .
	aDict at: #endPointMorph  put: (predefinedPropsDict at: #acceptsForm). 
	aDict! !

!ArrowMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 9:49:05 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #tipPoint 
		put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #headLength
		put: (predefinedPropsDict at: #acceptsPositiveNumber). 
	aDict at: #tailLength
		put: (predefinedPropsDict at: #acceptsPositiveNumber). 
	aDict at: #headWingLength
		put: (predefinedPropsDict at: #acceptsPositiveNumber). 
	aDict at: #tailHeight
		put: (predefinedPropsDict at: #acceptsPositiveNumber). 
	aDict at: #borderWidth 
		put: (predefinedPropsDict at: #acceptsPositiveNumber). 
	aDict at: #borderColor 
		put: (predefinedPropsDict at: #acceptsColor). 
	aDict at: #fillColor
		put: (predefinedPropsDict at: #acceptsColor). 
	aDict! !

!BezierQuadraticMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:35:36 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #startPoint 
		put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #endPoint 
		put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #oneControlPoint 
		put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #lineWidth 
		put: (predefinedPropsDict at: #acceptsPositiveNumber). 
	aDict at: #lineColor 
		put: (predefinedPropsDict at: #acceptsColor). 
	aDict! !

!BezierCubicMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:36:38 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #twoControlPoint 
		put: (predefinedPropsDict at: #acceptsPoint).  
	aDict! !

!CircleShapeMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:38:18 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #center 
		put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #radius 
		put: (predefinedPropsDict at: #acceptsPositiveNumber ). 
	aDict at: #lineWidth 
		put: (predefinedPropsDict at: #acceptsPositiveNumber). 
	aDict at: #lineColor 
		put: (predefinedPropsDict at: #acceptsColor). 
	aDict at: #fillColor 
		put: (predefinedPropsDict at: #acceptsColor).  
	aDict! !

!LineShapeMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:40:25 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #startPoint 
		put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #endPoint 
		put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #lineWidth 
		put: (predefinedPropsDict at: #acceptsPositiveNumber). 
	aDict at: #lineColor 
		put: (predefinedPropsDict at: #acceptsColor). 
	aDict! !

!RectangleShapeMorph class methodsFor: '*ui-metaproperties' stamp: 'KenD 25/Jan/2026, 7:44:44 pm (UTC)'!
addLocalMetaPropsTo: aDict

	| predefinedPropsDict |
	predefinedPropsDict := MetaProperty preDefinedPropsDict.
	aDict at: #origin 
		put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #corner
		put: (predefinedPropsDict at: #acceptsPoint). 
	aDict at: #lineWidth 
		put: (predefinedPropsDict at: #acceptsPositiveNumber). 
	aDict at: #lineColor 
		put: (predefinedPropsDict at: #acceptsColor). 
	aDict at: #fillColor
		put: (predefinedPropsDict at: #acceptsColor). 
	aDict! !

!LayoutSpec methodsFor: '*ui-metaproperties' stamp: 'KenD 14/Dec/2021, 7:44:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem layoutIcon ! !

!LayoutSizeSpec methodsFor: '*ui-metaproperties' stamp: 'KenD 27/Jan/2026, 8:31:40 pm (UTC)'!
privateFixedHeight

	^ fixedHeight! !

!LayoutSizeSpec methodsFor: '*ui-metaproperties' stamp: 'KenD 27/Jan/2026, 8:31:48 pm (UTC)'!
privateFixedWidth

	^ fixedWidth! !

!LayoutSizeSpec methodsFor: '*ui-metaproperties' stamp: 'KenD 27/Jan/2026, 8:32:07 pm (UTC)'!
privateProportionalHeight

	^ proportionalHeight! !

!LayoutSizeSpec methodsFor: '*ui-metaproperties' stamp: 'KenD 27/Jan/2026, 8:32:14 pm (UTC)'!
privateProportionalWidth

	^ proportionalWidth ! !

!FileIOAccessor methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:46:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem fileIcon ! !

!FileSystemEntry methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:46:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem fileIcon ! !

!DirectoryEntry methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:41:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem folderIcon ! !

!FileEntry methodsFor: '*ui-metaproperties' stamp: 'KenD 13/Dec/2021, 11:46:00 pm (UTC)'!
icon

	^ VisualPropertyMenuItem fileIcon ! !
VisualPropertyMenuItem initialize!
MetaProperty initialize!
MetaPropertyFrom initialize!
MetaPropertyOneOf initialize!
