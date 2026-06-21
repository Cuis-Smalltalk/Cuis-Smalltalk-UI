'From Cuis7.9 [latest update: #8014] on 21 June 2026 at 10:45:00 am'!
'Description I supply titled Panels, useful windows simpler
than SystemWindows.'!
!provides: 'UI-Panel' 1 166!
!requires: 'Cuis-Base' 75 7734 nil!
!requires: 'UI-Core' 1 25 nil!
!requires: 'UI-Entry' 1 53 nil!
SystemOrganization addCategory: #'UI-Panel'!


!classDefinition: #BreadcrumbsPane category: #'UI-Panel'!
LinearLayoutMorph subclass: #BreadcrumbsPane
	instanceVariableNames: 'root navBar viewer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'BreadcrumbsPane class' category: #'UI-Panel'!
BreadcrumbsPane class
	instanceVariableNames: ''!

!classDefinition: #DecoratedPane category: #'UI-Panel'!
LinearLayoutMorph subclass: #DecoratedPane
	instanceVariableNames: 'label quickButtons widgetsColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'DecoratedPane class' category: #'UI-Panel'!
DecoratedPane class
	instanceVariableNames: ''!

!classDefinition: #SidePane category: #'UI-Panel'!
LinearLayoutMorph subclass: #SidePane
	instanceVariableNames: 'presenter categories currentCategoryView currentCategoryRow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'SidePane class' category: #'UI-Panel'!
SidePane class
	instanceVariableNames: ''!

!classDefinition: #FlapItem category: #'UI-Panel'!
PreviewMorph subclass: #FlapItem
	instanceVariableNames: 'target flap'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'FlapItem class' category: #'UI-Panel'!
FlapItem class
	instanceVariableNames: ''!

!classDefinition: #Flap category: #'UI-Panel'!
LabelMorph subclass: #Flap
	instanceVariableNames: 'folded prevPosition objects panel target'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'Flap class' category: #'UI-Panel'!
Flap class
	instanceVariableNames: ''!

!classDefinition: #FlowLayoutMorph category: #'UI-Panel'!
PluggableScrollPane subclass: #FlowLayoutMorph
	instanceVariableNames: 'cells allowsSubmorphDrag alignment'
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
	instanceVariableNames: 'currentPageIndex acceptSelector currentPage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'WizardPanel class' category: #'UI-Panel'!
WizardPanel class
	instanceVariableNames: ''!

!classDefinition: #SidePaneExample category: #'UI-Panel'!
Object subclass: #SidePaneExample
	instanceVariableNames: 'icons'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Panel'!
!classDefinition: 'SidePaneExample class' category: #'UI-Panel'!
SidePaneExample class
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

!SidePane commentStamp: 'hlsf 27/Apr/2026 20:59:54' prior: 0!
I am a side bar to navigate in categories of various sections, features or options

- categories :  collection of 2-array or 3-array:
   2-array: Category name, message symbol
   3-array: Category name, message symbol, icon symbol
Message symbol is sent to the presenter to get the Category view to display
Icon symbol is used against the IconImporter provider by the presenter's 'icons' method

- presenter: an object responsible to provide each category view and optionally
an icons importer (IconImporter class)
!

!FlapItem commentStamp: '<historical>' prior: 0!
I encapsulate Object presented in a Flap.
- target : a Morph Class I accept to be drop into
- flap : the flap I am from!

!Flap commentStamp: '<historical>' prior: 0!
A flap holding collection of objects to be dragged and drop on targetMorph.
- folded : boolean, when true the button is set on the bottom of its owner at an arbitrary horizontal position
- objects : a collection of objects I present when unfolded and the user can drag away
- panel : the box morph I am attached to
- target : the target morph Class this flap is dedicated to.!

!FlowLayoutMorph commentStamp: '<historical>' prior: 0!
I arrange box morphs in a continuous flow in one or several line depending on my width. 
If my height is too small to contain all the morphs, I add a vertical scrollbar.!

!PluggableScrollBar commentStamp: '<historical>' prior: 0!
I am a ScrollBar which can get new values from my model.!

!Panel commentStamp: 'hlsf 5/1/2025 23:53:42' prior: 0!
I am an abstract Panel
- I present morphs in a panel. (see buildMorphicWindow)
- I am decorated with a window title with optional buttons
!

!DialogPanel commentStamp: '<historical>' prior: 0!
I am an abstract dialog panel with a button area at my bottom.!

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

!BreadcrumbsPane methodsFor: 'initialization' stamp: 'hlsf 30/Sep/2023, 3:15:00 pm (UTC)'!
initialize
	super initialize.
	navBar := LayoutMorph newRow.
	navBar separation: 2@0.
	self addMorphKeepMorphHeight: navBar.
	self adoptWidgetsColor: self defaultBorderColor 
! !

!BreadcrumbsPane methodsFor: 'initialization' stamp: 'hlsf 30/Jun/2023, 7:42:00 pm (UTC)'!
root: anObject
	root := anObject.
	navBar removeAllMorphs;
		addMorph: (self sliceButtonFor: root).		
	self addMorph: (anObject accept: viewer new).
	! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 3/Jul/2023, 9:59:00 am (UTC)'!
browseTo: anObject
	self replaceViewWith: anObject.
	navBar addMorph: (self sliceButtonFor: anObject).! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 6/Jun/2023, 7:45:00 pm (UTC)'!
removeSliceButtonsAfter: aNavButton
" Search for the navButtons coming after aNavButton, then remove them from the navBar "
	| toDelete |
	toDelete := OrderedCollection new.
	navBar submorphsInFrontOf: aNavButton do: [:aSliceButton | toDelete add: aSliceButton].
	navBar removeAllMorphsIn: toDelete! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 27/May/2026, 7:29:18 pm (UTC)'!
replaceView: aView byView: anotherView
" Replace a view in the pane with another viewer and shrink the panel "
	aView removeAllActions .
	self replaceSubmorph: aView by: anotherView .
	self morphExtent: self minimumExtent.
	self adoptWidgetsColor: self defaultBorderColor! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 2/Jul/2023, 11:03:00 am (UTC)'!
replaceViewWith: anObject
"Replace the main view in the pane with the viewer of the given object"
	self replaceView: submorphs first byView: (anObject accept: viewer new)! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 26/Apr/2026, 8:28:22 am (UTC)'!
sliceButtonFor: anObject
" A navigation button to browse anObject "
	| navButton |
	navButton := nil.
	anObject when: #browseTo send: #browseTo: to: self.
	navButton := PluggableButtonMorph 
		model: [self replaceViewWith: anObject.
			self removeSliceButtonsAfter: navButton.
			navButton adoptWidgetsColor: self defaultBorderColor lighter] 
		action: #value label: anObject printString.
	anObject when: #edited send: #updateSliceButton:with: to: self withArguments: {navButton . anObject}.
	navButton adoptWidgetsColor: self defaultBorderColor lighter .
	^ navButton! !

!BreadcrumbsPane methodsFor: 'navigate' stamp: 'hlsf 27/Jun/2023, 10:10:00 pm (UTC)'!
updateSliceButton: button with: anObject
	button label: anObject printString.
	navBar layoutSubmorphs ! !

!BreadcrumbsPane methodsFor: 'accessing' stamp: 'hlsf 3/Jul/2023, 1:10:00 pm (UTC)'!
adoptWidgetsColor: aColor 
	super adoptWidgetsColor: aColor.
	color := Theme current paneBackgroundFrom: aColor.! !

!BreadcrumbsPane methodsFor: 'accessing' stamp: 'hlsf 3/Jul/2023, 1:09:00 pm (UTC)'!
defaultBorderColor
	^ Theme current transcript! !

!BreadcrumbsPane methodsFor: 'accessing' stamp: 'hlsf 3/Jul/2023, 1:09:00 pm (UTC)'!
defaultColor
	^Theme current paneBackgroundFrom: self defaultBorderColor ! !

!BreadcrumbsPane methodsFor: 'accessing' stamp: 'hlsf 26/Jun/2023, 8:08:00 pm (UTC)'!
viewer: aViewerVisitorClass
	viewer := aViewerVisitorClass! !

!BreadcrumbsPane class methodsFor: 'instance creation' stamp: 'hlsf 30/Jun/2023, 7:43:00 pm (UTC)'!
on: anObject with: viewerVisitorClass
	^ self newColumn 
		viewer: viewerVisitorClass ;
		root: anObject ;		
		yourself! !

!BreadcrumbsPane class methodsFor: 'new-morph participation' stamp: 'hlsf 9/Jan/2025, 6:37:00 pm (UTC)'!
includeInNewMorphMenu
	^ false! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 2/Jul/2023, 10:11:00 pm (UTC)'!
adoptWidgetsColor: aColor 
	super adoptWidgetsColor: aColor.
	color := Theme current paneBackgroundFrom: aColor.! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 1/Jul/2023, 7:15:00 pm (UTC)'!
contents: aPane
	self addMorphUseAll: aPane.
	self adoptWidgetsColor: self defaultBorderColor ! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 6/May/2023, 7:58:00 am (UTC)'!
elasticMorph
	"The elastic morph between the title and the quickbuttons "
	^ self topRow submorphs second! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 29/May/2023, 9:53:00 am (UTC)'!
label: aString
	label contents: aString ! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 30/May/2023, 5:09:00 pm (UTC)'!
quickButtons
	^ quickButtons! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 29/May/2023, 10:34:00 am (UTC)'!
quickButtons: collection
	quickButtons removeAllMorphs.
	collection ifNotNil: [ collection do: [:aButton | quickButtons addMorph: aButton ] ]! !

!DecoratedPane methodsFor: 'accessing' stamp: 'hlsf 4/May/2023, 7:47:00 pm (UTC)'!
topRow
	^ submorphs last! !

!DecoratedPane methodsFor: 'initialization' stamp: 'hlsf 29/May/2023, 1:45:00 pm (UTC)'!
defaultBorderColor
	^ Theme current transcript! !

!DecoratedPane methodsFor: 'initialization' stamp: 'hlsf 29/May/2023, 1:55:00 pm (UTC)'!
defaultColor
	^Theme current paneBackgroundFrom: self defaultBorderColor ! !

!DecoratedPane methodsFor: 'initialization' stamp: 'hlsf 12/Sep/2024, 9:25:00 am (UTC)'!
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

!DecoratedPane methodsFor: 'initialization' stamp: 'hlsf 29/May/2023, 1:47:00 pm (UTC)'!
textBackgroundColor
	^Theme current paneBackgroundFrom: borderColor ! !

!DecoratedPane methodsFor: 'drawing' stamp: 'hlsf 12/Sep/2024, 8:45:00 am (UTC)'!
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

!DecoratedPane methodsFor: 'geometry testing' stamp: 'hlsf 4/May/2023, 7:32:00 pm (UTC)'!
requiresVectorCanvas
	^ true! !

!DecoratedPane methodsFor: 'geometry' stamp: 'jmv 7/Jan/2025, 9:53:00 am (UTC)'!
morphExtent: newExtent
	super morphExtent: newExtent.
	"Hack. This BoxMorph is drawing outside its bounds."
	self redrawNeeded! !

!DecoratedPane class methodsFor: 'examples' stamp: 'hlsf 3/May/2025, 7:15:00 am (UTC)'!
example1
"
	self example1 openInWorld
"
	| buttons |
	buttons :=	 OrderedCollection new.
	buttons add: (PluggableButtonMorph 
		model: Switch newOff stateGetter: #isOn 	action: #switch ::
		icon: Theme current globeIcon ;
		setBalloonText: 'Use GMT time zone';
		yourself).
	buttons add: (PluggableButtonMorph 
		model: Switch newOff action: #switch ::
		icon: Theme current clockIcon ;
		setBalloonText: 'Set the time';
		yourself).
	^ DecoratedPane 
		open: Sample09Clock new 
		label: 'A Label for the Pane'
		quickButtons: buttons! !

!DecoratedPane class methodsFor: 'examples' stamp: 'KenD 17/Jul/2024, 1:01:00 pm (UTC)'!
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

!DecoratedPane class methodsFor: 'examples' stamp: 'hlsf 9/Jan/2025, 6:40:00 pm (UTC)'!
initializedInstance
	^ self example1! !

!DecoratedPane class methodsFor: 'instance creation' stamp: 'hlsf 4/May/2023, 5:42:00 pm (UTC)'!
new
	^ self newColumn ! !

!DecoratedPane class methodsFor: 'instance creation' stamp: 'hlsf 29/May/2023, 12:38:00 pm (UTC)'!
open: aPane label: aString
	^ self open: aPane label: aString quickButtons: nil! !

!DecoratedPane class methodsFor: 'instance creation' stamp: 'hlsf 13/Jun/2023, 6:46:00 pm (UTC)'!
open: aPane label: aString quickButtons: aCollection
	| pane |
	pane := self new
		label: aString ;
		quickButtons: aCollection;
		contents: aPane.
	^ pane! !

!SidePane methodsFor: 'accessing' stamp: 'hlsf 23/May/2026, 1:36:49 pm (UTC)'!
categories: aCollection
	categories := aCollection ! !

!SidePane methodsFor: 'accessing' stamp: 'hlsf 26/Apr/2026, 8:35:32 am (UTC)'!
presenter: anObject
	presenter := anObject 
	! !

!SidePane methodsFor: 'accessing' stamp: 'hlsf 23/May/2026, 1:47:05 pm (UTC)'!
selectCategory: aCategoryTitle
" Simulate a click on the category title "
	aCategoryTitle perform: #'mouseButton1Up:localPosition:' withArguments: #(0 0)
	! !

!SidePane methodsFor: 'accessing' stamp: 'hlsf 23/May/2026, 1:50:14 pm (UTC)'!
selectCategoryNamed: viewMessageSymbol
"	the symbol used to get the view if the category "
	self selectCategory: (self sidebar submorphsSatisfying: [:m | m name = viewMessageSymbol ]) first
		
	! !

!SidePane methodsFor: 'accessing' stamp: 'hlsf 23/May/2026, 1:47:39 pm (UTC)'!
selectFirstCategory
	self selectCategory: self sidebar lastSubmorph
	! !

!SidePane methodsFor: 'accessing' stamp: 'hlsf 4/May/2026, 7:53:34 pm (UTC)'!
sidebar
	^ self lastSubmorph ! !

!SidePane methodsFor: 'action' stamp: 'hlsf 27/May/2026, 7:29:24 pm (UTC)'!
select: actionMessage
	| newView | 
	newView := presenter perform: actionMessage.
	currentCategoryView ifNotNil: [
			currentCategoryView removeAllActions .
			self removeMorph: currentCategoryView].
	self addMorph: newView layoutSpec: (LayoutSpec useAll offAxisEdgeWeight: 0).
	self morphExtent: self minimumExtent.
	newView adoptWidgetsColor: presenter defaultBorderColor.
	currentCategoryView := newView.
	self triggerEvent: #selectedCategory with: actionMessage! !

!SidePane methodsFor: 'initialization' stamp: 'hlsf 23/May/2026, 1:37:34 pm (UTC)'!
initialize
	| sideBar |
	super initialize.
	self beRow.
	self color: presenter defaultColor.
	sideBar := LinearLayoutMorph newColumn color: presenter defaultColor.
	self addMorph: sideBar layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0).
	categories do: [:labelAndAction | 
		sideBar addMorph: (self categoryBtn: labelAndAction ) layoutSpec: (LayoutSpec useAll offAxisEdgeWeight: 0)].
	self selectFirstCategory ! !

!SidePane methodsFor: 'ui' stamp: 'hlsf 23/May/2026, 1:41:28 pm (UTC)'!
categoryBtn: labelAndAction
	| row label isIconic |
	isIconic := labelAndAction size = 3.
	row := LinearLayoutMorph newRow 
		borderWidth: 8;
		separation: 16;
		borderColor: Color transparent;
		color: presenter defaultColor;
		name: labelAndAction second.
	label := (LabelMorph contents: labelAndAction first) 
		emphasis: 1;
		color: self unselectedCategoryColor .
	isIconic ifTrue: [ | image |
		image := presenter icons 
			getMorph: labelAndAction third 
			ofSize: label morphHeight rounded 
			fill: self unselectedCategoryColor.
		image 
			setProperty: #icon toValue: labelAndAction third. 
		row addMorph: image
			layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0.5)].
		
	row addMorph: label layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0.5).
	row 
		setProperty:  #handlesMouseDown: toValue: true;
		setProperty: #'mouseButton1Up:localPosition:' toValue: [:evt :localPosition | 
			currentCategoryRow ifNotNil: [
				self setCategory: currentCategoryRow toColor: self unselectedCategoryColor.
				currentCategoryRow color: presenter defaultColor].
			currentCategoryRow := row.
			self setCategory: currentCategoryRow toColor: self selectedCategoryColor.
			row color: presenter defaultColor lighter.
			self select: labelAndAction second].
	^ row! !

!SidePane methodsFor: 'ui' stamp: 'hlsf 27/Apr/2026, 8:09:31 pm (UTC)'!
selectedCategoryColor
	^ Color black! !

!SidePane methodsFor: 'ui' stamp: 'hlsf 27/Apr/2026, 8:55:45 pm (UTC)'!
setCategory: categoryRow toColor: aColor
"	Set the color scheme of the row contents to the given color "
	| image contents |
	contents := categoryRow submorphs.
	contents first color: aColor.
"	Is there an icon? "
	contents size = 1 ifTrue: [^ self ].
	image := contents second.
	image image: (presenter icons 
			getForm: (image valueOfProperty: #icon)
			ofSize: image form width 
			fill: aColor)! !

!SidePane methodsFor: 'ui' stamp: 'hlsf 27/Apr/2026, 8:09:42 pm (UTC)'!
unselectedCategoryColor
	^ Color lightGray lighter! !

!SidePane class methodsFor: 'instance creation' stamp: 'hlsf 23/May/2026, 1:38:35 pm (UTC)'!
on: aPresenter with: aCollection
	^ self basicNew
		presenter: aPresenter;
		categories: aCollection ;
		initialize;
		yourself! !

!SidePane class methodsFor: 'new-morph participation' stamp: 'hlsf 26/Apr/2026, 8:20:51 am (UTC)'!
includeInNewMorphMenu
	^ false! !

!FlapItem methodsFor: 'accessing' stamp: 'hlsf 13/Feb/2025, 8:35:00 am (UTC)'!
flap
	^ flap! !

!FlapItem methodsFor: 'accessing' stamp: 'hlsf 13/Feb/2025, 8:35:00 am (UTC)'!
flap: aFlap
	flap := aFlap ! !

!FlapItem methodsFor: 'accessing' stamp: 'hlsf 9/Feb/2025, 7:48:00 am (UTC)'!
imageMorph
	^ submorphs last! !

!FlapItem methodsFor: 'accessing' stamp: 'hlsf 9/Feb/2025, 10:00:00 am (UTC)'!
target
	^ target! !

!FlapItem methodsFor: 'accessing' stamp: 'hlsf 9/Feb/2025, 10:01:00 am (UTC)'!
target: aMoprh
	target := aMoprh ! !

!FlapItem methodsFor: 'dropping/grabbing' stamp: 'hlsf 13/Feb/2025, 8:39:00 am (UTC)'!
aboutToBeGrabbedBy: aMorph
" I am still owned by my flap, request it the target I am destinated for "
	^ FlapItem object: object image: self imageMorph form ::
			target: flap target;
			flap: flap;
			color: color;
			borderColor: borderColor;
			borderWidth: 1! !

!FlapItem methodsFor: 'dropping/grabbing' stamp: 'hlsf 9/Feb/2025, 3:59:00 pm (UTC)'!
justDroppedInto: aTarget event: aDropEvent.
	self delete! !

!FlapItem methodsFor: 'dropping/grabbing' stamp: 'hlsf 9/Feb/2025, 9:49:00 am (UTC)'!
rejectDropMorphEvent: dropEvent
	self hide; delete.
	self world ifNotNil: [ :w | w activeHand removeMorph: self ].
! !

!FlapItem methodsFor: 'dropping/grabbing' stamp: 'hlsf 9/Feb/2025, 4:16:00 pm (UTC)'!
wantsToBeDroppedInto: aMorph
" This is the siblling attached to the hand morph, use the target atttribute "
	^ aMorph class = target! !

!FlapItem methodsFor: 'testing' stamp: 'hlsf 9/Feb/2025, 4:13:00 pm (UTC)'!
is: aSymbol
	^ aSymbol == #FlapItem or: [ super is: aSymbol ]! !

!Flap methodsFor: 'initialization' stamp: 'hlsf 9/Feb/2025, 7:05:00 am (UTC)'!
defaultBorderColor
	^ Color pink! !

!Flap methodsFor: 'initialization' stamp: 'hlsf 7/Feb/2025, 7:18:00 pm (UTC)'!
defaultBorderWidth
	^ 2! !

!Flap methodsFor: 'initialization' stamp: 'hlsf 5/Feb/2025, 8:28:00 pm (UTC)'!
defaultPadding
	^ `8@8`! !

!Flap methodsFor: 'initialization' stamp: 'hlsf 10/Sep/2025, 2:15:00 pm (UTC)'!
initialize
	super initialize.
	self borderColor: self defaultBorderColor.
	folded := true! !

!Flap methodsFor: 'accessing' stamp: 'hlsf 5/Feb/2025, 10:12:00 pm (UTC)'!
borderColor: aColor
	color := aColor luminance > 0.5 ifTrue: [Color black] ifFalse: [Color white].
	super borderColor: aColor ! !

!Flap methodsFor: 'accessing' stamp: 'hlsf 6/Feb/2025, 9:16:00 am (UTC)'!
color: aColor
" Label color is automatically set. See #borderColor: "! !

!Flap methodsFor: 'accessing' stamp: 'hlsf 7/Feb/2025, 7:57:00 pm (UTC)'!
fillColor

	^ borderColor twiceLighter! !

!Flap methodsFor: 'accessing' stamp: 'hlsf 21/Jun/2026, 8:41:29 am (UTC)'!
iconicObjects: dyboScripts
	objects := dyboScripts collect: [:each | | item |
		item := FlapItem 
			object: each 
			image: each icon
			buttons: nil 
			label: each title ::
			setBalloonText: each description;
			flap: self;
			setProperty: #allowsItemDrag toValue: true;
			adoptWidgetsColor: borderColor;
			borderWidth: 2.
		item imageMorph setBalloonText: each description.
		item]! !

!Flap methodsFor: 'accessing' stamp: 'hlsf 13/Feb/2025, 8:35:00 am (UTC)'!
objects: placedMorphs
	objects := placedMorphs collect: [:each |
		FlapItem 
			object: each 
			image: (each imageForm: 32)
			buttons: nil 
			label: each name ::
			flap: self;
			setProperty: #allowsItemDrag toValue: true;
			adoptWidgetsColor: borderColor;
			borderWidth: 1]! !

!Flap methodsFor: 'accessing' stamp: 'hlsf 9/Feb/2025, 9:53:00 am (UTC)'!
target
	^ target! !

!Flap methodsFor: 'accessing' stamp: 'hlsf 9/Feb/2025, 9:53:00 am (UTC)'!
target: aMorph
	target := aMorph ! !

!Flap methodsFor: 'drawing' stamp: 'hlsf 7/Feb/2025, 7:57:00 pm (UTC)'!
drawOn: aCanvas
	| pen control inExtent halfBorder |
	halfBorder := borderWidth / 2.0.
	pen := halfBorder  @ (extent y - halfBorder).
	inExtent := self interiorExtent.
	aCanvas strokeWidth: borderWidth color: borderColor fillColor: self fillColor do: [
		control := pen + (padding x + borderWidth @ 0).
		aCanvas moveTo: pen;
			quadraticBezierTo: (pen := pen + (padding x + borderWidth @ padding y negated) )
			control: control.
		aCanvas lineTo: (pen := pen - (0 @ (inExtent y + borderWidth))).
		control := pen - (0@ padding y).
		aCanvas 
			quadraticBezierTo:  (pen := pen + (padding x @ padding y negated))
			control:  control.
		aCanvas lineTo: (pen := pen + (inExtent x - padding x - padding x - borderWidth @ 0)).
		control := pen + (padding x @ 0).
		aCanvas 
			quadraticBezierTo: (pen := pen + padding)
			control: control.
		aCanvas lineTo: (pen := pen + (0 @ (inExtent y ))).
		pen := extent - halfBorder .
		control := pen - (padding x + borderWidth @0).
		aCanvas 
			quadraticBezierTo: pen
			control:  control.
		"aCanvas  moveTo: halfBorder  @ (extent y - halfBorder)"].
	aCanvas
		drawString: (contents ifNil: [ '' ])
		at: self interiorOrigin
		font: self fontToUse
		color: color.
! !

!Flap methodsFor: 'geometry testing' stamp: 'hlsf 5/Feb/2025, 8:50:00 pm (UTC)'!
requiresVectorCanvas
	^ true ! !

!Flap methodsFor: 'events' stamp: 'hlsf 7/Feb/2025, 8:13:00 pm (UTC)'!
mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition
	self comeToFront.
	panel ifNotNil: [panel comeToFront ]! !

!Flap methodsFor: 'events' stamp: 'hlsf 7/Feb/2025, 4:56:00 pm (UTC)'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition
	prevPosition ifNil: [self toggleFolded].
	prevPosition := nil! !

!Flap methodsFor: 'events' stamp: 'hlsf 23/Sep/2025, 4:00:00 pm (UTC)'!
mouseMove: aMouseMoveEvent localPosition: localEventPosition
	aMouseMoveEvent anyButtonPressed ifFalse: [ ^ self ].
	prevPosition ifNotNil: [
		| delta |
		delta := aMouseMoveEvent eventPosition - prevPosition.
		(folded and: [delta y < -20 and: [delta y abs > delta x abs] ])
			ifTrue:  [self unfold]
			ifFalse: [self translateWith: delta] ].
	prevPosition := aMouseMoveEvent eventPosition! !

!Flap methodsFor: 'event handling testing' stamp: 'hlsf 7/Feb/2025, 3:15:00 pm (UTC)'!
handlesMouseDown: mouseButtonEvent
	^ true! !

!Flap methodsFor: 'flap ops' stamp: 'hlsf 9/Feb/2025, 3:40:00 pm (UTC)'!
fold
	folded := true.
	panel ifNotNil: [ panel delete].
	panel := nil.
	self repositionning ! !

!Flap methodsFor: 'flap ops' stamp: 'hlsf 17/Feb/2025, 9:28:00 pm (UTC)'!
repositionning
	self translateWith: 0@-200! !

!Flap methodsFor: 'flap ops' stamp: 'hlsf 7/Feb/2025, 7:37:00 pm (UTC)'!
toggleFolded
	folded ifTrue: [self unfold] ifFalse: [self fold]! !

!Flap methodsFor: 'flap ops' stamp: 'hlsf 10/Sep/2025, 2:12:00 pm (UTC)'!
translateWith: aVector
	| newPosition |
	newPosition :=(folded 
		ifTrue: [self morphPosition x + aVector x @ (borderWidth / 2.0 + owner morphHeight - self morphHeight )]
		ifFalse: [self morphPosition + aVector]).
	self morphPosition: (newPosition adhereTo: (owner fullBoundsInOwner extendBy: (self morphWidth negated @0))).
	folded ifFalse: [
		panel
			morphPosition: 0@ (self morphPosition y + self morphHeight - borderWidth);
			morphExtent: owner morphWidth @ (owner morphHeight - self morphPosition y - self morphHeight + (borderWidth / 2.0))]! !

!Flap methodsFor: 'flap ops' stamp: 'hlsf 17/Feb/2025, 9:27:00 pm (UTC)'!
unfold
	folded := false.
	panel := FlowLayoutMorph new.
	panel setProperty: #flap toValue: self.
	owner addMorph: panel.
	panel 
		allowsDrag ;
		cells: objects;
		morphPosition: 0@ (owner morphHeight - 200);
		morphExtent: owner morphWidth @ 200;
		color: self fillColor;
		adoptWidgetsColor: self fillColor.
	self repositionning 
	! !

!Flap methodsFor: 'menu' stamp: 'hlsf 9/Feb/2025, 6:59:00 am (UTC)'!
addCustomMenuItems: aCustomMenu hand: aHandMorph

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'close definitely' action: #delete! !

!Flap methodsFor: 'submorphs-add/remove' stamp: 'hlsf 9/Feb/2025, 7:00:00 am (UTC)'!
delete
	super delete.
	panel ifNotNil: [panel delete]! !

!Flap methodsFor: 'testing' stamp: 'hlsf 9/Feb/2025, 3:36:00 pm (UTC)'!
is: aSymbol
	^ aSymbol == #Flap or: [super is: aSymbol ]! !

!Flap methodsFor: 'submorphs-accessing' stamp: 'hlsf 10/Sep/2025, 2:49:00 pm (UTC)'!
noteNewOwner: newOwner
" if any flaps already installed, ovoid flaps occlusion "
	| flaps maxX|
	flaps := newOwner submorphs select: [:aMorph | (aMorph is: #Flap) and: [aMorph ~= self] ].
	maxX := flaps inject: 0 into: [:length :aFlap | length + aFlap morphWidth].
	self morphPosition: maxX @ 0.
	owner isWorldMorph ifTrue: [self repositionning]! !

!Flap methodsFor: 'as yet unclassified' stamp: 'hlsf 13/Sep/2025, 7:12:00 pm (UTC)'!
aboutToBeGrabbedBy: aHand
	^ nil! !

!Flap class methodsFor: 'new-morph participation' stamp: 'hlsf 6/Feb/2025, 8:20:00 am (UTC)'!
includeInNewMorphMenu
	^ false! !

!Flap class methodsFor: 'instance creation' stamp: 'hlsf 21/Jun/2026, 8:41:29 am (UTC)'!
label: aString emphasis: emphasis iconicObjects: dyboScripts
"	label: the name of the flap 
 	emphasis: Text emphasis applyed to the label, nil for none 
	iconicObjects: array of PlacedMorphs of this flap, these understand the #icon message as view in the flap
"
	| flap |
	flap := self contents: aString font: nil emphasis: emphasis.
	flap iconicObjects: dyboScripts.
	^ flap
	
! !

!Flap class methodsFor: 'instance creation' stamp: 'hlsf 21/Jun/2026, 8:37:31 am (UTC)'!
label: aString emphasis: emphasis objects: placedMorphs
"	label: the name of the flap 
 	emphasis: Text emphasis applyed to the label, nil for none 
	objects: array of PlacedMorphs of this flap, the iconic view of each is computed from its imageForm
"
	| flap |
	flap := self contents: aString font: nil emphasis: emphasis.
	flap objects: 	placedMorphs .
	^ flap
	
! !

!Flap class methodsFor: 'instance creation' stamp: 'hlsf 21/Jun/2026, 8:40:29 am (UTC)'!
label: aString iconicObjects: dyboScripts
	^ self label: aString emphasis: 0 iconicObjects: dyboScripts 
! !

!Flap class methodsFor: 'instance creation' stamp: 'hlsf 7/Feb/2025, 5:07:00 pm (UTC)'!
label: aString objects: placedMorphs
	^ self label: aString emphasis: 0 objects: placedMorphs 
! !

!Flap class methodsFor: 'examples' stamp: 'hlsf 10/Sep/2025, 2:08:00 pm (UTC)'!
example1
"
	self example1
"
	| flap cells |
	cells := OrderedCollection new.
	50 timesRepeat: [ cells add: (ColoredBoxMorph new :: 
			morphExtent: (5 to: 80) atRandom asPoint;
			color: Color random)].
	flap := self contents: ' Hello World!! '.
	flap objects: cells;
		openInWorld.
	^ flap
	! !

!Flap class methodsFor: 'examples' stamp: 'hlsf 10/Sep/2025, 2:08:00 pm (UTC)'!
example2
"
	self example2
"
	| flap cells |
	cells := Array 
		with: (Sample09Clock new :: name: 'An analog clock with a second hand ticking every seconds'; yourself)
		with: Sample01Star new.
	
	flap := self label: ' Graphics Objects ' emphasis: 1 objects: cells.
	flap	openInWorld.
	^flap
	! !

!Flap class methodsFor: 'examples' stamp: 'hlsf 10/Sep/2025, 12:52:00 pm (UTC)'!
example3
"
	self example1 borderColor: Color blue. 
	self example2 borderColor: Color yellow
"
" The two flaps are installed side by side and do not not overlap "! !

!FlowLayoutMorph methodsFor: 'initialization' stamp: 'hlsf 6/Feb/2025, 9:11:00 am (UTC)'!
defaultBorderColor
	^ Theme current transcript! !

!FlowLayoutMorph methodsFor: 'initialization' stamp: 'hlsf 6/Feb/2025, 9:11:00 am (UTC)'!
defaultColor
	^Theme current paneBackgroundFrom: self defaultBorderColor ! !

!FlowLayoutMorph methodsFor: 'initialization' stamp: 'hlsf 6/Feb/2025, 10:01:00 am (UTC)'!
defaultExtent
	^ `400@300`! !

!FlowLayoutMorph methodsFor: 'initialization' stamp: 'hlsf 21/Apr/2025, 10:13:00 pm (UTC)'!
initialize
	super initialize.
	self alwaysHideHorizontalScrollbar.
	allowsSubmorphDrag := false.
	alignment := #center.
	cells := #().
	self layoutSpec: LayoutSpec useAll;
		scroller: (LayoutMorph newColumn color: Color transparent)! !

!FlowLayoutMorph methodsFor: 'initialization' stamp: 'hlsf 21/Apr/2025, 9:55:00 pm (UTC)'!
newRow
	| row |
	row := ​ LayoutMorph newRow :: 
		separation: self gap ; 
		color: Color transparent.
	allowsSubmorphDrag ifTrue: [row setProperty: #allowsSubmorphDrag toValue: true].
	^ row
	! !

!FlowLayoutMorph methodsFor: 'accessing' stamp: 'hlsf 21/Apr/2025, 10:15:00 pm (UTC)'!
align: symbol
" how to align vertically the cells in each row.
Possible value: #rowTop #center #rowBottom "
	alignment := symbol ! !

!FlowLayoutMorph methodsFor: 'accessing' stamp: 'hlsf 9/Feb/2025, 6:40:00 am (UTC)'!
allowsDrag
	allowsSubmorphDrag := true! !

!FlowLayoutMorph methodsFor: 'accessing' stamp: 'hlsf 6/Feb/2025, 6:23:00 pm (UTC)'!
cells: morphs
	cells := morphs.	
	self updateLayout! !

!FlowLayoutMorph methodsFor: 'accessing' stamp: 'hlsf 6/Feb/2025, 6:20:00 pm (UTC)'!
gap
" Gap between two previews in a row "
	^ 12	! !

!FlowLayoutMorph methodsFor: 'layout' stamp: 'hlsf 21/Apr/2025, 10:15:00 pm (UTC)'!
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
		row 
			addMorph: cell 
			layoutSpec: (cell layoutSpec offAxisEdgeWeight: alignment).
		leftSpace := leftSpace - w - self gap]! !

!FlowLayoutMorph methodsFor: 'geometry' stamp: 'hlsf 6/Feb/2025, 6:06:00 pm (UTC)'!
extentChanged: oldExtent	
	self updateLayout.
	super extentChanged: oldExtent.! !

!FlowLayoutMorph class methodsFor: 'examples' stamp: 'hlsf 13/Feb/2025, 6:16:00 pm (UTC)'!
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

!FlowLayoutMorph class methodsFor: 'examples' stamp: 'hlsf 13/Feb/2025, 6:18:00 pm (UTC)'!
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

!FlowLayoutMorph class methodsFor: 'examples' stamp: 'hlsf 13/Feb/2025, 6:18:00 pm (UTC)'!
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

!PluggableScrollBar methodsFor: 'initialization' stamp: 'KenD 1/Dec/2025, 11:54:00 am (UTC)'!
fontPreferenceChanged
	| buttonExtent |
	
	buttonExtent := Theme current scrollbarThickness - 2.
	super fontPreferenceChanged.
	slider morphExtent: (buttonExtent @ buttonExtent).! !

!PluggableScrollBar methodsFor: 'initialization' stamp: 'KenD 1/Dec/2025, 11:52:00 am (UTC)'!
initialize
	| buttonExtent |
	buttonExtent := Theme current scrollbarThickness - 2.
	super initialize.
	slider morphExtent:  (buttonExtent @ buttonExtent).! !

!PluggableScrollBar methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013, 4:44:00 pm (UTC)'!
model: thang setValueSelector: setValueSym refreshValueSelector: getValueSym

	model := thang.
	setValueSelector := setValueSym.
	refreshValueSelector := getValueSym ! !

!PluggableScrollBar methodsFor: 'accessing' stamp: 'KenD 8/Feb/2022, 3:40:00 pm (UTC)'!
value
	
	^value! !

!PluggableScrollBar methodsFor: 'accessing' stamp: 'KenD 8/Feb/2022, 3:38:00 pm (UTC)'!
value: zeroToOne

	value := zeroToOne min: 1.0 max: 0.0! !

!PluggableScrollBar methodsFor: 'model access' stamp: 'KenD 8/Feb/2022, 5:47:00 am (UTC)'!
refreshValueFromModel
	"Called externally to reset value from model"

	refreshValueSelector ifNotNil: [
		self 
			value:  (model perform: refreshValueSelector) ;
			computeSlider.
	]! !

!PluggableScrollBar class methodsFor: 'new-morph participation' stamp: 'KenD 6/Dec/2013, 5:06:00 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!Panel methodsFor: 'printing' stamp: 'KenD 24/Apr/2015, 2:04:00 pm (UTC)'!
printOn: aStream 

	super printOn: aStream.
	aStream nextPutAll: '('.
	aStream
		print: self label;
		nextPutAll: ')'! !

!Panel methodsFor: 'submorphs-add/remove' stamp: 'KenD 9/Dec/2013, 2:44:00 pm (UTC)'!
addMorph: aMorph 
	"Add a submorph to our client area."

	layoutMorph addMorph: aMorph! !

!Panel methodsFor: 'submorphs-add/remove' stamp: 'KenD 9/Dec/2013, 2:44:00 pm (UTC)'!
addMorph: aMorph layoutSpec: aLayoutSpec
	"Add a submorph to our client area."

	layoutMorph addMorph: aMorph layoutSpec: aLayoutSpec! !

!Panel methodsFor: 'submorphs-add/remove' stamp: 'hlsf 27/May/2026, 7:30:01 pm (UTC)'!
replaceArea: oldArea with: newArea
	"Replace oldArea in its container with newArea and clean up any ActionMaps"
	
	oldArea owner replaceSubmorph: oldArea by: newArea.
	oldArea removeAllActions .
	self model removeActionsWithReceiver: oldArea.
	oldArea submorphsDo: [ :sm | 
		sm removeAllActions .
		self model removeActionsWithReceiver: sm
	].

! !

!Panel methodsFor: 'drawing' stamp: 'KenD 5/Sep/2020, 12:04:00 pm (UTC)'!
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

!Panel methodsFor: 'drawing' stamp: 'KenD 9/Dec/2013, 3:08:00 pm (UTC)'!
drawClassicFrameOn: aCanvas color: titleColor
	"Window border encompasses title area. No round corners. No title gradient."

	aCanvas fillRectangle: (0@0 extent: extent) color: color borderWidth: borderWidth borderStyleSymbol: #simple baseColorForBorder: self widgetsColor.

	"A border was drawn at the left, top and right of the title area.
	The look is that the title area is inside the window"
	aCanvas fillRectangle: (borderWidth@borderWidth extent: extent x - (2*borderWidth)@ self labelHeight) color: titleColor! !

!Panel methodsFor: 'drawing' stamp: 'hlsf 20/Apr/2026, 9:40:25 pm (UTC)'!
drawOn: aCanvas

	| titleColor |

	titleColor := self buttonColor.
	(Theme current roundWindowCorners)
		ifTrue: [
			"Round corners. Optional title gradient."
			self drawRoundedFrameOn: aCanvas color: titleColor ]
		ifFalse: [
			"No round corners. No title gradient."
			self drawClassicFrameOn: aCanvas color: titleColor ].! !

!Panel methodsFor: 'drawing' stamp: 'hlsf 23/Mar/2023, 8:40:00 am (UTC)'!
drawRoundedFrameOn: aCanvas color: theUIsColor
	"Title area is not inside window borders"
	aCanvas
		drawRoundedFrame: (0@0 extent: extent) 
		border: borderWidth 
		color: borderColor 
		topColor: theUIsColor 
		insideColor: color 
		labelHeight: self labelHeight + borderWidth! !

!Panel methodsFor: 'drawing' stamp: 'hlsf 2/Sep/2024, 5:39:00 pm (UTC)'!
makeMeFullyVisible 

	self world morphExtent > (0@0) ifFalse: [^ self].

	(self morphPosition >= (0@0) and: [ self morphPosition < (self world morphExtent-extent)]) ifTrue: [
		^ self "OK -- visible"].

	self morphPosition: (RealEstateAgent initialFrameFor: self initialExtent: self extentInWorld world: self world) topLeft! !

!Panel methodsFor: 'drawing' stamp: 'KenD 9/Dec/2013, 3:08:00 pm (UTC)'!
makeMeVisible 

	self world morphExtent > (0@0) ifFalse: [^ self].

	(self morphPosition >= (0@0) and: [ self morphPosition < (self world morphExtent-self labelHeight)]) ifTrue: [
		^ self "OK -- at least my top left is visible"].

	"window not on screen (probably due to reframe) -- move it now"
	self morphPosition: (RealEstateAgent initialFrameFor: self initialExtent: extent world: self world) topLeft! !

!Panel methodsFor: 'layout' stamp: 'KenD 26/Dec/2025, 11:35:48 am (UTC)'!
beColumn
	layoutMorph
		ifNotNil: [ layoutMorph beColumn ]
		ifNil: [
			layoutMorph := LayoutMorph newColumn.
			self addMorphBack: layoutMorph ]! !

!Panel methodsFor: 'layout' stamp: 'KenD 9/Dec/2013, 2:46:00 pm (UTC)'!
beRow
	layoutMorph
		ifNotNil: [ layoutMorph beRow ]
		ifNil: [
			layoutMorph _ LayoutMorph newRow.
			self addMorphFront: layoutMorph ]! !

!Panel methodsFor: 'layout' stamp: 'jmv 23/Aug/2020, 6:43:00 pm (UTC)'!
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

!Panel methodsFor: 'layout' stamp: 'jmv 7/Jan/2025, 9:03:00 am (UTC)'!
layoutSubmorphsIfNeeded
	"Return self. Recompute the layout if necessary."

	self isLayoutNeeded ifTrue: [
		self layoutSubmorphs ].
! !

!Panel methodsFor: 'layout' stamp: 'jmv 7/Jan/2025, 9:30:00 am (UTC)'!
someSubmorphPositionOrExtentChanged
	"Some submorph changed at any nested level.
	Must layout submorphs again."

	super someSubmorphPositionOrExtentChanged.
	self layoutNeeded: true.! !

!Panel methodsFor: 'geometry' stamp: 'hlsf 3/Jul/2022, 11:07:00 am (UTC)'!
boxExtent
	"answer the extent to use in all the buttons. 
	 
	the label height is used to be proportional to the fonts preferences"
	| e |
	e _ (Preferences at: #windowTitleFont) lineSpacing.
	^e@e! !

!Panel methodsFor: 'geometry' stamp: 'jmv 7/Jan/2025, 10:02:00 am (UTC)'!
extentChanged: oldExtent
	"Our extent changed. Must layout submorphs again."

	self layoutNeeded: true.! !

!Panel methodsFor: 'geometry' stamp: 'KenD 15/Sep/2024, 6:05:00 am (UTC)'!
fitInWorld

	"Try to be contained in the world; return boundingBox"
	| displayRect boundingBox |
	displayRect := RealEstateAgent maximumUsableAreaInWorld: self runningWorld.
	boundingBox  := self positionInWorld extent: self extentInWorld.
	boundingBox := boundingBox translatedToBeWithin: displayRect.
	self positionInWorld: boundingBox origin.
	self runningWorld activeHand releaseMouseFocus .
	^boundingBox! !

!Panel methodsFor: 'geometry' stamp: 'KenD 26/Aug/2015, 10:31:00 am (UTC)'!
fontPreferenceChanged
	"My size will have changed. "
	
	super fontPreferenceChanged.
	self morphExtent: self minimumExtent.
! !

!Panel methodsFor: 'geometry' stamp: 'KenD 18/Apr/2015, 6:35:00 pm (UTC)'!
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

!Panel methodsFor: 'geometry' stamp: 'KenD 9/Dec/2013, 3:05:00 pm (UTC)'!
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

!Panel methodsFor: 'geometry' stamp: 'KenD 2/Sep/2024, 5:39:00 pm (UTC)'!
layoutBounds
	"Return the bounds for laying out children of the receiver"
	"Exclude the label area"

	^  (0@0 extent: self extentInOwner) insetBy: (0 @ (self labelHeight) corner: 0 @ 0)! !

!Panel methodsFor: 'geometry' stamp: 'KenD 10/Apr/2021, 6:48:00 am (UTC)'!
minPaneHeightForReframe

	^ self boxExtent y + 10! !

!Panel methodsFor: 'geometry' stamp: 'hlsf 19/Oct/2025, 10:03:00 am (UTC)'!
minPaneWidthForReframe

	^ Theme current scrollbarThickness * 3! !

!Panel methodsFor: 'geometry' stamp: 'hlsf 28/May/2023, 7:39:00 pm (UTC)'!
minimumExtent
	"Subclasses may want to override me"
	
	| minTitleExtent minLayoutExtent  |
	
	minTitleExtent    := titleMorph ifNil: [0@0] ifNotNil:  [titleMorph minimumExtent].
	minLayoutExtent := layoutMorph minimumExtent.
	
	^ ((minTitleExtent x max: minLayoutExtent x)
		@ (minTitleExtent y + minLayoutExtent y))
	! !

!Panel methodsFor: 'GUI building' stamp: 'hlsf 20/Apr/2026, 9:37:31 pm (UTC)'!
adoptWidgetsColor: paneColor
	color := Theme current paneBackgroundFrom: paneColor.
	super adoptWidgetsColor: paneColor.! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 9/Dec/2013, 4:55:00 pm (UTC)'!
buildMorphicWindow

	self subclassResponsibility ! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 26/Dec/2025, 12:29:43 pm (UTC)'!
buildTitle
	titleMorph := WindowTitleMorph title: 'Untitled'.
	stayUp := false. "UI push pin to change"
	titleMorph 
		layoutSpec: (LayoutSpec morphHeightProportionalWidth: 1.0);
		morphExtent: extent x @ (self labelHeight + borderWidth);
		layoutSubmorphs.
	super addMorphBack: titleMorph.! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 9/Dec/2013, 4:42:00 pm (UTC)'!
buttonColor

	^ Theme current buttonColorFrom: self widgetsColor! !

!Panel methodsFor: 'GUI building' stamp: 'hlsf 3/Jul/2022, 11:07:00 am (UTC)'!
defaultButtonPaneHeight
	"Answer the user's preferred default height for new button panes."

	^ (Preferences at: #standardButtonFont) lineSpacing * 14 // 8! !

!Panel methodsFor: 'GUI building' stamp: 'hlsf 28/May/2023, 7:17:00 pm (UTC)'!
hideButtons

	self titleMorph hideAllButtons ! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 25/Apr/2015, 6:45:00 am (UTC)'!
showButtonsNamed: aSymbolCollection

	self titleMorph showButtonsNamed: aSymbolCollection ! !

!Panel methodsFor: 'GUI building' stamp: 'KenD 9/Dec/2013, 4:42:00 pm (UTC)'!
textBackgroundColor

	^ Theme current paneBackgroundFrom: self widgetsColor! !

!Panel methodsFor: 'GUI building' stamp: 'hlsf 29/Jul/2024, 8:35:00 am (UTC)'!
widgetsColor
	^ borderColor ! !

!Panel methodsFor: 'GUI building' stamp: 'hlsf 20/Apr/2026, 9:18:28 pm (UTC)'!
widgetsColor: aColor
	"aColor will be used for titles, borders, etc.
	A variation of it, #paneColorFrom:, will be used for panes background"

	borderColor := aColor.
	self color: self textBackgroundColor.
	self adoptWidgetsColor: borderColor! !

!Panel methodsFor: 'dropping/grabbing' stamp: 'KenD 17/Sep/2019, 11:26:00 am (UTC)'!
valueWhenDropped

	^nil! !

!Panel methodsFor: 'events' stamp: 'hlsf 3/Jul/2022, 11:07:00 am (UTC)'!
closeButtonClicked
	"The user clicked on the close-box control in the window title.  For Mac users only, the Mac convention of option-click-on-close-box is obeyed if the mac option key is down."

	(Preferences at: #dismissAllOnOptionClose) ifTrue:
		[Sensor rawMacOptionKeyPressed ifTrue:
			[^ self world closeUnchangedWindows]].
	self delete  "closeBox overrides stayUp"
! !

!Panel methodsFor: 'events' stamp: 'KenD 24/Apr/2015, 2:45:00 pm (UTC)'!
collapseButtonClicked
	
	self collapse
! !

!Panel methodsFor: 'events' stamp: 'KenD 24/Apr/2015, 2:45:00 pm (UTC)'!
expandButtonClicked
	
	self expand
! !

!Panel methodsFor: 'events' stamp: 'KenD 24/Apr/2015, 2:46:00 pm (UTC)'!
pinButtonClicked
	"The user clicked on the push pin. Subclasses should add actions and invoke me"
	
	self stayUp: true
	! !

!Panel methodsFor: 'events' stamp: 'KenD 9/Dec/2013, 3:07:00 pm (UTC)'!
wantsToBeDroppedInto: aMorph
	"Return true if it's okay to drop the receiver into aMorph"
	
	^ aMorph isWorldMorph! !

!Panel methodsFor: 'events' stamp: 'KenD 28/Apr/2015, 11:42:00 am (UTC)'!
windowMenuButtonClicked
	
	self subclassResponsibility 
! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 29/Dec/2021, 8:17:00 am (UTC)'!
defaultAlignement

	^ #center! !

!Panel methodsFor: 'initialization' stamp: 'KenD 26/Oct/2021, 4:57:00 am (UTC)'!
defaultBorderColor

	^self defaultColor! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 24/Mar/2024, 9:25:00 am (UTC)'!
defaultBorderWidth
	"answer the default border width for the receiver"

	^ Theme current windowBorderWidth ! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 24/Mar/2024, 10:07:00 am (UTC)'!
defaultColor
	^ Theme current defaultWindowColor ! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 25/Dec/2021, 2:55:00 pm (UTC)'!
defaultSeparation

	^ 10 "Pixels between controls/layouts"! !

!Panel methodsFor: 'initialization' stamp: 'hlsf 20/Apr/2026, 9:46:32 pm (UTC)'!
initialize
	"Initialize a system window. Add label, stripes, etc., if desired"
	super initialize.
	self buildTitle;
		beColumn.  "by default"
	self widgetsColor: self defaultColor.
! !

!Panel methodsFor: 'initialization' stamp: 'KenD 16/Jul/2024, 11:58:00 am (UTC)'!
openInWorld
	self morphPosition: 
			(RealEstateAgent 
					initialFrameFor: self 
					initialExtent: self minimumExtent 
					world: self runningWorld ) topLeft.
	super 	openInWorld! !

!Panel methodsFor: 'testing' stamp: 'KenD 9/Dec/2013, 2:45:00 pm (UTC)'!
is: aSymbol
	^ aSymbol == #Panel or: [ super is: aSymbol ]! !

!Panel methodsFor: 'testing' stamp: 'KenD 9/Dec/2013, 2:45:00 pm (UTC)'!
isOpaqueMorph
	"Not really used, as we also reimplement #addPossiblyUncoveredAreasIn:to:"
	^ (Theme current roundWindowCorners or: [ color mightBeTranslucent ]) not! !

!Panel methodsFor: 'label' stamp: 'KenD 24/Apr/2015, 1:48:00 pm (UTC)'!
label

	^ self titleMorph titleString ! !

!Panel methodsFor: 'label' stamp: 'hlsf 3/Jul/2022, 11:07:00 am (UTC)'!
labelHeight
	"Answer the height for the window label."

	^  (Preferences at: #windowTitleFont) lineSpacing+1! !

!Panel methodsFor: 'label' stamp: 'KenD 12/Feb/2026, 11:22:26 am (UTC)'!
relabel

	| newLabel |
	newLabel := StringRequestMorph 
		request: 'New title for this window'
		initialAnswer: titleMorph titleString.
	newLabel isEmpty ifTrue: [^self].
	self setLabel: newLabel! !

!Panel methodsFor: 'label' stamp: 'KenD 28/Apr/2015, 4:34:00 pm (UTC)'!
setLabel: aString

	self titleMorph titleString: aString.
! !

!Panel methodsFor: 'label' stamp: 'KenD 9/Dec/2013, 3:02:00 pm (UTC)'!
update: aSymbol

	super update: aSymbol.
	aSymbol == #relabel
		ifTrue: [ model ifNotNil: [ self setLabel: model labelString ]]! !

!Panel methodsFor: 'accessing' stamp: 'KenD 10/Jan/2026, 11:04:24 am (UTC)'!
defaultLayerNumber
	^ 16! !

!Panel methodsFor: 'accessing' stamp: 'KenD 24/Apr/2015, 1:54:00 pm (UTC)'!
layoutMorph

	^ layoutMorph! !

!Panel methodsFor: 'accessing' stamp: 'KenD 24/Apr/2015, 1:41:00 pm (UTC)'!
pinButton
	"private"
	
	^ titleMorph pinButton ! !

!Panel methodsFor: 'accessing' stamp: 'KenD 19/Apr/2015, 5:30:00 am (UTC)'!
stayUp

	^ stayUp! !

!Panel methodsFor: 'accessing' stamp: 'KenD 19/Apr/2015, 12:11:00 pm (UTC)'!
stayUp: aBoolean

	stayUp := aBoolean.
	aBoolean
		ifTrue: [ self pinButton hide ] 
		ifFalse: [ self pinButton show ] ! !

!Panel methodsFor: 'accessing' stamp: 'KenD 24/Apr/2015, 1:44:00 pm (UTC)'!
titleMorph 

	^ titleMorph! !

!Panel methodsFor: 'change reporting' stamp: 'hlsf 28/May/2023, 7:39:00 pm (UTC)'!
morphExtent: newExtent

	super morphExtent: newExtent.
	titleMorph ifNotNil: [titleMorph morphExtent: extent x @ (self labelHeight + borderWidth)]! !

!Panel class methodsFor: 'instance creation' stamp: 'hlsf 1/May/2025, 9:49:00 pm (UTC)'!
example1
" 
	Panel example1 openInWorld
"
| panel |
	panel := Panel new.
	panel showButtonsNamed: #(#close).
	^ panel
		! !

!Panel class methodsFor: 'instance creation' stamp: 'hlsf 1/May/2025, 9:45:00 pm (UTC)'!
initializedInstance
"
	self initializedInstance openInHand.
"	
	^ self example1 
		! !

!Panel class methodsFor: 'instance creation' stamp: 'KenD 9/Dec/2013, 4:53:00 pm (UTC)'!
open: model

	^self open: model label: nil! !

!Panel class methodsFor: 'instance creation' stamp: 'hlsf 9/Apr/2022, 8:11:00 am (UTC)'!
open: model label: aString
	|  window |
	window _ self basicNew ::
		model: model;
		initialize;
		buildMorphicWindow.
	aString ifNotNil: [ window setLabel: aString ].
	window openInWorld.
	^ window! !

!Panel class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 1:02:00 pm (UTC)'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!Panel class methodsFor: 'new-morph participation' stamp: 'KenD 13/Mar/2022, 5:31:00 am (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ true! !

!DialogPanel methodsFor: 'GUI building' stamp: 'hlsf 6/Mar/2025, 6:17:00 pm (UTC)'!
buildMorphicWindow
	layoutMorph removeAllMorphs.
	self newPane ifNotNil: [:pane | layoutMorph addMorphUseAll: pane].
	self newButtonArea ifNotNil: [:buttons | layoutMorph addMorphKeepMorphHeight: buttons].
	layoutMorph 
		separation: self defaultSeparation;
		axisEdgeWeight: self defaultAlignement.
	self morphExtent: self minimumExtent! !

!DialogPanel methodsFor: 'GUI building' stamp: 'hlsf 30/Dec/2021, 8:38:00 am (UTC)'!
newButtonArea
"Return the morph where the buttons are layed out"
	self subclassResponsibility ! !

!DialogPanel methodsFor: 'GUI building' stamp: 'hlsf 30/Dec/2021, 8:39:00 am (UTC)'!
newPane
"Return the morph containing the controls of the dialog"
	self subclassResponsibility ! !

!DialogPanel methodsFor: 'accessing' stamp: 'hlsf 1/Mar/2026, 8:10:07 pm (UTC)'!
pane
	^ layoutMorph submorphs last! !

!DialogPanel class methodsFor: 'new-morph participation' stamp: 'KenD 13/Mar/2022, 5:31:00 am (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ false! !

!EditPanel methodsFor: 'accessing' stamp: 'KenD 4/Jul/2015, 6:58:00 am (UTC)'!
editModel
	"A subclass may wish to supply a custom editModel rather than model clone.
	[Note Object>>copy and Morph>>copy]"
	
	editModel ifNil: [ editModel := self model shallowCopy postCopy ].
	
	^ editModel! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 19/Apr/2015, 1:22:00 pm (UTC)'!
cancelAndForgetEverything

	editModel := nil.
	self stayUp 
		ifFalse: [ self delete ]
		ifTrue: [ self refreshView ]! !

!EditPanel methodsFor: 'event handling' stamp: 'hlsf 16/Apr/2023, 10:48:00 am (UTC)'!
refreshView

	self subclassResponsibility ! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 18/Dec/2013, 5:38:00 pm (UTC)'!
replaceArea: oldArea with: newArea
	"Replace oldArea in its container with newArea and clean up any ActionMaps"
	
	super replaceArea: oldArea with: newArea.
	oldArea submorphsDo: [ :sm | 
		self editModel removeActionsWithReceiver: sm
	].
! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 27/Jul/2015, 11:25:00 am (UTC)'!
showHalo

	| aMorph |
	aMorph := self model.
	(aMorph isKindOf: Morph)
	ifFalse: [ self subclassResponsibility ] "subclass must override if model not Morph"
	ifTrue: [ aMorph isInWorld ifTrue: [ aMorph show; addHalo ] ]! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 27/Jul/2015, 2:32:00 pm (UTC)'!
showHaloButtonClicked

	self subclassResponsibility! !

!EditPanel methodsFor: 'event handling' stamp: 'KenD 17/Dec/2013, 5:01:00 pm (UTC)'!
updateMasterFromCopy
	"Update model from editModel"
	
	self subclassResponsibility ! !

!EditPanel methodsFor: 'initialization' stamp: 'KenD 17/Dec/2013, 5:02:00 pm (UTC)'!
editModel: anObject

	editModel := anObject! !

!EditPanel methodsFor: 'GUI building' stamp: 'KenD 14/Sep/2024, 1:15:00 pm (UTC)'!
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

!PluggableDialogPanel methodsFor: 'GUI building' stamp: 'KenD 23/Jul/2024, 4:20:00 pm (UTC)'!
buildMorphicWindow

	super buildMorphicWindow.
	layoutMorph adoptWidgetsColor: self widgetsColor.! !

!PluggableDialogPanel methodsFor: 'GUI building' stamp: 'hlsf 20/Apr/2026, 9:47:55 pm (UTC)'!
newButtonArea
"Return the morph where the buttons are layed out"
	buttonArea := LayoutMorph newRow ::
		gap: 8;
		color: Color transparent ;
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

!PluggableDialogPanel methodsFor: 'GUI building' stamp: 'hlsf 29/Jul/2024, 8:31:00 am (UTC)'!
newPane
	^ (model perform: viewSelector)
		adoptWidgetsColor: self widgetsColor;
		yourself! !

!PluggableDialogPanel methodsFor: 'accessing' stamp: 'hlsf 27/Aug/2023, 1:34:00 pm (UTC)'!
actionOnAltButton: selectorOrBlock
	actionOnAltButton := selectorOrBlock isSymbol 
		ifTrue: [ [model perform: selectorOrBlock] ]
		ifFalse: [selectorOrBlock]! !

!PluggableDialogPanel methodsFor: 'accessing' stamp: 'hlsf 27/Aug/2023, 1:34:00 pm (UTC)'!
actionOnButton: selectorOrBlock
	actionOnButton := selectorOrBlock isSymbol 
		ifTrue: [ [model perform: selectorOrBlock] ]
		ifFalse: [selectorOrBlock]! !

!PluggableDialogPanel methodsFor: 'accessing' stamp: 'hlsf 27/Aug/2023, 1:33:00 pm (UTC)'!
altButtonLabel: aString
	altButtonLabel := aString ! !

!PluggableDialogPanel methodsFor: 'accessing' stamp: 'hlsf 27/Aug/2023, 1:33:00 pm (UTC)'!
buttonLabel: aString
	buttonLabel := aString ! !

!PluggableDialogPanel methodsFor: 'accessing' stamp: 'hlsf 16/Apr/2023, 12:11:00 pm (UTC)'!
viewGetter: selector
	viewSelector := selector ! !

!PluggableDialogPanel methodsFor: 'geometry' stamp: 'hlsf 18/Apr/2023, 10:07:00 am (UTC)'!
minimumExtent
	| mini |
	mini := super minimumExtent.
	^ (mini x max: 350) @ mini y! !

!PluggableDialogPanel methodsFor: 'initialization' stamp: 'hlsf 27/Aug/2023, 1:32:00 pm (UTC)'!
initialize
	super initialize.
	buttonLabel := 'Accept'.
	altButtonLabel := 'Cancel'.
	actionOnAltButton := [self delete]! !

!PluggableDialogPanel class methodsFor: 'instance creation' stamp: 'hlsf 27/Aug/2023, 1:35:00 pm (UTC)'!
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

!PluggableDialogPanel class methodsFor: 'instance creation' stamp: 'hlsf 27/Aug/2023, 1:36:00 pm (UTC)'!
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

!PluggablePane methodsFor: 'GUI building' stamp: 'hlsf 28/May/2023, 7:29:00 pm (UTC)'!
buildTitle
" No title, no window "! !

!PluggablePane methodsFor: 'initialization' stamp: 'hlsf 28/May/2023, 7:30:00 pm (UTC)'!
defaultBorderWidth
	^ 0! !

!PluggablePane methodsFor: 'initialization' stamp: 'hlsf 12/May/2024, 1:51:00 pm (UTC)'!
defaultSeparation
	^ 0! !

!PluggablePane methodsFor: 'initialization' stamp: 'hlsf 29/Jul/2024, 8:33:00 am (UTC)'!
initialize
	super initialize.
	actionOnAltButton := nil.
	self color: (Theme current paneBackgroundFrom: self widgetsColor).! !

!PluggablePane methodsFor: 'drawing' stamp: 'hlsf 2/Sep/2024, 5:40:00 pm (UTC)'!
drawOn: aCanvas
	"A canvas is already set with a proper transformation from our coordinates to those of the Canvas target."

	aCanvas
		fillRectangle: self localBounds
		color: color
		borderWidth: borderWidth
		borderStyleSymbol: #simple
		baseColorForBorder: borderColor.! !

!PluggablePane methodsFor: 'label' stamp: 'hlsf 28/May/2023, 7:43:00 pm (UTC)'!
label
	^ 'a pane'
	! !

!PluggablePane methodsFor: 'geometry' stamp: 'hlsf 16/Jul/2024, 8:54:00 am (UTC)'!
adjustExtent
	self morphWidth: owner viewableWidth! !

!PluggablePane methodsFor: 'geometry' stamp: 'hlsf 2/Sep/2024, 5:39:00 pm (UTC)'!
layoutBounds
	"Return the bounds for laying out children of the receiver"
	"Exclude the label area"

	^  0@0 extent: self extentInOwner! !

!PluggablePane class methodsFor: 'instance creation' stamp: 'hlsf 27/Aug/2023, 1:37:00 pm (UTC)'!
open: model view: aSelector action: acceptSelectorOrAction
	|  pane |
	pane := self new
		model: model;
		viewGetter: aSelector ;
		actionOnButton: acceptSelectorOrAction;
		buildMorphicWindow.
	^ pane! !

!PluggablePane class methodsFor: 'instance creation' stamp: 'hlsf 27/Aug/2023, 1:37:00 pm (UTC)'!
open: model view: aSelector action: acceptSelectorOrAction altAction: cancelSelectorOrAction
	|  pane |
	pane := self new
		model: model;
		viewGetter: aSelector ;
		actionOnButton: acceptSelectorOrAction;
		actionOnAltButton: cancelSelectorOrAction;
		buildMorphicWindow.
	^ pane! !

!ValueEntryPanel methodsFor: 'events' stamp: 'KenD 11/Jan/2026, 10:54:44 am (UTC)'!
accept
	self delete.
	model ifNotNil: [ :myModel | myModel propertyValue: entry value ].! !

!ValueEntryPanel methodsFor: 'events' stamp: 'hlsf 19/Mar/2022, 8:22:00 am (UTC)'!
cancel
	self delete! !

!ValueEntryPanel methodsFor: 'events' stamp: 'KenD 11/Jan/2026, 10:54:55 am (UTC)'!
valueWhenDropped
	
	^ model  
		ifNotNil: [ :m | m propertyValue: entry value ] 
		ifNil: [ entry value ]! !

!ValueEntryPanel methodsFor: 'GUI building' stamp: 'hlsf 10/Aug/2025, 8:45:00 am (UTC)'!
newButtonArea
	"Add ACCEPT and CANCEL buttons"
	buttonArea := LayoutMorph newRow
		gap: 8;
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #accept
				label: 'Accept' :: color: Theme current acceptButton)
			layoutSpec: (LayoutSizeSpec new ::
							proportionalWidth: 0.4 minimum: 100;
							proportionalHeight:  1;
							offAxisEdgeWeight: #center);
		addMorph: (PluggableButtonMorph 
				model: self 
				action:  #cancel
				label: 'Cancel' :: color: Theme current cancelButton )
			layoutSpec: (LayoutSizeSpec new ::
							proportionalWidth: 0.4 minimum: 100;
							proportionalHeight:  1;
							offAxisEdgeWeight: #center);
		axisEdgeWeight: #center;
		color: (Color transparent).
		
	^ buttonArea ! !

!ValueEntryPanel methodsFor: 'GUI building' stamp: 'KenD 14/Sep/2024, 1:16:00 pm (UTC)'!
newPane
	| entryLayout |
	entryLayout := LayoutMorph newRow.
	entryLayout 
		gap: self defaultSeparation;
		axisEdgeWeight: #center;
		addMorph: entry ; "set in #initialize"
		color: (Color transparent).
	^ entryLayout ! !

!ValueEntryPanel methodsFor: 'initialization' stamp: 'hlsf 19/Mar/2022, 8:23:00 am (UTC)'!
model: aModel
	super model: aModel.
	entry ifNotNil: [:anEntry | anEntry setValue: aModel propertyValue]! !

!ValueEntryPanel methodsFor: 'event handling' stamp: 'hlsf 16/Apr/2023, 10:48:00 am (UTC)'!
refreshView

	self subclassResponsibility ! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 25/Dec/2021, 3:23:00 pm (UTC)'!
checkValidity: aModel
	self subclassResponsibility ! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'KenD 26/Jan/2026, 9:58:21 am (UTC)'!
open: aModel label: stringName
	| oldString propValue |
	oldString := stringName.
	propValue := aModel propertyValue.
	oldString ifNil: [oldString := ''].
	propValue  ifNil: [propValue := '']
			    ifNotNil: [ self checkValidity: propValue ].
	^ super open: aModel label: stringName.! !

!ValueEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 26/Mar/2022, 9:26:00 am (UTC)'!
openWide: aModel label: stringName
"My title is not shrinked, the dialog is extended as necessary to have the tile completely readable"
	| panel |
	panel _ self open: aModel label: stringName.
	panel titleMorph dontShrinkTitle.
	panel morphExtent: panel minimumExtent.
	^panel
	! !

!CharacterEntryPanel methodsFor: 'events' stamp: 'hlsf 9/Apr/2022, 8:14:00 am (UTC)'!
accept
	self delete.
	model ifNotNil: [ :myModel | 
		myModel propertyValue: (entry value at: 1) ]! !

!CharacterEntryPanel methodsFor: 'events' stamp: 'hlsf 19/Mar/2022, 8:24:00 am (UTC)'!
valueWhenDropped
	self model 
		ifNotNil: [ :m | m propertyValue: (entry value at: 1) ] 
		ifNil: [ '_' ]! !

!CharacterEntryPanel methodsFor: 'initialization' stamp: 'hlsf 9/Apr/2022, 8:15:00 am (UTC)'!
initialize
	super initialize .
	entry _ SimpleNumberEntryMorph singleCharSelection: $c ::
		setValue: model propertyValue;
		acceptCancelReceiver: self;
		yourself
! !

!CharacterEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 25/Dec/2021, 3:23:00 pm (UTC)'!
checkValidity: aChar
	(aChar isKindOf: Character) 
		ifFalse: [ self error: 'I require a Character: ' , aChar printString ].
! !

!CharacterEntryPanel class methodsFor: 'examples' stamp: 'KenD 20/Mar/2022, 1:58:00 pm (UTC)'!
example1
" 
	CharacterEntryPanel example1 
"
	| model |
	model := SignMorph forObject: $A.
	model openInWorld.
	^ self open: model label: 'Key in a character'! !

!FloatEntryPanel methodsFor: 'initialization' stamp: 'hlsf 9/Apr/2022, 8:18:00 am (UTC)'!
initialize
	super initialize.
	entry _ SimpleNumberEntryMorph floatDefault: 1.0 maxNumChars: 8 ::
		setValue: model propertyValue;
		acceptCancelReceiver: self;
		yourself! !

!FloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 9/Apr/2022, 8:34:00 am (UTC)'!
example1
" 
	FloatEntryPanel example1 
"
	| model |
	model := SignMorph forObject: 3.1.
	model openInWorld.
	^ self open: model label: 'A better PI'! !

!FloatEntryPanel class methodsFor: 'instance creation' stamp: 'KenD 21/Mar/2022, 1:32:00 pm (UTC)'!
checkValidity: aNumber

	(aNumber isKindOf: Number) ifFalse: [ self error: 'I require a Number ' , aNumber printString ].! !

!PointEntryPanel methodsFor: 'events' stamp: 'hlsf 19/Mar/2022, 8:24:00 am (UTC)'!
accept	
	self delete.
	self model ifNotNil: [ :myModel | 
		myModel propertyValue: (xEntryMorph value @ yEntryMorph value) ]! !

!PointEntryPanel methodsFor: 'events' stamp: 'hlsf 19/Mar/2022, 8:25:00 am (UTC)'!
valueWhenDropped
	self model 
		ifNotNil: [ :m | m propertyValue: 	(xEntryMorph value @ yEntryMorph value) ] 
		ifNil: [ 0@0 ]! !

!PointEntryPanel methodsFor: 'initialization' stamp: 'hlsf 9/Apr/2022, 8:17:00 am (UTC)'!
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

!PointEntryPanel methodsFor: 'GUI building' stamp: 'KenD 14/Sep/2024, 1:16:00 pm (UTC)'!
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

!PointEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 25/Dec/2021, 3:28:00 pm (UTC)'!
checkValidity: aPoint
	(aPoint isKindOf: Point) ifFalse: [ self error: 'I require a Point: ' , aPoint printString ].
! !

!PointEntryPanel class methodsFor: 'examples' stamp: 'hlsf 17/Mar/2022, 7:22:00 pm (UTC)'!
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

!PositiveFloatEntryPanel methodsFor: 'initialization' stamp: 'hlsf 9/Apr/2022, 8:18:00 am (UTC)'!
initialize
	super initialize.
	entry _ SimpleNumberEntryMorph positiveFloatDefault: 1.0 maxNumChars: 8 ::
		setValue: model propertyValue;
		acceptCancelReceiver: self;
		yourself
! !

!PositiveFloatEntryPanel class methodsFor: 'instance creation' stamp: 'KenD 11/Jan/2022, 12:29:00 pm (UTC)'!
checkValidity: aNumber
	(aNumber isKindOf: Number) ifFalse: [ self error: 'I require a Positive Number ' , aNumber printString ].
	(aNumber >= 0) ifFalse: [ self error: 'I require a Positive Number: ' , aNumber printString ]! !

!PositiveFloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 19/Mar/2022, 9:25:00 am (UTC)'!
example1
"
	PositiveFloatEntryPanel example1
"
	| model |
	model := SignMorph forObject: 3.1415.
	model openInWorld.
	^ self open: model label: 'Edit a positive float'! !

!PositiveFloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 19/Mar/2022, 9:31:00 am (UTC)'!
example2
"
	PositiveFloatEntryPanel example2
"
	| model |
	model := SignMorph forObject: -3.1415.
	model openInWorld.
	^ self open: model label: 'Edit a positive float'! !

!PositiveIntegerEntryPanel methodsFor: 'initialization' stamp: 'hlsf 9/Apr/2022, 8:19:00 am (UTC)'!
initialize
	super initialize.
	entry _ SimpleNumberEntryMorph integerDefault: 0 maxNumChars: 8 ::
		acceptCancelReceiver: self;
		setValue: model propertyValue;
		yourself! !

!PositiveIntegerEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 25/Dec/2021, 3:53:00 pm (UTC)'!
checkValidity: aNumber
	(aNumber isKindOf: Integer) ifFalse: [ self error: 'I require a Positive Integer: ' , aNumber printString ].
	(aNumber >= 0) ifFalse: [ self error: 'I require a Positive Integer: ' , aNumber printString ]! !

!PositiveIntegerEntryPanel class methodsFor: 'examples' stamp: 'hlsf 17/Mar/2022, 7:22:00 pm (UTC)'!
example1
"
	PositiveIntegerEntryPanel example1
"
	| model |
	model := SignMorph forObject: 152.
	model openInWorld.
	^ self open: model label: 'Edit a positive integer'! !

!PositiveIntegerEntryPanel class methodsFor: 'examples' stamp: 'hlsf 17/Mar/2022, 7:22:00 pm (UTC)'!
example2
"
	PositiveIntegerEntryPanel example2
"
	| model |
	model := SignMorph forObject: -152.
	"Expect failed invariant"
	^ self open: model label: 'Can''t negative integer'! !

!RangeFloatEntryPanel methodsFor: 'accessing' stamp: 'hlsf 19/Mar/2022, 8:55:00 am (UTC)'!
min: aMinFloat max: aMaxFloat
	min _ aMinFloat.
	max _ aMaxFloat ! !

!RangeFloatEntryPanel methodsFor: 'initialization' stamp: 'hlsf 9/Apr/2022, 8:19:00 am (UTC)'!
initialize
	super initialize .
	entry _ SimpleNumberEntryMorph floatRangeFrom: min to: max maxNumChars: 10 ::
		acceptCancelReceiver: self;
		setValue: model propertyValue;
		yourself! !

!RangeFloatEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 19/Mar/2022, 9:41:00 am (UTC)'!
checkValidity: aNumber between: min and: max
	(aNumber isKindOf: Number) ifFalse: [ self error: 'I require a Number ' , aNumber printString ].
	(aNumber between: min and: max) ifFalse: [
		self error: aNumber printString, ' is not in [ ', min printString, ' ; ', max printString, ' ]']
		! !

!RangeFloatEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 9/Apr/2022, 8:22:00 am (UTC)'!
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

!RangeFloatEntryPanel class methodsFor: 'examples' stamp: 'hlsf 19/Mar/2022, 9:41:00 am (UTC)'!
example1
"
	RangeFloatEntryPanel example1
"
	| model |
	model := SignMorph forObject: 0.15.
	model openInWorld.
	^ self open: model between: 0 and: 1 label: 'Edit a value in [0 ; 1]'! !

!RangeFloatEntryPanel class methodsFor: 'examples' stamp: 'KenD 19/Mar/2022, 2:04:00 pm (UTC)'!
example2
"
	RangeFloatEntryPanel example2
"
	| model |
	model := SignMorph forObject: 1.15.
	model openInWorld.
	^ self open: model between: 0 and: 5 label: 'Edit a value in [0 ; 5]'! !

!RangeFloatEntryPanel class methodsFor: 'examples' stamp: 'KenD 21/Mar/2022, 1:11:00 pm (UTC)'!
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

!StringEntryPanel methodsFor: 'initialization' stamp: 'hlsf 3/Jul/2022, 11:07:00 am (UTC)'!
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

!StringEntryPanel methodsFor: 'GUI building' stamp: 'KenD 14/Sep/2024, 1:16:00 pm (UTC)'!
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

!StringEntryPanel class methodsFor: 'examples' stamp: 'KenD 20/Mar/2022, 2:05:00 pm (UTC)'!
example1
"
	StringEntryPanel example1 
"
	| model |
	model := SignMorph forObject: 'Cuis Smalltalk'.
	model openInWorld.
	"I use a SqueezeLabelMorph in my title"
	^ self open: model  label: 'The Smalltalk I use'! !

!StringEntryPanel class methodsFor: 'examples' stamp: 'hlsf 9/Apr/2022, 8:32:00 am (UTC)'!
example2
"
	StringEntryPanel example2
"
	| model |
	model := SignMorph forObject: 'Cuis Smalltalk'.
	model openInWorld.
	^ self openWide: model  label: 'The Smalltalk I use is...' .! !

!StringEntryPanel class methodsFor: 'examples' stamp: 'hlsf 9/Apr/2022, 8:32:00 am (UTC)'!
example3
"
	StringEntryPanel example3
"
	| model |
	model := ValueHolder with: 'a file name'.
	model action: [:value | Transcript show: value].
	^ self openWide: model  label: 'Name the sktech to keep, this is a long title'! !

!StringEntryPanel class methodsFor: 'instance creation' stamp: 'hlsf 3/Nov/2022, 3:44:00 pm (UTC)'!
checkValidity: aString
	(aString isKindOf: CharacterSequence ) ifFalse: [ self error: 'I require a String: ' , aString printString ]! !

!TextEntryPanel methodsFor: 'initialization' stamp: 'hlsf 5/Feb/2026, 8:58:05 am (UTC)'!
initialize
	super initialize.
	entry := TextModelMorph withText: model propertyValue.
	entry layoutSpec: (LayoutSpec 
		proportionalWidth: 1 
		fixedHeight: (Preferences at: #windowTitleFont) lineSpacing * 4 )! !

!TextEntryPanel methodsFor: 'events' stamp: 'hlsf 9/Apr/2022, 8:27:00 am (UTC)'!
accept
	self delete.
	model 	ifNotNil: [ :myModel | 			
		myModel propertyValue: entry scroller contents asString		].! !

!TextEntryPanel methodsFor: 'events' stamp: 'hlsf 5/Feb/2026, 8:57:45 am (UTC)'!
valueWhenDropped
	
	^ model  
		ifNotNil: [ :m | m propertyValue: entry scroller contents asString ] 
		ifNil: [ entry scroller contents asString]! !

!TextEntryPanel class methodsFor: 'examples' stamp: 'hlsf 9/Apr/2022, 8:29:00 am (UTC)'!
example1
"
	super example1 openInWorld
"! !

!TextEntryPanel class methodsFor: 'examples' stamp: 'hlsf 9/Apr/2022, 8:31:00 am (UTC)'!
example2
"
	super example2 openInWorld
"! !

!TextEntryPanel class methodsFor: 'examples' stamp: 'hlsf 9/Apr/2022, 8:31:00 am (UTC)'!
example3
"
	super example3 openInWorld
"! !

!WizardPanel methodsFor: 'GUI building' stamp: 'hlsf 21/Jul/2024, 9:02:00 pm (UTC)'!
buildMorphicWindow
	super buildMorphicWindow .
	layoutMorph adoptWidgetsColor: self widgetsColor! !

!WizardPanel methodsFor: 'GUI building' stamp: 'hlsf 19/Apr/2026, 8:29:44 pm (UTC)'!
newButtonArea
"Ask the current page its buttons, if any"
	^ buttonArea :=  currentPageIndex ifNotNil: [ currentPage buttons]! !

!WizardPanel methodsFor: 'GUI building' stamp: 'hlsf 20/Apr/2026, 8:53:31 pm (UTC)'!
newPane
"Ask to the current page its pane, if any"
	^ currentPage panel ! !

!WizardPanel methodsFor: 'accessing' stamp: 'hlsf 25/Dec/2021, 2:51:00 pm (UTC)'!
emptyPane
	^ LayoutMorph newColumn 
		doAdoptWidgetsColor;
		adoptWidgetsColor: self widgetsColor.! !

!WizardPanel methodsFor: 'accessing' stamp: 'hlsf 19/Apr/2026, 8:17:27 pm (UTC)'!
numberOfPage
	^ self pageBuilders size! !

!WizardPanel methodsFor: 'accessing' stamp: 'hlsf 19/Apr/2026, 8:17:01 pm (UTC)'!
pageBuilders
"	A collection of method symbol, each one builds and returns a WizardPage " 
	^ self subclassResponsibility ! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 3/Nov/2021, 4:41:00 pm (UTC)'!
apply
	self triggerEvent: #apply! !

!WizardPanel methodsFor: 'actions' stamp: 'drgeo 20/Apr/2026, 8:09:22 pm (UTC)'!
cancel
	self delete.
	self triggerEvent: #cancel! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 31/Oct/2021, 9:35:00 am (UTC)'!
nextPage
	self goPage: currentPageIndex + 1
	! !

!WizardPanel methodsFor: 'actions' stamp: 'hlsf 31/Oct/2021, 9:35:00 am (UTC)'!
previousPage
	self goPage: currentPageIndex - 1! !

!WizardPanel methodsFor: 'initialize-release' stamp: 'drgeo 20/Apr/2026, 7:53:13 pm (UTC)'!
initialize
	super initialize.
	self goPage: 1! !

!WizardPanel methodsFor: 'navigation' stamp: 'hlsf 19/Apr/2026, 8:27:48 pm (UTC)'!
goPage: number
	(number between: 1 and: self numberOfPage) ifFalse: [^ self].
	currentPageIndex := number.
	currentPage := self perform: (self pageBuilders at: currentPageIndex).
	self setLabel: currentPage title.
	self buildMorphicWindow.
	self triggerEvent: #page with: number.! !

!WizardPanel methodsFor: 'open/close' stamp: 'hlsf 27/May/2026, 7:30:36 pm (UTC)'!
delete
	super delete.
	self removeAllActions ! !

!WizardPanel methodsFor: 'open/close' stamp: 'hlsf 7/Apr/2022, 1:54:00 pm (UTC)'!
minimumExtent
	^ 550 @ (350 max: super minimumExtent y)! !

!WizardPanel methodsFor: 'testing' stamp: 'hlsf 21/May/2026, 9:25:30 am (UTC)'!
isCancellingPossible
	^ true! !

!WizardPanel methodsFor: 'testing' stamp: 'drgeo 20/Apr/2026, 7:58:09 pm (UTC)'!
isReadyToApply
"Override, return true when the wizard is ready to appy its effect
The apply button is usually found in the last page of the wizard, an Apply Page"
	^ false! !

!WizardPanel class methodsFor: 'new-morph participation' stamp: 'KenD 13/Mar/2022, 5:32:00 am (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ false! !

!SidePaneExample methodsFor: 'action' stamp: 'hlsf 26/Apr/2026, 1:49:00 pm (UTC)'!
coloursView
	^ DropDownButtonMorph example1! !

!SidePaneExample methodsFor: 'action' stamp: 'hlsf 26/Apr/2026, 9:38:16 pm (UTC)'!
fieldsView
| mold |
	mold := Mold new.
	(mold integerField)
		label: 'Slot value';
		on: #propertyValue of: ValueHolder new;
		example: 'an integer value';
		addCondition: [:input :value| value >= 4] labeled: 'Value must be greater or equal to 4.';
		addCondition: [:input :value| value <= -10] labeled: 'Value must be lower or equal to -10.';
		beRequired.
	^ mold newPane color: Color transparent! !

!SidePaneExample methodsFor: 'action' stamp: 'hlsf 26/Apr/2026, 9:38:28 pm (UTC)'!
imageView
	^ RadioGroup example2 color: Color transparent! !

!SidePaneExample methodsFor: 'action' stamp: 'hlsf 26/Apr/2026, 9:37:59 pm (UTC)'!
labelView
	^ LabelGroup example1 color: Color transparent! !

!SidePaneExample methodsFor: 'action' stamp: 'hlsf 26/Apr/2026, 1:46:20 pm (UTC)'!
smalltalkView
	^ CheckGroup example1! !

!SidePaneExample methodsFor: 'initialization' stamp: 'hlsf 28/Apr/2026, 9:06:17 am (UTC)'!
defaultBorderColor
	^ Color gray ! !

!SidePaneExample methodsFor: 'initialization' stamp: 'hlsf 26/Apr/2026, 9:37:13 pm (UTC)'!
defaultColor
	^ Color gray muchLighter muchLighter ! !

!SidePaneExample methodsFor: 'initialization' stamp: 'hlsf 27/Apr/2026, 8:37:47 pm (UTC)'!
sidePaneWithIcons
	| categories |
	icons := IconImporter path: DyboSystem iconsPath.
	categories := #(
		('Label Group' labelView group)
		('Smalltalks' smalltalkView settings)
		('Images' imageView calibrate)
		('Colours' coloursView drag)
		('Edit some values' fieldsView pen)).
		
	^ SidePane on: self with: categories.! !

!SidePaneExample methodsFor: 'initialization' stamp: 'hlsf 27/Apr/2026, 7:21:00 pm (UTC)'!
sidePaneWithoutIcon
	| categories sideBar |
	categories := #(
		('Label Group' labelView)
		('Smalltalks' smalltalkView)
		('Images' imageView)
		('Colours' coloursView)
		('Edit some values' fieldsView)).
		
	sideBar := SidePane on: self with: categories.
	sideBar when: #selectedCategory send: #show: to: Transcript.
	^ sideBar ! !

!SidePaneExample methodsFor: 'accessing' stamp: 'hlsf 27/Apr/2026, 7:38:51 pm (UTC)'!
icons
	^ icons! !

!SidePaneExample class methodsFor: 'as yet unclassified' stamp: 'hlsf 27/Apr/2026, 7:18:10 pm (UTC)'!
example1
"
	SidePaneExample example1
"
	self new sidePaneWithoutIcon openInWorld! !

!SidePaneExample class methodsFor: 'as yet unclassified' stamp: 'hlsf 27/Apr/2026, 7:42:05 pm (UTC)'!
example2
"
	SidePaneExample example2
"
	self new sidePaneWithIcons openInWorld! !

!WizardPage methodsFor: 'accessing' stamp: 'KenD 14/Sep/2024, 1:17:00 pm (UTC)'!
buttons
	^ buttons ifNil: [
		buttons := LayoutMorph newRow 
		gap: 5;
		axisEdgeWeight: #rowRight;
		yourself]! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 22/Apr/2026, 8:45:02 pm (UTC)'!
contents: aStringOrMorph
	(aStringOrMorph isString or: [aStringOrMorph is: #Text])
		ifTrue: [ "If string, just be our new panel"
			panel := TextParagraphMorph contents: aStringOrMorph.
			panel 
				borderWidth: 0 ; 
				color: Color transparent]
		ifFalse: [ "If Morph, the Wizard directly gave us the panel with contents already set"
			panel := aStringOrMorph]! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 31/Oct/2021, 10:22:00 am (UTC)'!
panel
	^ panel! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 31/Oct/2021, 6:12:00 pm (UTC)'!
title
	^ title! !

!WizardPage methodsFor: 'accessing' stamp: 'hlsf 31/Oct/2021, 10:07:00 am (UTC)'!
wizard: aWizard
	wizard _ aWizard 
	! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 1/Mar/2022, 7:48:00 pm (UTC)'!
applyButton
	^ (PluggableButtonMorph 
		model: wizard
		action: #apply
		label: 'Apply') enableSelector: #isReadyToApply! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 1/Mar/2022, 7:47:00 pm (UTC)'!
cancelButton
	^ PluggableButtonMorph 
		model: wizard
		action: #cancel
		label: 'Cancel'! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 1/Mar/2022, 7:48:00 pm (UTC)'!
nextButton
	^ PluggableButtonMorph 
		model: wizard
		action: #nextPage
		label: 'Next'! !

!WizardPage methodsFor: 'GUI building' stamp: 'hlsf 1/Mar/2022, 7:48:00 pm (UTC)'!
previousButton
	^ PluggableButtonMorph 
		model: wizard
		action: #previousPage
		label: 'Previous'! !

!WizardPage methodsFor: 'page types' stamp: 'hlsf 21/May/2026, 9:29:19 am (UTC)'!
applyPage: string
	title := string.
	wizard isCancellingPossible ifTrue: [self buttons addMorph: self cancelButton].
	self buttons
		addMorph: self previousButton;
		addMorph: self applyButton! !

!WizardPage methodsFor: 'page types' stamp: 'hlsf 21/May/2026, 9:29:24 am (UTC)'!
firstPage: string
	title := string.
	wizard isCancellingPossible ifTrue: [self buttons addMorph: self cancelButton].
	self buttons	addMorph: self nextButton.! !

!WizardPage methodsFor: 'page types' stamp: 'hlsf 21/May/2026, 9:29:29 am (UTC)'!
standardPage: string
	title := string.
	wizard isCancellingPossible ifTrue: [self buttons addMorph: self cancelButton].
	self buttons
		addMorph: self previousButton;
		addMorph: self nextButton ! !

!WizardPage class methodsFor: 'instance creation' stamp: 'hlsf 3/Nov/2021, 1:04:00 pm (UTC)'!
applyPage: aString on: aWizard
	^ self new 
		wizard: aWizard ;
		applyPage: aString;
		yourself! !

!WizardPage class methodsFor: 'instance creation' stamp: 'hlsf 3/Nov/2021, 1:04:00 pm (UTC)'!
firstPage: aString on: aWizard
	^ self new 
		wizard: aWizard ;
		firstPage: aString;
		yourself! !

!WizardPage class methodsFor: 'instance creation' stamp: 'hlsf 3/Nov/2021, 1:04:00 pm (UTC)'!
standardPage: aString on: aWizard
	^ self new 
		wizard: aWizard ;
		standardPage: aString;
		yourself! !

!InnerTextMorph methodsFor: '*UI-Panel' stamp: 'hlsf 25/Mar/2022, 9:16:00 am (UTC)'!
contents
	^ model actualContents ! !
