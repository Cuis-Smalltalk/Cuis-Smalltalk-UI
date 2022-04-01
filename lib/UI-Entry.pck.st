'From Cuis 6.0 [latest update: #5096] on 1 April 2022 at 12:56:35 pm'!
'Description I supply simple text entry fields.'!
!provides: 'UI-Entry' 1 22!
!requires: 'Cuis-Base' 60 5031 nil!
!requires: 'UI-Click-Select' 1 3 nil!
!requires: 'UI-Base-Morphs' 1 11 nil!
SystemOrganization addCategory: 'UI-Entry'!


!classDefinition: #SimpleEditor category: 'UI-Entry'!
Editor subclass: #SimpleEditor
	instanceVariableNames: 'string pointIndex markIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Entry'!
!classDefinition: 'SimpleEditor class' category: 'UI-Entry'!
SimpleEditor class
	instanceVariableNames: ''!

!classDefinition: #TextEntryMorph category: 'UI-Entry'!
BoxedMorph subclass: #TextEntryMorph
	instanceVariableNames: 'font emphasis contents editor showTextCursor pauseBlinking textCursorRect keyboardFocusWatcher crAction acceptCancelReceiver'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Entry'!
!classDefinition: 'TextEntryMorph class' category: 'UI-Entry'!
TextEntryMorph class
	instanceVariableNames: ''!

!classDefinition: #SimpleNumberEntryMorph category: 'UI-Entry'!
TextEntryMorph subclass: #SimpleNumberEntryMorph
	instanceVariableNames: 'entryChars numCharsToHold theValue validator toString valueAccessor valueUpdator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Entry'!
!classDefinition: 'SimpleNumberEntryMorph class' category: 'UI-Entry'!
SimpleNumberEntryMorph class
	instanceVariableNames: ''!


!SimpleEditor commentStamp: '<historical>' prior: 0!
See comment in Editor!

!TextEntryMorph commentStamp: '<historical>' prior: 0!
A plain text editor for Morphic. Handles only one line. Does not handle fonts/styles, alignment, Smalltalk utilities and any other advanced stuff in TextModelMorph. Just a simple text editor.

Can optionally include a crAction: a zero argument closure, to be evaluated on Cr keystroke.!

!SimpleNumberEntryMorph commentStamp: '<historical>' prior: 0!
I am a simple numeric entry form.  I display and accept numeric values.

See class side for examples.

iVars
  getsCrEsc - nil or object which implements methods #cancel (ESC) and #accept (CR)
  entryChars - legal input characters, e.g. '1234567890ABCDEFabcdef'
  numCharsToHold - nil or number of chanrs for fixed size of field
  value - current value, defaulting to 0 (zero)
  label - string to display, e.g. '', '16r', 'per cent'
  validator - a closure which takes a string and returns a new valid value or nil
	e.g. [ :str | [ ('16r', str) asNumber ] on: Error do: [ ^nil ]].
  toString - a closure which takes a value and returns a string to display
	e.g. [ :n | n printStringHex ]

The validator is applied on return and if nil, the old value is redisplayed and the field flashed,
else the new value is remembered and displayed.!

!SimpleEditor methodsFor: 'typing support' stamp: 'jmv 12/19/2011 12:24'!
addString: aString
	"Think of a better name"

	self replaceSelectionWith: aString! !

!SimpleEditor methodsFor: 'typing support' stamp: 'jmv 12/19/2011 12:24'!
backTo: startIndex
	"During typing, backspace to startIndex."

	self markIndex: startIndex.
	self replaceSelectionWith: ''.
	self markIndex: self pointIndex! !

!SimpleEditor methodsFor: 'typing support' stamp: 'jmv 6/10/2012 11:14'!
dispatchOn: aKeyboardEvent
	"Carry out the action associated with this character, if any."
	| asciiValue |
	asciiValue _ aKeyboardEvent keyValue.
	"Control keys are handled by #shortcuts even if they have any modifiers"
	(asciiValue >= 32 and: [
		aKeyboardEvent commandAltKeyPressed ]) ifTrue: [
		^self perform: (self cmdShortcuts at: asciiValue + 1) with: aKeyboardEvent ].

	"We don't support multiple lines. Therefore, we don't process return as a #normalCharacter:"
	aKeyboardEvent isReturnKey ifTrue: [
		^ true].

	^ self perform: (self shortcuts at: asciiValue + 1) with: aKeyboardEvent! !

!SimpleEditor methodsFor: 'typing support' stamp: 'jmv 1/5/2021 14:34:14'!
processKeystrokeEvent: aKeyboardEvent

	"Key struck on the keyboard. Find out which one and, if special, carry 
	out the associated special action. Otherwise, add the character to the 
	stream of characters."

	(self dispatchOn: aKeyboardEvent) ifTrue: [
		^self].
	self markIndex: self pointIndex! !

!SimpleEditor methodsFor: 'initialization' stamp: 'jmv 11/4/2008 13:08'!
changeString: aString
	"Install aString as the one to be edited by the receiver."

	string _ aString.
	self resetState! !

!SimpleEditor methodsFor: 'initialization' stamp: 'jmv 11/4/2008 13:42'!
initialize
	"Initialize the state of the receiver. Subclasses should include 'super 
	initialize' when redefining this message to insure proper initialization."

	super initialize.
	self changeString: ''! !

!SimpleEditor methodsFor: 'initialization' stamp: 'jmv 10/16/2013 22:37'!
resetState 
	"Establish the initial conditions for editing the paragraph: place text cursor 
	before first character, set the emphasis to that of the first character,
	and save the paragraph for purposes of canceling."

	pointIndex _ 1.	"Like pointBlock in TextEditor"
	markIndex _ 1.	"Like markBlock in TextEditor"! !

!SimpleEditor methodsFor: 'events' stamp: 'jmv 8/21/2012 08:42'!
clickAndHalf

	| here |
	here _ self pointIndex.
	(here between: 2 and: string size)
		ifTrue: [ self selectWord ]
		ifFalse: [
			"if at beginning or end, select entire string"
			self selectAll ].! !

!SimpleEditor methodsFor: 'events' stamp: 'jmv 12/29/2011 14:51'!
mouseDown: evt index: index

	evt shiftPressed
		ifFalse: [
			self markIndex: index pointIndex: index ]
		ifTrue: [
			self mouseMove: evt index: index ]! !

!SimpleEditor methodsFor: 'events' stamp: 'jmv 5/27/2011 15:23'!
mouseMove: evt index: index
	"Change the selection in response to mouse-down drag"

	self pointIndex: index! !

!SimpleEditor methodsFor: 'menu messages' stamp: 'jmv 10/16/2013 22:37'!
copySelection
	"Copy the current selection and store it in the Clipboard, unless empty."

	self lineSelectAndEmptyCheck: [^ self].
	self clipboardTextPut: self selection! !

!SimpleEditor methodsFor: 'menu messages' stamp: 'jmv 9/22/2011 17:09'!
cut
	"Cut out the current selection and redisplay the paragraph if necessary."

	| selection |
	self lineSelectAndEmptyCheck: [^ self].
	selection _ self selection.
	self replaceSelectionWith: ''. 
	self clipboardTextPut: selection! !

!SimpleEditor methodsFor: 'nonediting/nontyping keys' stamp: 'jmv 9/19/2011 09:12'!
cursorEnd: aKeyboardEvent
	"Private - Move cursor end of current line."

	self
		moveCursor: [ :dummy | self endOfText ]
		forward: true
		event: aKeyboardEvent.
	^ true.! !

!SimpleEditor methodsFor: 'nonediting/nontyping keys' stamp: 'jmv 9/17/2010 13:42'!
cursorHome: aKeyboardEvent 

	"Private - Move cursor from position in current line to beginning of
	current line. If control key is pressed put cursor at beginning of text"

	self
		moveCursor:  [ :dummy | self beginningOfText ]
		forward: false
		event: aKeyboardEvent.
	^true! !

!SimpleEditor methodsFor: 'typing/selecting keys' stamp: 'jmv 12/19/2011 12:24'!
forwardDelete: aKeyboardEvent
	"Delete forward over the next character."

	| startIndex stopIndex |
	startIndex _ self markIndex.
	startIndex > string size ifTrue: [
		^ false].
	self hasSelection ifTrue: [
		"there was a selection"
		self replaceSelectionWith: ''.
		^ false].
	"Null selection - do the delete forward"
	stopIndex := startIndex.
	(aKeyboardEvent keyValue = 127 and: [ aKeyboardEvent shiftPressed ])
		ifTrue: [ stopIndex := (self nextWordStart: stopIndex) - 1 ].
	self selectFrom: startIndex to: stopIndex.
	self replaceSelectionWith: ''.
	self deselectAndPlaceCursorAt: startIndex.
	^false! !

!SimpleEditor methodsFor: 'accessing-selection' stamp: 'jmv 10/16/2013 22:17'!
hasSelection
	^markIndex ~= pointIndex! !

!SimpleEditor methodsFor: 'accessing-selection' stamp: 'jmv 11/4/2008 13:57'!
markIndex
	^markIndex! !

!SimpleEditor methodsFor: 'accessing-selection' stamp: 'jmv 11/5/2008 11:41'!
markIndex: anIndex
	markIndex _ anIndex min: string size + 1 max: 1! !

!SimpleEditor methodsFor: 'accessing-selection' stamp: 'jmv 5/27/2011 15:25'!
markIndex: anIndex pointIndex: anotherIndex
	markIndex _ anIndex min: string size + 1 max: 1.
	pointIndex _ anotherIndex min: string size + 1 max: 1! !

!SimpleEditor methodsFor: 'accessing-selection' stamp: 'jmv 11/4/2008 13:57'!
pointIndex
	^ pointIndex! !

!SimpleEditor methodsFor: 'accessing-selection' stamp: 'jmv 11/5/2008 11:41'!
pointIndex: anIndex
	pointIndex _ anIndex min: string size + 1 max: 1! !

!SimpleEditor methodsFor: 'accessing-selection' stamp: 'jmv 1/31/2013 21:09'!
selection

	| firstIndex lastIndex |
	firstIndex _ self startIndex.
	lastIndex _ self stopIndex - 1.

	(firstIndex = 1 and: [ lastIndex = string size ])
		ifTrue: [ ^string ].

	^string copyFrom: firstIndex to: lastIndex! !

!SimpleEditor methodsFor: 'accessing-selection' stamp: 'jmv 11/4/2008 13:55'!
startIndex
	^ pointIndex min: markIndex! !

!SimpleEditor methodsFor: 'accessing-selection' stamp: 'jmv 11/4/2008 13:55'!
stopIndex
	^ pointIndex max: markIndex! !

!SimpleEditor methodsFor: 'testing' stamp: 'jmv 11/17/2008 17:01'!
isAtEnd
	^pointIndex = (string size + 1)! !

!SimpleEditor methodsFor: 'testing' stamp: 'jmv 11/17/2008 17:01'!
isAtStart
	^pointIndex = 1! !

!SimpleEditor methodsFor: 'editing keys' stamp: 'jmv 9/2/2009 12:40'!
makeCapitalized: aKeyboardEvent
	"Force the current selection to uppercase.  Triggered by Cmd-X."
	| prev |
	prev _ $-.  "not a letter"
	self replaceSelectionWith:
		(self selection collect: [:c |
			prev _ prev isLetter ifTrue: [c asLowercase] ifFalse: [c asUppercase]]).
	^ true! !

!SimpleEditor methodsFor: 'editing keys' stamp: 'jmv 12/19/2011 12:22'!
makeLowercase: aKeyboardEvent
	"Force the current selection to lowercase.  Triggered by Cmd-X."

	self replaceSelectionWith: self selection asLowercase.
	^ true! !

!SimpleEditor methodsFor: 'editing keys' stamp: 'jmv 12/19/2011 12:22'!
makeUppercase: aKeyboardEvent
	"Force the current selection to uppercase.  Triggered by Cmd-Y."

	self replaceSelectionWith: self selection asUppercase.
	^ true! !

!SimpleEditor methodsFor: 'private' stamp: 'jmv 9/20/2011 08:46'!
privateCurrentString
	"Answer the string I'm editing. Private. Just for internal Editor use."

	^string! !

!SimpleEditor methodsFor: 'private' stamp: 'jmv 3/16/2011 10:44'!
sameColumn: start newLine: lineBlock forward: isForward
	"See comment in other implementors."
	^start! !

!SimpleEditor methodsFor: 'accessing' stamp: 'jmv 9/6/2017 10:02:17'!
replaceSelectionWith: aString
	"Deselect, and replace the selection text by aText."

	| start stop |
	morph disablesEditing ifTrue: [
		^ self ].
	start _ self startIndex.
	stop _ self stopIndex.
	(start = stop and: [aString size = 0]) ifFalse: [
		string _ string copyReplaceFrom: start to: stop-1 with: aString.	
		self deselectAndPlaceCursorAt:  start + aString size.
		self userHasEdited  " -- note text now dirty" ]! !

!SimpleEditor methodsFor: 'accessing' stamp: 'jmv 9/22/2011 16:52'!
string
	^string! !

!SimpleEditor methodsFor: 'new selection' stamp: 'jmv 9/19/2011 09:12'!
selectFrom: start to: stop

	"Select the specified characters inclusive."
	self selectInvisiblyFrom: start to: stop! !

!SimpleEditor methodsFor: 'new selection' stamp: 'jmv 10/16/2013 22:10'!
selectLine
	"Make the receiver's selection, if currently empty, encompass the current line."
	self hasSelection ifTrue:[^self].
	self selectAll! !

!SimpleEditor class methodsFor: 'keyboard shortcut tables' stamp: 'jmv 6/10/2012 11:07'!
cmdShortcutsSpec
	"
	Editor initialize
	"
	"arranged in QWERTY keyboard order"
	^#(
		#(		$a 	#selectAll:				'Select all')

		#(		$x 	#cut:						'Cut selection and store it in the Clipboard')
		#(		$c 	#copySelection:			'Copy selection to the Clipboard')
		#(		$v 	#paste:					'Paste Clipboard contents')
		#(		$ 	#selectWord:			'Select the current word as with double clicking')
	)! !

!SimpleEditor class methodsFor: 'new morph participation' stamp: 'KenD 1/1/2022 08:16:31'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'KenD 3/20/2022 11:31:52'!
acceptCancelReceiver
	"Answer nil or object implementing #accept and #cancel"
	
	^ acceptCancelReceiver! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'KenD 3/20/2022 11:31:59'!
acceptCancelReceiver: whoToNotify
	"Answer set to nil or object implementing #accept and #cancel"
	
	acceptCancelReceiver := whoToNotify! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 6/11/2020 16:50:03'!
baseFont

	font ifNil: [ font _ FontFamily defaultFamilyAndPointSize ].
	^font! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 3/16/2011 10:34'!
contents
	^contents! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 3/16/2011 10:41'!
contents: newContents 
	contents _ (newContents is: #Text)
		ifTrue: [
			emphasis := newContents emphasisAt: 1.
			 newContents string]
		ifFalse: [
			contents = newContents ifTrue: [^self].	"no substantive change"
			newContents].
	editor _ nil.
	self fitContents.
	self redrawNeeded! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 1/5/2013 14:23'!
crAction
	"Answer the optional Cr action"
	^crAction! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 1/5/2013 14:24'!
crAction: aBlock
	
	crAction := aBlock! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 9/6/2017 10:02:09'!
disableEditing
	self setProperty: #disablesEditing toValue: true.
	self stopBlinking! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 12/4/2011 22:25'!
editor
	"Return my current editor, or install a new one."
	editor ifNil: [ self installEditor ].
	^editor! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'KenD 4/1/2022 12:53:24'!
emphasis
	
	^ emphasis! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'KenD 4/1/2022 12:53:43'!
emphasis: emphasisCode
	
	emphasis := emphasisCode! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 1/1/2015 21:16'!
fitContents
	"Measures contents later at #minimumExtent"
	self morphExtent: 0@0! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 11/5/2008 13:18'!
fontToUse

	^ (emphasis isNil or: [emphasis = 0]) 
		ifTrue: [ self baseFont ]
		ifFalse: [ self baseFont emphasized: emphasis ]! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 3/17/2011 07:58'!
keyboardFocusWatcher: aMorph
	"We are usually used as a part of a bigger morph.
	Usually, that morph would be interested in us changing keyboard focus.
	An alternative implementation would be to define a new type of event, but:
		- I (jmv) prefer explicit message sends to registering in events.
		- There are too many evens already defined. It would be good to reduce that."
	keyboardFocusWatcher _ aMorph! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'jmv 4/25/2019 10:10:16'!
measureContents
	| f |

	f _ self fontToUse.
	^((f widthOfString: contents) max: 3)  @ f lineSpacing.! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'hlsf 3/17/2022 23:21:02'!
setValue: newContents
"For compatibility"
	^ self contents: newContents ! !

!TextEntryMorph methodsFor: 'accessing' stamp: 'hlsf 3/17/2022 23:19:38'!
value
"For compatibility"
	^ self contents! !

!TextEntryMorph methodsFor: 'drawing' stamp: 'jmv 4/25/2019 10:10:12'!
characterIndexAtPoint: aPoint

	| line block f |
	f _ self fontToUse.
	
	line _ TextLine 
		start: 1
		stop: contents size
		internalSpaces: 0
		paddingWidth: 0.
	line
		rectangle: (0@0 extent: extent);
		lineHeight: f lineSpacing baseline: f ascent.
		
	block _ (CharacterBlockScanner new text: (contents asText font: f))
		defaultFont: f;
		characterBlockAtPoint: aPoint index: nil
		in: line.

	^ block stringIndex! !

!TextEntryMorph methodsFor: 'drawing' stamp: 'jmv 10/16/2013 22:37'!
displayTextCursorAtX: x top: top bottom: bottom emphasis: anEmphasis on: aCanvas
	| textCursorColor x1 isBold isItalic x0 h w halfW r d |
	isBold _ anEmphasis allMask: 1.
	isItalic _ anEmphasis allMask: 2.
	textCursorColor _ Theme current textCursor.
	h _ bottom - top.
	w _ isBold
		ifTrue: [ h // 25 + 2 ]
		ifFalse: [ h // 30 + 1 ].
	halfW _ w // 2.
	isItalic
		ifTrue: [	
			"Keep tweaking if needed!!"
			d _ isBold ifTrue: [ 3 ] ifFalse: [ h // 24].
			x0 _ x- (h*5//24) + d.
			x1 _ x + d ]
		ifFalse: [
			x0 _ x.
			x1 _ x].
	x0 < halfW ifTrue: [
		x1 _ x1 - x0 + halfW.
		x0 _ halfW ].
	r _ extent x-halfW-1.
	r < x1 ifTrue: [
		x0 _ x0 + r - x1.
		x1 _ r ].
	textCursorRect _ x0-halfW-1@ top corner: x1+halfW+1+1 @ bottom.
	aCanvas
		line: x0+halfW@bottom to: x1+halfW@(top+w)
		width: w color: textCursorColor! !

!TextEntryMorph methodsFor: 'drawing' stamp: 'hlsf 3/19/2022 10:09:04'!
drawOn: aCanvas
	self hasSelection ifTrue: [ self drawSelectionOn: aCanvas ].
	self hasTextCursor ifTrue: [ self drawTextCursorOn: aCanvas ].
	aCanvas
		drawString: contents
		at: 0@0 + borderWidth
		font: self fontToUse
		color: color.
	(borderWidth > 0) ifTrue: [
		aCanvas
			frameRectangle: ((0@0 extent: extent) expandBy: 2)
			color: borderColor
			borderWidth: borderWidth
			borderStyleSymbol: #simple ]! !

!TextEntryMorph methodsFor: 'drawing' stamp: 'jmv 4/25/2019 10:07:24'!
drawSelectionOn: aCanvas
	| rightX leftX bottom |

	bottom _ self baseFont lineSpacing.
	leftX _ self fontToUse widthOfString: contents from: 1 to: editor startIndex-1.
	leftX _ leftX min: extent x.
	rightX _ self fontToUse widthOfString: contents from: 1 to: editor stopIndex-1.
	rightX _ rightX min: extent x.

	aCanvas
		fillRectangle: (leftX+1 @ 1 corner: (rightX + 2) @ (bottom + 2))
		color: (Theme current textHighlightFocused: self hasKeyboardFocus)! !

!TextEntryMorph methodsFor: 'drawing' stamp: 'hlsf 3/19/2022 10:04:40'!
drawTextCursorOn: aCanvas
	|  bottom x |

	showTextCursor ifTrue: [
		bottom _ self baseFont lineSpacing.
		x _ self fontToUse widthOfString: contents from: 1 to: editor startIndex-1.
		self displayTextCursorAtX: x + 1 top: 0 bottom: bottom emphasis: emphasis on: aCanvas ]! !

!TextEntryMorph methodsFor: 'events' stamp: 'jmv 8/21/2012 08:43'!
clickAndHalf: aMouseButtonEvent localPosition: localEventPosition
	self handleInteraction: [ self editor clickAndHalf ]! !

!TextEntryMorph methodsFor: 'events' stamp: 'KenD 3/20/2022 11:35:24'!
keyStroke: aKeyboardEvent
	"Handle a keystroke event."

	(self focusKeyboardFor: aKeyboardEvent)
		ifTrue: [ ^ self ].
	
	"Check for acceptCancelReceiver"
	(self acceptCancelReceiver) "Check for CR->accept or Esc->cancel"
		ifNotNil: [ :whoToInform |
			(aKeyboardEvent isEsc) 
				ifTrue: [ whoToInform cancel. ^self].
			(aKeyboardEvent isReturnKey)
				ifTrue: [ whoToInform accept. ^self].
		].
	
	"Return - check for special action
	Note: Code below assumes that this was some
	input field reacting on Return."
	aKeyboardEvent isReturnKey ifTrue: [
		crAction ifNotNil: [
			"Break the keyboard focus so that the receiver can be safely deleted."
			"Is this needed at all? (jmv)"
			"aKeyboardEvent hand newKeyboardFocus: nil."
			^crAction value ]].

	self pauseBlinking.
	self handleInteraction: [ self editor processKeystrokeEvent: aKeyboardEvent ].
	self updateFromContents.
	super keyStroke: aKeyboardEvent  "sends to keyStroke event handler, if any"! !

!TextEntryMorph methodsFor: 'events' stamp: 'jmv 1/14/2013 22:27'!
mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition
	"Make this TextMorph be the keyboard input focus, if it isn't already,
		and repond to the text selection gesture."

	aMouseButtonEvent hand newKeyboardFocus: self.

	self handleInteraction: [
		self editor mouseDown: aMouseButtonEvent index: (self characterIndexAtPoint: localEventPosition) ].

	aMouseButtonEvent hand
		waitForClicksOrDragOrSimulatedMouseButton2: self
		event: aMouseButtonEvent
		clkSel: nil
		clkNHalf: #clickAndHalf:localPosition:
		dblClkSel: nil
		dblClkNHalfSel: nil
		tripleClkSel: nil! !

!TextEntryMorph methodsFor: 'events' stamp: 'jmv 1/14/2013 23:16'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	super mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition.
	self pauseBlinking
! !

!TextEntryMorph methodsFor: 'events' stamp: 'jmv 8/20/2012 18:07'!
mouseEnter: event
	super mouseEnter: event.
	Preferences focusFollowsMouse
		ifTrue: [ event hand newKeyboardFocus: self ]! !

!TextEntryMorph methodsFor: 'events' stamp: 'jmv 8/21/2012 13:20'!
mouseMove: aMouseMoveEvent localPosition: localEventPosition

	aMouseMoveEvent mouseButton1Pressed ifFalse: [ ^ self ].
	self handleInteraction: [
		self editor mouseMove: aMouseMoveEvent index: (self characterIndexAtPoint: localEventPosition) ]! !

!TextEntryMorph methodsFor: 'initialization' stamp: 'hlsf 3/19/2022 10:08:33'!
defaultBorderWidth
	^ Theme current buttonBorderWidth! !

!TextEntryMorph methodsFor: 'initialization' stamp: 'cbr 12/3/2010 23:29'!
defaultColor
	"answer the default color/fill style for the receiver"
	^ Theme current text! !

!TextEntryMorph methodsFor: 'initialization' stamp: 'jmv 11/5/2008 12:15'!
initWithContents: aString font: aFont emphasis: emphasisCode 
	self initialize.
	
	font _ aFont.
	emphasis _ emphasisCode.
	self contents: aString! !

!TextEntryMorph methodsFor: 'initialization' stamp: 'jmv 10/16/2013 22:19'!
initialize
	super initialize.
	contents _ ''.
	font _ nil.
	emphasis _ 0.
	showTextCursor _ false. "Should never be nil"! !

!TextEntryMorph methodsFor: 'event handling testing' stamp: 'jmv 9/6/2017 10:02:10'!
disablesEditing

	^self hasProperty: #disablesEditing! !

!TextEntryMorph methodsFor: 'event handling testing' stamp: 'jmv 8/20/2012 18:52'!
handlesKeyboard

	^self visible! !

!TextEntryMorph methodsFor: 'event handling testing' stamp: 'jmv 8/20/2012 18:52'!
handlesMouseDown: aMouseButtonEvent
	^ true! !

!TextEntryMorph methodsFor: 'event handling testing' stamp: 'jmv 8/20/2012 18:52'!
handlesMouseOver: evt
	"implements #mouseEnter: and/or #mouseLeave:"
	^true! !

!TextEntryMorph methodsFor: 'events-processing' stamp: 'jmv 12/28/2011 22:45'!
focusKeyboardFor: aKeyboardEvent
	"If aKeyboardEvent tab or shift-tab use it to navigate keyboard focus.
	ctrl key ignored."
	aKeyboardEvent keyValue = 9
		ifTrue: [
			aKeyboardEvent shiftPressed
				ifFalse: [ aKeyboardEvent hand keyboardFocusNext ]
				ifTrue: [ aKeyboardEvent hand keyboardFocusPrevious ].
			^ true ].
	^super focusKeyboardFor: aKeyboardEvent! !

!TextEntryMorph methodsFor: 'events-processing' stamp: 'KenD 10/29/2015 20:43'!
fontPreferenceChanged

	font := nil.
	self baseFont.! !

!TextEntryMorph methodsFor: 'events-processing' stamp: 'jmv 3/6/2015 08:59'!
keyboardFocusChange: aBoolean 
	aBoolean
		ifTrue: [
			"A hand is wanting to send us characters..."
			editor ifNil: [ self editor ].	"Forces install"
			self selectAll.
			self showsBlinkingCursor ifTrue: [
				self startBlinking ]]
		ifFalse: [
			self stopBlinking.
			keyboardFocusWatcher ifNotNil: [
				keyboardFocusWatcher lostFocus: self ]].
	self redrawNeeded! !

!TextEntryMorph methodsFor: 'editing' stamp: 'jmv 10/16/2013 21:03'!
handleInteraction: interactionBlock
	"Perform the changes in interactionBlock, noting any change in selection
	and possibly a change in the size of the composition"

	"Also couple the editor to Morphic keyboard events"

	| oldEditor oldContents |
	oldEditor _ editor.
	oldContents _ contents.
	interactionBlock value.
	oldContents == contents 
		ifTrue: [ "this will not work if the composition changed"
			editor _ oldEditor	"since it may have been changed while in block"].
	self redrawNeeded! !

!TextEntryMorph methodsFor: 'testing' stamp: 'jmv 11/5/2008 12:41'!
hasSelection

	^editor notNil and: [editor hasSelection]! !

!TextEntryMorph methodsFor: 'testing' stamp: 'jmv 10/16/2013 22:18'!
hasTextCursor

	^ self hasKeyboardFocus and: [editor notNil and: [editor hasSelection not]]! !

!TextEntryMorph methodsFor: 'unaccepted edits' stamp: 'jmv 3/14/2011 09:21'!
hasUnacceptedEdits: aBoolean
	"Set the hasUnacceptedEdits flag to the given value. "
	
	self flag: #jmv.
	"Not used in this morph, as it doesn't do accept / cancel"
	self redrawNeeded! !

!TextEntryMorph methodsFor: 'private' stamp: 'jmv 12/4/2011 22:25'!
installEditor
	"Install an editor for my contents.  This constitutes 'hasFocus'.
	If priorEditor is not nil, then initialize the new editor from its state.
	We may want to rework this so it actually uses the prior editor."

	editor _ SimpleEditor new morph: self.
	editor changeString: contents.
	self redrawNeeded.
	^editor! !

!TextEntryMorph methodsFor: 'private' stamp: 'jmv 12/29/2011 15:05'!
updateFromContents

	"O contents deberia ser un StringHolder????"
	contents _ self editor string.
	self redrawNeeded! !

!TextEntryMorph methodsFor: 'geometry' stamp: 'KenD 10/26/2020 12:18:58'!
minimumExtent

	^ self measureContents + self extentBorder ! !

!TextEntryMorph methodsFor: 'blink cursor' stamp: 'jmv 7/18/2014 14:53'!
onBlinkCursor
	"Blink the cursor"
	showTextCursor _ showTextCursor not | pauseBlinking.
	pauseBlinking _ false.
	textCursorRect ifNotNil: [ :r | self invalidateLocalRect: r]! !

!TextEntryMorph methodsFor: 'blink cursor' stamp: 'jmv 3/6/2015 08:59'!
pauseBlinking
	"Show a solid cursor (non blinking) for a short while"
	pauseBlinking _ true.
	self showsBlinkingCursor ifTrue: [
		"Show cursor right now if needed"
		showTextCursor ifFalse: [
			showTextCursor _ true.
			textCursorRect ifNotNil: [ :r | self invalidateLocalRect: r ]]]! !

!TextEntryMorph methodsFor: 'blink cursor' stamp: 'jmv 9/6/2017 10:02:15'!
showsBlinkingCursor

	^self handlesKeyboard and: [ self disablesEditing not ]! !

!TextEntryMorph methodsFor: 'blink cursor' stamp: 'jmv 2/2/2014 22:20'!
startBlinking
	"And show the cursor"
	pauseBlinking _ true.
	"Start blinking in a short while"
	showTextCursor _ true.
	self startStepping: #onBlinkCursor stepTime: 500! !

!TextEntryMorph methodsFor: 'blink cursor' stamp: 'jmv 7/18/2014 14:53'!
stopBlinking
	"And do not show cursor anymore."
	self stopStepping: #onBlinkCursor.
	"Hide cursor right now if needed"
	showTextCursor ifTrue: [
		showTextCursor _ false.
		textCursorRect ifNotNil: [ :r | self invalidateLocalRect: r ]]! !

!TextEntryMorph methodsFor: 'typing/selecting keys' stamp: 'jmv 3/16/2011 10:45'!
selectAll
	self editor selectAll.
	self redrawNeeded! !

!TextEntryMorph class methodsFor: 'new-morph participation' stamp: 'KenD 3/20/2022 18:50:06'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!TextEntryMorph class methodsFor: 'instance creation' stamp: 'jmv 3/16/2011 10:25'!
contents: aString
	" 'StringMorph contents: str' is faster than 'StringMorph new contents: str' 
	(OneLineEditorMorph contents: 'Some string') openInWorld
	"
	^ self contents: aString font: nil! !

!TextEntryMorph class methodsFor: 'instance creation' stamp: 'jmv 11/4/2008 12:47'!
contents: aString font: aFont
	^ self basicNew initWithContents: aString font: aFont emphasis: 0! !

!TextEntryMorph class methodsFor: 'instance creation' stamp: 'jmv 11/4/2008 12:47'!
contents: aString font: aFont emphasis: emphasisCode
	^ self basicNew initWithContents: aString font: aFont emphasis: emphasisCode! !

!TextEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 1/1/2022 08:14:30'!
new
	^self contents: 'edit one line'! !

!TextEntryMorph class methodsFor: 'examples' stamp: 'KenD 4/1/2022 12:28:17'!
example1
"
	TextEntryMorph example1 openInWorld 
"
	^ TextEntryMorph new
		borderWidth: 0.5;
		borderColor: Color blue;
		yourself! !

!TextEntryMorph class methodsFor: 'examples' stamp: 'KenD 4/1/2022 12:28:12'!
example2
" 
	TextEntryMorph example2 openInWorld 
"
| editor |
	editor _ TextEntryMorph 
		contents: 'Cuis-Smalltalk rocks' 
		font: FontFamily defaultFamilyAndPointSize 
		emphasis: AbstractFont boldCode.
	editor
		morphWidth: 400;
		color: Color blue;
		borderWidth: 1.5;
		borderColor: Color red.
	^ editor! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 2/28/2015 11:04'!
disablesEdition

	^ self hasProperty: #disablesEdition! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 11/21/2013 15:07'!
entryChars

	^ entryChars! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 10/28/2015 20:21'!
fontToUse

	^ Preferences standardListFont ! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'jmv 4/25/2019 10:08:07'!
measureContents
	| myFont |

	(self numCharsToHold) ifNil: [ ^ super measureContents ].
	
	myFont := self fontToUse.
	"Use a wide character as sample for the character width"
	^ 4 + ((myFont widthOfString: 'A') * (self numCharsToHold max: 3)  @ myFont lineSpacing).! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 11/21/2013 15:06'!
numCharsToHold

	^ numCharsToHold! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 12/2/2013 16:53'!
setValue: newValue

	(theValue == newValue) ifTrue: [ ^self ].
	theValue := newValue.
	self contents: (self toString value: self value).
	self morphExtent: self measureContents + 4.
	self valueUpdator ifNotNil: [ :update | update value: newValue]! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 11/21/2013 15:08'!
toString

	^ toString! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 11/21/2013 15:08'!
validator

	^ validator! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 11/21/2013 16:22'!
value

	^ theValue ! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 11/22/2013 19:15'!
valueAccessor
	
	^ valueAccessor! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 11/22/2013 19:16'!
valueAccessor: aOneArgBlock
	
	valueAccessor := aOneArgBlock! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 11/22/2013 19:16'!
valueUpdator
	
	^ valueUpdator! !

!SimpleNumberEntryMorph methodsFor: 'accessing' stamp: 'KenD 11/22/2013 19:16'!
valueUpdator: aOneArgBlock
	
	valueUpdator := aOneArgBlock! !

!SimpleNumberEntryMorph methodsFor: 'drawing' stamp: 'KenD 6/1/2020 15:39:06'!
displayTextCursorAtX: x top: top bottom: bottom emphasis: anEmphasis on: aCanvas

	"Displace my text 4@4 from parent"
	super displayTextCursorAtX: x + 4 top: top + 2 bottom: bottom + 2 emphasis: anEmphasis on: aCanvas! !

!SimpleNumberEntryMorph methodsFor: 'drawing' stamp: 'hlsf 3/19/2022 10:34:24'!
drawOn: aCanvas
	self hasSelection     ifTrue: [ self drawSelectionOn: aCanvas ].
	self hasTextCursor ifTrue: [ self drawTextCursorOn: aCanvas ].
	aCanvas
		drawString: contents
		at: 4@4
		font: self fontToUse
		color: color.
	(borderWidth > 0) ifTrue: [	
		aCanvas
			frameRectangle: (0@0 extent: self morphExtentInOwner)
			color:borderColor
			borderWidth: borderWidth
			borderStyleSymbol: #simple]
! !

!SimpleNumberEntryMorph methodsFor: 'drawing' stamp: 'KenD 6/1/2020 15:47:50'!
drawSelectionOn: aCanvas
	| rightX leftX bottom |

	bottom _ self baseFont lineSpacing.
	leftX _ self fontToUse widthOfString: contents from: 1 to: editor startIndex-1.
	leftX _ leftX min: extent x.
	rightX _ self fontToUse widthOfString: contents from: 1 to: editor stopIndex-1.
	rightX _ rightX min: extent x.

	aCanvas
		fillRectangle: (leftX+4 @ 4 corner: (rightX + 4) @ (bottom + 3)) "displace from parent"
		color: (Theme current textHighlightFocused: self hasKeyboardFocus)! !

!SimpleNumberEntryMorph methodsFor: 'geometry' stamp: 'KenD 8/24/2015 19:58'!
minumExtent

	^ self measureContents + self extentBorder ! !

!SimpleNumberEntryMorph methodsFor: 'events' stamp: 'KenD 3/20/2022 15:56:48'!
keyStroke: aKeyboardEvent
	"Check for legal char if in ASCII range, else let super so it"
	
	((aKeyboardEvent isEsc)
	  or: [aKeyboardEvent isReturnKey]
	    or: [aKeyboardEvent isBackspace])
		ifTrue: [ ^super keyStroke: aKeyboardEvent ].

	(aKeyboardEvent isKeystroke
	    and: [ self entryChars includes: aKeyboardEvent keyCharacter ]
		and: [self contents size < self numCharsToHold])
			ifFalse: [  self flash. ^self ]. "reject"
		
	"else OK to add"
	super keyStroke: aKeyboardEvent! !

!SimpleNumberEntryMorph methodsFor: 'events' stamp: 'KenD 12/19/2013 17:14'!
keyboardFocusChange: aBoolean 

	super keyboardFocusChange: aBoolean.
	aBoolean ifFalse: [ self crAction ifNotNil: [ :thunk | thunk value ]].! !

!SimpleNumberEntryMorph methodsFor: 'events' stamp: 'KenD 9/1/2016 15:26:39'!
mouseLeave: event
	super mouseLeave: event.
	self crAction ifNotNil: [ :thunk | thunk value ]! !

!SimpleNumberEntryMorph methodsFor: 'events' stamp: 'KenD 12/17/2013 14:03'!
refreshValueFrom: model
	"Refresh my value from model"
	
	self valueAccessor ifNotNil: [ :accessor | 
				theValue := accessor value: model.
				self contents: (self toString value: self value).
				self morphExtent: self measureContents + 4.
				self redrawNeeded
	]! !

!SimpleNumberEntryMorph methodsFor: 'initialization' stamp: 'KenD 3/20/2022 08:39:35'!
legalChars: legalEntryChars numCharsToHold: nilOrInteger value: initialValue validator: aClosureToValidate toString: aClosureForString

	". the character Backspace is always allowd to permit deletion "
	entryChars := legalEntryChars. 
	numCharsToHold := nilOrInteger.
	theValue := initialValue.
	validator := aClosureToValidate.
	toString := aClosureForString.
	self 
		contents: (self toString value: initialValue);
		acceptCancelReceiver: nil;
		color: Color black;
		crAction: [ | newString newVal |
			newString := self editor string.
			(newString size = 0)
				ifTrue: [ newVal := nil ] "Empty String"
				ifFalse: [ newVal := self validator value: newString ].
			newVal ifNil: [ 	self flash.  "rejected"
						self contents: (self toString value: self value).
				 ]
				 ifNotNil: [ self setValue: newVal ]. "accepted"
	].
	self numCharsToHold 
		ifNotNil: [ | desiredExtent |
			desiredExtent := self measureContents + 4.
			self layoutSpec: (LayoutSpec 
				fixedWidth: desiredExtent x 
				fixedHeight: desiredExtent y
				offAxisEdgeWeight: #center)
	].
! !

!SimpleNumberEntryMorph class methodsFor: 'examples' stamp: 'KenD 3/19/2022 15:36:26'!
circleDegrees
" SimpleNumberEntryMorph circleDegrees openInWorld "
"Answer 0..360.0 or nil"
	^ self new
			legalChars: '12345.67890'
		     	numCharsToHold: 5 
			value: 0 
			validator: [ :str | | degrees |
				degrees := [ str asNumber ] on: Error do: [ -1 ].
				(degrees between: 0 and: 360) 
					ifTrue: [ degrees ]
					ifFalse: [ nil ]
			]
			toString: [ :n | n printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'examples' stamp: 'KenD 12/2/2013 16:23'!
circleDegreesExact
	"Answer 0..360 or nil"

	^ self new
			legalChars: '1234567890' "No $. "
		     numCharsToHold: 3 
			value: 0 
			validator: [ :str | | degrees |
				degrees := [ str asNumber ] on: Error do: [ -1 ].
				(degrees between: 0 and: 360) 
					ifTrue: [ degrees ]
					ifFalse: [ nil ]
			]
			toString: [ :n | n printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'examples' stamp: 'hlsf 12/17/2021 11:07:17'!
circleDegreesInteger
" SimpleNumberEntryMorph circleInteger openInWorld "
"Answer 0..360 or nil"

	^ self new
			legalChars: '1234567890' "No $. "
		     numCharsToHold: 3 
			value: 0 
			validator: [ :str | | degrees |
				degrees := [ str asNumber ] on: Error do: [ -1 ].
				(degrees between: 0 and: 360) 
					ifTrue: [ degrees ]
					ifFalse: [ nil ]
			]
			toString: [ :n | n printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'examples' stamp: 'hlsf 12/17/2021 11:07:37'!
circleDegreesRounded
" SimpleNumberEntryMorph circleDegreesRounded openInWorld "
"Answer 0..360.0 or nil"
	^ self new
			legalChars: '12345.67890' "Includes $. "
		     numCharsToHold: 3 
			value: 0 
			validator: [ :str | | degrees |
				degrees := [ str asNumber ] on: Error do: [ -1 ].
				(degrees between: 0 and: 360) 
					ifTrue: [ degrees rounded ] 
					ifFalse: [ nil ]
			]
			toString: [ :n | n printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'examples' stamp: 'hlsf 12/17/2021 11:09:00'!
hexRGBEntry
" SimpleNumberEntryMorph hexRGBEntry openInWorld "
"Answer 0.FFFFFF or nil"

	^ self new
			legalChars: '1234567890ABCDEFabcdef'
		     numCharsToHold: 6 
			value: 0 
			validator: [ :str | 
				(str size <= 6)
				ifTrue: [[ ('16r', str asUppercase) asNumber ] on: Error do: [ nil ]]
				ifFalse: [ nil ]]
			toString: [ :n |
				n printStringBase: 16 length: 6 padded: true ]! !

!SimpleNumberEntryMorph class methodsFor: 'examples' stamp: 'NM 1/21/2022 16:01:57'!
ipV4Octect
" Can be an integer number beweeen 0 and 255.
---- Example --- 
SimpleNumberEntryMorph ipV4Octect openInHand 

 "
	^ self new
		legalChars: '0123456789'
		numCharsToHold: 3 
		value: 0 
			validator: [ :str | | degrees |
				degrees := [ str asNumber ] on: Error do: [ -1 ].
				(degrees between: 0 and: 255) 
					ifTrue: [ degrees ]
					ifFalse: [ nil ]
			]
			toString: [ :n | n printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'examples' stamp: 'hlsf 12/17/2021 11:09:43'!
percent
" SimpleNumberEntryMorph percent openInWorld "
"Answer 0..100.0 or nil"
	^ self new
			legalChars: '12345.67890'
		     numCharsToHold: 3 
			value: 0 
			validator: [ :str | | val | 
				val := [ str asNumber ] on: Error do: [ -1 ].
				(val between: 0 and: 100) ifFalse: [ nil ] ifTrue: [ val ]
			] 
			toString: [ :n | n printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'examples' stamp: 'KenD 11/23/2013 20:01'!
percentExact
	"Answer 0..100 or nil"

	^ self new
			legalChars: '1234567890'  "No $. "
		     numCharsToHold: 3 
			value: 0 
			validator: [ :str | | val | 
				val := [ str asNumber ] on: Error do: [ -1 ].
				(val between: 0 and: 100) ifFalse: [ nil ] ifTrue: [ val ]
			] 
			toString: [ :n | n printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'examples' stamp: 'hlsf 12/17/2021 11:10:06'!
percentInteger
" SimpleNumberEntryMorph percentInteger openInWorld "
"Answer 0..100 or nil"

	^ self new
			legalChars: '1234567890'  "No $. "
		     numCharsToHold: 3 
			value: 0 
			validator: [ :str | | val | 
				val := [ str asNumber ] on: Error do: [ -1 ].
				(val between: 0 and: 100) ifFalse: [ nil ] ifTrue: [ val ]
			] 
			toString: [ :n | n printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'examples' stamp: 'KenD 3/19/2022 15:51:35'!
rgbOneOf
" SimpleNumberEntryMorph rgbOneOf openInWorld "
"Answer 0..255 or nil"

	^ self new
			legalChars: '1234567890'
		     	numCharsToHold: 3 
			value: 0 
			validator: [ :str | | val |
				 val := [str asNumber ] on: Error do: [ -1 ].
				(val between: 0 and: 255) 
					ifTrue: [ val ]
					ifFalse: [ nil ]
			]
			toString: [ :n | n printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'new-morph participation' stamp: 'KenD 12/6/2013 19:07'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 1/30/2022 15:46:25'!
floatDefault: aReal  maxNumChars: numChars
	"Any real number"
	
	(aReal isKindOf: Number) 
		ifFalse: [ self error: 'Expected an real number : ' , aReal printString ].

	^ self new
		legalChars: '-12345.67890'  
		numCharsToHold: numChars
		value: aReal 
		validator: [ :str |  [ str asNumber ] on: Error do: [ aReal ] ] 
		toString:  [ :n | n printStringFractionDigits: 4 ]! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'hlsf 3/17/2022 17:07:32'!
floatRangeFrom: min to: max maxNumChars: numChars
	"min..max"

	^ self new ::
		legalChars: '-12345.67890'  
		numCharsToHold: numChars
		value: min
		validator: [ :str | | val | 
			val := [ str asNumber ] on: Error do: [ -1 ].
			(val between: min and: max) ifFalse: [ nil ] ifTrue: [ val] 		] 
		toString: [ :n | n printStringFractionDigits: 4 ]! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 11/23/2013 20:01'!
hexEntryOfSize: numChars
	"Answer 0.FF* or nil"
	"E.g. size = 6 for  'FFFFFF' "

	^ self new
			legalChars: '1234567890ABCDEFabcdef'
		     numCharsToHold: numChars 
			value: 0 
			validator: [ :str | 
				(str size <= numChars)
				ifTrue: [[ ('16r', str asUppercase) asNumber ] on: Error do: [ nil ]]
				ifFalse: [ nil ]]
			toString: [ :n | n printStringHex ]! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 1/30/2022 15:39:28'!
integerDefault: anInteger  maxNumChars: numChars
	"Any Integer"
	
	(anInteger isKindOf: Integer) 
		ifFalse: [ self error: 'Expected an Integer : ' , anInteger printString ].

	^ self new
			legalChars: '-1234567890'  
		     numCharsToHold: numChars
			value: anInteger 
			validator: [ :str |  [ str asNumber ] on: Error do: [ -1 ] ] 
			toString:  [ :n | n printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 6/1/2020 14:52:10'!
integerRangeFrom: min to: max maxNumChars: numChars
	"min..max"

	^ self new
			legalChars: '1234567890'  
		     numCharsToHold: numChars
			value: min
			validator: [ :str | | val | 
				val := [ str asNumber ] on: Error do: [ -1 ].
				(val between: min and: max) ifFalse: [ nil ] ifTrue: [ val truncated ]
			] 
			toString: [ :n | n truncated printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 11/21/2013 14:35'!
legalChars: entryChars numCharsToHold: nilOrInteger value: initialValue validator: aClosureToValidate toString: aClosureForString

	self new legalChars: entryChars numCharsToHold: nilOrInteger value: initialValue validator: aClosureToValidate toString: aClosureForString! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 12/15/2013 19:57'!
percentForFixedFactor: factorMax
	"Entry and display as 0..100; internal value as 0.0..factorMax
	where factorMax is an integer."
"
	SimpleNumberEntryMorph percentForFixedFactor: 255.
	100% -> 255
"
	| ratio |
	ratio := 100 / factorMax.
	^ self new
			legalChars: '1234567890'  "No $. "
		     numCharsToHold: 3 
			value: 0 
			validator: [ :str | | val | 
				val := [ str asNumber ] on: Error do: [ -1 ].
				(val between: 0 and: 100) ifFalse: [ nil ] ifTrue: [ (val / ratio) rounded ]
			] 
			toString: [ :n | (n * ratio) rounded printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 12/15/2013 19:58'!
percentForRealFactor: factorMax
	"Entry and display as 0..100; internal value as 0.0..factorMax
	where factorMax is a float."
"
	SimpleNumberEntryMorph percentForRealFactor: 1.0
	40% -> 0.4
"
	| ratio |
	ratio := 100 / factorMax.
	^ self new
			legalChars: '1234567890'  "No $. "
		     numCharsToHold: 3 
			value: 0 
			validator: [ :str | | val | 
				val := [ str asNumber ] on: Error do: [ -1 ].
				(val between: 0 and: 100) ifFalse: [ nil ] ifTrue: [ val / ratio ]
			] 
			toString: [ :n | (n * ratio) rounded printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 1/11/2022 14:25:16'!
positiveFloatDefault: aReal  maxNumChars: numChars
	"Any real number"
	
	(aReal isKindOf: Number) 
		ifFalse: [ self error: 'Expected a positive real number : ' , aReal printString ].

	^ self new
		legalChars: '12345.67890'  
		numCharsToHold: numChars
		value: aReal 
		validator: [ :str |  [ str asNumber ] on: Error do: [ aReal ] ] 
		toString:  [ :n | n printStringFractionDigits: 4 ]! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 12/16/2013 17:08'!
realFactor: factorMax
	"0.0..factorMax
	where factorMax is a float."

	^ self new
			legalChars: '12345.67890'  
		     numCharsToHold: 3 
			value: 0 
			validator: [ :str | | val | 
				val := [ str asNumber ] on: Error do: [ -1 ].
				(val between: 0 and: 1.0) ifFalse: [ nil ] ifTrue: [ val ]
			] 
			toString: [ :n | n asFloat printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 12/16/2013 17:09'!
realFactor: factorMax maxNumChars: numChars
	"0.0..factorMax
	where factorMax is a float."

	^ self new
			legalChars: '12345.67890'  
		     numCharsToHold: numChars
			value: 0 
			validator: [ :str | | val | 
				val := [ str asNumber ] on: Error do: [ -1 ].
				(val between: 0 and: 1.0) ifFalse: [ nil ] ifTrue: [ val ]
			] 
			toString: [ :n | n asFloat printString ]! !

!SimpleNumberEntryMorph class methodsFor: 'instance creation' stamp: 'KenD 3/20/2022 15:59:57'!
singleCharSelection: aChar
	"Really a character editor"

	^ self new
			legalChars: '1234567890',
						'abcdefghijklmnopqrstuvwxyz',
						'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 
		     	numCharsToHold: 1 
			value: aChar 
			validator: [ :str | str  ]
			toString: [ :c | c asString ]! !

!String methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:31:40'!
asTextEmphasis

	^ TextEmphasis fromChoiceString: self! !

!String methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:31:50'!
asTextEmphasisCode

	^ TextEmphasis codeForChoice: self! !

!TextAlignment class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:38:38'!
choices

	^ #(leftFlush rightFlush centered justified)! !

!TextAlignment class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:38:43'!
codeForChoice: aStringOrSymbol
	"On error, answer 0 as the default value, else index - 1"
"	
	self codeForChoice: #centered.
"
	^ (self choices indexOf: aStringOrSymbol asSymbol ifAbsent: [ 1 ]) - 1! !

!TextAlignment class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:38:49'!
fromChoiceString: aStringOrSymbol

	^self new alignment: (self codeForChoice: aStringOrSymbol)! !

!TextAlignment class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:41:04'!
fromUser
"
   self fromUser inspect.
"

	^ self fromUser: 0! !

!TextAlignment class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:39:28'!
fromUser: defaultChoiceCode
	"Put up a menu and answer an instance of me"
"
	(TextAlignment fromUser: 3) inspect.
"
		
	| aMenu |

	aMenu _ MenuMorph new defaultTarget: self.
	
	aMenu addTitle: 'Text Alignment'.
	self choices do: [ :choice | 
		aMenu add: choice asString 
				target: self
			     action: #privateSetResult:inMorph:
				argumentList: { choice. aMenu. }
	].
	aMenu invokeModal.
	^ self perform: (aMenu valueOfProperty: #resultValue
									 ifAbsent: [ self stringForCode: defaultChoiceCode ])! !

!TextAlignment class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:39:23'!
privateSetResult: aResult inMorph: aMenuMorph
	"Used by self>>fromUser: to let a MenuMorph transmit the result"

	aMenuMorph setProperty: #resultValue toValue: aResult ! !

!TextAlignment class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:39:13'!
stringForCode: alignmentCode
"
	self stringForCode: 3.
"
	^ self choices at: alignmentCode + 1 ifAbsent: [ self leftFlush ]! !

!TextEmphasis methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:29:48'!
asUIString
	"Return a string for UI text display"
	
	^ self class stringForCode: self emphasisCode! !

!TextEmphasis class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:27:44'!
choices

	^ #(normal bold italic underline struckThrough superscript subscript withST80Glyphs)! !

!TextEmphasis class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:28:07'!
codeForChoice: aStringOrSymbol
	"Take emphasis choices and return a code.
	e.g. 'bold+italic' -> 3"

	| collectedChoices |
	collectedChoices := aStringOrSymbol findTokens: $+.
	(collectedChoices size < 1)
		ifTrue: [ self error: 'Bad choice for TextEmphasis: ', aStringOrSymbol asString ].
	(collectedChoices allSatisfy: [ :choice | self choices includes: choice ])
		ifFalse: [ self error: 'Bad choice for TextEmphasis: ', aStringOrSymbol asString ].
		
	^ collectedChoices 
				inject: 0 
				into: [:sum :choice | sum + (self privateCodeForChoice: choice) ]
	! !

!TextEmphasis class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:28:17'!
fromChoiceString: aStringOrSymbol
	"Answer an instance of me"
	
	^ self new emphasisCode: (self codeForChoice: aStringOrSymbol)! !

!TextEmphasis class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:28:24'!
fromUser

	^ self fromUser: 0
	! !

!TextEmphasis class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:28:55'!
fromUser: defaultChoiceCode
	"Put up a menu and answer an instance of me"
"
	(TextEmphasis fromUser: 3) asUIString.
"
	| emphasisCode |
	emphasisCode :=  (MultiSelectMenu 
							choices: TextEmphasis choices
							seed: defaultChoiceCode 
							title: 'Text Emphasis') invokeModal. 
	^ self new emphasisCode: emphasisCode ! !

!TextEmphasis class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:28:37'!
privateCodeForChoice: aStringOrSymbol
	"Take emphasis choice and return a code.  E.g. 'bold' -> 1
	Here, a multi-choice, like  'bold+italic', is an error.
	aStringOrSymbol MUST be in self choices"

	| indexLessTwo |
	indexLessTwo
		:= ((self choices indexOf: aStringOrSymbol
					 ifAbsent: [ self error: 
						'Bad choice for TextEmphasis: ', aStringOrSymbol asString ])
			- 2 ).
	^ (indexLessTwo < 0)
		ifTrue: [ 0 ]
		ifFalse: [ 1 bitShift: indexLessTwo ]
		
	! !

!TextEmphasis class methodsFor: '*ui-entry' stamp: 'KenD 12/13/2021 15:28:43'!
stringForCode: emphasisCode
	"Answer combined choices with $+.
	E.g. 3 -> 'bold+italic' "

	| stringResult |
	(emphasisCode isZero)
		ifTrue: [ ^ #normal asString ].

	stringResult := nil. 
	1 to: 7 do: [ :bitPos |
		((emphasisCode bitAt: bitPos) isZero)
			ifFalse: [ 
				(stringResult isNil)
					ifTrue: [ stringResult := self choices at: bitPos + 1 ]
					ifFalse: [ stringResult := stringResult
										, '+'
										,  (self choices at: bitPos + 1) 
					]
			]
	].
	
	^ stringResult! !
