'From Cuis 6.0 [latest update: #5093] on 11 March 2022 at 4:16:37 pm'!
'Description MetaProperties describe and define public visual properties of Morphs.  They are used by a PropertyEditor.'!
!provides: 'Morphic-MetaProperties' 1 113!
!requires: 'Cuis-Base' 60 5031 nil!
!requires: 'UI-Edit-Lens' 1 1 nil!
!requires: 'Color-Edit-Panel' 1 3 nil!
!requires: 'Complex' 1 0 nil!
!requires: 'UI-Entry' 1 7 nil!
!requires: 'UI-Click-Select' 1 2 nil!
!requires: 'UI-Panel' 1 17 nil!
!requires: 'Graphics-Files-Additional' 1 18 nil!
SystemOrganization addCategory: 'Morphic-MetaProperties'!


!classDefinition: #VisualPropertyMenuItem category: 'Morphic-MetaProperties'!
UpdatingMenuItemMorph subclass: #VisualPropertyMenuItem
	instanceVariableNames: 'metaProperty name prevValue targetMorph accessProc updateProc'
	classVariableNames: 'BlankIcon BoolIcon CharIcon ChronIcon ClassIcon ClosureIcon CollectIcon CpxIcon FalseIcon FileIcon FloatIcon FolderIcon FontIcon FracIcon GrabLineHorizIcon GrabLineVertIcon ImageIcon IntIcon LayoutIcon NilIcon ObjIcon OneOfIcon PtIcon RngIcon StrIcon StreamIcon SymIcon TargetIcon TrueIcon WindowIcon'
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'VisualPropertyMenuItem class' category: 'Morphic-MetaProperties'!
VisualPropertyMenuItem class
	instanceVariableNames: ''!

!classDefinition: #OrdinaryPropertyMenuItem category: 'Morphic-MetaProperties'!
MenuItemMorph subclass: #OrdinaryPropertyMenuItem
	instanceVariableNames: 'accessKind name targetMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'OrdinaryPropertyMenuItem class' category: 'Morphic-MetaProperties'!
OrdinaryPropertyMenuItem class
	instanceVariableNames: ''!

!classDefinition: #MorphMessageBox category: 'Morphic-MetaProperties'!
WorkspaceWindow subclass: #MorphMessageBox
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'MorphMessageBox class' category: 'Morphic-MetaProperties'!
MorphMessageBox class
	instanceVariableNames: ''!

!classDefinition: #VisualPropertyEditor category: 'Morphic-MetaProperties'!
MenuMorph subclass: #VisualPropertyEditor
	instanceVariableNames: 'targetMorph metaProps showAllIvars showAllProps'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'VisualPropertyEditor class' category: 'Morphic-MetaProperties'!
VisualPropertyEditor class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyTests category: 'Morphic-MetaProperties'!
TestCase subclass: #MetaPropertyTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'MetaPropertyTests class' category: 'Morphic-MetaProperties'!
MetaPropertyTests class
	instanceVariableNames: ''!

!classDefinition: #MetaProperty category: 'Morphic-MetaProperties'!
Object subclass: #MetaProperty
	instanceVariableNames: 'kind editProc'
	classVariableNames: 'MetaPropDict PreDefinedPropsDict'
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'MetaProperty class' category: 'Morphic-MetaProperties'!
MetaProperty class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyFrom category: 'Morphic-MetaProperties'!
MetaProperty subclass: #MetaPropertyFrom
	instanceVariableNames: 'minValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'MetaPropertyFrom class' category: 'Morphic-MetaProperties'!
MetaPropertyFrom class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyOneOf category: 'Morphic-MetaProperties'!
MetaProperty subclass: #MetaPropertyOneOf
	instanceVariableNames: 'choiceCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'MetaPropertyOneOf class' category: 'Morphic-MetaProperties'!
MetaPropertyOneOf class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyMultiSelect category: 'Morphic-MetaProperties'!
MetaPropertyOneOf subclass: #MetaPropertyMultiSelect
	instanceVariableNames: 'maxValue encodeProc decodeProc'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'MetaPropertyMultiSelect class' category: 'Morphic-MetaProperties'!
MetaPropertyMultiSelect class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyRange category: 'Morphic-MetaProperties'!
MetaProperty subclass: #MetaPropertyRange
	instanceVariableNames: 'minValue maxValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'MetaPropertyRange class' category: 'Morphic-MetaProperties'!
MetaPropertyRange class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyTransducer category: 'Morphic-MetaProperties'!
MetaProperty subclass: #MetaPropertyTransducer
	instanceVariableNames: 'kinds transformProc'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'MetaPropertyTransducer class' category: 'Morphic-MetaProperties'!
MetaPropertyTransducer class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyViaTest category: 'Morphic-MetaProperties'!
MetaProperty subclass: #MetaPropertyViaTest
	instanceVariableNames: 'testClosure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-MetaProperties'!
!classDefinition: 'MetaPropertyViaTest class' category: 'Morphic-MetaProperties'!
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

!VisualPropertyEditor commentStamp: '<historical>' prior: 0!
My instances present the public visual properties of Morphs -- those which have MetaProperties.

MetaProperties can be added to any Morph class and all submorph classes will inherit them.

See class MetaProperty and my class #initialize method for details. !

!MetaPropertyTests commentStamp: '<historical>' prior: 0!
Unit tests for MetaProeprties!

!MetaProperty commentStamp: '<historical>' prior: 0!
I am the parent class for Morph meta-properties.  

My instances are immutable and may be shared.  See class side for common MetaProperties.

I maintain MetaPropDict, a dictionary of Class->Dict(name->metaProp).  See #MetaProperty class>>MetapropDictForClass:

Also, there is PreDefinedPropsDict, which contains metaPropName->metaProp for sharing.  These pre-defined MetaProperties are typically added in my class and subclass #initialize methods.
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

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:29:37'!
name

	^ name! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 12/2/2016 16:07:12'!
name

	^ name! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 9/18/2019 16:05:31'!
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

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:29:30'!
metaProperty

	^ metaProperty! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:29:58'!
prevValue

	^ prevValue! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:30:25'!
propertyDescriptor

	^ self metaProperty! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 12/12/2016 14:38:44'!
propertyValue
	"Getter"

	^ accessProc value! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 12/22/2016 16:50:52'!
propertyValue: newValue
	"Setter"

	updateProc value: newValue.
	self update! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:35:46'!
targetMorph

	^ targetMorph ! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 3/3/2022 12:42:26'!
acceptDroppingMorph: aMorph event: evt
	"This message is sent when a morph is dropped onto 
	 a morph that has agreed to accept the dropped morph 
	 by responding 'true' to the wantsDroppedMorph:event: message."
	
	self dropAction: aMorph! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 16:38:00'!
allowsMorphDrop
	"Answer whether we accept dropping morphs. Redefined to answer true."

	^ true! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 3/3/2022 12:45:58'!
processDropMorph: aDropEvent
	"I have already expressed a desire for the drop. Just do it."
	
	| dropedMorph |
	dropedMorph := aDropEvent contents.
	aDropEvent wasHandled: true.
	self propertyValue: dropedMorph valueWhenDropped.
	dropedMorph showAcceptAndDeleteSelf.! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 12/7/2016 14:55:23'!
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

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 3/3/2022 12:18:28'!
wantsDroppedMorph: aMorph event: evt
	"Return true if the receiver wishes to accept the given morph, which is being dropped by a hand in response to the given event. Note that for a successful drop operation both parties need to agree. The symmetric check is done automatically via aMorph wantsToBeDroppedInto: self."

	^ self allowsValue: aMorph valueWhenDropped
	
! !

!VisualPropertyMenuItem methodsFor: 'editing' stamp: 'KenD 12/18/2016 13:05:45'!
edit

	self metaProperty edit: self targetMorph menuItem: self.
	self update ! !

!VisualPropertyMenuItem methodsFor: 'editing' stamp: 'KenD 11/28/2016 16:35:20'!
undo
	"Reset value from remembered value"

	self targetMorph setProperty: self name  toValue: self prevValue! !

!VisualPropertyMenuItem methodsFor: 'events-processing' stamp: 'KenD 4/14/2019 15:27:49'!
update

	self updateContents.
	self targetMorph redrawNeeded.! !

!VisualPropertyMenuItem methodsFor: 'initialization' stamp: 'KenD 3/11/2022 16:14:35'!
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

!VisualPropertyMenuItem methodsFor: 'testing' stamp: 'KenD 11/28/2016 16:37:33'!
allowsValue: aValue

	^ self metaProperty accepts: aValue! !

!VisualPropertyMenuItem methodsFor: 'testing' stamp: 'KenD 4/13/2019 14:30:25'!
is: aSymbol
	^ aSymbol == #VisualPropertyMenuItem or: [ super is: aSymbol ]! !

!VisualPropertyMenuItem methodsFor: 'private' stamp: 'KenD 4/14/2019 16:19:18'!
displayStringForWidth: maxWidth
	"Answer a string which fits in maxwidth"
	|  myString count stringWidth  |
	myString := self displayString.
	(myString size <= 0) ifTrue: [ ^ '' ].
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

!VisualPropertyMenuItem methodsFor: 'private' stamp: 'KenD 4/14/2019 16:12:02'!
updateContents
	"(re)set my content string and icon"

	| myWidth |
	myWidth := self owner ifNil: [60] ifNotNil: [self owner morphWidth - 10 ].
	self morphWidth: myWidth.
	self contents: ( self displayStringForWidth: (myWidth - 20) ). "space for icon + border"
	self setIcon: (self propertyValue icon)! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:29'!
blankIcon

	^BlankIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:35'!
booleanIcon

	^BoolIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:41'!
charIcon

	^CharIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:49'!
chronIcon

	^ChronIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:55'!
classIcon

	^ClassIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:01'!
closureIcon

	^ClosureIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:09'!
collectionIcon

	^CollectIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:15'!
complexIcon

	^CpxIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:22'!
falseIcon

	^FalseIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:28'!
fileIcon

	^FileIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:36'!
floatIcon

	^FloatIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:41'!
folderIcon

	^FolderIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:46'!
fontIcon

	^FontIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:50'!
fractionIcon

	^FracIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 2/3/2022 15:41:06'!
grabLineHorizIcon

	^GrabLineHorizIcon ! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 2/3/2022 15:40:51'!
grabLineVertIcon

	^GrabLineVertIcon ! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 12/14/2021 12:40:25'!
imageIcon

	^ImageIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:56'!
integerIcon

	^IntIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 12/14/2021 12:40:40'!
layoutIcon

	^LayoutIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:02'!
nilIcon

	^NilIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:06'!
objectIcon

	^ObjIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:12'!
oneOfIcon

	^OneOfIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:17'!
pointIcon

	^PtIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:26'!
rangeIcon

	^RngIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:31'!
streamIcon

	^StreamIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:37'!
stringIcon

	^StrIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:43'!
symbolIcon

	^SymIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 1/30/2022 15:19:43'!
targetIcon

	^TargetIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:49'!
trueIcon

	^TrueIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:54'!
windowIcon

	^WindowIcon! !

!VisualPropertyMenuItem class methodsFor: 'class initialization' stamp: 'KenD 2/3/2022 15:44:44'!
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

!VisualPropertyMenuItem class methodsFor: 'class initialization' stamp: 'KenD 12/7/2016 15:07:44'!
propName: aSymbol morph: aMorph

	^ self propName: aSymbol morph: aMorph propMeta: MetaProperty default
! !

!VisualPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 12/12/2016 14:39:37'!
ivarName: aSymbol morph: aMorph propMeta: aPropertyDescriptor
	"Instance Variable based accessor"
	
	^ self 
		propName: aSymbol 
		morph: aMorph 
		propMeta: aPropertyDescriptor 
		accessProc: [ ^ aMorph instVarNamed: aSymbol ] 
		updateProc: [ :newValue | aMorph instVarNamed: aSymbol put: newValue ] ! !

!VisualPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 12/22/2016 19:59:47'!
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

!VisualPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 12/12/2016 14:39:10'!
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

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 5/12/2018 19:45:14'!
icon

	^icon! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 5/12/2018 19:45:42'!
icon: anIcon

	self setIcon: anIcon! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 12/2/2016 16:15:02'!
targetMorph

	^ targetMorph! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 12/2/2016 16:22:54'!
value
	"Answer value of my targetMorph's property or instance variable"

	^ (accessKind = #property)
		ifTrue:  [ targetMorph valueOfProperty: name ]
		ifFalse: [ targetMorph instVarNamed:     name ]! !

!OrdinaryPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 12/11/2016 13:53:49'!
allowsMorphDrop
	"We don't allow editing by Drop, but answer true here to visually reject and delete dropped morph."

	^ true! !

!OrdinaryPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 12/2/2016 16:05:05'!
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

!OrdinaryPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 11/7/2021 14:17:00'!
showReject: aMorph
	"Draw and erase a red X"

	| leftStroke rightStroke mPos mExtent |
	mPos := aMorph morphPositionInWorld.
	mExtent := aMorph morphExtentInOwner.
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
	leftStroke   openInWorld.
	rightStroke openInWorld.
	
	"NB: Keep Morph when rejected"
	leftStroke   addAlarm: #delete after: 400.	
	rightStroke addAlarm: #delete after: 400.
	
	PopUpMenu inform: 'You can''t set this'
	! !

!OrdinaryPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 3/3/2022 12:40:22'!
wantsDroppedMorph: aMorph event: evt
	"Return true if the receiver wishes to accept the given morph, which is being dropped by a hand in response to the given event. Note that for a successful drop operation both parties need to agree. The symmetric check is done automatically via aMorph wantsToBeDroppedInto: self."

"	self showReject: aMorph."
	
	"Rejecting the drop adds aMorph to its old owner at 0@0."
	^ false  "Reject the drop"! !

!OrdinaryPropertyMenuItem methodsFor: 'initialization' stamp: 'KenD 12/2/2016 16:03:28'!
itemForIVar: aName targetMorph: aMorph

	accessKind := #instanceVariable.
	targetMorph := aMorph.
	name := aName.! !

!OrdinaryPropertyMenuItem methodsFor: 'initialization' stamp: 'KenD 12/2/2016 16:02:32'!
itemForProperty: aName targetMorph: aMorph

	accessKind := #property.
	targetMorph := aMorph.
	name := aName.! !

!OrdinaryPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 12/2/2016 16:00:46'!
itemForIVar: aName targetMorph: aMorph

	^self new itemForIVar: aName targetMorph: aMorph! !

!OrdinaryPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 12/2/2016 16:01:01'!
itemForProperty: aName targetMorph: aMorph

	^self new itemForProperty: aName targetMorph: aMorph! !

!MorphMessageBox methodsFor: 'geometry' stamp: 'KenD 3/6/2022 07:55:01'!
boxExtent
	"answer the extent to use in all the buttons. 
	 
	the label height is used to be proportional to the fonts preferences"
	| e |
	e _ Preferences windowTitleFont lineSpacing.
	^e@e! !

!MorphMessageBox methodsFor: 'geometry' stamp: 'KenD 9/30/2016 17:06:54'!
minimumExtent

	^ 700@(self boxExtent y * 2.3)! !

!MorphMessageBox methodsFor: 'initialization' stamp: 'KenD 9/30/2016 15:28:45'!
initialize

	super initialize.
	self morphExtent: self minimumExtent.! !

!MorphMessageBox class methodsFor: 'instance creation' stamp: 'KenD 9/30/2016 16:59:14'!
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

!VisualPropertyEditor methodsFor: 'dropping/grabbing' stamp: 'KenD 4/12/2019 15:45:56'!
aboutToGrab: aMorph
	"submorph is being grabbed by a hand.
	Perform necessary adjustments (if any) and return the actual morph
	that should be added to the hand.
	Answer nil to reject the drag."
"
	Transcript show: 'PropertyEditor aboutToGrab: ', aMorph printString ; newLine.
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

!VisualPropertyEditor methodsFor: 'dropping/grabbing' stamp: 'KenD 12/7/2016 14:47:43'!
allowsSubmorphDrag
	"Answer whether our morphs can just be grabbed with the hand, instead of requiring the use of the halo. Redefined to answer true."

	^ true! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 12/2/2016 19:23:37'!
addIVarsDisplay
	" Add display of IVars to self"
	
	self addLine.
	
	self ivarNames do: [ :ivarName | | iVal displayString propMorph |
		iVal := self targetMorph instVarNamed: ivarName.
		displayString := (ivarName, ': ', iVal printString)
							truncateWithElipsisTo: 40.
		propMorph := 
			OrdinaryPropertyMenuItem 
				itemForIVar: ivarName 
				targetMorph: self targetMorph.
		propMorph contents: displayString.
		propMorph icon:iVal icon.
		self addMorphBack: propMorph
	].

! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 4/12/2019 15:45:57'!
addMetaPropsDisplay
	" Add display of MetaProperty selections to self"

	| myIvarNames myMorph |
	myMorph := self targetMorph.
	myIvarNames := self ivarNames.
	
	self addLine.
	
	self metaPropNames do: [ :name | | propMorph |
		propMorph := 
		((myIvarNames includes: name)
			ifTrue: [
				VisualPropertyMenuItem "@@@Used? Useful?@@"
						ivarName: name 
						morph: myMorph 
						propMeta: (self metaProps at: name)
			]
			ifFalse: [
				VisualPropertyMenuItem 
						propName: name 
						morph: myMorph 
						propMeta: (self metaProps at: name)
			]
		).
		propMorph  target: propMorph
					  selector: #edit
					  arguments: nil.
		self addMorphBack: propMorph
	].
! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 5/12/2018 17:56:47'!
addOperationsDisplay
	"This is a separate method so subclasses can override"

	self add: 'Refresh Me'  
				target: self action: #refreshView;
		 add: 'toggle Instance Variable display' 
				target: self action: #toggleIVarView;
		 add: 'toggle Instance Properties display' 
				target: self action: #toggleOrdinaryPropsView;
		 add: 'show Drop Target for morph' 
				target: self targetMorph action: #showDropTarget.
			
	(self targetMorph isKindOf: LayoutMorph)
		ifTrue: [ 
			self add: 'edit LayoutMorph properties'
				  target: self targetMorph action: #editMe
		].

	self
		 add: 'open a Message Window for morph' 
			target: self targetMorph action: #messageWindow.! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 12/2/2016 19:13:17'!
addOrdinaryPropertiesDisplay
	" Add display of ordinary properties to self"
	
	self addLine.
	
	self propertyNames do: [ :propName | | propValue displayString propMorph |
		propValue := self targetMorph valueOfProperty: propName.
		displayString :=  (propName, ': ', (propValue printString))
							truncateWithElipsisTo: 40.
		propMorph := 
			OrdinaryPropertyMenuItem 
				itemForProperty: propName 
				targetMorph: self targetMorph.
		propMorph contents: displayString.
		propMorph icon: propValue icon.
		self addMorphBack: propMorph
	].
! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 11/30/2016 14:31:43'!
addPropertiesDisplay

	self notYetImplemented ! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 11/7/2021 14:25:14'!
adjustSubmorphsLayout

	| calculatedExtent |
	super adjustSubmorphsLayout.
	calculatedExtent := self morphExtentInOwner.
	self morphExtent: (calculatedExtent x max: self minItemWidth) @ calculatedExtent y.
	self titleMorph morphExtent: (calculatedExtent x max: self minItemWidth) @ self titleMorph morphHeight.
! !

!VisualPropertyEditor methodsFor: 'initialization' stamp: 'KenD 11/28/2016 18:27:45'!
addTitle: aString

	titleMorph := WindowTitleMorph title: aString  buttonsNamed: #( close collapse showHalo ).
	titleMorph color: Theme current menuTitleBar.
	self addMorphFront: titleMorph.! !

!VisualPropertyEditor methodsFor: 'initialization' stamp: 'KenD 12/22/2016 17:07:55'!
forMorph: aMorph
	"Initialize, but do NOT open this instance"

	targetMorph := aMorph.  "NB: immutable"
	showAllIvars  := false.
	showAllProps := false.
	metaProps := MetaProperty metaPropsForMorph: aMorph.
	targetMorph when: #propertyChanged send: #refreshView to: self. "triggered by #propertyValue:"
	self defaultTarget: self;
		 stayUp: true;
		 refreshView;
	 	 yourself! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 12/12/2016 11:19:20'!
alwaysHiddenIVars
	"Answer a collection of names of ivars never to be shown"

	^ #(properties extent location)! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 19:04:33'!
alwaysHiddenProperties
	"Answer a collection of names of properties never to be shown"

	^ #(morphModifiers)! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 12/12/2016 13:59:01'!
ivarNames
	"Answer an alpha-sorted collection of Instance variable names less MetaProperties"

	| ivarNames neverShown metaPropsDict |
	ivarNames := SortedCollection sortBlock: [ :sym1 :sym2 | sym1 < sym2 ].
	metaPropsDict := self metaProps.
	neverShown     := (self alwaysHiddenIVars) , (self morphSelectorProperties).
	
	self targetMorph class allInstVarNames do: [ :ivarName | 
		(neverShown includes: ivarName)
			ifFalse: [ 
				(metaPropsDict includesKey: ivarName)
					ifFalse:  [ ivarNames add: ivarName ]
			] 
	].

	^ ivarNames ! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 15:04:49'!
metaPropNames
	"Answer an alpha-sorted collection of MetaProperty names"

	| metaPropNames |
	metaPropNames := SortedCollection sortBlock: [ :sym1 :sym2 | sym1 < sym2 ].
	self metaProps keysDo: [ :mpName |  metaPropNames add: mpName ].

	^ metaPropNames ! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:24'!
metaProps

	^ metaProps! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 12/12/2016 11:29:59'!
morphSelectorProperties
	"Answer a collection of names of properties accessed via selector"

	^ #(morphPosition morphExtent)! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 16:30:33'!
propertyNames
	"Answer an alpha-sorted collection of property names less MetaProperties"

	| propNames neverShown metaPropsDict |
	propNames := SortedCollection sortBlock: [ :sym1 :sym2 | sym1 < sym2 ].
	metaPropsDict := self metaProps.
	neverShown     := self alwaysHiddenProperties.
	
	(self targetMorph propertiesDict)
	ifNotNil: [ :dict |
		dict keysDo: [ :propName | 
		(neverShown includes: propName)
			ifFalse: [ 
				(metaPropsDict includesKey: propName)
					ifFalse:  [ propNames add: propName ]
			] 
		]
	].

	^ propNames ! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:39'!
showAllIvars

	^ showAllIvars! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 12/24/2016 17:31:12'!
showAllIvars: aBool

	showAllIvars := aBool.
	self refreshView.! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:53'!
showAllProps

	^ showAllProps! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 12/24/2016 17:30:58'!
showAllProps: aBool

	showAllProps := aBool.
	self refreshView.! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:01'!
targetMorph

	^ targetMorph ! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 15:44:19'!
titleMorph

	^ titleMorph! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 15:33:30'!
toggleShowIVars

	self showAllIvars: (self showAllIvars not)! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 15:33:20'!
toggleShowProps

	self showAllProps: (self showAllProps not)! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 3/18/2019 17:09:50'!
valueWhenDropped

	^nil! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:15:45'!
closeButtonClicked
	"The user clicked on the close-box control in the window title.  For Mac users only, the Mac convention of option-click-on-close-box is obeyed if the mac option key is down."

	Preferences dismissAllOnOptionClose ifTrue:
		[Sensor rawMacOptionKeyPressed ifTrue:
			[^ self world closeUnchangedWindows]].
	self targetMorph removeActionsForEvent: #propertyChanged.
	self delete  "closeBox overrides stayUp"! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:15:54'!
collapseButtonClicked
	
	self collapse
! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:16:16'!
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

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:16:39'!
fontPreferenceChanged

	super fontPreferenceChanged.
	self refreshView.! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/7/2021 14:16:06'!
refreshView

	"Something may have changed.."
	| aMorph |
	aMorph := self targetMorph.
	self removeAllMorphs.
	
	self addTitle: (aMorph printStringLimitedTo: 60).

	self addOperationsDisplay.
	self addMetaPropsDisplay.
	self showAllIvars  ifTrue: [ self addIVarsDisplay ].
	self showAllProps ifTrue: [ self addOrdinaryPropertiesDisplay ].
	
	self titleMorph morphExtent: (self titleMorph morphExtentInOwner x) @ (Preferences windowTitleFont lineSpacing).
	self adjustSubmorphsLayout;
		yourself! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:18:46'!
showHaloButtonClicked
	"Show my targetMorph's halo"
	| aMorph |
	aMorph := self targetMorph.
	aMorph isInWorld 
		ifTrue: [ aMorph show; addHalo ]
		ifFalse: [
"			(HoverHelpMorph 
			contents: aMorph printString , ' not shown in world')
				popUpForHand: self  world activeHand
"			aMorph openInWorld; 
				show;
				morphPosition: 200@100;
				addHalo   
		]! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/30/2016 15:33:47'!
toggleIVarView

	self toggleShowIVars; refreshView! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 12/24/2016 17:30:31'!
toggleOrdinaryPropsView

	self toggleShowProps! !

!VisualPropertyEditor methodsFor: 'geometry' stamp: 'KenD 12/3/2016 12:32:04'!
minItemWidth
	"Answer enough space to contain generous title"

	^ Preferences windowTitleFont widthOfString: '0123456789112345678921234567893'
! !

!VisualPropertyEditor class methodsFor: 'instance creation' stamp: 'KenD 12/24/2016 17:50:21'!
forMorph: aMorph

	aMorph removeHalo.
	^ self new forMorph: aMorph! !

!VisualPropertyEditor class methodsFor: 'new-morph participation' stamp: 'KenD 12/24/2016 15:51:18'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ false! !

!VisualPropertyEditor class methodsFor: 'class initialization' stamp: 'KenD 12/31/2021 13:22:05'!
initialize
"
	VisualPropertyEditor initialize.
"
	"Add typical Morph visual properties to MetaProperty's MetaPropDict"
	
	| classDict propsDict |
	"Ensure named MetaProperties exist"
	MetaProperty initializeDictionaries.

	"Seed MetaProperties for known Morphs"
	propsDict := MetaProperty preDefinedPropsDict.

	classDict := MetaProperty metaPropsDictForClass: PlacedMorph.
	classDict at: #layoutSpec   put: (propsDict at: #acceptsLayoutSpec). 

	classDict := MetaProperty metaPropsDictForClass: BoxedMorph.
	classDict at: #morphExtent   put: (propsDict at: #acceptsPositivePoint). 
	classDict at: #morphPosition put: (propsDict at: #acceptsPoint). 
	classDict at: #color put: (propsDict at: #acceptsColor). 
	classDict at: #borderColor put: (propsDict at: #acceptsColor). 
	classDict at: #borderWidth put: (propsDict at: #acceptsPositiveInteger).
"	classDict at: #borderStyle put: (propsDict at: #acceptsBorderStyle)."
	
	classDict := MetaProperty metaPropsDictForClass: LineMorph.
	classDict at: #startPoint put: (propsDict at: #acceptsPoint). 
	classDict at: #endPoint put: (propsDict at: #acceptsPoint). 
	classDict at: #color put: (propsDict at: #acceptsColor). 
	classDict at: #lineWidth put: (propsDict at: #acceptsPositiveInteger). 
"
	classDict := MetaProperty metaPropsDictForClass: PointerLineMorph.
	classDict at: #endPointMorph put: (propsDict at: #acceptsMorph). 
"
	classDict := MetaProperty metaPropsDictForClass: Panel.
	classDict at: #widgetsColor put: (propsDict at: #acceptsColor). 
	classDict at: #stayUp put: (propsDict at: #acceptsBoolean). 
	
	classDict := MetaProperty metaPropsDictForClass: FontMorph.
	classDict at: #labelMorph put: (propsDict at: #acceptsLabelMorph). 
	classDict at: #string put: (propsDict at: #acceptsString).
	classDict at: #font put: (propsDict at: #acceptsFont).
	classDict at: #emphasis put: (propsDict at: #acceptsEmphasis). 

	classDict := MetaProperty metaPropsDictForClass: PluggableButtonMorph.
	classDict at: #label put: (propsDict at: #acceptsString).
	classDict at: #font put: (propsDict at: #acceptsFont).
	classDict at: #icon put: (propsDict at: #acceptsForm).
	classDict at: #iconName put: (propsDict at: #acceptsSymbol).
	classDict at: #iconDrawSelector put: (propsDict at: #acceptsSymbol).

	classDict := MetaProperty metaPropsDictForClass: ImageMorph.
	classDict at: #image put: (propsDict at: #acceptsForm).
	classDict at: #borderColor put: (propsDict at: #acceptsColor).
	classDict at: #borderWidth put: (propsDict at: #acceptsPositiveInteger).
	"classDict at: #borderStyle put: (propsDict at: #acceptsBorderStyle)."

	classDict := MetaProperty metaPropsDictForClass: LayoutMorph.
	classDict at: #borderColor put: (propsDict at: #acceptsColor).
	classDict at: #borderWidth put: (propsDict at: #acceptsPositiveInteger).
"	classDict at: #borderStyle put: (propsDict at: #acceptsBorderStyle)."

	classDict := MetaProperty metaPropsDictForClass: FrameMorph.
	classDict at: #borderStyle put: (propsDict at: #acceptsBorderStyle).

	classDict := MetaProperty metaPropsDictForClass: WindowTitleMorph.
	classDict at: #titleString put: (propsDict at: #acceptsString).
	
	classDict := MetaProperty metaPropsDictForClass: LabelMorph.
	classDict at: #contents put: (propsDict at: #acceptsString).
	classDict at: #font put: (propsDict at: #acceptsFont).
	classDict at: #emphasis put: (propsDict at: #acceptsEmphasis). 
"	
	classDict := MetaProperty metaPropsDictForClass: MinimalStringMorph.
	classDict at: #contents put: (propsDict at: #acceptsString).
	classDict at: #font put: (propsDict at: #acceptsFont).
	classDict at: #emphasis put: (propsDict at: #acceptsEmphasis). 
"	
	classDict := MetaProperty metaPropsDictForClass: OneLineEditorMorph.
	classDict at: #contents put: (propsDict at: #acceptsString).
	classDict at: #font put: (propsDict at: #acceptsFont).
	classDict at: #emphasis put: (propsDict at: #acceptsEmphasis). 

	classDict := MetaProperty metaPropsDictForClass: VisualPropertyEditor .
	classDict at: #showAllIvars put: (propsDict at: #acceptsBoolean).
	classDict at: #showAllProps put: (propsDict at: #acceptsBoolean).
	
	classDict := MetaProperty metaPropsDictForClass: PluggableButtonMorph.
	classDict at: #font put: (propsDict at: #acceptsFont).
	classDict at: #icon put: (propsDict at: #acceptsForm).
	classDict at: #label put: (propsDict at: #acceptsString).
	classDict at: #iconName put: (propsDict at: #acceptsSymbol).

	classDict := MetaProperty metaPropsDictForClass: SystemWindow .
	classDict at: #labelString put: (propsDict at: #acceptsString).


! !

!MetaPropertyTests methodsFor: 'testing' stamp: 'KenD 12/5/2016 14:19:19'!
testAccepts

	self assert: ((MetaProperty kind: String) accepts: 'aString').
	self deny: ((MetaProperty kind: String) accepts: 2@3).
	self assert: ((MetaProperty kind: String) accepts: #symbol).

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
	self deny: ((MetaPropertyFrom kind: Point minValue: 0@0) accepts: -23@-47).
	self deny: ((MetaPropertyFrom kind: Point minValue: 0@0) accepts: 1@-1).

	"Pattern Match"
	self assert: ((MetaPropertyViaTest kind: String test: [ :s | '*baz*' match: s ]) accepts: 'mombazzi').
	self deny: ((MetaPropertyViaTest kind: String test: [ :s | '*baz*' match: s ]) accepts: 'bamboozle').
	self deny: ((MetaPropertyViaTest kind: String test: [ :s | '*baz*' match: s ]) accepts: 43).
! !

!MetaPropertyTests methodsFor: 'testing' stamp: 'KenD 12/5/2016 13:55:45'!
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

!MetaPropertyTests methodsFor: 'testing' stamp: 'KenD 12/5/2016 13:22:28'!
testPredefinedMProps

	self assert: ((MetaProperty metaPropNamed: #acceptsString) accepts: 'aString').
	self assert: ((MetaProperty metaPropNamed: #acceptsColor) accepts: Color blue).
	self assert: ((MetaProperty metaPropNamed: #acceptsPositivePoint) accepts: 2@3).
	self assert: ((MetaProperty metaPropNamed: #acceptsPositiveNumber) accepts: 0.1).
	
	self deny: ((MetaProperty metaPropNamed: #acceptsPositivePoint) accepts: -2@3).
	self deny: ((MetaProperty metaPropNamed: #acceptsPositiveNumber) accepts: -1).! !

!MetaProperty methodsFor: 'testing' stamp: 'KenD 12/4/2016 14:21:39'!
accepts: newValue

	^ newValue isKindOf: kind! !

!MetaProperty methodsFor: 'editing' stamp: 'KenD 12/22/2016 14:38:58'!
edit: myMorph menuItem: item

	(self editProc) 
	 	ifNil: [  (HoverHelpMorph contents: 'Need editor for ' , item name asString)
			popUpForHand: myMorph world activeHand ]
		ifNotNil: [ :closure | closure value: myMorph value: self value: item ]! !

!MetaProperty methodsFor: 'accessing' stamp: 'KenD 12/14/2016 10:52:25'!
editProc

	^ editProc ! !

!MetaProperty methodsFor: 'accessing' stamp: 'KenD 12/4/2016 14:33:35'!
kind

	^ kind! !

!MetaProperty methodsFor: 'initialization' stamp: 'KenD 12/4/2016 14:20:57'!
initialize

	kind := Object "default"! !

!MetaProperty methodsFor: 'initialization' stamp: 'KenD 12/4/2016 14:19:45'!
kind: aClass

	(aClass isKindOf: Class)
	ifTrue:  [ kind := aClass ]
	ifFalse: [ self error: 'Expected a class: ', aClass printString ].! !

!MetaProperty methodsFor: 'initialization' stamp: 'KenD 12/14/2016 10:51:37'!
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

!MetaProperty class methodsFor: 'class initialization' stamp: 'KenD 12/14/2016 14:02:51'!
addToInitialDictionaries

	"Does nothing -- method inherited by subclasses which do not override it"! !

!MetaProperty class methodsFor: 'class initialization' stamp: 'KenD 12/14/2016 15:30:54'!
initialize
	"Add typical usages to dictionary for sharing."
"
	MetaProperty initialize.
"
	
	"self initializeDictionaries." "invoked in VisualPropertyEditor class>>initialize"
! !

!MetaProperty class methodsFor: 'class initialization' stamp: 'KenD 1/10/2022 13:15:12'!
initializeDictionaries
	"Add typical usages to dictionary for sharing."
"
	PreDefinedPropsDict := nil.
	MetaPropDict  := nil.
	MetaProperty initializeDictionaries.
"
	| props |
	PreDefinedPropsDict 
		ifNil: [  PreDefinedPropsDict := IdentityDictionary new ].
	MetaPropDict  "See VisualPropertyEditor class>>initialize"
		ifNil: [ MetaPropDict  := Dictionary new ]. 
	
	props := self preDefinedPropsDict.
	props at: #acceptsString 
			put: (MetaProperty 
			kind: String
			editProc: [ :morph :metaProp :menuItem | 
						StringEntryPanel 
								open: menuItem
								label: (menuItem name asString) ::						
								morphPosition: morph morphPositionInWorld 
												+ morph morphExtentInOwner;
							    fitInWorld
							 ]).
	props at: #acceptsSymbol 
			put: (MetaProperty 
					kind: Symbol
					editProc: [ :morph :metaProp :menuItem | 
						StringEntryPanel 
								open: menuItem
								label: (menuItem name asString) ::
								morphPosition: morph morphPositionInWorld 
												+ morph morphExtentInOwner;
								fitInWorld ]).
	props at: #acceptsCharacter 
			put: (MetaProperty 
					kind: Character
					editProc: [ :morph :metaProp :menuItem | 
						CharacterEntryPanel 
								open: menuItem
								label: (menuItem name asString) ::
								morphPosition: morph morphPositionInWorld 
												+ morph morphExtentInOwner; fitInWorld
						]).
	props at: #acceptsNumber put: (MetaProperty kind: Number).
	props at: #acceptsColor 
		    put: (MetaProperty 
				kind: Color
				editProc: [ :morph :metaProp :menuItem |
					| origColor |
					origColor := menuItem prevValue.
					Color colorSelectionMenu: origColor ] ).
	props at: #acceptsPoint 
		    put: (MetaProperty 
				kind: Point
				editProc: [ :morph :metaProp :menuItem | 
						PointEntryPanel 
								open: menuItem 
								label: (menuItem name asString) ::
								morphPosition: morph morphPositionInWorld 
												+ morph morphExtentInOwner; fitInWorld ]).
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
					| newFont |
					newFont := AbstractFont fromUser. 
					newFont ifNotNil: [ :f | menuItem propertyValue: f. morph redrawNeeded ] ]  ).
	props at: #acceptsForm put: (MetaProperty kind: Form).
	props at: #acceptsLocation put: (MetaProperty kind: Point).
	props at: #acceptsLayoutSpec 
			put: (MetaProperty 
					kind: LayoutSpec
					editProc: [ :morph :metaProp :menuItem | 
								 morph editMyLayoutSpec ] ).
	props at: #acceptsLabelMorph put: (MetaProperty kind: LabelMorph).

	self allSubclassesDo: [ :subclass | subclass addToInitialDictionaries ].
	
	! !

!MetaProperty class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:24:56'!
kind: aClass

	^ self new kind: aClass! !

!MetaProperty class methodsFor: 'instance creation' stamp: 'KenD 12/14/2016 10:46:15'!
kind: aClass editProc: aClosure

	^ self new kind: aClass editProc: aClosure! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 12/14/2016 14:09:10'!
metaPropDict
	"Answer a dictionary of Class->Dict(name->metaProp)"

	^ MetaPropDict! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 12/5/2016 07:39:48'!
metaPropNamed: metaPropName

	^ PreDefinedPropsDict at: metaPropName ifAbsent: [ nil ]
	! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 12/2/2016 15:36:33'!
metaPropsDictForClass: aClass

	| classDict |
	classDict := self metaPropDict.
	classDict at: aClass ifAbsentPut: [ Dictionary new ].
	
	^ classDict at: aClass! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 12/2/2016 15:48:27'!
metaPropsForMorph: aMorph
	"Answer a combined Dictionary of name->metaProp by collecting all inherited MetaProps"
	
	| metaPropDict |
	
	metaPropDict := self metaPropsDictForClass: aMorph class.
	aMorph class allSuperclassesDo: [ :sc | | dict |
		dict := self metaPropsDictForClass: sc.
		"supers w same name are ignored, else added"
		dict keysAndValuesDo: [ :k :v | metaPropDict at: k ifAbsentPut: [ v ] ] 
	].
		
	
	^ metaPropDict! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 12/14/2016 14:09:20'!
preDefinedPropsDict

	^ PreDefinedPropsDict ! !

!MetaProperty class methodsFor: 'documentation' stamp: 'KenD 12/2/2016 15:43:36'!
whyMe

^
'
Some Morph properties support private mechanics, but others should be visually shared and displayed in a PropertyEditor so that users can easily adjust visual properties.

The basic idea here is to allow authors of Morph classes to attach MetaProperties so that a Morph''s visual instance variables and properties show up in a VisualPropertyEditor.  Instance variables and properties are private/hidden by default.

To remove walls, a morph''s public properties (those that have been annotated to show up in a VisualPropertyEditor) can be updated by fill-in or DragNDrop for example from a Color, Font or some other Palette or selected from a menu select list.

Note that these (public) visual properties may be virtual.  The idea being that changing a property value may store a value into an instance variable, a #property, or invoke a bit of code that does the right thing and maintains some invariant.

MetaProperties are considered immutable and may be shared.  They are associated with Morph classes and are inherited by Morph subclasses.

See the #examples class category.
'! !

!MetaPropertyFrom methodsFor: 'testing' stamp: 'KenD 12/4/2016 14:57:36'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ minValue <= newValue ]! !

!MetaPropertyFrom methodsFor: 'initialization' stamp: 'KenD 12/4/2016 14:58:26'!
kind: aClass minValue: min

	super kind: aClass.
	(min  isKindOf: aClass) ifFalse: [ self error: 'minValue must be aKindOf: ',  aClass printString ].
	minValue := min.! !

!MetaPropertyFrom methodsFor: 'accessing' stamp: 'KenD 12/4/2016 14:56:58'!
minValue

	^ minValue! !

!MetaPropertyFrom methodsFor: 'accessing' stamp: 'KenD 12/22/2016 15:52:37'!
minValue: aValue

	minValue := aValue ! !

!MetaPropertyFrom class methodsFor: 'class initialization' stamp: 'KenD 1/11/2022 15:27:11'!
addToInitialDictionaries
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
								morphPosition: morph morphPositionInWorld 
												+ morph morphExtentInOwner
								; fitInWorld ]).
	props at: #acceptsPositiveNumber 
		  put: (MetaPropertyFrom 
				kind: Number 
				minValue: 0
				editProc: [ :morph :metaProp :menuItem | 
					PositiveFloatEntryPanel
						open: menuItem
						label: (menuItem name asString) ::
						morphPosition: morph morphPositionInWorld 
											+ morph morphExtentInOwner;
						fitInWorld ]).
	props at: #acceptsPositiveInteger
		    put: (MetaPropertyFrom 
					kind: Integer 
					minValue: 0
					editProc: [ :morph :metaProp :menuItem | 
						PositiveIntegerEntryPanel 
								open: menuItem
								label: (menuItem name asString) ::
								morphPosition: morph morphPositionInWorld 
												+ morph morphExtentInOwner;
								fitInWorld ]).
	! !

!MetaPropertyFrom class methodsFor: 'class initialization' stamp: 'KenD 4/2/2017 14:43:50'!
initialize

	self preDefinedPropsDict ifNil: [ PreDefinedPropsDict := IdentityDictionary new].
	self addToInitialDictionaries.! !

!MetaPropertyFrom class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:59:16'!
kind: aClass minValue: min

	^ self new kind: aClass minValue: min! !

!MetaPropertyFrom class methodsFor: 'instance creation' stamp: 'KenD 12/22/2016 15:53:32'!
kind: aClass minValue: min editProc: editProc

	^ self new kind: aClass editProc: editProc :: minValue: min! !

!MetaPropertyFrom class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:59:28'!
minValue: min

	^ self new kind: Object minValue: min! !

!MetaPropertyOneOf methodsFor: 'testing' stamp: 'KenD 12/4/2016 14:29:45'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ choiceCollection includes: newValue ]! !

!MetaPropertyOneOf methodsFor: 'accessing' stamp: 'KenD 12/4/2016 14:34:10'!
choices

	^ choiceCollection! !

!MetaPropertyOneOf methodsFor: 'editing' stamp: 'KenD 12/24/2016 15:59:42'!
edit: myMorph menuItem: item

	| menu selectIndex |
	menu := PopUpMenu labelArray: (self choices collect: [ :elt | elt printString]).
	selectIndex := menu startUpWithCaption: 'Set ', item name asString, ' to:'.
	item propertyValue: ( self choices at: selectIndex ). 
	myMorph redrawNeeded.! !

!MetaPropertyOneOf methodsFor: 'initialization' stamp: 'KenD 2/12/2018 16:22:20'!
kind: aClass choices: aCollection

	super kind: aClass.
	(aCollection isCollection)
		ifFalse: [ self error: 'Expected a collection of value choices: ', aCollection printString ].
	(aCollection allSatisfy: [ :elt | elt isKindOf: aClass])
		ifFalse: [ self error: 'Expected collection elements of kind: ', aClass printString,
					 ' got: ', aCollection printString ].
	
	choiceCollection := aCollection.
! !

!MetaPropertyOneOf class methodsFor: 'testing' stamp: 'KenD 12/18/2016 09:49:30'!
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

!MetaPropertyOneOf class methodsFor: 'class initialization' stamp: 'KenD 3/21/2017 17:33:47'!
addToInitialDictionaries
	"Add typical usages to dictionary for sharing."
"
	MetaPropertyOneOf addToInitialDictionaries.
"
	| props |
	props := self preDefinedPropsDict.
	
	props at: #acceptsBoolean       put: (MetaPropertyOneOf kind: Boolean choices: #(true false)).
	props at: #acceptsBorderStyle put: (MetaPropertyOneOf kind: Symbol choices: #(inset raised simple)).
	props at: #acceptsAlignment 
		  put: (MetaPropertyOneOf kind: Symbol choices: #(leftFlush rightFlush centered justified)).
! !

!MetaPropertyOneOf class methodsFor: 'class initialization' stamp: 'KenD 12/14/2016 14:14:53'!
initialize

	self addToInitialDictionaries.! !

!MetaPropertyOneOf class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:40:39'!
choices: aCollection

	^ self new kind: Object choices: aCollection! !

!MetaPropertyOneOf class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:30:57'!
kind: aClass choices: aCollection

	^ self new kind: aClass choices: aCollection! !

!MetaPropertyMultiSelect methodsFor: 'testing' stamp: 'KenD 2/9/2022 07:14:04'!
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

!MetaPropertyMultiSelect methodsFor: 'testing' stamp: 'KenD 12/18/2016 12:54:37'!
encodingInRange: encoded

	(encoded isKindOf: Integer)
		ifTrue: [  "Already encoded"
			^ ((0 <= encoded)
				and: [ encoded <= maxValue ])
		]
		ifFalse: [ ^ false ]! !

!MetaPropertyMultiSelect methodsFor: 'accessing' stamp: 'KenD 12/18/2016 15:10:14'!
decodeProc
	"Answer a closure which takes an integer and answers a string"

	^ decodeProc ! !

!MetaPropertyMultiSelect methodsFor: 'accessing' stamp: 'KenD 12/18/2016 15:09:43'!
encodeProc
	"Answer a closure which takes a value and encodes it into an integer"

	^ encodeProc ! !

!MetaPropertyMultiSelect methodsFor: 'editing' stamp: 'KenD 2/9/2022 14:36:05'!
edit: myMorph menuItem: item

	| menu encodedResult |
	menu := (MultiSelectMenu 
					choices: choiceCollection
					seed: (self encodeProc value: item propertyValue)
					title: item name asString).
	encodedResult := menu invokeModal.
	item propertyValue: encodedResult. 
	myMorph redrawNeeded.! !

!MetaPropertyMultiSelect methodsFor: 'initialization' stamp: 'KenD 12/18/2016 09:12:42'!
multiChoiceFrom: aCollection encodeProc: encoder decodeProc: decoder

	super kind: Object choices: aCollection.
	encodeProc := encoder.
	decodeProc := decoder.
	maxValue := (1 bitShift: (aCollection size)) - 1. "bitMask"
	
	((encoder isKindOf: BlockClosure) and: [ encoder numArgs = 1 ])
		ifFalse: [ self error: 'Encoder should be a closure of 1 argument: ', encoder printString ].
	((decoder isKindOf: BlockClosure) and: [ decoder numArgs = 1 ])
		ifFalse: [ self error: 'Decoder should be a closure of 1 argument: ', decoder printString ].

! !

!MetaPropertyMultiSelect methodsFor: 'initialization' stamp: 'KenD 2/9/2022 07:25:21'!
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

!MetaPropertyMultiSelect class methodsFor: 'class initialization' stamp: 'KenD 2/9/2022 07:30:47'!
addToInitialDictionaries
	"Add typical usages to dictionary for sharing."
"
	MetaPropertyMultiSelect addToInitialDictionaries.
"
	| props |
	props := self preDefinedPropsDict.
	
	props  at: #acceptsEmphasis 
			put: (MetaPropertyMultiSelect 
				multiChoiceFrom: TextEmphasis choices 
				kind: Symbol
				encodeProc:
				 [ :intOrString |
					(intOrString isKindOf: Integer) 
						ifTrue: [ intOrString ]
						ifFalse: [ (intOrString isKindOf: String) 
									ifTrue:  [ TextEmphasis codeForChoice: intOrString ]
									ifFalse: [ -1 ]
								]
				]
				decodeProc: [ :encoded | 
					TextEmphasis stringForCode: ((encoded isKindOf: Integer) 
								ifTrue:[encoded]  ifFalse:[0])
				]
				).! !

!MetaPropertyMultiSelect class methodsFor: 'instance creation' stamp: 'KenD 12/18/2016 09:13:11'!
multiChoiceFrom: aCollection encodeProc: encoder decodeProc: decoder

	^ self new multiChoiceFrom: aCollection encodeProc: encoder decodeProc: decoder! !

!MetaPropertyMultiSelect class methodsFor: 'instance creation' stamp: 'KenD 2/9/2022 07:24:48'!
multiChoiceFrom: aCollection kind: aClass encodeProc: encoder decodeProc: decoder

	^ self new multiChoiceFrom: aCollection kind: aClass encodeProc: encoder decodeProc: decoder! !

!MetaPropertyRange methodsFor: 'testing' stamp: 'KenD 12/4/2016 14:43:49'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ minValue <= newValue ]
			and: [ newValue <= maxValue ]! !

!MetaPropertyRange methodsFor: 'initialization' stamp: 'KenD 12/4/2016 14:45:45'!
kind: aClass minValue: min maxValue: max

	super kind: aClass.
	(min  isKindOf: aClass) ifFalse: [ self error: 'minValue must be aKindOf: ',  aClass printString ].
	(max isKindOf: aClass) ifFalse: [ self error: 'maxValue must be aKindOf: ', aClass printString ].
	minValue := min.
	maxValue := max.! !

!MetaPropertyRange methodsFor: 'accessing' stamp: 'KenD 12/4/2016 14:42:29'!
maxValue

	^ maxValue! !

!MetaPropertyRange methodsFor: 'accessing' stamp: 'KenD 12/4/2016 14:42:19'!
minValue

	^ minValue! !

!MetaPropertyRange class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:41:31'!
kind: aClass minValue: min maxValue: max

	^ self new kind: aClass minValue: min maxValue: max! !

!MetaPropertyRange class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:41:43'!
minValue: min maxValue: max

	^ self new kind: Object minValue: min maxValue: max! !

!MetaPropertyTransducer methodsFor: 'testing' stamp: 'KenD 12/22/2016 20:16:03'!
accepts: newValue

	^ (self kinds anySatisfy: [ :class | newValue isKindOf: class ])! !

!MetaPropertyTransducer methodsFor: 'accessing' stamp: 'KenD 12/22/2016 19:58:24'!
decodeProc
	"Emulate multiselect protocol"
	^ [ :value | value ] "identity/pass-through"! !

!MetaPropertyTransducer methodsFor: 'accessing' stamp: 'KenD 12/22/2016 19:58:51'!
encodeProc
	"Emulate multiselect protocol"
	^ transformProc ! !

!MetaPropertyTransducer methodsFor: 'accessing' stamp: 'KenD 12/22/2016 19:37:37'!
kinds

	^ kinds! !

!MetaPropertyTransducer methodsFor: 'accessing' stamp: 'KenD 12/22/2016 19:37:52'!
transformProc

	^ transformProc ! !

!MetaPropertyTransducer methodsFor: 'initialization' stamp: 'KenD 12/22/2016 19:43:30'!
kinds: classCollection transformProc: aClosure

	(classCollection allSatisfy: [ :c | c isKindOf: Class ])
		ifFalse: [ self error: 'Expected a collection of classes: ', classCollection printString ].
	
	(aClosure isKindOf: BlockClosure)
		ifFalse:  [ self error: 'Expected a closure for transforming a value: ', aClosure printString ].
	(aClosure numArgs = 1)
		ifFalse: [ self error: 'Expected a closure for transforming a value: ', aClosure printString ].
	transformProc := aClosure.
	kinds := classCollection.! !

!MetaPropertyTransducer class methodsFor: 'class initialization' stamp: 'KenD 12/23/2016 15:27:55'!
addToInitialDictionaries
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

!MetaPropertyTransducer class methodsFor: 'instance creation' stamp: 'KenD 12/22/2016 19:44:06'!
kinds: classCollection transformProc: aClosure

	^ self new kinds: classCollection transformProc: aClosure! !

!MetaPropertyViaTest methodsFor: 'testing' stamp: 'KenD 12/4/2016 15:19:09'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ testClosure value: newValue ]! !

!MetaPropertyViaTest methodsFor: 'initialization' stamp: 'KenD 12/4/2016 15:18:19'!
kind: aClass test: aClosure

	super kind: aClass.
	(aClosure isKindOf: BlockClosure) 
		ifFalse: [ self error: 'Expected a BlockClosure: ', aClosure printString ].
	(aClosure argumentCount = 1) 
		ifFalse: [ self error: 'Test should take one argument and answer a boolean: ',
					aClosure printString ].
	testClosure := aClosure.! !

!MetaPropertyViaTest methodsFor: 'accessing' stamp: 'KenD 12/4/2016 15:18:32'!
test

	^ testClosure! !

!MetaPropertyViaTest methodsFor: 'accessing' stamp: 'KenD 12/4/2016 15:18:29'!
testClosure

	^ testClosure! !

!MetaPropertyViaTest class methodsFor: 'class initialization' stamp: 'KenD 12/23/2016 15:30:03'!
addToInitialDictionaries
	"Add typical usages to dictionary for sharing."
"
	MetaPropertyViaTest addToInitialDictionaries.
"
"
	| props |
	props := self preDefinedPropsDict.
"! !

!MetaPropertyViaTest class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 15:21:17'!
kind: aClass test: aClosure

	^ self new kind: aClass test: aClosure! !

!MetaPropertyViaTest class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 15:21:10'!
test: aClosure

	^ self new kind: Object test: aClosure! !

!ProtoObject methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:11:53'!
icon

	^ VisualPropertyMenuItem blankIcon! !

!Object methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:10:08'!
icon

	^ VisualPropertyMenuItem objectIcon ! !

!Object methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:10:17'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ SignMorph forObject: self
! !

!Boolean methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:38:12'!
icon

	^ VisualPropertyMenuItem booleanIcon ! !

!False methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:44:48'!
icon

	^ VisualPropertyMenuItem falseIcon ! !

!True methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:45:16'!
icon

	^ VisualPropertyMenuItem trueIcon ! !

!Color methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:40:40'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ DropColorMorph fromColor: self! !

!UndefinedObject methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:15:06'!
icon

	^ VisualPropertyMenuItem nilIcon ! !

!Magnitude methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:06:00'!
icon

	^ VisualPropertyMenuItem integerIcon ! !

!Float methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:47:15'!
icon

	^ VisualPropertyMenuItem floatIcon ! !

!Fraction methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:48:18'!
icon

	^ VisualPropertyMenuItem fractionIcon ! !

!Integer methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:01:28'!
icon

	^ VisualPropertyMenuItem integerIcon ! !

!Time methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:14:09'!
icon

	^ VisualPropertyMenuItem chronIcon ! !

!Character methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:38:55'!
icon

	^ VisualPropertyMenuItem charIcon ! !

!Timespan methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:14:27'!
icon

	^ VisualPropertyMenuItem chronIcon ! !

!BlockClosure methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:37:37'!
icon

	^ VisualPropertyMenuItem closureIcon ! !

!Collection methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:39:28'!
icon

	^ VisualPropertyMenuItem collectionIcon ! !

!String methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:12:47'!
icon

	^ VisualPropertyMenuItem stringIcon ! !

!Symbol methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:13:08'!
icon

	^ VisualPropertyMenuItem symbolIcon ! !

!Stream methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:12:17'!
icon

	^ VisualPropertyMenuItem streamIcon ! !

!FileIOAccessor methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:46:24'!
icon

	^ VisualPropertyMenuItem fileIcon ! !

!FileSystemEntry methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:46:46'!
icon

	^ VisualPropertyMenuItem fileIcon ! !

!DirectoryEntry methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:41:08'!
icon

	^ VisualPropertyMenuItem folderIcon ! !

!FileEntry methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:46:02'!
icon

	^ VisualPropertyMenuItem fileIcon ! !

!Form methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:47:44'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ ImageMorph new image: self
! !

!Point methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:11:23'!
icon

	^ VisualPropertyMenuItem pointIcon ! !

!AbstractFont methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:35:41'!
icon

	^ VisualPropertyMenuItem fontIcon ! !

!AbstractFont methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:35:51'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ FontMorph font: self
! !

!Morph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/17/2021 19:21:31'!
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"Add morph-specific items to the given menu which was invoked by the given hand.  This method provides is invoked both from the halo-menu and from the control-menu regimes."

	aCustomMenu  addLine.
	
	(Smalltalk includesKey: #VisualPropertyEditor)
		ifTrue: [ aCustomMenu addVisualProperties;
				  addLine;
				  add: 'show target halo' action: #addHalo;
				  add: 'show DropTarget for me' action: #showDropTarget
			 ]
		ifFalse: [ aCustomMenu add: 'edit my layoutSpec' action: #editMyLayoutSpec ]! !

!Morph methodsFor: '*morphic-metaproperties' stamp: 'KenD 3/6/2022 07:52:19'!
messageWindow

	^ MorphMessageBox openForMorph: self! !

!Morph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:09:08'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ (self world == self)
		ifTrue: [ SignMorph forObject: self ] "World"
		ifFalse: [ self ]
	
	
! !

!Morph methodsFor: '*morphic-metaproperties' stamp: 'KenD 3/6/2022 07:52:08'!
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

!Morph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:09:14'!
openVisualPropertyEditor

	(VisualPropertyEditor forMorph: self) openInWorld ::
		morphPositionInWorld: self morphPositionInWorld
								  + (self displayFullBounds extent // 2) ;
		removeHalo ! !

!Morph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:09:19'!
propertiesDict
	"Private - could export a #propertiesDo: method"

	^ properties ! !

!Morph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:09:25'!
valueWhenDropped
	"Subclasses which wrap values should override (e.g. SignMorph, DropColorMorph)"
	
	^ self copy! !

!LayoutMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:44:20'!
icon

	^ VisualPropertyMenuItem layoutIcon ! !

!ImageMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:45:11'!
icon

	^ VisualPropertyMenuItem imageIcon ! !

!ImageMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:49:44'!
image

	^ self form! !

!ImageMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/13/2021 16:49:50'!
valueWhenDropped
	"Answer my form (image)"
	
	^ self form! !

!LabelMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:03:11'!
emphasis

	^ emphasis! !

!SystemWindow methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:13:39'!
labelString

	^ self label! !

!SystemWindow methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:13:44'!
labelString: aString

	self setLabel: aString! !

!Panel methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:10:58'!
icon

	^ VisualPropertyMenuItem windowIcon ! !

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:06:41'!
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

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:06:48'!
addVisualProperties

	| theMorphOfInterest myMeta |
	theMorphOfInterest := self targetMorph.
	
	self setProperty: #metaProps 
		 toValue: (MetaProperty metaPropsForMorph: theMorphOfInterest).
	myMeta := self metaProps.
		
	self metaPropNames do: [ :name | | item |

		item := VisualPropertyMenuItem 
						propName:  name 
						morph: theMorphOfInterest 
						propMeta:  (myMeta at: name).

		item  target: item
					  selector: #edit
					  arguments: nil.
					
		self addMorphBack: item
	].
	"#propertyChanged triggered by #propertyValue:"
	theMorphOfInterest when: #propertyChanged send: #refreshView to: self. 
	! !

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:06:55'!
allowsSubmorphDrag
	"Answer whether our morphs can just be grabbed with the hand, instead of requiring the use of the halo. Redefined to answer true."

	^ true! !

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:07:04'!
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

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:07:13'!
fontPreferenceChanged

	super fontPreferenceChanged.
	self refreshView.! !

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:07:19'!
metaPropNames
	"Answer an alpha-sorted collection of MetaProperty names"

	| metaPropNames |
	metaPropNames := SortedCollection sortBlock: [ :sym1 :sym2 | sym1 < sym2 ].
	self metaProps keysDo: [ :mpName |  metaPropNames add: mpName ].

	^ metaPropNames ! !

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:07:26'!
metaProps

	^ self valueOfProperty: #metaProps ifAbsent: [ Dictionary new ].! !

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:07:34'!
morphSelectorProperties
	"Answer a collection of names of properties accessed via selector"

	^ #(morphPosition morphExtent)! !

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:07:39'!
refreshView "of visual properties"

	self items do: [ :item |
		(item is: #VisualPropertyMenuItem)
			ifTrue: [ item redrawNeeded ]
	]
! !

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:07:45'!
showTargetHalo
	"Show my targetMorph's halo"
	| aMorph |
	aMorph := self targetMorph.
	aMorph isInWorld 
		ifTrue: [ aMorph show; addHalo ]
		ifFalse: [
"			(HoverHelpMorph 
			contents: aMorph printString , ' not shown in world')
				popUpForHand: self  world activeHand
"			aMorph openInWorld; 
				show;
				morphPosition: 200@100;
				addHalo   
		]! !

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:07:51'!
targetMorph
	"My defaultTarget is the morph of interest"
	
	^ defaultTarget! !

!MenuMorph methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:07:59'!
valueWhenDropped

	^nil! !

!LayoutSpec methodsFor: '*morphic-metaproperties' stamp: 'KenD 12/14/2021 12:44:31'!
icon

	^ VisualPropertyMenuItem layoutIcon ! !
VisualPropertyMenuItem initialize!
VisualPropertyEditor initialize!
MetaProperty initialize!
MetaPropertyFrom initialize!
MetaPropertyOneOf initialize!
