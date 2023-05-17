'From Cuis 6.0 [latest update: #5799] on 17 May 2023 at 10:35:17 am'!
'Description I am a translucent editing lens for a morph.

I display SVG control points and allow change, e.g. to bezier curves.

I also allow one to drop morphs which make changes to myMorph.
Each such morph has property DropActionMorph set to true.'!
!provides: 'UI-Edit-Lens' 1 8!
!requires: 'UI-DragAndDrop' 1 7 nil!
SystemOrganization addCategory: 'UI-Edit-Lens'!


!classDefinition: #MorphEditLens category: 'UI-Edit-Lens'!
SystemWindow subclass: #MorphEditLens
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Edit-Lens'!
!classDefinition: 'MorphEditLens class' category: 'UI-Edit-Lens'!
MorphEditLens class
	instanceVariableNames: ''!


!MorphEditLens commentStamp: '<historical>' prior: 0!
I am a transcient drop target for a morph.

I allow one to drop morphs which make changes to myMorph.
Each such morph has property DropActionMorph set to true.

Subclasses may be used to "see inside" my target/model and add specialized editing features.
!

!MorphEditLens methodsFor: 'access' stamp: 'KenD 7/4/2015 15:53'!
targetMorph

	^ self model! !

!MorphEditLens methodsFor: 'access' stamp: 'KenD 7/4/2015 16:34'!
targetMorph: aMorph

	self model: aMorph! !

!MorphEditLens methodsFor: 'dropping/grabbing' stamp: 'KenD 12/3/2013 19:33'!
allowsMorphDrop
	"Answer whether we accept dropping morphs. By default answer false."

	^ true! !

!MorphEditLens methodsFor: 'dropping/grabbing' stamp: 'KenD 3/3/2022 12:54:14'!
processDropMorph: aDropEvent
	"I have already expressed a desire for the drop. Just do it."
	
	| dropedMorph |
	dropedMorph := aDropEvent contents.
	aDropEvent wasHandled: true.
	dropedMorph dropAction: self  ! !

!MorphEditLens methodsFor: 'dropping/grabbing' stamp: 'KenD 2/9/2022 06:30:20'!
wantsDroppedMorph: aMorph event: evt
	"Return true if the receiver wishes to accept the given morph, which is being dropped by a hand in response to the given event. Note that for a successful drop operation both parties need to agree. The symmetric check is done automatically via aMorph wantsToBeDroppedInto: self."

	^ (aMorph hasProperty: #DropActionMorph)
	or: [(Smalltalk includesKey: #MetaProperty)
		and: [((MetaProperty metaPropsForMorph: 
					self targetMorph)
				detect: [ :metaProp | 
						metaProp accepts: 
						  aMorph valueWhenDropped] 
				ifNone: [^false]).
			^true
		]
	]! !

!MorphEditLens methodsFor: 'event handling' stamp: 'KenD 7/27/2015 16:25'!
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

!MorphEditLens methodsFor: 'geometry' stamp: 'KenD 5/17/2023 10:06:30'!
boxExtent
	"answer the extent to use in all the buttons. 
	 
	the label height is used to be proportional to the fonts preferences"
	| e |
	e := (Preferences at: #windowTitleFont) lineSpacing.
	^e@e! !

!MorphEditLens methodsFor: 'initialization' stamp: 'KenD 1/6/2016 09:56'!
createHaloBox
	^ (PluggableButtonMorph model: self action: #showHaloButtonClicked)
		icon: (Theme current doItIcon magnifyTo: self boxExtent);
		iconName: #showHalo;
		setBalloonText: 'show target halo' ;
		morphExtent: self boxExtent! !

!MorphEditLens methodsFor: 'initialization' stamp: 'KenD 7/4/2015 16:11'!
createMenuBox
	"Substitute a different button."
	"This avoids having a button on top of the window title."

	^ self createHaloBox ! !

!MorphEditLens methodsFor: 'initialization' stamp: 'KenD 12/3/2013 18:25'!
defaultBorderColor

	^ Color orange! !

!MorphEditLens methodsFor: 'initialization' stamp: 'KenD 12/3/2013 18:25'!
defaultColor
	"See through me"

	^ Color transparent! !

!MorphEditLens methodsFor: 'initialization' stamp: 'KenD 7/5/2015 15:20'!
initialize

	super initialize.
	self widgetsColor: self defaultBorderColor.

! !

!MorphEditLens methodsFor: 'initialization' stamp: 'KenD 2/9/2022 06:59:56'!
openFor: aMorph

	self targetMorph: aMorph.
	"Don't let Layout obfiscate view below"
	(self layoutMorph) color: (Color teal alpha: 0.3).

	"Nota Bene: must set my extent before asking about label"

	self 
		morphExtent: aMorph morphExtentInOwner + self boxExtent;
		setLabel: ('Morph Lens: ', (aMorph printStringLimitedTo: 64));
		openInWorld; "Ignores settings; RESET them!!!!"
		morphPosition: aMorph morphPositionInWorld - (2 * self boxExtent) ;
		morphExtent: aMorph morphExtentInOwner + (3 * self boxExtent);
		color: (Color teal alpha: 0.3);
		refreshSubmorphs;
		yourself
	
! !

!MorphEditLens methodsFor: 'morphIt' stamp: 'KenD 7/5/2015 07:02'!
refreshSubmorphs
	"remove submorphs and get 'em back"
"
	| curPos deltaX deltaY myExtent|
	curPos := self borderWidth @ self borderWidth.
	deltaX := deltaY := 40.  ""Large Icon Size including border""
	myExtent := self morphExtent max: 80@240.
"
	self layoutMorph removeAllMorphs. 
	"(MorphMorph modifiersOf: self targetMorph) "
	(self targetMorph valueOfProperty: #morphModifiers  ifAbsent: [ nil ])
		ifNotNil: [ :modifiers | modifiers do: 
			[ :m | 
				m ifNotNil: [
					self addMorph: m layoutSpec: LayoutSpec keepMorphExtent .
					m show.
"
					m morphPosition: curPos.
					(curPos x + deltaX > myExtent x)
						ifTrue: [ curPos := self borderWidth @ (curPos y + deltaY) ]
						ifFalse: [ curPos := (curPos x + deltaX) @ curPos y ].
"
"					Transcript newLine; show: 'SubM curPos: ', curPos printString .
"
				]
			]
		].
	self layoutMorph layoutSubmorphs .
	self redrawNeeded.
	! !

!MorphEditLens class methodsFor: 'new-morph participation' stamp: 'KenD 12/6/2013 19:06'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!MorphEditLens class methodsFor: 'instance creation' stamp: 'KenD 12/3/2013 18:40'!
openFor: aMorph

	^ self basicNew initialize openFor: aMorph ! !

!Morph methodsFor: '*ui-edit-lens' stamp: 'KenD 12/31/2021 12:50:27'!
showDropTarget

	self showEditLens! !

!Morph methodsFor: '*ui-edit-lens' stamp: 'KenD 12/31/2021 12:50:16'!
showEditLens
	"Display an Edit-Lens for me"

	MorphEditLens openFor: self! !
