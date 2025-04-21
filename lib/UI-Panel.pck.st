'From Cuis7.3 [latest update: #7099] on 21 April 2025 at 5:24:59 pm'!
'Description I supply titled Panels, useful windows simpler
than SystemWindows.'!
!provides: 'UI-Panel' 1 124!
!requires: 'Cuis-Base' 71 6722 nil!
!requires: 'UI-Core' 1 18 nil!
!requires: 'UI-Entry' 1 53 nil!
SystemOrganization addCategory: #'UI-Panel'!


!classDefinition: #BreadcrumbsPane category: #'UI-Panel'!
LayoutMorph subclass: #BreadcrumbsPane
	instanceVariableNames: 'root navBar viewer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'BreadcrumbsPane class' category: #'UI-Panel'!
BreadcrumbsPane class
	instanceVariableNames: ''!

!classDefinition: #DecoratedPane category: #'UI-Panel'!
LayoutMorph subclass: #DecoratedPane
	instanceVariableNames: 'label quickButtons widgetsColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'DecoratedPane class' category: #'UI-Panel'!
DecoratedPane class
	instanceVariableNames: ''!

!classDefinition: #FlowLayoutMorph category: #'UI-Panel'!
PluggableScrollPane subclass: #FlowLayoutMorph
	instanceVariableNames: 'cells allowsSubmorphDrag'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'FlowLayoutMorph class' category: #'UI-Panel'!
FlowLayoutMorph class
	instanceVariableNames: ''!

!classDefinition: #PluggableScrollBar category: #'UI-Panel'!
ScrollBar subclass: #PluggableScrollBar
	instanceVariableNames: 'refreshValueSelector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PluggableScrollBar class' category: #'UI-Panel'!
PluggableScrollBar class
	instanceVariableNames: ''!

!classDefinition: #Panel category: #'UI-Panel'!
PluggableMorph subclass: #Panel
	instanceVariableNames: 'titleMorph layoutMorph stayUp'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'Panel class' category: #'UI-Panel'!
Panel class
	instanceVariableNames: ''!

!classDefinition: #DialogPanel category: #'UI-Panel'!
Panel subclass: #DialogPanel
	instanceVariableNames: 'buttonArea'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'DialogPanel class' category: #'UI-Panel'!
DialogPanel class
	instanceVariableNames: ''!

!classDefinition: #EditPanel category: #'UI-Panel'!
DialogPanel subclass: #EditPanel
	instanceVariableNames: 'editModel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'EditPanel class' category: #'UI-Panel'!
EditPanel class
	instanceVariableNames: ''!

!classDefinition: #PluggableDialogPanel category: #'UI-Panel'!
DialogPanel subclass: #PluggableDialogPanel
	instanceVariableNames: 'viewSelector actionOnButton actionOnAltButton buttonLabel altButtonLabel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PluggableDialogPanel class' category: #'UI-Panel'!
PluggableDialogPanel class
	instanceVariableNames: ''!

!classDefinition: #PluggablePane category: #'UI-Panel'!
PluggableDialogPanel subclass: #PluggablePane
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PluggablePane class' category: #'UI-Panel'!
PluggablePane class
	instanceVariableNames: ''!

!classDefinition: #ValueEntryPanel category: #'UI-Panel'!
DialogPanel subclass: #ValueEntryPanel
	instanceVariableNames: 'entry'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'ValueEntryPanel class' category: #'UI-Panel'!
ValueEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #CharacterEntryPanel category: #'UI-Panel'!
ValueEntryPanel subclass: #CharacterEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'CharacterEntryPanel class' category: #'UI-Panel'!
CharacterEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #FloatEntryPanel category: #'UI-Panel'!
ValueEntryPanel subclass: #FloatEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'FloatEntryPanel class' category: #'UI-Panel'!
FloatEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #PointEntryPanel category: #'UI-Panel'!
ValueEntryPanel subclass: #PointEntryPanel
	instanceVariableNames: 'xEntryMorph yEntryMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PointEntryPanel class' category: #'UI-Panel'!
PointEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #PositiveFloatEntryPanel category: #'UI-Panel'!
ValueEntryPanel subclass: #PositiveFloatEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PositiveFloatEntryPanel class' category: #'UI-Panel'!
PositiveFloatEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #PositiveIntegerEntryPanel category: #'UI-Panel'!
ValueEntryPanel subclass: #PositiveIntegerEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'PositiveIntegerEntryPanel class' category: #'UI-Panel'!
PositiveIntegerEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #RangeFloatEntryPanel category: #'UI-Panel'!
ValueEntryPanel subclass: #RangeFloatEntryPanel
	instanceVariableNames: 'min max'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'RangeFloatEntryPanel class' category: #'UI-Panel'!
RangeFloatEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #StringEntryPanel category: #'UI-Panel'!
ValueEntryPanel subclass: #StringEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'StringEntryPanel class' category: #'UI-Panel'!
StringEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #TextEntryPanel category: #'UI-Panel'!
StringEntryPanel subclass: #TextEntryPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'TextEntryPanel class' category: #'UI-Panel'!
TextEntryPanel class
	instanceVariableNames: ''!

!classDefinition: #WizardPanel category: #'UI-Panel'!
DialogPanel subclass: #WizardPanel
	instanceVariableNames: 'pages currentPageIndex acceptSelector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'WizardPanel class' category: #'UI-Panel'!
WizardPanel class
	instanceVariableNames: ''!

!classDefinition: #WizardPage category: #'UI-Panel'!
Object subclass: #WizardPage
	instanceVariableNames: 'wizard panel buttons title'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'WizardPage class' category: #'UI-Panel'!
WizardPage class
	instanceVariableNames: ''!


!BreadcrumbsPane commentStamp: '<historical>' prior: 0!
A breadcrumbs panel to navigate a tree of objects. A visitor (viewer) is used to get the appropriate view of the browsed objects.
At the top, the navigation, a collection of buttons to access the browsed objects. 
At the bottom, a view of the visited object.
When clicking a button, the bottom view is replaced by the associated buttons's object view. The navigation is adjusted accordingly.
The browsed objects listen to events:
- #browseTo, to instruct me to browse the given objet. See my method #browseTo:
- #edited, to updated a button label when its associated object was edited. Its name may have changed

- root : the root of the tree of objects
- viewer : a Visitor class accepted by the browsed objects to get its view!

!DecoratedPane commentStamp: '<historical>' prior: 0!
- I present morphs in a pane with optional scrollbars
- I am decorated with a surounding thin line and quick buttons for actions in my model!

!FlowLayoutMorph commentStamp: '<historical>' prior: 0!
I arrange box morphs in a continuous flow in one or several line depending on my width. 
If my height is too small to contain all the morphs, I add a vertical scrollbar.!

!PluggableScrollBar commentStamp: '<historical>' prior: 0!
I am a ScrollBar which can get new values from my model.!

!Panel commentStamp: 'hlsf 4/8/2022 12:19:51' prior: 0!
- I present morphs in a panel. (see buildMorphicWindow)
- I am decorated with a window title with optional buttons
!

!DialogPanel commentStamp: '<historical>' prior: 0!
I am a dialog panel with a button area at my bottom.!

!EditPanel commentStamp: '<historical>' prior: 0!
I abstract common edit methods for my concrete subclasses.

The gist is that my model is a reference to the original object.
My editModel is a "putty" or "shadow" copy to which all edit operations are applied.
If the user Update's then the changes are propagated from the editModel to the model.

Examples:
  LayoutMorphEditPanel open:  (LayoutMorph newRow).
  LayoutSpecEditPanel open: (LayoutSpec useAll).!

!PluggableDialogPanel commentStamp: '<historical>' prior: 0!
A pluggable Dialog panel with 'Accept' and 'Cancel' buttons. 
The model should answer to:
- viewSelector (yeah...) to get a view to plug in the panel.
- actionOnAccept (block or symbol) when the 'Accept' button is pressed.

It is used with the Morphic-Mold package for assisted field descriptions and validations. 
The model is then a Mold instance or a composite of Mold instances.!

!PluggablePane commentStamp: '<historical>' prior: 0!
A pluggable pane (no window, no title) with an optional 'Cancel' button. 
The model should answer to:
- viewSelector (yeah...) to get a view to plug in the panel.
- actionOnAccept (block or symbol) for an 'Accept' button
- optional actionOnCancel for a 'Cancel' button

It is used with the Morphic-Mold package for assisted field descriptions and validations. 
The model is then a Mold instance or a composite of Mold instances. 
Other use cases are possible!

!ValueEntryPanel commentStamp: '<historical>' prior: 0!
I am an abstract class for editing simple values.

I take a model which has accessors #propertyValue and #propertyValue:
which get and set the value I am editing.

- entry the morph I am using to edit the model!

!CharacterEntryPanel commentStamp: '<historical>' prior: 0!
I provide for editing/changing a single character.!

!FloatEntryPanel commentStamp: '<historical>' prior: 0!
I edit floats!!!

!PointEntryPanel commentStamp: '<historical>' prior: 0!
I am a panel for filling in a Point value.

My xEntryMorph and yEntryMorph hold the current points x@y value.

!

!PositiveFloatEntryPanel commentStamp: '<historical>' prior: 0!
I edit a real number greater than zero!

!PositiveIntegerEntryPanel commentStamp: '<historical>' prior: 0!
I edit positive integers!

!RangeFloatEntryPanel commentStamp: '<historical>' prior: 0!
I edit a real number in the interval [min ; max]!

!StringEntryPanel commentStamp: '<historical>' prior: 0!
I allow a user to edit a string!

!WizardPanel commentStamp: '<historical>' prior: 0!
I am an abstractact wizard to let the user input data in a sequence of differents pages. 
My model hold the data. In DrGeo, the model is a macro builder or script builder
It emits event when 
 - the user changes the page with the next and previous buttons
 - the user press apply and cancel
!

!WizardPage commentStamp: '<historical>' prior: 0!
See WizardPanel.
I am a model of page to add to a WizardPanel.!

!BreadcrumbsPane methodsFor: 'initialization' stamp: 'hlsf 9/30/2023 17:15:02'!
initialize
	super initialize.
	navBar := LayoutMorph newRow.
	navBar separation: 2@0.
	self addMorphKeepMorphHeight: navBar.
	self adoptWidgetsColor: self defaultBorderColor 
! !

!BreadcrumbsPane methodsFor: 'initialization' stamp: 'hlsf 6/30/2023 21:42:58'!
root: anObject
	root := anObject.
	navBar removeAllMorphs;
		addMorph: (self sliceButtonFor: root).		
	self addMorph: (anObject accept: viewer new).
	! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 7/3/2023 11:59:21'!
browseTo: anObject
	self replaceViewWith: anObject.
	navBar addMorph: (self sliceButtonFor: anObject).! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 6/6/2023 21:45:26'!
removeSliceButtonsAfter: aNavButton
" Search for the navButtons coming after aNavButton, then remove them from the navBar "
	| toDelete |
	toDelete := OrderedCollection new.
	navBar submorphsInFrontOf: aNavButton do: [:aSliceButton | toDelete add: aSliceButton].
	navBar removeAllMorphsIn: toDelete! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 7/13/2023 09:24:29'!
replaceView: aView byView: anotherView
" Replace a view in the pane with another viewer and shrink the panel "
	aView releaseActionMap.
	self replaceSubmorph: aView by: anotherView .
	self morphExtent: self minimumExtent.
	self adoptWidgetsColor: self defaultBorderColor ! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 7/2/2023 13:03:09'!
replaceViewWith: anObject
"Replace the main view in the pane with the viewer of the given object"
	self replaceView: submorphs first byView: (anObject accept: viewer new)! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 7/3/2023 15:13:28'!
sliceButtonFor: anObject
" A navigation button to browse anObject "
	| navButton |
	navButton := nil.
	anObject when: #browseTo send: #browseTo: to: self.
	navButton := PluggableButtonMorph 
		model: [self replaceViewWith: anObject.
			self removeSliceButtonsAfter: navButton		] 
		action: #value label: anObject printString.
	anObject when: #edited send: #updateSliceButton:with: to: self withArguments: {navButton . anObject}.
	navButton adoptWidgetsColor: self defaultBorderColor .
	^ navButton! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 6/28/2023 00:10:05'!
updateSliceButton: button with: anObject
	button label: anObject printString.
	navBar layoutSubmorphs ! !

!BreadcrumbsPane methodsFor: 'accessing' stamp: 'hlsf 7/3/2023 15:10:07'!
adoptWidgetsColor: aColor 
	super adoptWidgetsColor: aColor.
	color := Theme current paneBackgroundFrom: aColor.! !

!BreadcrumbsPane methodsFor: 'accessing' stamp: 'hlsf 7/3/2023 15:09:26'!
defaultBorderColor
	^ Theme current transcript! !

!BreadcrumbsPane methodsFor: 'accessing' stamp: 'hlsf 7/3/2023 15:09:08'!
defaultColor
	^Theme current paneBackgroundFrom: self defaultBorderColor ! !

!BreadcrumbsPane methodsFor: 'accessing' stamp: 'hlsf 6/26/2023 22:08:13'!
viewer: aViewerVisitorClass
	viewer := aViewerVisitorClass! !

!BreadcrumbsPane class methodsFor: 'instance creation' stamp: 'hlsf 6/30/2023 21:43:23'!
on: anObject with: viewerVisitorClass
	^ self newColumn 
		viewer: viewerVisitorClass ;
		root: anObject ;		
		yourself! !

!BreadcrumbsPane class methodsFor: 'new-morph participation' stamp: 'hlsf 1/9/2025 20:37:37'!
includeInNewMorphMenu
	^ false! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 7/3/2023 00:11:54'!
adoptWidgetsColor: aColor 
	super adoptWidgetsColor: aColor.
	color := Theme current paneBackgroundFrom: aColor.! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 7/1/2023 21:15:19'!
contents: aPane
	self addMorphUseAll: aPane.
	self adoptWidgetsColor: self defaultBorderColor ! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 5/6/2023 09:58:02'!
elasticMorph
	"The elastic morph between the title and the quickbuttons "
	^ self topRow submorphs second! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 5/29/2023 11:53:49'!
label: aString
	label contents: aString ! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 5/30/2023 19:09:46'!
quickButtons
	^ quickButtons! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 5/29/2023 12:34:40'!
quickButtons: collection
	quickButtons removeAllMorphs.
	collection ifNotNil: [ collection do: [:aButton | quickButtons addMorph: aButton ] ]! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 5/4/2023 21:47:33'!
topRow
	^ submorphs last! !

!DecoratedPane methodsFor: 'initialization' stamp: 'hlsf 5/29/2023 15:45:05'!
defaultBorderColor
	^ Theme current transcript! !

!DecoratedPane methodsFor: 'initialization' stamp: 'hlsf 5/29/2023 15:55:26'!
defaultColor
	^Theme current paneBackgroundFrom: self defaultBorderColor ! !

!DecoratedPane methodsFor: 'initialization' stamp: 'hlsf 9/12/2024 11:25:43'!
initialize
	| row |
	super initialize.	
	self padding: 10@10;
		doAdoptWidgetsColor.
		
	label := LabelMorph new.
	quickButtons := LayoutMorph newRow :: axisEdgeWeight: #rowRight; color: Color transparent.
	row := LayoutMorph newRow :: separation: 2@0; color: Color transparent .
	row 
		addMorph: label;
		addMorphUseAll: (ColoredBoxMorph new :: color: Color transparent; yourself);
		addMorph: quickButtons layoutSpec: (LayoutSpec proportionalWidth: 0 proportionalHeight: 0) .
	self 	addMorph: row layoutSpec: (LayoutSpec proportionalHeight: 0)! !

!DecoratedPane methodsFor: 'initialization' stamp: 'hlsf 5/29/2023 15:47:27'!
textBackgroundColor
	^Theme current paneBackgroundFrom: borderColor ! !

!DecoratedPane methodsFor: 'drawing' stamp: 'hlsf 9/12/2024 10:45:23'!
drawOn: canvas
	|  startPosition endPosition |
	endPosition := self topRow morphPosition + (0 @ self topRow morphExtent y / 2).
	startPosition := self topRow externalize: self elasticMorph morphPosition  
		+  (0 @ self elasticMorph morphExtent y / 2).
	super drawOn: canvas.
	canvas strokeWidth: 1 color: Theme current menuText do: [
		canvas moveTo: startPosition;
			rel_LineTo: self elasticMorph morphWidth@0;
			rel_MoveTo: quickButtons morphWidth @ 0;
			rel_ArcTo: padding / 2  radius: padding / 2  angleOfXAxis: 0 largeFlag: false sweepFlag: true;
			lineToY: extent y - padding y;
			rel_ArcTo: padding * (-1@1) / 2  radius: padding / 2  angleOfXAxis: 0 largeFlag: false sweepFlag: true;
			lineToX:  padding x;
			rel_ArcTo: padding / -2  radius: padding / 2  angleOfXAxis: 0 largeFlag: false sweepFlag: true;
			lineToY: endPosition y + (padding y / 2);
			rel_ArcTo: padding * (-1@1) / -2  radius: padding / 2  angleOfXAxis: 0 largeFlag: false sweepFlag: true]! !

!DecoratedPane methodsFor: 'geometry testing' stamp: 'hlsf 5/4/2023 21:32:35'!
requiresVectorCanvas
	^ true! !

!DecoratedPane methodsFor: 'geometry' stamp: 'jmv 1/7/2025 11:53:33'!
morphExtent: newExtent
	super morphExtent: newExtent.
	"Hack. This BoxMorph is drawing outside its bounds."
	self redrawNeeded! !

!DecoratedPane class methodsFor: 'examples' stamp: 'hlsf 5/29/2023 12:32:24'!
example1
"
	self example1 openInWorld
"
	| buttons |
	buttons :=	 OrderedCollection new.
	buttons add: (PluggableButtonMorph 
		model: Switch newOff 			stateGetter: #isOn 		action: #switch ::
		icon: Theme current globeIcon ;
		setBalloonText: 'Use GMT time zone';
		yourself).
	buttons add: (PluggableButtonMorph 
		model: Switch newOff 				action: #switch ::
		icon: Theme current clockIcon ;
		setBalloonText: 'Set the time';
		yourself).
	^ DecoratedPane 
		open: Sample09Clock new 
		label: 'A Label for the Pane'
		quickButtons: buttons! !

!DecoratedPane class methodsFor: 'examples' stamp: 'KenD 7/17/2024 15:01:27'!
example2
"
	self example2 openInWorld
"
	^LayoutMorph newColumn ::
		addMorph: DecoratedPane example1;
		addMorph:  LayoutAdjustingMorph new
			layoutSpec: (LayoutSpec fixedHeight: 4);
		addMorph: DecoratedPane example1;
		borderWidth: 4;
		borderColor: Color orange;
		morphExtent: 265@275.! !

!DecoratedPane class methodsFor: 'examples' stamp: 'hlsf 1/9/2025 20:40:42'!
initializedInstance
	^ self example1! !

!DecoratedPane class methodsFor: 'instance creation' stamp: 'hlsf 5/4/2023 19:42:24'!
new
	^ self newColumn ! !

!DecoratedPane class methodsFor: 'instance creation' stamp: 'hlsf 5/29/2023 14:38:05'!
open: aPane label: aString
	^ self open: aPane label: aString quickButtons: nil! !

!DecoratedPane class methodsFor: 'instance creation' stamp: 'hlsf 6/13/2023 20:46:28'!
open: aPane label: aString quickButtons: aCollection
	| pane |
	pane := self new
		label: aString ;
		quickButtons: aCollection;
		contents: aPane.
	^ pane! !

!FlowLayoutMorph methodsFor: 'initialization' stamp: 'hlsf 2/6/2025 11:11:57'!
defaultBorderColor
	^ Theme current transcript! !

!FlowLayoutMorph methodsFor: 'initialization' stamp: 'hlsf 2/6/2025 11:11:46'!
defaultColor
	^Theme current paneBackgroundFrom: self defaultBorderColor ! !

!FlowLayoutMorph methodsFor: 'initialization' stamp: 'hlsf 2/6/2025 12:01:07'!
defaultExtent
	^ `400@300`! !

!FlowLayoutMorph methodsFor: 'initialization' stamp: 'hlsf 4/21/2025 17:23:54'!
initialize
	super initialize.
	self alwaysHideHorizontalScrollbar.
	allowsSubmorphDrag := false.
	cells := #().
	self layoutSpec: LayoutSpec useAll;
		scroller: (LayoutMorph newColumn color: Color transparent)! !

!FlowLayoutMorph methodsFor: 'initialization' stamp: 'hlsf 2/8/2025 19:41:08'!
newRow
	| row |
	row := ​ LayoutMorph newRow :: 
		separation: self gap ; 
		color: Color transparent.
	allowsSubmorphDrag ifTrue: [row setProperty: #allowsSubmorphDrag toValue: true].
	^ row
	! !

!FlowLayoutMorph methodsFor: 'accessing' stamp: 'hlsf 2/9/2025 08:40:16'!
allowsDrag
	allowsSubmorphDrag := true! !

!FlowLayoutMorph methodsFor: 'accessing' stamp: 'hlsf 2/6/2025 20:23:31'!
cells: morphs
	cells := morphs.	
	self updateLayout! !

!FlowLayoutMorph methodsFor: 'accessing' stamp: 'hlsf 2/6/2025 20:20:23'!
gap
" Gap between two previews in a row "
	^ 12	! !

!FlowLayoutMorph methodsFor: 'layout' stamp: 'hlsf 2/6/2025 20:31:38'!
updateLayout
	| tableWidth leftSpace row |
	tableWidth := self viewableWidth.
	scroller 
		removeAllMorphs;
		morphExtent: tableWidth @ 0.
	leftSpace := 0.
	cells do: [:cell | | w |
		w := cell morphWidth.
		w + self gap > leftSpace ifTrue: [ 
			scroller addMorph: (row := self newRow).
			leftSpace := tableWidth - self gap].
		row addMorph: cell.
		leftSpace := leftSpace - w - self gap]! !

!FlowLayoutMorph methodsFor: 'geometry' stamp: 'hlsf 2/6/2025 20:06:44'!
extentChanged: oldExtent	
	self updateLayout.
	super extentChanged: oldExtent.! !

!FlowLayoutMorph class methodsFor: 'examples' stamp: 'hlsf 2/13/2025 20:16:55'!
example1
"
	self example1
"
	| flow cells |
	flow := self new openInWorld.
	cells := OrderedCollection new.
	50 timesRepeat: [ cells add: (ColoredBoxMorph new :: 
			morphExtent: (5 to: 80) atRandom asPoint;
			color: Color random)].
	flow cells: cells! !

!FlowLayoutMorph class methodsFor: 'examples' stamp: 'hlsf 2/13/2025 20:18:38'!
example2
" 	Non working example because the added moprhs are not kind of boxed morph, 
	those need an intermediate morph to pack in
	
	self example2
"
	| flow cells |
	flow := self new openInWorld.
	cells := OrderedCollection new.
	10 timesRepeat: [ cells add: (Sample09Clock new scale:  Random next + 0.2)].
	flow cells: cells! !

!FlowLayoutMorph class methodsFor: 'examples' stamp: 'hlsf 2/13/2025 20:18:53'!
example3
"
    self example3
"
    | flow cells |
    flow := self new openInWorld.
    cells := OrderedCollection new.
    30 timesRepeat: [ |cellContent cellContentExtent cell  |
             cellContentExtent := (15 to: 80) atRandom asPoint.
             cellContent := (ColoredBoxMorph new ::  
                    morphExtent: cellContentExtent; color: Color random).

             cell := (LayoutMorph newRow ::  morphExtent: 100@100;
                color: Color lightGray; layoutSpec: LayoutSpec keepMorphExtent).
             cell addMorph: cellContent
                layoutSpec: (LayoutSpec fixedExtent: cellContentExtent).
        cell axisEdgeWeight: #center.
        cells add: cell].

    flow cells: cells! !

!PluggableScrollBar methodsFor: 'initialization' stamp: 'KenD 8/26/2015 12:27'!
fontPreferenceChanged

	super fontPreferenceChanged.
	slider morphExtent: self buttonExtent @ self buttonExtent.! !

!PluggableScrollBar methodsFor: 'initialization' stamp: 'KenD 11/26/2013 21:12'!
initialize

	super initialize.
	slider morphExtent: self buttonExtent @ self buttonExtent.! !

!PluggableScrollBar methodsFor: 'accessing' stamp: 'KenD 11/25/2013 18:44'!
model: thang setValueSelector: setValueSym refreshValueSelector: getValueSym

	model := thang.
	setValueSelector := setValueSym.
	refreshValueSelector := getValueSym ! !

!PluggableScrollBar methodsFor: 'accessing' stamp: 'KenD 2/8/2022 17:40:04'!
value
	
	^value! !

!PluggableScrollBar methodsFor: 'accessing' stamp: 'KenD 2/8/2022 17:38:53'!
value: zeroToOne

	value := zeroToOne min: 1.0 max: 0.0! !

!PluggableScrollBar methodsFor: 'model access' stamp: 'KenD 2/8/2022 07:47:53'!
refreshValueFromModel
	"Called externally to reset value from model"

	refreshValueSelector ifNotNil: [
		self 
			value:  (model perform: refreshValueSelector) ;
			computeSlider.
	]! !

!PluggableScrollBar methodsFor: 'as yet unclassified' stamp: 'hlsf 7/20/2024 22:15:02'!
sliderSlack
	^self buttonExtent // 15! !

!PluggableScrollBar class methodsFor: 'new-morph participation' stamp: 'KenD 12/6/2013 19:06'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!Panel methodsFor: 'printing' stamp: 'KenD 4/24/2015 16:04'!
printOn: aStream 

	super printOn: aStream.
	aStream nextPutAll: '('.
	aStream
		print: self label;
		nextPutAll: ')'! !

!Panel methodsFor: 'submorphs-add/remove' stamp: 'KenD 12/9/2013 16:44'!
addMorph: aMorph 
	"Add a submorph to our client area."

	layoutMorph addMorph: aMorph! !

!Panel methodsFor: 'submorphs-add/remove' stamp: 'KenD 12/9/2013 16:44'!
addMorph: aMorph layoutSpec: aLayoutSpec
	"Add a submorph to our client area."

	layoutMorph addMorph: aMorph layoutSpec: aLayoutSpec! !

!Panel methodsFor: 'submorphs-add/remove' stamp: 'KenD 12/18/2013 19:36'!
replaceArea: oldArea with: newArea
	"Replace oldArea in its container with newArea and clean up any ActionMaps"
	
	oldArea owner replaceSubmorph: oldArea by: newArea.
	oldArea releaseActionMap.
	self model removeActionsWithReceiver: oldArea.
	oldArea submorphsDo: [ :sm | 
		sm releaseActionMap.
		self model removeActionsWithReceiver: sm
	].

! !

!Panel methodsFor: 'drawing' stamp: 'KenD 9/5/2020 14:04:08'!
addPossiblyUncoveredAreasIn: aRectangle to: aCollection
	"Answer an array of rectangles encompassing those areas in aRectangle not completely
	covered by self. These are the areas that might require further drawing (of morphs below us)
	All areas that might possibly be uncovered must be included."
	 | r |
	self visible ifFalse: [ ^self ].
	
	color mightBeTranslucent ifTrue: [
		aCollection add: aRectangle.
		^self ].

	"Solid rectangle.
	This will be the fastest in many cases. So, please disable rounded corners if on slow hardware!!"
	Theme current roundWindowCorners ifFalse: [
		aRectangle areasOutside: self displayBounds do: [ :rr |  aCollection add: rr ].
		^self ].

	"The solid rectangle does not include the corners.
	Report a couple of rows (top and bottom) or columns (left and right) as uncovered areas.
	We could also try to be more careful and answer each rounded corner...
	Right now, report top and bottom rows as uncovered areas"
	r _ Theme current roundedWindowRadius.
	aRectangle areasOutside: (self displayBounds insetBy: 0@r) do: [ :rr |  aCollection add: rr ]! !

!Panel methodsFor: 'drawing' stamp: 'KenD 12/9/2013 17:08'!
drawClassicFrameOn: aCanvas color: titleColor
	"Window border encompasses title area. No round corners. No title gradient."

	aCanvas fillRectangle: (0@0 extent: extent) color: color borderWidth: borderWidth borderStyleSymbol: #simple baseColorForBorder: self widgetsColor.

	"A border was drawn at the left, top and right of the title area.
	The look is that the title area is inside the window"
	aCanvas fillRectangle: (borderWidth@borderWidth extent: extent x - (2*borderWidth)@ self labelHeight) color: titleColor! !

!Panel methodsFor: 'drawing' stamp: 'jmv 1/7/2025 11:48:37'!
drawOn: aCanvas

	| titleColor |

	titleColor := self defaultColor.
	(Theme current roundWindowCorners)
		ifTrue: [
			"Round corners. Optional title gradient."
			self drawRoundedFrameOn: aCanvas color: titleColor ]
		ifFalse: [
			"No round corners. No title gradient."
			self drawClassicFrameOn: aCanvas color: titleColor ].! !

!Panel methodsFor: 'drawing' stamp: 'hlsf 3/23/2023 10:40:08'!
drawRoundedFrameOn: aCanvas color: theUIsColor
	"Title area is not inside window borders"
	aCanvas
		drawRoundedFrame: (0@0 extent: extent) 
		border: borderWidth 
		color: borderColor 
		topColor: theUIsColor 
		insideColor: color 
		labelHeight: self labelHeight + borderWidth! !

!Panel methodsFor: 'drawing' stamp: 'hlsf 9/2/2024 19:39:01'!
makeMeFullyVisible 

	self world morphExtent > (0@0) ifFalse: [^ self].

	(self morphPosition >= (0@0) and: [ self morphPosition < (self world morphExtent-extent)]) ifTrue: [
		^ self "OK -- visible"].

	self morphPosition: (RealEstateAgent initialFrameFor: self initialExtent: self extentInWorld world: self world) topLeft! !

!Panel methodsFor: 'drawing' stamp: 'KenD 12/9/2013 17:08'!
makeMeVisible 

	self world morphExtent > (0@0) ifFalse: [^ self].

	(self morphPosition >= (0@0) and: [ self morphPosition < (self world morphExtent-self labelHeight)]) ifTrue: [
		^ self "OK -- at least my top left is visible"].

	"window not on screen (probably due to reframe) -- move it now"
	self morphPosition: (RealEstateAgent initialFrameFor: self initialExtent: extent world: self world) topLeft! !

!Panel methodsFor: 'layout' stamp: 'KenD 12/9/2013 16:46'!
beColumn
	layoutMorph
		ifNotNil: [ layoutMorph beColumn ]
		ifNil: [
			layoutMorph _ LayoutMorph newColumn.
			self addMorphFront: layoutMorph ]! !

!Panel methodsFor: 'layout' stamp: 'KenD 12/9/2013 16:46'!
beRow
	layoutMorph
		ifNotNil: [ layoutMorph beRow ]
		ifNil: [
			layoutMorph _ LayoutMorph newRow.
			self addMorphFront: layoutMorph ]! !

!Panel methodsFor: 'layout' stamp: 'jmv 8/23/2020 20:43:06'!
layoutSubmorphs
	"Compute a new layout of submorphs based on the given layout bounds."

	| myBounds |
	layoutMorph ifNotNil: [
		myBounds _ self layoutBounds.
		layoutMorph
			morphPosition: myBounds origin;
			morphExtent: myBounds extent 
	].
	titleMorph ifNotNil: [ titleMorph layoutSubmorphs ].
	
	self layoutNeeded: false! !

!Panel methodsFor: 'layout' stamp: 'jmv 1/7/2025 11:03:01'!
layoutSubmorphsIfNeeded
	"Return self. Recompute the layout if necessary."

	self isLayoutNeeded ifTrue: [
		self layoutSubmorphs ].
! !

!Panel methodsFor: 'layout' stamp: 'jmv 1/7/2025 11:30:44'!
someSubmorphPositionOrExtentChanged
	"Some submorph changed at any nested level.
	Must layout submorphs again."

	super someSubmorphPositionOrExtentChanged.
	self layoutNeeded: true.! !

!Panel methodsFor: 'geometry' stamp: 'hlsf 7/3/2022 13:07:02'!
boxExtent
	"answer the extent to use in all the buttons. 
	 
	the label height is used to be proportional to the fonts preferences"
	| e |
	e _ (Preferences at: #windowTitleFont) lineSpacing.
	^e@e! !

!Panel methodsFor: 'geometry' stamp: 'jmv 1/7/2025 12:02:16'!
extentChanged: oldExtent
	"Our extent changed. Must layout submorphs again."

	self layoutNeeded: true.! !

!Panel methodsFor: 'geometry' stamp: 'KenD 9/15/2024 08:05:15'!
fitInWorld

	"Try to be contained in the world; return boundingBox"
	| displayRect boundingBox |
	displayRect := RealEstateAgent maximumUsableAreaInWorld: self runningWorld.
	boundingBox  := self positionInWorld extent: self extentInWorld.
	boundingBox := boundingBox translatedToBeWithin: displayRect.
	self positionInWorld: boundingBox origin.
	self runningWorld activeHand releaseMouseFocus .
	^boundingBox! !

!Panel methodsFor: 'geometry' stamp: 'KenD 8/26/2015 12:31'!
fontPreferenceChanged
	"My size will have changed. "
	
	super fontPreferenceChanged.
	self morphExtent: self minimumExtent.
! !

!Panel methodsFor: 'geometry' stamp: 'KenD 4/18/2015 20:35'!
labelRectangle
	"Actually the whole label area"

	| e x0 y0 x1 y1|
	e _ self boxExtent.
	x0 _  e x * 4 + 14.
	y0 _ 2.
	x1 _ extent x - 1.
	y1 _ e y + 1.
	^x0@y0 corner: x1@y1
	
	
	
! !

!Panel methodsFor: 'geometry' stamp: 'KenD 12/9/2013 17:05'!
labelRectangleForEmbossed
	"Actually the whole label area"

	| e x0 y0 x1 y1 |
	e _ self boxExtent.
	x0 _ e x * 4 + 14.
	y0 _ 1.
	x1 _ extent x - 1.
	y1 _ e y + 2.
	^x0@y0 corner: x1@y1
	
	
	
! !

!Panel methodsFor: 'geometry' stamp: 'KenD 9/2/2024 19:39:16'!
layoutBounds
	"Return the bounds for laying out children of the receiver"
	"Exclude the label area"

	^  (0@0 extent: self extentInOwner) insetBy: (0 @ (self labelHeight) corner: 0 @ 0)! !

!Panel methodsFor: 'geometry' stamp: 'KenD 4/10/2021 08:48:50'!
minPaneHeightForReframe

	^ self boxExtent y + 10! !

!Panel methodsFor: 'geometry' stamp: 'KenD 12/9/2013 17:06'!
minPaneWidthForReframe

	^ ScrollBar scrollbarThickness * 3! !

!Panel methodsFor: 'geometry' stamp: 'hlsf 5/28/2023 21:39:03'!
minimumExtent
	"Subclasses may want to override me"
	
	| minTitleExtent minLayoutExtent  |
	
	minTitleExtent    := titleMorph ifNil: [0@0] ifNotNil:  [titleMorph minimumExtent].
	minLayoutExtent := layoutMorph minimumExtent.
	
	^ ((minTitleExtent x max: minLayoutExtent x)
		@ (minTitleExtent y + minLayoutExtent y))
	! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 12/9/2013 18:55'!
buildMorphicWindow

	self subclassResponsibility ! !

!Panel methodsFor: 'GUI building' stamp: 'hlsf 5/28/2023 21:24:05'!
buildTitle
	titleMorph := WindowTitleMorph title: 'Untitled'.
	stayUp := false. "UI push pin to change"
	titleMorph 
		layoutSpec: (LayoutSpec morphHeightProportionalWidth: 1.0);
		morphExtent: extent x @ (self labelHeight + borderWidth);
		layoutSubmorphs.
	super addMorph: titleMorph.! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 12/9/2013 18:42'!
buttonColor

	^ Theme current buttonColorFrom: self widgetsColor! !

!Panel methodsFor: 'GUI building' stamp: 'hlsf 7/3/2022 13:07:12'!
defaultButtonPaneHeight
	"Answer the user's preferred default height for new button panes."

	^ (Preferences at: #standardButtonFont) lineSpacing * 14 // 8! !

!Panel methodsFor: 'GUI building' stamp: 'hlsf 5/28/2023 21:17:12'!
hideButtons

	self titleMorph hideAllButtons ! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 4/25/2015 08:45'!
showButtonsNamed: aSymbolCollection

	self titleMorph showButtonsNamed: aSymbolCollection ! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 12/9/2013 18:42'!
textBackgroundColor

	^ Theme current paneBackgroundFrom: self widgetsColor! !

!Panel methodsFor: 'GUI building' stamp: 'hlsf 7/29/2024 10:35:53'!
widgetsColor
	^ borderColor ! !

!Panel methodsFor: 'dropping/grabbing' stamp: 'KenD 9/17/2019 13:26:55'!
valueWhenDropped

	^nil! !

!Panel methodsFor: 'events' stamp: 'hlsf 7/3/2022 13:07:05'!
closeButtonClicked
	"The user clicked on the close-box control in the window title.  For Mac users only, the Mac convention of option-click-on-close-box is obeyed if the mac option key is down."

	(Preferences at: #dismissAllOnOptionClose) ifTrue:
		[Sensor rawMacOptionKeyPressed ifTrue:
			[^ self world closeUnchangedWindows]].
	self delete  "closeBox overrides stayUp"
! !

!Panel methodsFor: 'events' stamp: 'KenD 4/24/2015 16:45'!
collapseButtonClicked
	
	self collapse
! !

!Panel methodsFor: 'events' stamp: 'KenD 4/24/2015 16:45'!
expandButtonClicked
	
	self expand
! !

!Panel methodsFor: 'events' stamp: 'KenD 4/24/2015 16:46'!
pinButtonClicked
	"The user clicked on the push pin. Subclasses should add actions and invoke me"
	
	self stayUp: true
	! !

!Panel methodsFor: 'events' stamp: 'KenD 12/9/2013 17:07'!
wantsToBeDroppedInto: aMorph
	"Return true if it's okay to drop the receiver into aMorph"
	
	^ aMorph isWorldMorph! !

!Panel methodsFor: 'events' stamp: 'KenD 4/28/2015 13:42'!
windowMenuButtonClicked
	
	self subclassResponsibility 
! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 12/29/2021 10:17:01'!
defaultAlignement

	^ #center! !

!Panel methodsFor: 'initialization' stamp: 'KenD 10/26/2021 06:57:59'!
defaultBorderColor

	^self defaultColor! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 3/24/2024 11:25:01'!
defaultBorderWidth
	"answer the default border width for the receiver"

	^ Theme current windowBorderWidth ! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 3/24/2024 12:07:59'!
defaultColor
	^ Theme current defaultWindowColor ! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 12/25/2021 16:55:34'!
defaultSeparation

	^ 10 "Pixels between controls/layouts"! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 7/29/2024 10:34:10'!
initialize
	"Initialize a system window. Add label, stripes, etc., if desired"

	super initialize.
	self buildTitle;
		beColumn.  "by default"
	borderColor := self defaultColor. " widget color "
	self color: self textBackgroundColor ;
		adoptWidgetsColor: self widgetsColor.
	
! !

!Panel methodsFor: 'initialization' stamp: 'KenD 7/16/2024 13:58:43'!
openInWorld
	self morphPosition: 
			(RealEstateAgent 
					initialFrameFor: self 
					initialExtent: self minimumExtent 
					world: self runningWorld ) topLeft.
	super 	openInWorld! !

!Panel methodsFor: 'testing' stamp: 'KenD 12/9/2013 16:45'!
is: aSymbol
	^ aSymbol == #Panel or: [ super is: aSymbol ]! !

!Panel methodsFor: 'testing' stamp: 'KenD 12/9/2013 16:45'!
isOpaqueMorph
	"Not really used, as we also reimplement #addPossiblyUncoveredAreasIn:to:"
	^ (Theme current roundWindowCorners or: [ color mightBeTranslucent ]) not! !

!Panel methodsFor: 'label' stamp: 'KenD 4/24/2015 15:48'!
label

	^ self titleMorph titleString ! !

!Panel methodsFor: 'label' stamp: 'hlsf 7/3/2022 13:07:15'!
labelHeight
	"Answer the height for the window label."

	^  (Preferences at: #windowTitleFont) lineSpacing+1! !

!Panel methodsFor: 'label' stamp: 'jmv 9/12/2024 12:41:43'!
relabel

	| newLabel |
	newLabel := StringRequestMorph 
		request: 'New title for this window'
		initialAnswer: self labelString.
	newLabel isEmpty ifTrue: [^self].
	self setLabel: newLabel! !

!Panel methodsFor: 'label' stamp: 'KenD 4/28/2015 18:34'!
setLabel: aString

	self titleMorph titleString: aString.
! !

!Panel methodsFor: 'label' stamp: 'KenD 12/9/2013 17:02'!
update: aSymbol

	super update: aSymbol.
	aSymbol == #relabel
		ifTrue: [ model ifNotNil: [ self setLabel: model labelString ]]! !

!Panel methodsFor: 'accessing' stamp: 'hlsf 4/5/2025 09:01:00'!
layerNumber
	^ 30! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/24/2015 15:54'!
layoutMorph

	^ layoutMorph! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/24/2015 15:41'!
pinButton
	"private"
	
	^ titleMorph pinButton ! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/19/2015 07:30'!
stayUp

	^ stayUp! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/19/2015 14:11'!
stayUp: aBoolean

	stayUp := aBoolean.
	aBoolean
		ifTrue: [ self pinButton hide ] 
		ifFalse: [ self pinButton show ] ! !

!Panel methodsFor: 'accessing' stamp: 'KenD 4/24/2015 15:44'!
titleMorph 

	^ titleMorph! !

!Panel methodsFor: 'change reporting' stamp: 'hlsf 5/28/2023 21:39:43'!
morphExtent: newExtent

	super morphExtent: newExtent.
	titleMorph ifNotNil: [titleMorph morphExtent: extent x @ (self labelHeight + borderWidth)]! !

!Panel class methodsFor: 'instance creation' stamp: 'hlsf 12/27/2021 11:09:02'!
example1
" 
	Panel example1 openInWorld
"
| panel |
	panel _ Panel new.
	panel 	titleMorph showButtonsNamed: #(#close).
	^ panel
		! !

!Panel class methodsFor: 'instance creation' stamp: 'KenD 3/13/2022 07:30:33'!
initializedInstance
"
	self initializedInstance openInHand.
"
	| panel |
	panel _ Panel new.
	panel 	titleMorph showButtonsNamed: #(#close).
	^ panel
		! !

!Panel class methodsFor: 'instance creation' stamp: 'KenD 12/9/2013 18:53'!
open: model

	^self open: model label: nil! !

!Panel class methodsFor: 'instance creation' stamp: 'hlsf 4/9/2022 10:11:28'!
open: model label: aString
	|  window |
	window _ self basicNew ::
		model: model;
		initialize;
		buildMorphicWindow.
	aString ifNotNil: [ window setLabel: aString ].
	window openInWorld.
	^ window! !

!Panel class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 15:02:35'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!Panel class methodsFor: 'new-morph participation' stamp: 'KenD 3/13/2022 07:31:29'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ true! !

!DialogPanel methodsFor: 'GUI building' stamp: 'hlsf 3/6/2025 20:17:40'!
buildMorphicWindow
	layoutMorph removeAllMorphs.
	self newPane ifNotNil: [:pane | layoutMorph addMorphUseAll: pane].
	self newButtonArea ifNotNil: [:buttons | layoutMorph addMorphKeepMorphHeight: buttons].
	layoutMorph 
		separation: self defaultSeparation;
		axisEdgeWeight: self defaultAlignement.
	self morphExtent: self minimumExtent! !

!DialogPanel methodsFor: 'GUI building' stamp: 'hlsf 12/30/2021 10:38:36'!
newButtonArea
"Return the morph where the buttons are layed out"
	self subclassResponsibility ! !

!DialogPanel methodsFor: 'GUI building' stamp: 'hlsf 12/30/2021 10:39:08'!
newPane
"Return the morph containing the controls of the dialog"
	self subclassResponsibility ! !

!DialogPanel class methodsFor: 'new-morph participation' stamp: 'KenD 3/13/2022 07:31:41'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ false! !

!EditPanel methodsFor: 'accessing' stamp: 'KenD 7/4/2015 08:58'!
editModel
	"A subclass may wish to supply a custom editModel rather than model clone.
	[Note Object>>copy and Morph>>copy]"
	
	editModel ifNil: [ editModel := self model shallowCopy postCopy ].
	
	^ editModel! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 4/19/2015 15:22'!
cancelAndForgetEverything

	editModel := nil.
	self stayUp 
		ifFalse: [ self delete ]
		ifTrue: [ self refreshView ]! !

!EditPanel methodsFor: 'event handling' stamp: 'hlsf 4/16/2023 12:48:33'!
refreshView

	self subclassResponsibility ! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 12/18/2013 19:38'!
replaceArea: oldArea with: newArea
	"Replace oldArea in its container with newArea and clean up any ActionMaps"
	
	super replaceArea: oldArea with: newArea.
	oldArea submorphsDo: [ :sm | 
		self editModel removeActionsWithReceiver: sm
	].
! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 7/27/2015 13:25'!
showHalo

	| aMorph |
	aMorph := self model.
	(aMorph isKindOf: Morph)
	ifFalse: [ self subclassResponsibility ] "subclass must override if model not Morph"
	ifTrue: [ aMorph isInWorld ifTrue: [ aMorph show; addHalo ] ]! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 7/27/2015 16:32'!
showHaloButtonClicked

	self subclassResponsibility! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 12/17/2013 19:01'!
updateMasterFromCopy
	"Update model from editModel"
	
	self subclassResponsibility ! !

!EditPanel methodsFor: 'initialization' stamp: 'KenD 12/17/2013 19:02'!
editModel: anObject

	editModel := anObject! !

!EditPanel methodsFor: 'GUI building' stamp: 'KenD 9/14/2024 15:15:23'!
newButtonArea
	"Answer a LayoutMorph with Update and Cancel buttons"
	
	buttonArea := LayoutMorph newRow 
		color: Color transparent;
		gap: 8;
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #updateMasterFromCopy
				label: 'Update'  :: color: Theme current acceptButton)
			layoutSpec: (LayoutSpec 
							proportionalWidth: 0.3 
							proportionalHeight:  1 
							offAxisEdgeWeight: #center);
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #cancelAndForgetEverything
				label: 'Cancel' :: color: Theme current cancelButton )
			layoutSpec: (LayoutSpec 
							proportionalWidth: 0.3 
							proportionalHeight:  1 
							offAxisEdgeWeight: #center);
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #showHaloButtonClicked
				label: 'Show Halo' :: 
					color: (Theme current buttonColorFrom: Theme current defaultWindowColor))
			layoutSpec: (LayoutSpec 
							proportionalWidth: 0.3 
							proportionalHeight:  1 
							offAxisEdgeWeight: #center);
		layoutSpec: (LayoutSpec 
							proportionalWidth: 1 
							fixedHeight: (2 * (Preferences at: #windowTitleFont) lineSpacing)
							offAxisEdgeWeight: #center);
		axisEdgeWeight: #center";
		color: self widgetsColor".
	^ buttonArea! !

!PluggableDialogPanel methodsFor: 'GUI building' stamp: 'KenD 7/23/2024 18:20:10'!
buildMorphicWindow

	super buildMorphicWindow.
	layoutMorph adoptWidgetsColor: self widgetsColor.! !

!PluggableDialogPanel methodsFor: 'GUI building' stamp: 'KenD 9/14/2024 15:16:23'!
newButtonArea
"Return the morph where the buttons are layed out"
	buttonArea := LayoutMorph newRow ::
		gap: 8;
		axisEdgeWeight: #rowRight;
		addMorph: (PluggableButtonMorph
			model: actionOnButton 
			action: #value
			label: buttonLabel ).
	actionOnAltButton ifNotNil: [
		buttonArea addMorph: (PluggableButtonMorph 
			model: actionOnAltButton 
			action: #value
			label: altButtonLabel)].
	^ buttonArea ! !

!PluggableDialogPanel methodsFor: 'GUI building' stamp: 'hlsf 7/29/2024 10:31:16'!
newPane
	^ (model perform: viewSelector)
		adoptWidgetsColor: self widgetsColor;
		yourself! !

!PluggableDialogPanel methodsFor: 'accessing' stamp: 'hlsf 8/27/2023 15:34:57'!
actionOnAltButton: selectorOrBlock
	actionOnAltButton := selectorOrBlock isSymbol 
		ifTrue: [ [model perform: selectorOrBlock] ]
		ifFalse: [selectorOrBlock]! !

!PluggableDialogPanel methodsFor: 'accessing' stamp: 'hlsf 8/27/2023 15:34:39'!
actionOnButton: selectorOrBlock
	actionOnButton := selectorOrBlock isSymbol 
		ifTrue: [ [model perform: selectorOrBlock] ]
		ifFalse: [selectorOrBlock]! !

!PluggableDialogPanel methodsFor: 'accessing' stamp: 'hlsf 8/27/2023 15:33:27'!
altButtonLabel: aString
	altButtonLabel := aString ! !

!PluggableDialogPanel methodsFor: 'accessing' stamp: 'hlsf 8/27/2023 15:33:16'!
buttonLabel: aString
	buttonLabel := aString ! !

!PluggableDialogPanel methodsFor: 'accessing' stamp: 'hlsf 4/16/2023 14:11:53'!
viewGetter: selector
	viewSelector := selector ! !

!PluggableDialogPanel methodsFor: 'geometry' stamp: 'hlsf 4/18/2023 12:07:20'!
minimumExtent
	| mini |
	mini := super minimumExtent.
	^ (mini x max: 350) @ mini y! !

!PluggableDialogPanel methodsFor: 'initialization' stamp: 'hlsf 8/27/2023 15:32:30'!
initialize
	super initialize.
	buttonLabel := 'Accept'.
	altButtonLabel := 'Cancel'.
	actionOnAltButton := [self delete]! !

!PluggableDialogPanel class methodsFor: 'instance creation' stamp: 'hlsf 8/27/2023 15:35:42'!
open: model label: aString view: viewSelector action: acceptSelectorOrAction
	|  window |
	window := self new 
		model: model;
		viewGetter: viewSelector ;
		actionOnButton: acceptSelectorOrAction;
		buildMorphicWindow.
	aString ifNotNil: [ window setLabel: aString ].
	window openInWorld.
	^ window! !

!PluggableDialogPanel class methodsFor: 'instance creation' stamp: 'hlsf 8/27/2023 15:36:04'!
open: model label: aString view: viewSelector action: acceptSelectorOrAction altAction: cancelSelectorOrAction
	|  window |
	window := self new
		model: model;
		viewGetter: viewSelector ;
		actionOnButton: acceptSelectorOrAction;
		actionOnAltButton: cancelSelectorOrAction;
		buildMorphicWindow.
	aString ifNotNil: [ window setLabel: aString ].
	window openInWorld.
	^ window! !

!PluggablePane methodsFor: 'GUI building' stamp: 'hlsf 5/28/2023 21:29:26'!
buildTitle
" No title, no window "! !

!PluggablePane methodsFor: 'initialization' stamp: 'hlsf 5/28/2023 21:30:11'!
defaultBorderWidth
	^ 0! !

!PluggablePane methodsFor: 'initialization' stamp: 'hlsf 5/12/2024 15:51:11'!
defaultSeparation
	^ 0! !

!PluggablePane methodsFor: 'initialization' stamp: 'hlsf 7/29/2024 10:33:38'!
initialize
	super initialize.
	actionOnAltButton := nil.
	self color: (Theme current paneBackgroundFrom: self widgetsColor).! !

!PluggablePane methodsFor: 'drawing' stamp: 'hlsf 9/2/2024 19:40:10'!
drawOn: aCanvas
	"A canvas is already set with a proper transformation from our coordinates to those of the Canvas target."

	aCanvas
		fillRectangle: self localBounds
		color: color
		borderWidth: borderWidth
		borderStyleSymbol: #simple
		baseColorForBorder: borderColor.! !

!PluggablePane methodsFor: 'label' stamp: 'hlsf 5/28/2023 21:43:08'!
label
	^ 'a pane'
	! !

!PluggablePane methodsFor: 'geometry' stamp: 'hlsf 9/2/2024 19:39:20'!
layoutBounds
	"Return the bounds for laying out children of the receiver"
	"Exclude the label area"

	^  0@0 extent: self extentInOwner! !

!PluggablePane methodsFor: 'as yet unclassified' stamp: 'hlsf 7/16/2024 10:54:35'!
adjustExtent
	self morphWidth: owner viewableWidth! !

!PluggablePane class methodsFor: 'instance creation' stamp: 'hlsf 8/27/2023 15:37:31'!
open: model view: aSelector action: acceptSelectorOrAction
	|  pane |
	pane := self new
		model: model;
		viewGetter: aSelector ;
		actionOnButton: acceptSelectorOrAction;
		buildMorphicWindow.
	^ pane! !

!PluggablePane class methodsFor: 'instance creation' stamp: 'hlsf 8/27/2023 15:37:50'!
open: model view: aSelector action: acceptSelectorOrAction altAction: cancelSelectorOrAction
	|  pane |
	pane := self new
		model: model;
		viewGetter: aSelector ;
		actionOnButton: acceptSelectorOrAction;
		actionOnAltButton: cancelSelectorOrAction;
		buildMorphicWindow.
	^ pane! !

!ValueEntryPanel methodsFor: 'events' stamp: 'hlsf 4/9/2022 10:20:51'!
accept
	self delete.
	model 	ifNotNil: [ :myModel | 			
		myModel propertyValue: entry value 		].! !

!ValueEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:22:36'!
cancel
	self delete! !

!ValueEntryPanel methodsFor: 'events' stamp: 'hlsf 4/9/2022 10:21:04'!
valueWhenDropped
	
	^ model  
		ifNotNil: [ :m | 	m propertyValue: entry value ] 
		ifNil: [ entry value ]! !

!ValueEntryPanel methodsFor: 'GUI building' stamp: 'KenD 9/14/2024 15:16:36'!
newButtonArea
	"Add ACCEPT and CANCEL buttons"
	buttonArea := LayoutMorph newRow
		gap: 8;
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #accept
				label: 'Accept' :: color: Theme current acceptButton)
			layoutSpec: (LayoutSpec new ::
							proportionalWidth: 0.4 minimum: 100;
							proportionalHeight:  1;
							offAxisEdgeWeight: #center);
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #cancel
				label: 'Cancel' :: color: Theme current cancelButton )
			layoutSpec: (LayoutSpec new ::
							proportionalWidth: 0.4 minimum: 100;
							proportionalHeight:  1;
							offAxisEdgeWeight: #center);
		axisEdgeWeight: #center;
		color: (Color transparent).
		
	^ buttonArea ! !

!ValueEntryPanel methodsFor: 'GUI building' stamp: 'KenD 9/14/2024 15:16:45'!
newPane
	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		gap: self defaultSeparation;
		axisEdgeWeight: #center;
		addMorph: entry ; "set in #initialize"
		color: (Color transparent).
	^ entryLayout ! !

!ValueEntryPanel methodsFor: 'initialization' stamp: 'hlsf 3/19/2022 10:23:21'!
model: aModel
	super model: aModel.
	entry ifNotNil: [:anEntry | anEntry setValue: aModel propertyValue]! !

!ValueEntryPanel methodsFor: 'event handling' stamp: 'hlsf 4/16/2023 12:48:33'!
refreshView

	self subclassResponsibility ! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:23:25'!
checkValidity: aModel
	self subclassResponsibility ! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 3/19/2022 10:59:27'!
open: aModel label: stringName
	self checkValidity: aModel propertyValue.
	^ super open: aModel label: stringName.! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 3/26/2022 11:26:00'!
openWide: aModel label: stringName
"My title is not shrinked, the dialog is extended as necessary to have the tile completely readable"
	| panel |
	panel _ self open: aModel label: stringName.
	panel titleMorph dontShrinkTitle.
	panel morphExtent: panel minimumExtent.
	^panel
	! !

!CharacterEntryPanel methodsFor: 'events' stamp: 'hlsf 4/9/2022 10:14:42'!
accept
	self delete.
	model ifNotNil: [ :myModel | 
		myModel propertyValue: (entry value at: 1) ]! !

!CharacterEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:24:16'!
valueWhenDropped
	self model 
		ifNotNil: [ :m | m propertyValue: (entry value at: 1) ] 
		ifNil: [ '_' ]! !

!CharacterEntryPanel methodsFor: 'initialization' stamp: 'hlsf 4/9/2022 10:15:29'!
initialize
	super initialize .
	entry _ SimpleNumberEntryMorph singleCharSelection: $c ::
		setValue: model propertyValue;
		acceptCancelReceiver: self;
		yourself
! !

!CharacterEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:23:45'!
checkValidity: aChar
	(aChar isKindOf: Character) 
		ifFalse: [ self error: 'I require a Character: ' , aChar printString ].
! !

!CharacterEntryPanel class methodsFor: 'examples' stamp: 'KenD 3/20/2022 15:58:16'!
example1
" 
	CharacterEntryPanel example1 
"
	| model |
	model := SignMorph forObject: $A.
	model openInWorld.
	^ self open: model label: 'Key in a character'! !

!FloatEntryPanel methodsFor: 'initialization' stamp: 'hlsf 4/9/2022 10:18:43'!
initialize
	super initialize.
	entry _ SimpleNumberEntryMorph floatDefault: 1.0 maxNumChars: 8 ::
		setValue: model propertyValue;
		acceptCancelReceiver: self;
		yourself! !

!FloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 4/9/2022 10:34:50'!
example1
" 
	FloatEntryPanel example1 
"
	| model |
	model := SignMorph forObject: 3.1.
	model openInWorld.
	^ self open: model label: 'A better PI'! !

!FloatEntryPanel class methodsFor: 'instance creation' stamp: 'KenD 3/21/2022 15:32:16'!
checkValidity: aNumber

	(aNumber isKindOf: Number) ifFalse: [ self error: 'I require a Number ' , aNumber printString ].! !

!PointEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:24:48'!
accept	
	self delete.
	self model ifNotNil: [ :myModel | 
		myModel propertyValue: (xEntryMorph value @ yEntryMorph value) ]! !

!PointEntryPanel methodsFor: 'events' stamp: 'hlsf 3/19/2022 10:25:11'!
valueWhenDropped
	self model 
		ifNotNil: [ :m | m propertyValue: 	(xEntryMorph value @ yEntryMorph value) ] 
		ifNil: [ 0@0 ]! !

!PointEntryPanel methodsFor: 'initialization' stamp: 'hlsf 4/9/2022 10:17:10'!
initialize
	super initialize.
	xEntryMorph _ SimpleNumberEntryMorph floatDefault: 0.0 maxNumChars: 8 ::
		setValue: model propertyValue x;
		acceptCancelReceiver: self;
		yourself.	
	yEntryMorph _ SimpleNumberEntryMorph floatDefault: 0.0 maxNumChars: 8 ::
		setValue: model propertyValue y;
		acceptCancelReceiver: self;
		yourself! !

!PointEntryPanel methodsFor: 'GUI building' stamp: 'KenD 9/14/2024 15:16:50'!
newPane

	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		gap: self defaultSeparation;
		axisEdgeWeight: #center;
		addMorph: xEntryMorph; "set in #initialize"
		addMorph: (LabelMorph new :: contents: '@' );
		addMorph: yEntryMorph;
		color: (Color transparent).
	
	^ entryLayout ! !

!PointEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:28:29'!
checkValidity: aPoint
	(aPoint isKindOf: Point) ifFalse: [ self error: 'I require a Point: ' , aPoint printString ].
! !

!PointEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/17/2022 21:22:13'!
example1
" 
	PointEntryPanel example1 
"
	| model |
	model := SignMorph forObject: (10@200).
	model openInWorld.
	^  self
		open: model
		label: 'Point Value' ! !

!PositiveFloatEntryPanel methodsFor: 'initialization' stamp: 'hlsf 4/9/2022 10:18:52'!
initialize
	super initialize.
	entry _ SimpleNumberEntryMorph positiveFloatDefault: 1.0 maxNumChars: 8 ::
		setValue: model propertyValue;
		acceptCancelReceiver: self;
		yourself
! !

!PositiveFloatEntryPanel class methodsFor: 'instance creation' stamp: 'KenD 1/11/2022 14:29:38'!
checkValidity: aNumber
	(aNumber isKindOf: Number) ifFalse: [ self error: 'I require a Positive Number ' , aNumber printString ].
	(aNumber >= 0) ifFalse: [ self error: 'I require a Positive Number: ' , aNumber printString ]! !

!PositiveFloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/19/2022 11:25:47'!
example1
"
	PositiveFloatEntryPanel example1
"
	| model |
	model := SignMorph forObject: 3.1415.
	model openInWorld.
	^ self open: model label: 'Edit a positive float'! !

!PositiveFloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/19/2022 11:31:13'!
example2
"
	PositiveFloatEntryPanel example2
"
	| model |
	model := SignMorph forObject: -3.1415.
	model openInWorld.
	^ self open: model label: 'Edit a positive float'! !

!PositiveIntegerEntryPanel methodsFor: 'initialization' stamp: 'hlsf 4/9/2022 10:19:00'!
initialize
	super initialize.
	entry _ SimpleNumberEntryMorph integerDefault: 0 maxNumChars: 8 ::
		acceptCancelReceiver: self;
		setValue: model propertyValue;
		yourself! !

!PositiveIntegerEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/25/2021 17:53:21'!
checkValidity: aNumber
	(aNumber isKindOf: Integer) ifFalse: [ self error: 'I require a Positive Integer: ' , aNumber printString ].
	(aNumber >= 0) ifFalse: [ self error: 'I require a Positive Integer: ' , aNumber printString ]! !

!PositiveIntegerEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/17/2022 21:22:40'!
example1
"
	PositiveIntegerEntryPanel example1
"
	| model |
	model := SignMorph forObject: 152.
	model openInWorld.
	^ self open: model label: 'Edit a positive integer'! !

!PositiveIntegerEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/17/2022 21:22:44'!
example2
"
	PositiveIntegerEntryPanel example2
"
	| model |
	model := SignMorph forObject: -152.
	"Expect failed invariant"
	^ self open: model label: 'Can''t negative integer'! !

!RangeFloatEntryPanel methodsFor: 'accessing' stamp: 'hlsf 3/19/2022 10:55:50'!
min: aMinFloat max: aMaxFloat
	min _ aMinFloat.
	max _ aMaxFloat ! !

!RangeFloatEntryPanel methodsFor: 'initialization' stamp: 'hlsf 4/9/2022 10:19:31'!
initialize
	super initialize .
	entry _ SimpleNumberEntryMorph floatRangeFrom: min to: max maxNumChars: 10 ::
		acceptCancelReceiver: self;
		setValue: model propertyValue;
		yourself! !

!RangeFloatEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 3/19/2022 11:41:15'!
checkValidity: aNumber between: min and: max
	(aNumber isKindOf: Number) ifFalse: [ self error: 'I require a Number ' , aNumber printString ].
	(aNumber between: min and: max) ifFalse: [
		self error: aNumber printString, ' is not in [ ', min printString, ' ; ', max printString, ' ]']
		! !

!RangeFloatEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 4/9/2022 10:22:03'!
open: aModel between: aMin and: aMax label: stringName
| panel |
	self checkValidity: aModel propertyValue between: aMin and: aMax.
	panel _ self basicNew :: 
		model: aModel;
		min: aMin max: aMax;
		initialize ;
		buildMorphicWindow.
	stringName ifNotNil: [panel setLabel: stringName].
	panel openInWorld.
	^ panel
		! !

!RangeFloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 3/19/2022 11:41:38'!
example1
"
	RangeFloatEntryPanel example1
"
	| model |
	model := SignMorph forObject: 0.15.
	model openInWorld.
	^ self open: model between: 0 and: 1 label: 'Edit a value in [0 ; 1]'! !

!RangeFloatEntryPanel class methodsFor: 'examples' stamp: 'KenD 3/19/2022 16:04:46'!
example2
"
	RangeFloatEntryPanel example2
"
	| model |
	model := SignMorph forObject: 1.15.
	model openInWorld.
	^ self open: model between: 0 and: 5 label: 'Edit a value in [0 ; 5]'! !

!RangeFloatEntryPanel class methodsFor: 'examples' stamp: 'KenD 3/21/2022 15:11:59'!
example3
"
	RangeFloatEntryPanel example3
"
	| model panel |
	model _ ValueHolder with: 3.1415.
	model inspect.
	panel _ self open: model between: 3 and: 4 label: 'Edit a value for pi'.
	model action: [ panel openInWorld]. "Panel is usually closed when property edited in the model, open it again"
	^ panel! !

!StringEntryPanel methodsFor: 'initialization' stamp: 'hlsf 7/3/2022 13:07:25'!
initialize
	super initialize.
	entry _ TextEntryMorph contents: model propertyValue ::
		acceptCancelReceiver: self;
		yourself.
	entry 	layoutSpec: 
		(LayoutSpec 
			proportionalWidth: 1 
			fixedHeight: (Preferences at: #windowTitleFont) lineSpacing )
		! !

!StringEntryPanel methodsFor: 'GUI building' stamp: 'KenD 9/14/2024 15:16:57'!
newPane

	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		gap: self defaultSeparation;
		axisEdgeWeight: #rowLeft;
		addMorph: entry ; "set in #initialize"
		color: Color transparent;
		borderColor: Color black.
	
	^ entryLayout ! !

!StringEntryPanel class methodsFor: 'examples' stamp: 'KenD 3/20/2022 16:05:08'!
example1
"
	StringEntryPanel example1 
"
	| model |
	model := SignMorph forObject: 'Cuis Smalltalk'.
	model openInWorld.
	"I use a SqueezeLabelMorph in my title"
	^ self open: model  label: 'The Smalltalk I use'! !

!StringEntryPanel class methodsFor: 'examples' stamp: 'hlsf 4/9/2022 10:32:32'!
example2
"
	StringEntryPanel example2
"
	| model |
	model := SignMorph forObject: 'Cuis Smalltalk'.
	model openInWorld.
	^ self openWide: model  label: 'The Smalltalk I use is...' .! !

!StringEntryPanel class methodsFor: 'examples' stamp: 'hlsf 4/9/2022 10:32:37'!
example3
"
	StringEntryPanel example3
"
	| model |
	model := ValueHolder with: 'a file name'.
	model action: [:value | Transcript show: value].
	^ self openWide: model  label: 'Name the sktech to keep, this is a long title'! !

!StringEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 11/3/2022 17:44:16'!
checkValidity: aString
	(aString isKindOf: CharacterSequence ) ifFalse: [ self error: 'I require a String: ' , aString printString ]! !

!TextEntryPanel methodsFor: 'initialization' stamp: 'hlsf 7/3/2022 13:07:28'!
initialize
	super initialize.
	entry _ TextModelMorph withText: model propertyValue.
	entry 	layoutSpec: (LayoutSpec 
		proportionalWidth: 1 
		fixedHeight: (Preferences at: #windowTitleFont) lineSpacing * 4 )! !

!TextEntryPanel methodsFor: 'events' stamp: 'hlsf 4/9/2022 10:27:37'!
accept
	self delete.
	model 	ifNotNil: [ :myModel | 			
		myModel propertyValue: entry scroller contents asString		].! !

!TextEntryPanel methodsFor: 'events' stamp: 'hlsf 4/9/2022 10:27:42'!
valueWhenDropped
	
	^ model  
		ifNotNil: [ :m | 	m propertyValue: entry scroller contents asString ] 
		ifNil: [ entry scroller contents asString]! !

!TextEntryPanel class methodsFor: 'examples' stamp: 'hlsf 4/9/2022 10:29:43'!
example1
"
	super example1 openInWorld
"! !

!TextEntryPanel class methodsFor: 'examples' stamp: 'hlsf 4/9/2022 10:31:30'!
example2
"
	super example2 openInWorld
"! !

!TextEntryPanel class methodsFor: 'examples' stamp: 'hlsf 4/9/2022 10:31:24'!
example3
"
	super example3 openInWorld
"! !

!WizardPanel methodsFor: 'GUI building' stamp: 'hlsf 7/21/2024 23:02:44'!
buildMorphicWindow
	super buildMorphicWindow .
	layoutMorph adoptWidgetsColor: self widgetsColor! !

!WizardPanel methodsFor: 'GUI building' stamp: 'hlsf 12/27/2021 10:25:18'!
newButtonArea
"Ask the current page its buttons, if any"
	^ buttonArea _  currentPageIndex ifNotNil: [ (pages at: currentPageIndex) buttons]! !

!WizardPanel methodsFor: 'GUI building' stamp: 'hlsf 12/27/2021 10:20:21'!
newPane
"Ask to the current page its pane, if any"
	^ currentPageIndex ifNotNil: [	(pages at: currentPageIndex) panel]! !

!WizardPanel methodsFor: 'accessing' stamp: 'hlsf 12/25/2021 16:51:55'!
emptyPane
	^ LayoutMorph newColumn 
		doAdoptWidgetsColor;
		adoptWidgetsColor: self widgetsColor.! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 11/3/2021 18:41:35'!
apply
	self triggerEvent: #apply! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 11/3/2021 18:43:02'!
cancel
	pages do: [:each | each delete].
	self delete.
	self triggerEvent: #cancel! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 10/31/2021 11:35:43'!
nextPage
	self goPage: currentPageIndex + 1
	! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 10/31/2021 11:35:43'!
previousPage
	self goPage: currentPageIndex - 1! !

!WizardPanel methodsFor: 'initialize-release' stamp: 'hlsf 11/3/2021 16:20:50'!
addPage: wizardPage
	pages add: wizardPage.
	currentPageIndex ifNil: ["The first added page is the first one to show"
		currentPageIndex _ 1.
		self setLabel: wizardPage title.
		self buildMorphicWindow	]! !

!WizardPanel methodsFor: 'initialize-release' stamp: 'hlsf 12/27/2021 11:10:57'!
addPages
" override to add the pages to your wizrard panel"
	self shouldBeImplemented ! !

!WizardPanel methodsFor: 'initialize-release' stamp: 'hlsf 10/31/2021 10:08:07'!
initialize
	super initialize.
	pages _ OrderedCollection new.! !

!WizardPanel methodsFor: 'navigation' stamp: 'hlsf 11/3/2021 18:40:47'!
goPage: number
	(number < 1 or: [number > pages size]) ifTrue: [^ self].
	currentPageIndex _ number.
	self setLabel: (pages at: currentPageIndex) title.
	self buildMorphicWindow.
	self triggerEvent: #page with: number.! !

!WizardPanel methodsFor: 'open/close' stamp: 'hlsf 11/19/2021 11:04:46'!
delete
	super delete.
	self releaseActionMap ! !

!WizardPanel methodsFor: 'open/close' stamp: 'hlsf 4/7/2022 15:54:46'!
minimumExtent
	^ 550 @ (350 max: super minimumExtent y)! !

!WizardPanel methodsFor: 'testing' stamp: 'hlsf 12/25/2021 16:53:33'!
isReadyToApply
	^ false! !

!WizardPanel methodsFor: 'event handling' stamp: 'hlsf 4/16/2023 12:48:33'!
refreshView

	self subclassResponsibility ! !

!WizardPanel class methodsFor: 'new-morph participation' stamp: 'KenD 3/13/2022 07:32:09'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ false! !

!WizardPanel class methodsFor: 'examples' stamp: 'hlsf 12/27/2021 11:09:57'!
example1
"
	self example1 openInWorld
"
| wizard | 
	wizard := WizardPanel open: nil label: 'A Wizard panel'.
	wizard 
		addPage: ((WizardPage firstPage: 'First page' on: wizard) 
			contents: 'A description for first page');
		addPage: ((WizardPage standardPage: 'Standard page' on: wizard) 
			contents: 'A description for standard page');
		addPage: ((WizardPage applyPage: 'Final page' on: wizard) 
			contents: 'Another description for apply page').
	^ wizard! !

!WizardPage methodsFor: 'accessing' stamp: 'KenD 9/14/2024 15:17:33'!
buttons
	^ buttons ifNil: [
		buttons := LayoutMorph newRow 
		gap: 5;
		axisEdgeWeight: #rowRight;
		yourself]! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 12/30/2021 10:11:12'!
contents: aStringOrMorph
	aStringOrMorph isString 
		ifTrue: [ "If string, just be our new panel"
			panel _ TextParagraphMorph contents: aStringOrMorph.
			panel 
				borderWidth: 0 ; 
				color: Color transparent]
		ifFalse: [ "If Morph, the Wizard directly gave us the panel with contents already set"
			panel _ aStringOrMorph]! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 10/31/2021 12:22:19'!
panel
	^ panel! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 10/31/2021 20:12:16'!
title
	^ title! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 10/31/2021 12:07:06'!
wizard: aWizard
	wizard _ aWizard 
	! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 3/1/2022 21:48:15'!
applyButton
	^ (PluggableButtonMorph 
		model: wizard
		action: #apply
		label: 'Apply') enableSelector: #isReadyToApply! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 3/1/2022 21:47:54'!
cancelButton
	^ PluggableButtonMorph 
		model: wizard
		action: #cancel
		label: 'Cancel'! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 3/1/2022 21:48:01'!
nextButton
	^ PluggableButtonMorph 
		model: wizard
		action: #nextPage
		label: 'Next'! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 3/1/2022 21:48:07'!
previousButton
	^ PluggableButtonMorph 
		model: wizard
		action: #previousPage
		label: 'Previous'! !

!WizardPage methodsFor: 'initialization' stamp: 'hlsf 11/3/2021 15:20:49'!
applyPage: string
	title _ string.
	self buttons
		addMorph: self cancelButton;
		addMorph: self previousButton;
		addMorph: self applyButton! !

!WizardPage methodsFor: 'initialization' stamp: 'hlsf 11/3/2021 15:08:57'!
delete
"Clean up if necessary at Wizard close"! !

!WizardPage methodsFor: 'initialization' stamp: 'hlsf 11/3/2021 15:16:13'!
firstPage: string
	title _ string.
	self buttons
		addMorph: self cancelButton;
		addMorph: self nextButton.! !

!WizardPage methodsFor: 'initialization' stamp: 'hlsf 11/3/2021 15:18:56'!
standardPage: string
	title _ string.
	self buttons
		addMorph: self cancelButton;
		addMorph: self previousButton;
		addMorph: self nextButton ! !

!WizardPage class methodsFor: 'instance creation' stamp: 'hlsf 11/3/2021 15:04:52'!
applyPage: aString on: aWizard
	^ self new 
		wizard: aWizard ;
		applyPage: aString;
		yourself! !

!WizardPage class methodsFor: 'instance creation' stamp: 'hlsf 11/3/2021 15:04:14'!
firstPage: aString on: aWizard
	^ self new 
		wizard: aWizard ;
		firstPage: aString;
		yourself! !

!WizardPage class methodsFor: 'instance creation' stamp: 'hlsf 11/3/2021 15:04:38'!
standardPage: aString on: aWizard
	^ self new 
		wizard: aWizard ;
		standardPage: aString;
		yourself! !

!InnerTextMorph methodsFor: '*UI-Panel' stamp: 'hlsf 3/25/2022 11:16:07'!
contents
	^ model actualContents ! !
