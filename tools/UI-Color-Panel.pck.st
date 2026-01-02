'From Cuis7.7 [latest update: #7782] on 2 January 2026 at 3:20:04 pm'!
'Description I supply the RGB/HSV and OK-LCH ColorEditor Panels'!
!provides: 'UI-Color-Panel' 1 49!
!requires: 'Cuis-Base' 77 7780 nil!
!requires: 'UI-DragAndDrop' 1 4 nil!
!requires: 'CSS3-NamedColors' 1 1 nil!
!requires: 'UI-Click-Select' 1 84 nil!
!requires: 'Color-Extras' 1 9 nil!
!requires: 'UI-Panel' 1 140 nil!
!requires: 'UI-Palette' 1 19 nil!
!requires: 'Graphics-Files-Additional' 1 30 nil!
SystemOrganization addCategory: #'UI-Color-Panel'!


!classDefinition: #ColorPaneMorph category: #'UI-Color-Panel'!
ImageMorph subclass: #ColorPaneMorph
	instanceVariableNames: 'zeroPlaneForm zIndex zValue colorPoint focusMorph'
	classVariableNames: 'BlueIndex BrightnessForm BrightnessIndex BrightnessOverlay GBForm GreenIndex HueIndex HueOverlay RBForm RGForm RedIndex SaturationForm SaturationIndex SaturationOverlay'
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'ColorPaneMorph class' category: #'UI-Color-Panel'!
ColorPaneMorph class
	instanceVariableNames: ''!

!classDefinition: #ColorRingMorph category: #'UI-Color-Panel'!
ImageMorph subclass: #ColorRingMorph
	instanceVariableNames: 'radius center'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'ColorRingMorph class' category: #'UI-Color-Panel'!
ColorRingMorph class
	instanceVariableNames: ''!

!classDefinition: #ColorSliderMorph category: #'UI-Color-Panel'!
ImageMorph subclass: #ColorSliderMorph
	instanceVariableNames: 'colorPane sliderMorph maxZValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'ColorSliderMorph class' category: #'UI-Color-Panel'!
ColorSliderMorph class
	instanceVariableNames: ''!

!classDefinition: #OKLCHCircleMorph category: #'UI-Color-Panel'!
ImageMorph subclass: #OKLCHCircleMorph
	instanceVariableNames: 'centerPoint colorRing hueArm chromaFrame colorDrawingScale'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'OKLCHCircleMorph class' category: #'UI-Color-Panel'!
OKLCHCircleMorph class
	instanceVariableNames: 'center'!

!classDefinition: #SimpleEntryButton category: #'UI-Color-Panel'!
ImageMorph subclass: #SimpleEntryButton
	instanceVariableNames: 'entryMorph myDelta'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'SimpleEntryButton class' category: #'UI-Color-Panel'!
SimpleEntryButton class
	instanceVariableNames: ''!

!classDefinition: #ColorPalette category: #'UI-Color-Panel'!
ImagePickerPanel subclass: #ColorPalette
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'ColorPalette class' category: #'UI-Color-Panel'!
ColorPalette class
	instanceVariableNames: ''!

!classDefinition: #ColorEditorPanel category: #'UI-Color-Panel'!
DialogPanel subclass: #ColorEditorPanel
	instanceVariableNames: 'alphaFrame alphaSlider alphaSwatch colorPane colorSwatch sliderColumn closeColorSwatch closeColorLabel closestRGB radioSelection rgbRadio hsvRadio closestColordictColor rgbString'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'ColorEditorPanel class' category: #'UI-Color-Panel'!
ColorEditorPanel class
	instanceVariableNames: ''!

!classDefinition: #OKLCHEditPanel category: #'UI-Color-Panel'!
DialogPanel subclass: #OKLCHEditPanel
	instanceVariableNames: 'circleMorph colorSwatch alphaSwatch lightnessSlider rgbEntry lEntry cEntry hEntry alphaEntry'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'OKLCHEditPanel class' category: #'UI-Color-Panel'!
OKLCHEditPanel class
	instanceVariableNames: ''!

!classDefinition: #HueArmMorph category: #'UI-Color-Panel'!
FrameMorph subclass: #HueArmMorph
	instanceVariableNames: 'model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'HueArmMorph class' category: #'UI-Color-Panel'!
HueArmMorph class
	instanceVariableNames: ''!

!classDefinition: #ColorEditorModel category: #'UI-Color-Panel'!
Object subclass: #ColorEditorModel
	instanceVariableNames: 'color'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'ColorEditorModel class' category: #'UI-Color-Panel'!
ColorEditorModel class
	instanceVariableNames: ''!

!classDefinition: #ColorSliderModel category: #'UI-Color-Panel'!
Object subclass: #ColorSliderModel
	instanceVariableNames: 'color setter getter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'ColorSliderModel class' category: #'UI-Color-Panel'!
ColorSliderModel class
	instanceVariableNames: ''!


!ColorPaneMorph commentStamp: '<historical>' prior: 0!
I present a plane in a color cube.

The x and y selectors map to a 256 x 256 plane (slice of a 3d cube) with a constant z.
	o-------> X
	|
	|				X and Y coordinates are as per Smalltalk view coordinates 
	v                    (y increasing downward)
	Y
The z value is "mixed in" to give a (x,y,z) color plane. [see #refreshForm]

The selected color point (x,y) is visually noted by a focusMorph "ring".
One may click on the pane to update the colorPoint.
Click and hold to pick up a color swatch.
The z value corresponds to the slider/scroller position mapped to the range:
	R/G/B       0..255
	Hue          0..360 (degrees)
	Sat/Bright 0..100 (%).

Note that RGB are additive colors.   
  E.g. for (x,y)=(red,blue);z=green 
  The "background" varies over r&b and a fixed g overlay is added.
HSV is more complex
  Basically an alpha is used to blend background and overlay.

See ColorPaneMorph>>refreshForm and 
	ColorPaneMorph class>>make*Form  and 
	>>make*Overlay  methods for details!

!ColorSliderMorph commentStamp: '<historical>' prior: 0!
I am a slider (a kind of ScrollBar) which shows a color range as a background.

The associated ColorPane has a Focus Color (x,y) at constant z.
This pane shows the range of color of z at the focus point -- constant (x,y)
!

!OKLCHCircleMorph commentStamp: '<historical>' prior: 0!
OKLCH Circle for Picker.

Cylindrical model: ligtness slice over degreees=hue, radius=chroma.

For a given lightness value, colorwheel is Hue by degree (0..360) 
and radial distabce/magnitude by chroma/saturation (gray..maxSat).
Color is absent where not supported by OKLCH.

!

!SimpleEntryButton commentStamp: '<historical>' prior: 0!
I am an excessively dumb button which adds a positive or negative delta 
to my entryMorph, which is a SimpleNumberEntryMorph!

!ColorPalette commentStamp: '<historical>' prior: 0!
I am just a way to get a Color palette.  See my class side.!

!ColorEditorPanel commentStamp: '<historical>' prior: 0!
I present the ColorEditor UI

Usage: 
	ColorEditorPanel open.
	ColorEditorPanel openWithColor: Color forestGreen.!

!OKLCHEditPanel commentStamp: '<historical>' prior: 0!
OK-LCH Color Editor.

https://en.wikipedia.org/wiki/Oklab_color_space
Color Picker [https://oklch.com]
Color Palette goal [https://harmonizer.evilmartians.com]
Why [https://evilmartians.com/chronicles/oklch-in-css-why-quit-rgb-hsl]
!

!ColorEditorModel commentStamp: '<historical>' prior: 0!
I am the model (state holder) for a ColorEditor.!

!ColorSliderModel commentStamp: 'KenD 28/Dec/2025 10:06:24' prior: 0!
I am the model (state holder) for a ColorSliderMorph.

I am used in place of a ColorPaneMorph to interface with a ColorSliderMorph.

My getter and setter are closuers used to update some other model from me.!

!ColorPaneMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 30/Nov/2013 19:33:00'!
aboutToGrab: aMorph
	"submorph is being grabbed by a hand.
	Perform necessary adjustments (if any) and return the actual morph
	that should be added to the hand.
	Answer nil to reject the drag."

	^ DropColorMorph fromColor: self focusColor! !

!ColorPaneMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 30/Nov/2013 19:35:00'!
allowsSubmorphDrag
	"Answer whether our morphs can just be grabbed with the hand, instead of requiring the use of the halo. Redefined to answer true."
	
	"Click and hold"

	^ true! !

!ColorPaneMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 3/Mar/2022 13:43:00'!
processDropMorph: aDropEvent
	"I have already expressed a desire for the drop. Just do it."
	
	| dropedMorph dropAction |
	dropedMorph := aDropEvent contents.
	dropAction := self valueOfProperty: #dropAction ifAbsent: [ nil ]. 
	aDropEvent wasHandled: (dropAction notNil).
	dropAction ifNotNil: [ :doIt |
		doIt value: dropedMorph value:  dropedMorph valueWhenDropped.
	 ]
! !

!ColorPaneMorph methodsFor: 'private' stamp: 'KenD 5/Dec/2013 20:50:00'!
colorConstructors
	"Answer a closure which takes values from my (x,y,z) and answers a Color.
	The radio button value is Z which determines the 'slider'.
	X and Y range from 0 to 256.
	Z ranges 0 to 255 (rgb) 360 (hue) or 100 (sv).
	
	Hue scale is 0..360; all others are 0..1.0"

	"self colorConstructors at: self zIndex"
	^ {
		[ :x :y :z | Color r: z/255 g: x/255 b: y/255  ] . "Red"
		[ :x :y :z | Color r: x/255 g: z/255 b: y/255 ] . "Green"
		[ :x :y :z | Color r: x/255 g: y/255 b: z/255 ] . "Blue"
		[ :x :y :z | Color h: z s: x/255 v: y/255 ]. "Hue"
		[ :x :y :z | Color h: x/255*360 s: z/100 v: y/255 ]. "Saturation"
		[ :x :y :z | Color h: x/255*360 s: y/255 v: z/100]. "Brightness"
	}! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 27/Nov/2013 15:48:00'!
colorPoint

	^ colorPoint ! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 7/Dec/2013 15:17:00'!
colorPoint: aPoint

	(colorPoint = aPoint)
		ifFalse: [ 
			colorPoint := aPoint.
			self triggerEvent: #colorChanged with: self
		]! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 27/Nov/2013 14:58:00'!
colorSelector

	^ #(red green blue hue saturation brightness) at: self zIndex ! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 5/Dec/2013 20:20:00'!
focusColor
	"Answer my focus color"
	
	^ (self colorConstructors at: zIndex) value: colorPoint x value: colorPoint y value: zValue 

! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013 18:20:00'!
focusMorph

	^ focusMorph! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013 22:32:00'!
pureColorForm
	"Create form from current color"

	^ self focusColor iconOrThumbnailOfSize: 256@256

! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013 23:20:00'!
rORgORbForm
	"Answer a pureColorForm of my z component -- which must be Red, Green, or Blue"

	|  colorMaker |
	colorMaker := {
		[ Color r: self zValue / 256 g: 0 b: 0 ]. "Red"
		[ Color r: 0 g: self zValue / 256 b: 0 ]. "Green"
		[ Color r: 0 g: 0 b: self zValue / 256 ]. "Blue"
		[ nil ]. "Hue"
		[ nil ]. "Saturation"
		[ nil ]. "Brightness"
	}.

	^ (colorMaker at: self zIndex) value iconOrThumbnailOfSize: 256@256
	
! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013 18:27:00'!
zIndex

	^ zIndex
! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013 13:29:00'!
zValue

	^ zValue ! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 7/Dec/2013 15:16:00'!
zValue: zeroTo255 "or ..100 or ..360"

	(zValue = zeroTo255)
		ifFalse: [ 
			zValue := zeroTo255.  "Does NOT change colorPoint"
			self triggerEvent: #colorChanged with: self.
		]
! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013 17:48:00'!
zeroPlaneForm

	^ zeroPlaneForm! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 26/Nov/2013 17:04:00'!
focusMorphDiameter
	
	^ 10! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 29/Nov/2013 14:35:00'!
fromModel: model selector: aSelector

	zIndex := self zIndexFromSelector: aSelector.
	self updateColorFromModel: model
! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 26/Nov/2013 18:43:00'!
initialize

	super initialize.
	self image: (Form extent: 256@256 depth: 32).
	self makeFocusMorph.! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 26/Nov/2013 18:43:00'!
makeFocusMorph

	focusMorph := EllipseMorph new. 
	focusMorph 
		morphExtent: self focusMorphDiameter @ self focusMorphDiameter;
		color: Color transparent;
		borderWidth: 2;
		borderColor: Color orange;
		morphPosition: 0@0.
		
	self addMorph: self focusMorph.! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 8/Dec/2013 08:07:00'!
zIndex: oneTo6 zValue: anInteger colorPoint: aPoint

	zIndex := oneTo6.
	zValue := anInteger.
	colorPoint := aPoint.
	self focusMorph morphPosition: (aPoint - (self focusMorphDiameter / 2)).
	self refreshForm;
		 triggerEvent: #colorChanged
! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 27/Nov/2013 09:21:00'!
zIndexFromSelector: aSelector

	^ #(red green blue hue saturation brightness) 
			indexOf: aSelector asLowercase asSymbol
			ifAbsent: [ self error: 'Invalid selector' , aSelector asString ]! !

!ColorPaneMorph methodsFor: 'change processing' stamp: 'KenD 15/Dec/2025 15:04:57'!
hackHSVform
	"answer a base form for color plane over (x,y) with constant z.
	This is turtle slow, but accurate"

	| colorMaker displayForm |
	displayForm := Form extent: 256@256 depth: 32.
	colorMaker := self colorConstructors at: self zIndex.
	1 to: 255 do: [ :x |
		1 to: 255 do:  [ :y | 
			displayForm colorAt: x @ y put: (colorMaker value: x value: y value: self zValue)
		]
	].
	self image: displayForm

	! !

!ColorPaneMorph methodsFor: 'change processing' stamp: 'KenD 1/Dec/2013 18:15:00'!
refreshForm
	"Create color pane from x,y base blending in z"

	| formMaker |
	formMaker := {
		[  "Red"
				self image: (self class gbForm copy). "(x,y,0)"
				self form 
					copy: (0@0 corner: 256@256) 
					from: self rORgORbForm "(0,0,z)"
					to: 0@0 
					rule: 20. "rgbAdd (x,y,0) to (0,0,z)"
		].
		[  "Green"
				self image: (self class rbForm copy). "(x,y,0)"
				self form 
					copy: (0@0 corner: 256@256) 
					from: self rORgORbForm "(0,0,z)"
					to: 0@0 
					rule: 20. "rgbAdd (x,y,0) to (0,0,z)"
		]. 
		[  "Blue"
				self image: (self class rgForm copy). "(x,y,0)"
				self form 
					copy: (0@0 corner: 256@256) 
					from: self rORgORbForm "(0,0,z)"
					to: 0@0 
					rule: 20. "rgbAdd (x,y,0) to (0,0,z)"
		]. 
		[  "Hue"
			self image: ((Color h: zValue s:1 v: 1) iconOrThumbnailOfSize: 256@256). 
			self form 
				copy: (0@0 corner: 256@256) 
				from: self class hueOverlay copy
				to: 0@0 
				rule: Form blend.		
		].
		[  "Saturation"
			self image: self class saturationForm copy.
			self form 
				copyBits: self class saturationOverlay 
				at: 0@0 
				translucent: (100 - zValue  / 100) asFloat
		].
		[  "Brightness"
			self image: self class brightnessForm copy.
			self form 
				copyBits:  (Color black iconOrThumbnailOfSize: 256@256)
				at: 0@0 
				translucent: (100 - zValue / 100) asFloat
		].
	}.
	(formMaker at: zIndex) value
	! !

!ColorPaneMorph methodsFor: 'change processing' stamp: 'KenD 2/Jan/2026 13:41:38'!
resetFocus

	| contrastingColor |
	self focusMorph morphPosition: (colorPoint - (self focusMorphDiameter / 2)).
	contrastingColor :=  self focusColor negated.
	"Show up against background"
	(contrastingColor oklchLightness > 0.8) 
		ifTrue: [self focusMorph borderColor: contrastingColor twiceDarker ]
		ifFalse: [self focusMorph borderColor: contrastingColor twiceLighter] .

	self triggerEvent: #resetFocus.
	! !

!ColorPaneMorph methodsFor: 'events' stamp: 'KenD 4/Dec/2013 21:52:00'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"

	^ true! !

!ColorPaneMorph methodsFor: 'events' stamp: 'KenD 4/Dec/2013 21:52:00'!
handlesMouseOver: evt
	"Do I want to receive mouseEnter: and mouseLeave: when the button is up and the hand is empty?" 
	
	^ true! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 28/Sep/2021 08:56:00'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	(self coversPixel: aMouseButtonEvent eventPosition)
		ifTrue: [ 
				self 
					colorPoint: localEventPosition;
					resetFocus;
					triggerEvent: #colorChanged
		]
! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 17/Sep/2019 06:35:00'!
mouseEnter: event

	Cursor currentCursor: (Cursor cursorAt: #crossHairCursor)! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 17/Sep/2019 06:35:00'!
mouseLeave: event

	Cursor currentCursor: (Cursor cursorAt: #normalCursor)! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 29/Nov/2013 00:08:00'!
updateColorFromModel: model
	"No selector change, but color changed"
	
	|  updateFuns |
	updateFuns := {
		[ zValue := model red. colorPoint := model green @ model blue ].
		[ zValue := model green. colorPoint := model red @ model blue ].
		[ zValue := model blue. colorPoint := model red @ model green ].
		[ zValue := model hue.
			colorPoint := (255* (model saturationFactor)) rounded 
				@ (255* (model brightnessFactor)) rounded ].
		[ zValue := model saturation. 
			colorPoint := (255* (model hueFactor)) rounded
				@ (255* (model brightnessFactor)) rounded ].
		[ zValue := model brightness. 
			colorPoint := (255* (model hueFactor)) rounded 
				@ (255* (model saturationFactor)) rounded ].
	}.

	(updateFuns at: self zIndex) value.
	self refreshForm.
	self resetFocus.
! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013 14:33:00'!
blueIndex

	^ BlueIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013 23:12:00'!
brightnessForm

	^ BrightnessForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013 14:34:00'!
brightnessIndex

	^ BrightnessIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013 23:13:00'!
brightnessOverlay

	^ BrightnessOverlay ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013 22:59:00'!
gbForm

	^ GBForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013 14:33:00'!
greenIndex

	^ GreenIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013 14:33:00'!
hueIndex

	^ HueIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013 23:11:00'!
hueOverlay

	^ HueOverlay! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013 22:59:00'!
rbForm

	^ RBForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013 14:33:00'!
redIndex

	^ RedIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013 22:59:00'!
rgForm

	^ RGForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013 23:12:00'!
saturationForm

	^ SaturationForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013 14:34:00'!
saturationIndex

	^ SaturationIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013 23:13:00'!
saturationOverlay

	^ SaturationOverlay! !

!ColorPaneMorph class methodsFor: 'initialization' stamp: 'KenD 3/Dec/2013 21:28:00'!
defaultColor

	^ Color transparent! !

!ColorPaneMorph class methodsFor: 'examples' stamp: 'KenD 26/Nov/2013 18:22:00'!
greenExample
	"RGB with Color Teal: r=2,g=147,b=134"
	"123"
"
	self greenExample.
"
	(self 
		zSelector: #Green
		zValue: 147 
		colorPoint: 2@134) openInWorld! !

!ColorPaneMorph class methodsFor: 'new-morph participation' stamp: 'KenD 6/Dec/2013 19:05:00'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 1/Dec/2013 16:13:00'!
initialize
"	
	self initialize.
"
	
	"This is the index of the z dimension -- the selected slider"
	RedIndex := 1. 
	GreenIndex := 2.
	BlueIndex := 3.
	HueIndex := 4.
	SaturationIndex := 5.
	BrightnessIndex := 6.
	
	SaturationForm := self makeSaturationForm.
	SaturationOverlay := self makeSaturationOverlay.
	BrightnessForm := self makeBrightnessForm.
	RBForm := self makeRBForm.
	RGForm := self makeRGForm.
	GBForm := self makeGBForm.
	HueOverlay := self makeHueOverlay.
	! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025 15:05:58'!
makeBrightnessForm
	"Briightness is the slider; This is a background/base slice of hue and value"

	| hueFactor briteForm |
	hueFactor := 256 / 360.
	briteForm := Form extent: 256@256 depth:  32.
	1 to: 255 do: [ :x |
		1 to: 255 do:  [ :y | 
			briteForm colorAt: x @ y put: (Color h: (x / hueFactor) s: (y / 256) v: 1.0)
		]
	].

	^ briteForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025 15:06:03'!
makeGBForm
	"(x,y)=(g,b), slider value adds z=red"
"
	(ImageMorph new image: ColorPaneMorph makeGBForm) openInWorld.
"
	| rbForm |
	rbForm := Form extent: 256@256 depth:  32.
	0 to: 255 do: [ :x |
		0 to: 255 do:  [ :y | 
			rbForm colorAt: x @ y put: (Color r: 0 g: x/256 b: y/256)
		]
	].

	^ rbForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025 15:06:09'!
makeHueOverlay
	"This is a combination of Saturation+Brightness which is mixed with a Hue"
"
	(ImageMorph new image: ColorPaneMorph makeHueOverlay) openInWorld.
"
	| hueForm valForm satForm |
	"Brightness (Value) component [y] from Black to White"
	valForm := Form extent: 256@256 depth:  32.
	0 to: 255 do: [ :x |
		0 to: 255 do:  [ :y | 
			valForm colorAt: x @ y put: ((Color h: 0 s: 0 v: (y/256)) alpha: (256-y)/256)
		]
	].
	"Saturation component [x] white mixed in from full to none"
	satForm := Form extent: 256@256 depth:  32.
	1 to: 255 do: [ :x |
		1 to: 255 do:  [ :y |
			satForm colorAt: x @ y put: (Color white alpha: (256-x)/256)
		]
	].
	hueForm := satForm.
	hueForm 
		copy: (0@0 corner: 256@256) 
		from: valForm 
		to: 0@0
		rule: Form blend.  "Mix S and V"
	
	^ hueForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025 15:06:15'!
makeRBForm
	"(x,y)=(r,b), slider value adds z=green"
"
	(ImageMorph new image: ColorPaneMorph makeRBForm) openInWorld.
"
	| rbForm |
	rbForm := Form extent: 256@256 depth:  32.
	0 to: 255 do: [ :x |
		0 to: 255 do:  [ :y | 
			rbForm colorAt: x @ y put: (Color r: x/256 g: 0 b: y/256)
		]
	].

	^ rbForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025 15:06:20'!
makeRGForm
	"(x,y)=(r,g), slider value adds z=blue"
"
	(ImageMorph new image: ColorPaneMorph makeRGForm) openInWorld.
"
	| rbForm |
	rbForm := Form extent: 256@256 depth:  32.
	0 to: 255 do: [ :x |
		0 to: 255 do:  [ :y | 
			rbForm colorAt: x @ y put: (Color r: x/256 g: y/256 b: 0)
		]
	].

	^ rbForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025 15:06:23'!
makeSaturationForm
	"Saturation is the slider.  Hue is the base and Brightness/Value the overlay"
"
	(ImageMorph new image: ColorPaneMorph makeSaturationForm) openInWorld.
"
	| hueFactor satForm |
	hueFactor := 256 / 360.
	satForm := Form extent: 256@256 depth:  32.
	0 to: 255 do: [ :x |
		0 to: 255 do:  [ :y | 
			satForm colorAt: x @ y put: (Color h: (x / hueFactor) s: 1.0 v: (y / 256))
		]
	].

	^ satForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025 15:06:28'!
makeSaturationOverlay
	"Overlay is Value/Brightness"
"
	(ImageMorph new image: ColorPaneMorph makeSaturationOverlay) openInWorld.
"
	| satOverlay |
	satOverlay := Form extent: 256@256 depth:  32.
	0 to: 255 do: [ :x |
		0 to: 255 do:  [ :y | 
			satOverlay colorAt: x @ y put: (Color h: 0 s: 0 v: (y / 256))
		]
	].

	^ satOverlay
! !

!ColorPaneMorph class methodsFor: 'geometry' stamp: 'KenD 16/Sep/2016 15:48:00'!
minimumExtent
	"Also my maximum extent"
	^ 256@256! !

!ColorPaneMorph class methodsFor: 'instance creation' stamp: 'KenD 26/Nov/2013 18:14:00'!
zSelector: aSymbol zValue: anInteger colorPoint: aPoint

	^ self new 
			zIndex: (#(Red Green Blue Hue Saturation Brightness) 
						 indexOf: aSymbol
						 ifAbsent: [ self error: 'Invalid selector' , aSymbol asString ])
			zValue: anInteger 
			colorPoint: aPoint! !

!ColorRingMorph methodsFor: 'drawing' stamp: 'KenD 21/Dec/2025 09:37:01'!
dotAt: circlePoint color: myColor
	"Draw a black dot relative to center at circlePoint"
	| myForm morphPoint |
	morphPoint := self circle2morph: circlePoint.
	myForm := self imageForm.
	-4 to: 4 do: [ :deltaX |
		-4 to: 4 do: [ :deltaY |
			myForm colorAt: morphPoint + (deltaX@deltaY) put: myColor.
		]
	].
	-1 to: 1 do: [ :pos |
		myForm colorAt: morphPoint + (5@pos) put: myColor.
		myForm colorAt: morphPoint + (pos@5) put: myColor.
		myForm colorAt: morphPoint + (-5@pos) put: myColor.
		myForm colorAt: morphPoint + (pos@-5) put: myColor.
	].
	image := myForm.  
	self redrawNeeded.! !

!ColorRingMorph methodsFor: 'drawing' stamp: 'KenD 2/Jan/2026 15:17:51'!
drawDots
	"Draw a circle of color-wheel dots at 10 degree increments"
	| innerRadius |
	innerRadius := radius - 20.
	0 to: 350 by: 10 do: [ :degrees |
		self dotAt: (Point r: innerRadius degrees: degrees) roundedHAFZ 
			color: ((Color okl: 0.58 c:  0.13 h:  degrees) adjustSaturation: 0.3 brightness: 0.2).
	]. ! !

!ColorRingMorph methodsFor: 'geometry' stamp: 'KenD 20/Dec/2025 13:17:23'!
circle2morph: circlePoint
	"Given a point relative to centerPoint as (0,0), return the Morph's point relative to it's origin"
	
	^ (circlePoint x + center x) @ (circlePoint y - center y) negated.! !

!ColorRingMorph methodsFor: 'initialization' stamp: 'KenD 20/Dec/2025 13:34:16'!
radius: r

	radius := r.
	center := (r @ r).
	self color: Color transparent;
		drawDots;
		redrawNeeded;
		yourself
	! !

!ColorRingMorph class methodsFor: 'instance creation' stamp: 'KenD 23/Dec/2025 09:04:28'!
initializedInstance
"
	self initializedInstance openInWorld.
"
 	^ self radius: 120! !

!ColorRingMorph class methodsFor: 'instance creation' stamp: 'KenD 20/Dec/2025 13:35:06'!
radius: r

	| sideLength |
	sideLength := r * 2 + 1. "Want a center pixel"
	
	^(self newWith: (Form extent: (sideLength@sideLength) depth: 32)) radius: r.! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 4/Dec/2013 22:03:00'!
colorPane

	^ colorPane ! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 26/Dec/2013 13:08:00'!
deltaPoint
	"Offset for slider to center on bar"
	
	^ -4  @ -5! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 5/Dec/2013 19:38:00'!
maxZValue

	^ maxZValue "100, 256, or 360"! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 15/Dec/2025 15:11:20'!
scaledZPosition
	"Answer color Z value scaled to 0..255 as Y position (zero low .. 255 high)"
	"NB: must round result as coordinate cannot be a fraction"

	^ (255 - ((self colorPane zValue / self maxZValue) * 255))! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 4/Dec/2013 22:03:00'!
sliderMorph

	^ sliderMorph ! !

!ColorSliderMorph methodsFor: 'initialization' stamp: 'KenD 5/Dec/2013 17:42:00'!
colorPane: aColorPaneMorph

	colorPane := aColorPaneMorph.
	self 
		refreshColorFromModel; 
		redrawBackground.! !

!ColorSliderMorph methodsFor: 'initialization' stamp: 'KenD 15/May/2024 15:13:00'!
initialize

	super initialize.
	sliderMorph := BorderedBoxMorph new.
	sliderMorph 
		color: Color transparent;
		borderColor: Color black;
		borderWidth: 3;
		morphExtent:28@10;
		morphPosition: -4@5.
		
	maxZValue := 256. "Default"

	self 
		image: (Form extent: 20@256 depth: 32); flag: #Trashed; "??Where??"
		layoutSpec: (LayoutSpec 
							fixedWidth: 28 
							fixedHeight: 256 
							offAxisEdgeWeight: #center);
		addMorph: sliderMorph.! !

!ColorSliderMorph methodsFor: 'events' stamp: 'KenD 5/Dec/2013 17:52:00'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"
	
	^ true! !

!ColorSliderMorph methodsFor: 'events' stamp: 'KenD 5/Dec/2013 21:09:00'!
mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition
	"Update visual feedback"

	super mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition.
	self colorPane zValue: (self zValueFromY: localEventPosition y).
	self resetSliderPosition.! !

!ColorSliderMorph methodsFor: 'events' stamp: 'KenD 1/Dec/2025 14:28:00'!
mouseMove: aMouseMoveEvent localPosition: localEventPosition

	aMouseMoveEvent anyButtonPressed ifTrue: [
		self colorPane zValue: (self zValueFromY: localEventPosition y).
		self resetSliderPosition.
	]! !

!ColorSliderMorph methodsFor: 'event handling' stamp: 'KenD 15/Dec/2025 15:15:01'!
redrawBackground
	"Draw the color scale as background and set maxZValue"
	
	| colorMaker myForm pointX pointY scaleZ |
	"r g b h s v"
	maxZValue := #(255 255 255 359 100 100) at: self colorPane zIndex. 
	scaleZ := {
		[ :z | z ]. [ :z | z ]. [ :z | z ]. "r g b"
		[ :z | z / 255 * 360 ]. [ :z | z / 255 * 100 ]. [ :z | z / 255 * 100 ]. "h s v"
	} at: self colorPane zIndex.
	
	colorMaker := self colorPane colorConstructors at: self colorPane zIndex.
	pointX := self colorPane colorPoint x.
	pointY := self colorPane colorPoint y.
	self image: (Form extent: 20@256 depth: 32). self flag: #Trashed.
	myForm  := self form.
	0 to: 19 do: [ :x |
		0 to: 255 do:  [ :y | 
			myForm colorAt: x@y 
					    put: (colorMaker value: pointX 
											value: pointY 
											value: (scaleZ value: 255-y))
		]
	].
	self resetSliderPosition.
	self redrawNeeded.! !

!ColorSliderMorph methodsFor: 'event handling' stamp: 'KenD 5/Dec/2013 19:33:00'!
refreshColorFromModel

	self resetSliderPosition.

	! !

!ColorSliderMorph methodsFor: 'event handling' stamp: 'KenD 26/Dec/2013 13:06:00'!
resetSliderPosition
	"Center me over selected Z position"
	
	self sliderMorph morphPosition: self deltaPoint + (0 @ (self scaledZPosition)).! !

!ColorSliderMorph methodsFor: 'private' stamp: 'KenD 5/Dec/2013 21:17:00'!
zValueFromY: zeroTo255

	| newY |
	newY := (zeroTo255 min: 255 max: 0).

	^ ((255 - newY) / 255) * self maxZValue! !

!ColorSliderMorph class methodsFor: 'instance creation' stamp: 'KenD 5/Dec/2013 17:31:00'!
colorPane: aColorPaneMorph

	^ self new colorPane: aColorPaneMorph! !

!ColorSliderMorph class methodsFor: 'new-morph participation' stamp: 'KenD 6/Dec/2013 19:06:00'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!OKLCHCircleMorph methodsFor: 'geometry' stamp: 'KenD 19/Dec/2025 13:36:28'!
circle2morph: circlePoint
	"Given a point relative to centerPoint as (0,0), return the Morph's point relative to it's origin"
	| answer |
	answer := (circlePoint x + centerPoint x) @ (circlePoint y - centerPoint y) negated.
	"Transcript log: 'Circle Pt: ', circlePoint printString, ' -> Morph Pt : ', answer printString."
	^ answer
! !

!OKLCHCircleMorph methodsFor: 'geometry' stamp: 'KenD 21/Dec/2025 13:46:19'!
colorRingOffset
	"Answer offset to set colorRing beyond our radius"
	| radius |
	radius := centerPoint x.
	^ radius // 5. ! !

!OKLCHCircleMorph methodsFor: 'geometry' stamp: 'KenD 21/Dec/2025 13:35:56'!
hueArmOffset

	"Answer point to add to centerPoint for hueArm"
	| radius offset  |
	radius := centerPoint x.
	offset := radius // 20. 
	^(offset@offset) negated "Up and to left"! !

!OKLCHCircleMorph methodsFor: 'geometry' stamp: 'KenD 19/Dec/2025 13:36:38'!
morph2circle: morphPoint
	"Given a point relative to centerPoint as (0,0), return the Morph's point relative to it's origin"
	| answer |
	answer := (morphPoint x - centerPoint x) @ (morphPoint y - centerPoint y) negated.
	"Transcript log: 'Morph Pt: ', morphPoint printString, ' -> Circle Pt : ', answer printString."
	^answer! !

!OKLCHCircleMorph methodsFor: 'geometry' stamp: 'KenD 21/Dec/2025 15:03:35'!
radius

	^ centerPoint x "Same as centerPoint y"! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 15:26:38'!
chromaFrame

	^chromaFrame! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 15:27:00'!
chromaFrame: aFraneMorph

	chromaFrame := aFraneMorph! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 26/Dec/2025 11:16:53'!
colorAbsenceColor

	"Answer this when no OKLCH color is present"
	^Color cyan lighter! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 21/Dec/2025 15:11:55'!
colorDrawingScale

	^colorDrawingScale! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 25/Dec/2025 09:46:08'!
colorRing

	^colorRing! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 13:31:52'!
hueArm

	^hueArm! !

!OKLCHCircleMorph methodsFor: 'initialization' stamp: 'KenD 29/Dec/2025 15:16:26'!
addColorRing

	| radius colorRingOffset |
	radius := centerPoint x.
	colorRingOffset := (radius // 5) + 4. 
	colorRing := ColorRingMorph radius: radius + colorRingOffset.
	self addMorphFront: colorRing.
	"Make colorRIng Center to be our Center"
	colorRing morphPosition: (colorRingOffset @ colorRingOffset) negated.! !

!OKLCHCircleMorph methodsFor: 'initialization' stamp: 'KenD 31/Dec/2025 13:56:18'!
addCromaFrame: chroma0To1

	|  side chromaFrameCenter |
	chromaFrame := FrameMorph new.
	side := self radius // 5.
	chromaFrame borderStyle: #simple;
			borderWidth: 3;
			borderColor: Color white;
	"(hueArm x to chromaFrame x) = (rotation center x to chromaFrame center x)"
			morphExtent: (2 * hueArm rotationCenter x negated @ side).
			
	chromaFrameCenter := chromaFrame morphExtent / 2.
	hueArm addMorphFront: chromaFrame.
	"Center on Chroma.  Cap Chroma to radius."
	chromaFrame morphPosition: ((colorDrawingScale * chroma0To1) min: self radius)
								@ ((chromaFrameCenter y  negated) + (hueArm morphExtent y // 2)).
	chromaFrame setProperty: #handlesMouseDown: 
				  toValue: [ :igniredEvent | ^true].
	chromaFrame setProperty: #mouseMove:localPosition: 
				  toValue: [ :mouseEvent :localPosition |
					mouseEvent anyButtonPressed ifTrue: [ | model newX |
						model := chromaFrame valueOfProperty: #model.
						newX := ((chromaFrame morphPosition x + localPosition x) 
								min: (model maxOKChroma * colorDrawingScale - chromaFrameCenter x)).
						chromaFrame morphPosition: (newX @  chromaFrame morphPosition y).
						model setOKChroma: (chromaFrame morphPosition x) / colorDrawingScale.
						"self newChromaAt: model color oklchChroma "
					].
				  ].! !

!OKLCHCircleMorph methodsFor: 'initialization' stamp: 'KenD 31/Dec/2025 11:23:40'!
addHueArm: hueInDegrees

	"My Hue arm is like a clock arm, rotated to show the hue in degrees."
	| ringOffset  |
	ringOffset := self colorRingOffset.
	hueArm := HueArmMorph new.
	hueArm borderStyle: #simple;
			borderWidth: 3;
			borderColor: Color black;
			morphExtent: (self radius - self hueArmOffset x) @ (ringOffset // 2) .
	"Want hueArm to pivot about cernerPoint "
	hueArm morphPosition: centerPoint + self hueArmOffset.
	self addMorphFront: hueArm.
	hueArm hide.
	^hueArm

	! !

!OKLCHCircleMorph methodsFor: 'initialization' stamp: 'KenD 25/Dec/2025 15:18:36'!
sideLength: numPixels l: llightness0to1 c: chroma0to1 h: hueIndegrees

	| center  |
	super initialize.
	color := Color transparent.
	center := numPixels // 2.
	centerPoint := (center @ center).
	colorDrawingScale := 3 * center.
	
	self beColorful: llightness0to1;
		addColorRing;
		addHueArm: hueIndegrees;
		addCromaFrame: chroma0to1;
		yourself
	

		! !

!OKLCHCircleMorph methodsFor: 'drawing' stamp: 'KenD 18/Dec/2025 20:00:10'!
dotAt: circlePoint
	"Draw a black dot relative to center at circlePoint"
	| myForm morphPoint |
	morphPoint := (self circle2morph: circlePoint) roundedHAFZ.
	myForm := self imageForm.
	-2 to: 2 do: [ :deltaX |
		-2 to: 2 do: [ :deltaY |
			myForm colorAt: morphPoint + (deltaX@deltaY) put: Color black.
		]
	].
	myForm colorAt: morphPoint + (3@0) put: Color black.
	myForm colorAt: morphPoint + (0@3) put: Color black.
	myForm colorAt: morphPoint + (-3@0) put: Color black.
	myForm colorAt: morphPoint + (0@-3) put: Color black.
	image := myForm.! !

!OKLCHCircleMorph methodsFor: 'color updating' stamp: 'KenD 26/Dec/2025 11:17:08'!
beColorful: lightness0To1
 	"Chroma and Hue are constant for a given lightness.
	Map between Morpj (x,y) from (0,0) to Circle with centerPoint."
	| morphPoint circlePoint pixelColor myForm myRadius |
	myForm := self imageForm.
	myRadius :=  self radius.
	0 to: (myRadius * 2) - 1 do: [ :theY |
		0 to: (myRadius * 2) - 1 do: [ :theX |
			morphPoint := theX @ theY.
			circlePoint := (self morph2circle: morphPoint) roundedHAFZ.
			(circlePoint magnitude < myRadius) ifTrue: [
				pixelColor := Color okOrNilL: lightness0To1
								    c: (circlePoint magnitude) / colorDrawingScale 
								    h: circlePoint degrees.
				myForm colorAt: morphPoint
						put: (pixelColor ifNotNil: [pixelColor] ifNil: [self colorAbsenceColor ])
				]
				ifFalse: [myForm colorAt: morphPoint put: Color transparent].
			
			(circlePoint magnitude roundedHAFZ = myRadius)
				ifTrue: [ myForm colorAt: morphPoint put: Color purple ].
		]
	].
	image := myForm.
	self dotAt: 0@0.  "Circle center"
	
	^self
  ! !

!OKLCHCircleMorph methodsFor: 'color updating' stamp: 'KenD 31/Dec/2025 13:57:59'!
newChromaAt: chroma0To1

	|  chromaFrameCenter |
	chromaFrameCenter := chromaFrame morphExtent / 2.
	"Center on Chroma.  Cap Chroma to radius."
	chromaFrame morphPosition: 
			((colorDrawingScale * chroma0To1) min: self radius)
			@ ((chromaFrameCenter y negated) + (hueArm morphExtent y // 2));
			redrawNeeded! !

!OKLCHCircleMorph methodsFor: 'color updating' stamp: 'KenD 31/Dec/2025 12:57:01'!
setColor:  aColor
	"Invoked by contaier on color change"
	aColor oklchDo: [ :lightness0To1 :chroma0to1 :hueInDegrees |
		self beColorful: lightness0To1.
		self newChromaAt: chroma0to1.
		self hueArm rotateToDegrees: hueInDegrees.
	].
	self redrawNeeded ! !

!OKLCHCircleMorph methodsFor: 'geometry testing' stamp: 'KenD 20/Dec/2025 13:45:01'!
submorphsMightProtrude

	^true "ColorRingMorph"! !

!OKLCHCircleMorph class methodsFor: 'new-morph participation' stamp: 'KenD 23/Dec/2025 09:02:20'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!OKLCHCircleMorph class methodsFor: 'instance creation' stamp: 'KenD 23/Dec/2025 08:59:50'!
sideLength: numPixels color: aColor

	| sideLength |
	(numPixels odd)
		ifTrue: [ sideLength := numPixels ]
		ifFalse: [ sideLength := numPixels + 1 ].
	aColor oklchDo: [ :lightness :chroma :hue |
		^(self newWith: (Form extent: (sideLength@sideLength) depth: 32)) 
				sideLength: sideLength 
				l: lightness 
				c: chroma 
				h: hue
	]
! !

!OKLCHCircleMorph class methodsFor: 'instance creation' stamp: 'KenD 17/Dec/2025 18:35:49'!
sideLength: numPixels l: lightness c: chroma h: hue

	| sideLength |
	(numPixels odd)
		ifTrue: [ sideLength := numPixels ]
		ifFalse: [ sideLength := numPixels + 1 ].
	^(self newWith: (Form extent: (sideLength@sideLength) depth: 32)) 
		sideLength: sideLength 
		l: lightness 
		c: chroma 
		h: hue
! !

!SimpleEntryButton methodsFor: 'events' stamp: 'KenD 29/Dec/2025 09:21:51'!
handlesMouseDown: aMouseButtonEvent
	^ true! !

!SimpleEntryButton methodsFor: 'events' stamp: 'KenD 29/Dec/2025 09:21:44'!
handlesMouseOver: evt
	"implements #mouseEnter: and/or #mouseLeave:"
	^true! !

!SimpleEntryButton methodsFor: 'events' stamp: 'KenD 29/Dec/2025 14:21:25'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	super mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition.
	entryMorph valueUpdator value: (entryMorph value + myDelta).
	entryMorph redrawNeeded 
! !

!SimpleEntryButton methodsFor: 'events' stamp: 'KenD 29/Dec/2025 09:56:28'!
mouseEnter: aMouseEvent

	borderColor := OKLCHEditPanel swatchBorderColor.
	self redrawNeeded ! !

!SimpleEntryButton methodsFor: 'events' stamp: 'KenD 29/Dec/2025 09:56:48'!
mouseLeave: aMouseEvent

	borderColor := Color black.
	self redrawNeeded ! !

!SimpleEntryButton methodsFor: 'initialization' stamp: 'KenD 29/Dec/2025 14:20:57'!
entryModel: aSimpeNumberEntryMorph delta: aNumber

	entryMorph := aSimpeNumberEntryMorph.
	myDelta := aNumber.
! !

!SimpleEntryButton class methodsFor: 'instance creation' stamp: 'KenD 31/Dec/2025 12:21:04'!
newDown: aSimpeNumberEntryMorph delta: aNumber
	
	| newMe |
	(aNumber > 0) ifTrue: [self error: 'newDown delta must be negative'].
	newMe :=  super newWith:  (BitBltCanvas arrowOfDirection: #down size: 16).
	^newMe borderWidth: 3;
			borderColor: Color black;
			entryModel:  aSimpeNumberEntryMorph delta: aNumber;
			yourself! !

!SimpleEntryButton class methodsFor: 'instance creation' stamp: 'KenD 31/Dec/2025 12:21:09'!
newUp: aSimpeNumberEntryMorph delta: aNumber
	
	| newMe |
	(aNumber < 0) ifTrue: [self error: 'newUp delta must be positive'].
	newMe :=  super newWith:  (BitBltCanvas arrowOfDirection: #up size: 16).
	^newMe borderWidth: 3;
			borderColor: Color black;
			entryModel:  aSimpeNumberEntryMorph delta: aNumber;
			yourself! !

!ColorPalette class methodsFor: 'instance creation' stamp: 'KenD 16/Sep/2021 14:15:00'!
initializedInstance

	^ ImagePickerPanel namedColors! !

!ColorPalette class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022 15:04:00'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!ColorPalette class methodsFor: 'new-morph participation' stamp: 'KenD 24/Dec/2013 17:55:00'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 24/Dec/2013 19:57:00'!
useCSS3ColorDict
"
	self useCSS3ColorDict.
"
	Feature require: 'CSS3-NamedColors'.
	Color setColorNamesDict: Color css3ColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 24/Jul/2015 11:33:00'!
useCrayonColorDict
"
	ColorPalette useCrayonColorDict.
"

	Feature require: 'Crayon-NamedColors'.
	Color setColorNamesDict: Color crayonColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 24/Dec/2013 19:57:00'!
useNBSISCCColorDict
"
	self useNBSISCCColorDict.
"
	Feature require: 'NBSISCC-NamedColors'.
	Color setColorNamesDict: Color nbsisccColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 24/Dec/2013 19:56:00'!
useSmallColorDict

	Color setColorNamesDict: Color defaultColorNamesDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 24/Dec/2013 19:56:00'!
useXKCDColorDict
"
	self useXKCDColorDict.
"

	Feature require: 'XKCD-NamedColors'.
	Color setColorNamesDict: Color xkcdColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 24/Dec/2013 19:59:00'!
useXKCDFirst48ColorDict
"
	self useXKCDFirst48ColorDict.
"

	Color setColorNamesDict: Color xkcdFirst48ColorNamesDictionary.! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 26/Nov/2013 21:27:00'!
colorPane

	^ colorPane ! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 29/Oct/2015 08:57:00'!
colorSelectionSymbol

	^ radioSelection ! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 29/Oct/2015 08:57:00'!
colorSelectionSymbol: aSym

	radioSelection := aSym! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 19/Nov/2013 21:15:00'!
colorSwatch

	^ colorSwatch! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 19/Nov/2013 21:14:00'!
hsvRadio

	^ hsvRadio! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 19/Nov/2013 21:14:00'!
rgbRadio

	^ rgbRadio! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 24/Nov/2013 08:48:00'!
rgbString
	"Answer my rgbString StringMorph"
	^ rgbString! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 25/Nov/2013 19:12:00'!
sliderColumn

	^ sliderColumn! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 9/Feb/2022 13:50:00'!
swatchBorderColor

	"Match with Visual Menu Item text color"
	^ (Color r: 0.5 g: 0.07 b: 0.5) ! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 11/Feb/2022 13:18:00'!
buildAlphaSwatch
	"Display swatch of current color including alpha value."
	
	alphaSwatch := 
		DropColorMorph fromColor: model color.
		
	alphaFrame := FrameMorph new ::
		morphExtent: alphaSwatch morphExtent + 8;
		borderColor: self swatchBorderColor; 
		borderWidth: 4; 	
		"Make color swatch draggable"
		setProperty: #allowsSubmorphDrag 
				toValue: true;
		"Flash when mouseover"
		setProperty: #handlesMouseOver: 
				toValue: true;
		setProperty: #mouseEnter:   
				toValue: [ :ignoredEvent | alphaFrame flash ];
		yourself.
	
	alphaFrame addMorph: alphaSwatch.
	alphaSwatch 
		morphPosition: 4@4 ;
		setBalloonText: 
'Drag:
Color plus α' .
	
	^alphaFrame
	! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 1/Dec/2025 14:19:00'!
buildColorPaneColumn

	| selector column hexDisplayLayout  |
	selector := self defaultRadioSelector asLowercase asSymbol.
	colorPane := (ColorPaneMorph 
					zSelector: self defaultRadioSelector 
					zValue:  (self model perform: selector)
					colorPoint: 10@10).
	colorPane updateColorFromModel: self model.
	colorPane when: #colorChanged send: #updateColorFromPane to: self.
	colorPane layoutSpec: (LayoutSpec keepMorphExtent).
	
	hexDisplayLayout := LayoutMorph newRow.
	hexDisplayLayout
		layoutSpec: (LayoutSpec 
							proportionalWidth: 0.2 
							proportionalHeight: 0.1
							offAxisEdgeWeight: #center);
		gap: 1;
		color: Color transparent;
		addMorph: (LabelMorph new contents: '16r') layoutSpec: (LayoutSpec keepMorphExtent);
		addMorph: self rgbString;
		addMorph: (LabelMorph new contents: ' hexRGB').
		
	alphaSlider := PluggableScrollBar new ::
		model: self model setValueSelector: #alpha: refreshValueSelector: #alpha ; 
		interval: 0;
		morphExtent: (256 @ Theme current scrollbarThickness) ;   "Horizontal"
		setProperty: #balloonText toValue: 'set alpha transparency' ;
		adoptWidgetsColor: Color orange darker darker ;
		refreshValueFromModel . 
	
	column := LayoutMorph newColumn.
	column
		addMorph: colorPane ;
		addMorph: hexDisplayLayout; 
		addMorph: alphaSlider ;
		addMorph: (LabelMorph contents: 'transparent <-α-> opaque') ;
		axisEdgeWeight: #columnTop;
		gap: 4;
		color: Color transparent.
	
	^ column! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 23/Dec/2025 14:15:10'!
buildMorphicWindow
" Our layout is a bit different to a traditional dialog, so we override as 
we don't need button area at the bottom and main panel is a row of morphs." 
	
	self layoutMorph gap: self defaultSeparation ;
		padding: 10;
		axisEdgeWeight: self defaultAlignement ;
		addMorph: self buildColorPaneColumn;
		addMorph: self buildSliderColumn;
		addMorph: self buildRadioButtonColumn;
		color: (Theme current paneBackgroundFrom: Color grey);
		morphExtent: self minimumExtent.
	self model 
		when: #colorChanged 
		send: #refreshColor 
		to: self.
	^self
		colorSwatchesBeDroppable;
		refreshColor;
		yourself
! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 14/Sep/2024 15:14:00'!
buildRadioButtonColumn

	| radioCol setupEntryMorph valueEntryMorph |
	rgbRadio := RadioGroup fromList: #(Red Green Blue).
	rgbRadio gap: 2.
	hsvRadio := RadioGroup fromList: #(Hue Saturation Brightness).
	hsvRadio gap: 2.
	rgbRadio when: #informRadioSelection send: #newRadioSelection: to: self.
	hsvRadio when: #informRadioSelection send: #newRadioSelection: to: self.
	setupEntryMorph := [ :sym :entryMorph | | selector |
		selector := sym asLowercase asSymbol.
		entryMorph valueAccessor: [ :myModel | myModel perform: selector ].
		entryMorph valueUpdator: [ :myValue | 
					self model perform: ( selector , ':' ) asSymbol with: myValue ].
		entryMorph refreshValueFrom: self model.
		self model when: #colorChanged 
			send: #refreshValueFrom: 
			to: entryMorph.
	].
	
	#(Red Green Blue) do: [ :sym | | entryMorph |
		entryMorph := SimpleNumberEntryMorph rgbOneOf.
		setupEntryMorph value: sym value: entryMorph.
		(rgbRadio rowFor: sym) addMorph: entryMorph.
	].
	valueEntryMorph := SimpleNumberEntryMorph circleDegreesExact.
	setupEntryMorph value: #Hue value: valueEntryMorph.
	(hsvRadio rowFor: #Hue) 
		addMorph: valueEntryMorph;
		addMorph: (LabelMorph contents: 'deg').
.
	#(Saturation Brightness) do:  [ :sym | | entryMorph |
		entryMorph := SimpleNumberEntryMorph percentExact.
		setupEntryMorph value: sym value: entryMorph.
		(hsvRadio rowFor: sym) 
			addMorph: entryMorph;
			addMorph: (LabelMorph contents: '%').
	].
	(rgbRadio buttonFor: self defaultRadioSelector) select.

	self rgbString 
		valueAccessor: [ :myModel | myModel rgbValue ];
		valueUpdator: [ :myValue | self model setRGBColorFromInteger: myValue ];
		refreshValueFrom: self model.
	self model when: #colorChanged send: #refreshValueFrom: to: rgbString.

	radioCol := LayoutMorph newColumn.
	^ radioCol 
		gap: 0;
		axisEdgeWeight: #columnTop;
		addMorph: rgbRadio;
		addMorph: hsvRadio;
		addMorph: self buildSwatchLayout;
		color: Color transparent;
		yourself
	! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 7/Feb/2022 11:24:00'!
buildSliderColumn

	sliderColumn := LayoutMorph newColumn.
	sliderColumn color: Color transparent.
	self 		
		buildAlphaSwatch;
		resetSliderColumn.
	
	^ sliderColumn 

	! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 14/Sep/2024 15:14:00'!
buildSwatchLayout
	"Display swatch of current color and closest named color"

	| swatchLayout labelColumn colorFrame closeColorFrame |
	closeColorSwatch := DropColorMorph fromColor: model color "baseColor".
	closeColorFrame := FrameMorph new ::
		morphExtent: closeColorSwatch morphExtent + 8;
		borderColor: self swatchBorderColor; 
		borderWidth: 4; 	
		"Make color swatch draggable"
		setProperty: #allowsSubmorphDrag toValue: true;
		"Flash when mouseover"
		setProperty: #handlesMouseOver: 
				toValue: true;
		yourself.
	closeColorFrame 
		addMorph: closeColorSwatch;
		setProperty: #mouseEnter:   
			toValue: [ :ignoredEvent | closeColorFrame flash ].
	closeColorSwatch 
		morphPosition: 4@4;
		setBalloonText: 
'Drag:
Closest Web Color' .
	labelColumn        := LayoutMorph newColumn.
	closeColorLabel   := LabelMorph new contents: ''.
	labelColumn
		color: Color transparent;
		axisEdgeWeight: #center;
		gap: 3;
		addMorph: closeColorFrame layoutSpec: (LayoutSpec keepMorphExtent);
		addMorph: closestRGB          layoutSpec: (LayoutSpec keepMorphExtent);
		addMorph: closeColorLabel   layoutSpec: (LayoutSpec keepMorphExtent).
		
	colorFrame := FrameMorph new ::
		morphExtent: colorSwatch morphExtent + 8;
		borderWidth: 4; 	
		borderColor: self swatchBorderColor;
		"Make color swatch draggable"
		setProperty: #allowsSubmorphDrag toValue: true;
		"Flash when mouseover"
		setProperty: #handlesMouseOver: 
				toValue: true;
		yourself.
	colorFrame 
		addMorph: colorSwatch;
		setProperty: #mouseEnter:   
			toValue: [ :ignoredEvent | colorFrame flash ].
	colorSwatch 
		morphPosition: 4@4 ;
		setBalloonText: 
'Drag: 
Color without α' .

	swatchLayout := LayoutMorph newRow.
	^ swatchLayout 
		gap: 6;
		addMorph: colorFrame layoutSpec: (LayoutSpec keepMorphExtent);
		addMorph: labelColumn;
		color: Color transparent;
		yourself
	! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 29/Oct/2015 09:01:00'!
resetSliderColumn

	self resetSliderColumn: self colorSelectionSymbol! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 14/Sep/2024 15:14:00'!
resetSliderColumn: sliderSym
	"Radio selector changed.."

	| scrollBar sliderLabel |
	"#(Red Green Blue Hue Saturation Brightness) inclides: sliderSym"
	scrollBar := 
		ColorSliderMorph colorPane: self colorPane.
	
	(self sliderColumn submorphs 
		detect: [ :s | s class == ColorSliderMorph ] 
					ifNone: [ nil ]) 
		ifNotNil: [ :sb | 
			self colorPane removeDependent: sb 
		].
		
	self colorPane 
		when: #colorChanged 
		send: #refreshColorFromModel 
		to: scrollBar.
		
	self colorPane 
		when: #resetFocus     
		send: #redrawBackground         
		to: scrollBar.

	sliderLabel := sliderSym asString.
	
	^self sliderColumn 
		removeAllMorphs;
		gap: 6;
		layoutSpec: (LayoutSpec 
					fixedWidth: 4 
					  + (FontFamily 
						defaultFamilyAndPointSize 
						widthOfString:
						 'BrightnessXX') 
					fixedHeight: 256  
					offAxisEdgeWeight: 
						#columnLeft);
		addMorph: scrollBar;
		addMorph: (LabelMorph 
					contents: sliderLabel 
					font: FontFamily 
						defaultFamilyAndPointSize);
		addMorph: alphaFrame ;
		yourself
! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 23/Nov/2013 17:09:00'!
colorSwatchExtent

	^ 64 @ 64! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 4/Mar/2022 13:32:00'!
colorSwatchesBeDroppable

	{alphaSwatch. colorPane. colorSwatch.} do: [ :dropTarget | 
		dropTarget
			setProperty:  #'allowsMorphDrop' toValue: true;
			setProperty: #wantsDroppedMorph:event: 
				toValue: [ :dropMorph :evt | dropMorph valueWhenDropped isKindOf: Color] ;
			setProperty: #dropAction 
				toValue: [ :dropMorph :colorValue |
					self setColor: colorValue. 
					dropMorph showAcceptAndDeleteSelf.
				]
	].
! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'hlsf 29/Dec/2021 10:17:00'!
defaultAlignement
	^ #rowLeft! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 24/Nov/2013 18:58:00'!
defaultRadioSelector

	^ #Green! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 28/May/2022 12:02:00'!
initialize

	super initialize.
	self beRow.
	self color: Color veryVeryLightGray.
	self titleMorph showButtonsNamed: #( close collapse ).
	model ifNil: [ model := ColorEditorModel new ].
	colorSwatch := DropColorMorph fromColor: model color.
	rgbString     := SimpleNumberEntryMorph hexRGBEntry.
	closestRGB  := LabelMorph new contents: ''.
	self 
		colorSelectionSymbol: self defaultRadioSelector;
		refreshColorSwatch;
		yourself

	! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 27/May/2022 15:00:00'!
model: aColorModel
	
	model := aColorModel ! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 28/May/2022 11:51:00'!
setColor: aColor

	self model setColor: aColor.
	self refreshColor.
! !

!ColorEditorPanel methodsFor: 'events-processing' stamp: 'KenD 29/Oct/2015 09:02:00'!
fontPreferenceChanged

	super fontPreferenceChanged.
	self resetSliderColumn.! !

!ColorEditorPanel methodsFor: 'events-processing' stamp: 'KenD 29/Oct/2015 09:01:00'!
newRadioSelection: selectionSymbol

	"Only one radio group can be selected at a time"
	( #(Red, Green, Blue) includes: selectionSymbol ) 
		ifTrue: [ self hsvRadio unselectAll ].
	( #(Hue Saturation Brightness) includes: selectionSymbol ) 
		ifTrue: [ self rgbRadio unselectAll ].
		
	self colorSelectionSymbol: selectionSymbol.
	self resetSliderColumn.
	self colorPane fromModel: self model selector: selectionSymbol.
	self colorPane resetFocus.

	
	! !

!ColorEditorPanel methodsFor: 'events-processing' stamp: 'KenD 6/Feb/2022 15:53:00'!
updateColorFromPane
	"Someone changed color in colorPane.  Update my model"
	
	self model setColor: 
		(self colorPane focusColor
			alpha: self model alpha)! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 30/Dec/2025 12:48:39'!
refreshAlphaSwatch
	"When color changes"
	
	(alphaSwatch color = self model color)
	ifFalse: [ | newColor |
		newColor := self model color. " alpha: alphaSlider value."
		alphaSwatch image: 
		(newColor 
			iconOrThumbnailOfSize: 32@32).
		alphaSwatch color: newColor.
		alphaSlider refreshValueFromModel.
	]! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 12/Sep/2021 15:41:00'!
refreshCloseColor
	"model color has changed.  Refresh my views."
	
	| closeAssoc closeColor |
	closeAssoc := self model color closestAssocFrom: Color css3ColorDictionary.
	closeColor := closeAssoc value.
	closeColorSwatch 
		image: (closeColor iconOrThumbnailOfSize: 32);
		color: closeColor.
	closeColorLabel 
		contents: closeAssoc key asString; 
		fitContents.
	closestRGB 
		contents: '16r', (closeColor hexStringRGB);
		fitContents.
	"I may have changed extent a bit.
	Make sure it all still fits."
	self morphExtent: self minimumExtent.
! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 6/Feb/2022 16:12:00'!
refreshColor
	"model color has changed.  Refresh my views."
	
	self 
		refreshColorSwatch;
		refreshColorPane;
		refreshCloseColor;
		refreshAlphaSwatch! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 27/Nov/2013 14:43:00'!
refreshColorPane
	"When selector changes.."

	self colorPane updateColorFromModel: self model.! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 6/Feb/2022 16:00:00'!
refreshColorSwatch
	"When color changes"
	
	colorSwatch image: (model baseColor iconOrThumbnailOfSize: self colorSwatchExtent).
	colorSwatch color: self model baseColor! !

!ColorEditorPanel methodsFor: 'accessing' stamp: 'KenD 5/Jun/2025 12:44:00'!
defaultLayerNumber
	"Act like any other Morph with respect to Z-order"
	^100! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 27/Jul/2024 18:56:00'!
initializedInstance
"
	self initializedInstance openInWorld.
"
 	| panel |
	panel := self new
		model: (ColorEditorModel color: self defaultColor) ;
		buildMorphicWindow;
		setLabel: 'Color Editor'.
	^ panel 	
		"widgetsColor: panel windowColor ;
		yourself"! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 28/May/2022 11:40:00'!
open
"
	self open 
"	
	^ self open: (ColorEditorModel color: self defaultColor)! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 7/Feb/2022 12:25:00'!
open: model

	^ self open: model label: 'Color Editor'! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 2/Jan/2026 12:19:49'!
openWithColor: aColor

	^ self open: (ColorEditorModel color: aColor) label: 'Color Editor'! !

!ColorEditorPanel class methodsFor: 'initialization' stamp: 'KenD 24/Dec/2013 09:26:00'!
defaultColor

	^ Color  r: 16r40/255 g: 16rA5/255 b: 16rD0/255.! !

!ColorEditorPanel class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022 15:02:00'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!ColorEditorPanel class methodsFor: 'new-morph participation' stamp: 'KenD 6/Dec/2013 19:09:00'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025 13:04:54'!
defaultAlignement
	^ #rowLeft! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025 13:04:21'!
defaultLayerNumber
	"Act like any other Morph with respect to Z-order"
	^100! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 25/Dec/2025 14:21:32'!
defaultSeparation

	^10! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 24/Dec/2025 11:37:52'!
labelFont

	^ (FontFamily defaultFamilyPointSize: 16)! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 24/Dec/2025 11:38:29'!
minorFont

	^ (FontFamily defaultFamilyPointSize: 10)! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025 09:22:30'!
model: aColorModel
	
	model := aColorModel ! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 29/Dec/2025 14:53:05'!
setColor: aColor
	" Set my model's color."
	
	self model setColor: aColor.
	"Invokes #colorChanged for refreshColor"! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 24/Dec/2025 13:19:02'!
swatchBorderColor

	"Match with Visual Menu Item text color"
	^ (Color r: 0.5 g: 0.07 b: 0.5) ! !

!OKLCHEditPanel methodsFor: 'initialization' stamp: 'KenD 30/Dec/2025 12:27:26'!
initialize

	super initialize.
	self beRow.
	self color: Color veryVeryLightGray.
	self titleMorph showButtonsNamed: #( close collapse ).
	model ifNil: [ model := ColorEditorModel new ].
	colorSwatch := DropColorMorph fromColor: model color. "alpha=1"
	alphaSwatch :=  DropColorMorph fromColor: model color. 
	rgbEntry      := SimpleNumberEntryMorph hexRGBEntry.
"	self model when: #colorChanged: send: #refreshColor to: self."
	circleMorph := OKLCHCircleMorph 
						sideLength: self class defaultCircleMorphSideLength 
						color: model color.
	^self borderWidth: self defaultSeparation ; "Add room for color circle"
		  borderColor: Color transparent;
		 yourself! !

!OKLCHEditPanel methodsFor: 'color updating' stamp: 'KenD 29/Dec/2025 14:35:57'!
colorChanged

	self refreshColor
		

! !

!OKLCHEditPanel methodsFor: 'color updating' stamp: 'KenD 27/Dec/2025 13:54:19'!
refreshAlphaSwatch
	"When color changes"
	
	(alphaSwatch color = self model color)
	ifFalse: [ | newColor | 
		newColor := self model color.
		alphaSwatch image: 
			(newColor iconOrThumbnailOfSize: 32@32).
		alphaSwatch color: newColor
	]! !

!OKLCHEditPanel methodsFor: 'color updating' stamp: 'KenD 27/Dec/2025 14:23:41'!
refreshCircleMorph

	circleMorph setColor: self model color! !

!OKLCHEditPanel methodsFor: 'color updating' stamp: 'KenD 27/Dec/2025 13:49:29'!
refreshColor
	"model color has changed.  Refresh my views."
	
	lightnessSlider refreshValueFromModel.

	self 
		refreshAlphaSwatch;
		refreshColorSwatch.

	{ alphaEntry. rgbEntry. lEntry. cEntry.  hEntry. } do: [ :entry |
		entry refreshValueFrom: self model.
	].

	self refreshCircleMorph;
		redrawNeeded;
		yourself
! !

!OKLCHEditPanel methodsFor: 'color updating' stamp: 'KenD 23/Dec/2025 14:26:35'!
refreshColorSwatch
	"When color changes"
	
	colorSwatch image: (model baseColor iconOrThumbnailOfSize: self class colorSwatchExtent).
	colorSwatch color: self model baseColor "NB: No alpha here. Alpha=1"! !

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 30/Dec/2025 12:30:02'!
buildColorCircleColumn

	| circleLayout |
	circleLayout := LayoutMorph newColumn :: 
		separation: 20;
		axisEdgeWeight: #center;
		color: Color transparent.
						
	"circleMorph := OKLCHCircleMorph sideLength: 260 color: self model color."
	circleMorph layoutSpec: (LayoutSizeSpec new offAxisEdgeWeight: #center).
	circleMorph hueArm model: self model.
	circleMorph chromaFrame setProperty: #model toValue: self model.
	
	^circleLayout 
		addMorph: circleMorph;
		yourself
! !

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 2/Jan/2026 12:18:05'!
buildLightnessSliderColumn

	"Answer a verticle slider with dark at bottom and light at top"
	| lightSliderLayout |
	lightSliderLayout := LayoutMorph newColumn :: 
		separation: 0;
		axisEdgeWeight: #center;
		color: Color transparent.
		
	lightnessSlider := PluggableScrollBar new ::
						model: (self model)
								setValueSelector: #setOKDarkness: 
								refreshValueSelector: #getOKDarkness ;
						setProperty: #balloonText toValue: 'set Lightness' ;
						interval: 0;
						scrollDelta: 0.02 pageDelta: 0.1;  "2% & 10%"
						color: Color grey;
						morphExtent: (Theme current scrollbarThickness @ 300);
						value: (self model) getOKDarkness. "Black @ bottom"
	
	^lightSliderLayout 
		addMorph: lightnessSlider;
		yourself
! !

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 26/Dec/2025 13:42:27'!
buildMorphicWindow
" Our layout is a bit different to a traditional dialog, so we override as 
  we don't need button area at the bottom and main panel is a row of morphs." 
	
	layoutMorph beRow.  "A row of columns"
	self layoutMorph gap: self defaultSeparation ;
		axisEdgeWeight: self defaultAlignement ;
		padding: 10;
		color: (Color veryVeryLightGray);
		addMorph: self buildColorCircleColumn;
		addMorph: self buildLightnessSliderColumn;
		addMorph: self buildValuesColumn;
		addMorph: self buildSwatchesColumn;
		morphExtent: self minimumExtent.
	self titleMorph color: Color grey.
	self model 
		when: #colorChanged 
		send: #refreshColor 
		to: self.
	^self
		colorSwatchesBeDroppable;
		refreshColor;
		yourself
! !

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 31/Dec/2025 12:48:21'!
buildSwatchesColumn

	| swatchesLayout colorFrame rgbLayout alphaFrame |
	swatchesLayout := LayoutMorph newColumn ::
		 padding: 10;
		 axisEdgeWeight: #columnTop;
		 color: Color transparent.
	colorFrame := FrameMorph new ::
		morphExtent: (self class colorSwatchExtent) + 16;
		borderWidth: 4; 	
		borderColor: self swatchBorderColor;
		"Make color swatch draggable"
		setProperty: #allowsSubmorphDrag toValue: true;
		"Flash when mouseover"
		setProperty: #handlesMouseOver: toValue: true;
		addMorph: colorSwatch;
		yourself.
	colorSwatch morphPosition: 4@4;
				setBalloonText: 
'Drag:
Full Color [α=1]' .
	colorFrame setProperty: #mouseEnter:   
				toValue: [ :ignoredEvent | colorFrame flash ].
	
	rgbEntry := SimpleNumberEntryMorph hexRGBEntry ::
					valueAccessor: [ :myModel | myModel rgbValue ];
					valueUpdator: [ :myValue |  
						self model setRGBColorFromInteger: myValue ];
					refreshValueFrom: self model;
					yourself.
	rgbLayout := LayoutMorph newRow ::
				color: Color transparent;
				addMorph: (LabelMorph contents: 'RGB 16r' font: self minorFont);
				addMorph: rgbEntry;
				yourself.
				
	alphaFrame  := FrameMorph new ::
		morphExtent: alphaSwatch morphExtent + 8;
		borderColor: self swatchBorderColor; 
		borderWidth: 4; 	
		"Make color swatch draggable"
		setProperty: #allowsSubmorphDrag 
				toValue: true;
		"Flash when mouseover"
		setProperty: #handlesMouseOver: 
				toValue: true;
		yourself.
	alphaFrame	setProperty: #mouseEnter:   
				toValue: [ :ignoredEvent | alphaFrame flash ].
	alphaFrame addMorph: alphaSwatch.
	alphaSwatch 
		morphPosition: 4@4 ;
		setBalloonText: 
'Drag:
Color plus α' .

	alphaEntry := SimpleNumberEntryMorph 
					percentForRealFactor: 1.0 ::
					valueAccessor: [ :myModel | self model alpha ];
					valueUpdator: [ :myValue |  "Clamp alpha at 0.0-1.0"
						self model alpha: ((myValue min: 1.0) max: 0.0)
					];
					refreshValueFrom: self model;
					yourself.
				
	^swatchesLayout 
		addMorph: colorFrame;
		addMorph: rgbLayout;
		addMorph: alphaFrame;
		addMorph: (self
					buildValueBox: 'Alpha' 
					lable: 'α:' 
					entryBox: alphaEntry 
					units: '%' 
					upName: 'More Opaque' 
					downName: 'More Transparent'
					deltaAdjust: 0.04);  "4%"
		yourself
		! !

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 29/Dec/2025 14:26:26'!
buildValueBox: stringTitle 
lable: entryNameString 
entryBox: entryMorph 
units: unitString 
upName: upString 
downName: downString
deltaAdjust: delta

	| aBox entryBox adjustBox adjustUp adjustDown |
	aBox := LayoutMorph newColumn ::
		addMorph: (LabelMorph contents: stringTitle font: self labelFont);
		color: Color veryLightGray.
	entryBox := LayoutMorph newRow ::
		addMorph: (LabelMorph contents: entryNameString font: self labelFont);
		addMorph: entryMorph;
		addMorph: (LabelMorph contents: unitString font: self minorFont);
		axisEdgeWeight: #rowLeft.
	adjustUp := LayoutMorph newRow :: 
					axisEdgeWeight: #rowLeft;
					addMorph: (SimpleEntryButton newUp: entryMorph 
													delta: delta);
					addMorph: (LabelMorph contents: upString font: self minorFont).
	adjustDown := LayoutMorph newRow :: 
					axisEdgeWeight: #rowLeft;
					addMorph: (SimpleEntryButton newDown: entryMorph 
													delta: delta negated);
					addMorph: (LabelMorph contents: downString font: self minorFont).
	adjustBox := LayoutMorph newColumn ::
		addMorph: adjustUp;
		addMorph: adjustDown.

	^aBox 
		addMorph: entryBox;
		addMorph: adjustBox;
		yourself
	! !

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 31/Dec/2025 12:50:59'!
buildValuesColumn

	| valuesLayout |
	valuesLayout := LayoutMorph newColumn ::
		 padding: 10;
		 axisEdgeWeight: #center;
		 color: Color transparent.
	lEntry := SimpleNumberEntryMorph percentForRealFactor: 1.0 ::
					valueAccessor: [ :myModel | myModel getOKLightness ];
					valueUpdator: [ :myValue | "Enforce range bounds"
								self model setOKLightness: ((myValue min: 1.0) max: 0.0) ];
					refreshValueFrom: self model;
					yourself.
	cEntry := SimpleNumberEntryMorph percentForRealFactor: 0.5 ::
					valueAccessor: [ :myModel | myModel getOKChroma  ];
					valueUpdator: [ :myValue |  "Enforce range bounds"
								self model setOKChroma: ((myValue min: 1.0) max: 0.0) ];
					refreshValueFrom: self model;
					yourself.
	hEntry := SimpleNumberEntryMorph circleDegrees ::
					valueAccessor: [ :myModel | myModel getOKHue ];
					valueUpdator: [ :myValue | | newDeg | 
						newDeg := myValue \\ 360.
						self model "Angle goes through 0 degrees in both directions"
							setOKHue: ((newDeg > 0)
								ifTrue: [ newDeg ] 
								ifFalse: [ newDeg + 360 ])];
					refreshValueFrom: self model;
					yourself.
	valuesLayout addMorph: (self
					buildValueBox: 'Lightness' 
					lable: 'L:' 
					entryBox: lEntry 
					units: '%' 
					upName: 'Lighter' 
					downName: 'Darker'
					deltaAdjust: 0.03).  "3%"
	valuesLayout addMorph: (self
					buildValueBox: 'Chroma' 
					lable: 'C:' 
					entryBox: cEntry 
					units: '0 ~ 60%' 
					upName: 'More Saturated' 
					downName: 'More Grey'
					deltaAdjust: 0.004). "0.4%"
	valuesLayout addMorph: (self
					buildValueBox: 'Hue' 
					lable: 'H:' 
					entryBox: hEntry 
					units: '0 - 360 degrees' 
					upName: 'antiClock' 
					downName: 'Clockwise'
					deltaAdjust: 3). "3 degrees"
	^valuesLayout				! !

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 29/Dec/2025 14:54:11'!
colorSwatchesBeDroppable

	{alphaSwatch. colorSwatch.} do: [ :dropTarget | 
		dropTarget
			setProperty:  #'allowsMorphDrop' toValue: true;
			setProperty: #wantsDroppedMorph:event: 
				toValue: [ :dropMorph :evt | dropMorph valueWhenDropped isKindOf: Color] ;
			setProperty: #dropAction 
				toValue: [ :dropMorph :colorValue |
					self setColor: colorValue. 
					dropMorph showAcceptAndDeleteSelf.
				]
	].! !

!OKLCHEditPanel methodsFor: 'events-processing' stamp: 'KenD 30/Dec/2025 07:58:50'!
fontPreferenceChanged

	"No action taken here"! !

!OKLCHEditPanel methodsFor: 'geometry testing' stamp: 'KenD 30/Dec/2025 12:24:29'!
submorphsMightProtrude

	^true "ColorRingMorph, hueArmMorph"! !

!OKLCHEditPanel class methodsFor: 'instance creation' stamp: 'KenD 2/Jan/2026 12:13:34'!
color: aColor

	^ self new setColor: aColor! !

!OKLCHEditPanel class methodsFor: 'instance creation' stamp: 'KenD 2/Jan/2026 12:20:09'!
initializedInstance
"
	self initializedInstance openInWorld.
"
 	^self new
		model: (ColorEditorModel color: self defaultColor) ;
		buildMorphicWindow;
		setLabel: self titleString.
		! !

!OKLCHEditPanel class methodsFor: 'instance creation' stamp: 'KenD 24/Dec/2025 13:34:38'!
open
"
	self open 
"	
	^ self openWithColor: self defaultColor! !

!OKLCHEditPanel class methodsFor: 'instance creation' stamp: 'KenD 2/Jan/2026 12:20:16'!
openWithColor: aColor

	^ self new
		model: (ColorEditorModel color: aColor) ;
		buildMorphicWindow;
		setLabel: self titleString! !

!OKLCHEditPanel class methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025 14:25:49'!
colorSwatchExtent

	^ 64 @ 64! !

!OKLCHEditPanel class methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025 13:31:53'!
defaultCircleMorphSideLength

	^260 "Pixels"! !

!OKLCHEditPanel class methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025 12:59:45'!
defaultColor

	^ Color  r: 16r40/255 g: 16rA5/255 b: 16rD0/255.! !

!OKLCHEditPanel class methodsFor: 'accessing' stamp: 'KenD 31/Dec/2025 12:23:16'!
swatchBorderColor

	"Match with Visual Menu Item text color"
	^ `(Color r: 0.5 g: 0.07 b: 0.5)`! !

!OKLCHEditPanel class methodsFor: 'accessing' stamp: 'KenD 26/Dec/2025 11:14:53'!
titleString

	^ 'OK-LCH Color Editor'
	 ! !

!OKLCHEditPanel class methodsFor: 'new-morph participation' stamp: 'KenD 23/Dec/2025 12:57:33'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!HueArmMorph methodsFor: 'events' stamp: 'KenD 27/Dec/2025 14:27:26'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"
	
	^ true! !

!HueArmMorph methodsFor: 'events' stamp: 'KenD 27/Dec/2025 19:11:59'!
handlesMouseOver: aMouseEvent

	^true! !

!HueArmMorph methodsFor: 'events' stamp: 'KenD 27/Dec/2025 19:09:58'!
mouseEnter: igniredMouseEvent

	self borderColor: OKLCHEditPanel swatchBorderColor! !

!HueArmMorph methodsFor: 'events' stamp: 'KenD 27/Dec/2025 19:10:23'!
mouseLeave: igniredMouseEvent

	self borderColor: Color black! !

!HueArmMorph methodsFor: 'events' stamp: 'KenD 31/Dec/2025 12:53:42'!
mouseMove: aMouseMoveEvent localPosition: localEventPosition

	aMouseMoveEvent anyButtonPressed ifTrue: [
		self rotateToDegrees:  self currentDegrees - localEventPosition degrees.
		self model setOKHue: self currentDegrees.
	]! !

!HueArmMorph methodsFor: 'geometry' stamp: 'KenD 31/Dec/2025 08:42:44'!
currentDegrees

	"Rotation opposite of default"
	^location degrees negated
	! !

!HueArmMorph methodsFor: 'geometry' stamp: 'KenD 31/Dec/2025 12:55:43'!
rotateToDegrees: newDegrees
	"Like rotateBy: but to absolute degrees."
	
	"reset to 0 because #rotateBy: is from current position"
	self hide; redrawNeeded;
		rotateBy: location radians negated.
	
      "Rotation is Clockwise, but Hue rotates CounterClockwise.
	 #rotateBy: from zero."
	self	rotateBy: newDegrees degreesToRadians negated;
		show;
		redrawNeeded;
		yourself
! !

!HueArmMorph methodsFor: 'geometry' stamp: 'KenD 21/Dec/2025 09:39:03'!
rotationCenter

	| circleDelta |
	circleDelta := self morphExtent y // 2.
	^(circleDelta @ circleDelta)! !

!HueArmMorph methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 14:59:25'!
model

	^model! !

!HueArmMorph methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 14:59:49'!
model: aColorEditorModel

	model := aColorEditorModel! !

!HueArmMorph class methodsFor: 'new-morph participation' stamp: 'KenD 23/Dec/2025 09:02:34'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 6/Feb/2022 14:25:00'!
baseColor
	"Answer a color without alpha translucency"
	
	^ Color r: color red g: color green  b: color blue ! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 22/Nov/2013 20:53:00'!
blue
	"Answer my blue component 0..255"

	^ (self color blue * 255) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 16:42:00'!
blue: zeroTo255

	self setColor: (Color 
		r: self color red
		g: self color green
		b: (zeroTo255 / 255) asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013 18:52:00'!
blueFactor
	"Answer my blueness 0..1"

	^ self color blue! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 24/Nov/2013 19:05:00'!
blueFactor: zeroToOne

	self setColor: (Color 
		r: self color red
		g: self color green
		b: (zeroToOne * 255 / 255) asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 16:44:00'!
brightness
	"Answer percent brightness"

	^ (self color brightness * 100) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 16:43:00'!
brightness: aPercent

	self setColor: (Color
		h: self color hue
		s: self color saturation
		v: (aPercent / 100) asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013 18:53:00'!
brightnessFactor
	"Answer my brightness 0..1"

	^ self color brightness! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 24/Nov/2013 19:04:00'!
brightnessFactor: zeroToOne

	self setColor: (Color
		h: self color hue
		s: self color saturation
		v: zeroToOne asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 15:54:00'!
color

	^ color! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025 14:39:39'!
getOKChroma

	^self color oklchChroma! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 14:18:01'!
getOKDarkness

	^(1 - self color oklchLightness)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025 14:39:33'!
getOKHue

	^self color oklchHue! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025 14:39:27'!
getOKLightness

	^self color oklchLightness! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 22/Nov/2013 20:53:00'!
green
	"Answer my green component 0..255"

	^ (self color green * 255) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 16:41:00'!
green: zeroTo255

	self setColor: (Color 
		r: self color red
		g: (zeroTo255 / 255) asFloat 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013 18:51:00'!
greenFactor
	"Answer my greenness 0..1"

	^ self color green! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Nov/2013 20:09:00'!
greenFactor: zeroToOne

	self setColor: (Color 
		r: self color red
		g: (zeroToOne * 255 / 255) asFloat 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 16:44:00'!
hue
	"Answer my hue 0..360 (degrees)"

	^ self color hue rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 16:40:00'!
hue: zeroTo360

	self setColor: (Color 
		h: zeroTo360
		s: (self color saturation) 
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013 18:55:00'!
hueFactor
	"Answer my hue 0..1"

	^ (self color hue / 360) asFloat! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 24/Nov/2013 19:02:00'!
hueFactor: zeroToOne

	self setColor: (Color 
		h: (zeroToOne * 360) asFloat
		s: (self color saturation) 
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 18:55:13'!
maxOKChroma
	"Answer max Chroma at this hue and lightness."

	^(self color oklchDo: [:theLightness :oldChroma :theHue |
			"Values beyond the max anserert the max"
			(Color okl:  theLightness c:  0.9 h: theHue) oklchChroma 
		])
! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 22/Nov/2013 20:53:00'!
red
	"Answer my red component 0..255"

	^ (self color red * 255) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 16:42:00'!
red: zeroTo255

	self setColor: (Color 
		r: (zeroTo255 / 255) asFloat 
		g: self color green 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013 18:51:00'!
redFactor
	"Answer my redness 0..1"

	^ self color red! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 24/Nov/2013 19:06:00'!
redFactor: zeroToOne

	self setColor: (Color 
		r: (zeroToOne * 255 / 255) asFloat 
		g: self color green 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 16:45:00'!
saturation
	"Answer my percent saturation"

	^ (self color saturation * 100) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 16:42:00'!
saturation: aPercent

	self setColor: (Color 
		h: (self color hue) 
		s: (aPercent / 100) asFloat
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013 18:56:00'!
saturationFactor
	"Answer my saturation 0..1"

	^ self color saturation ! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 24/Nov/2013 19:01:00'!
saturationFactor: zeroToOne

	self setColor: (Color 
		h: (self color hue) 
		s: zeroToOne asFloat
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013 20:59:00'!
setColor: aColor
	"Set my color and trigger #colorChanged passing me (the model)"
	
	(color == aColor) ifTrue: [ ^self ].
	color := aColor.
	self triggerEvent: #colorChanged with: self.
	^ self

! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 14:08:34'!
setOKChroma: newChroma

	| newColor oldAlpha|
	self color oklchDo: [:theLightness :oldChroma :theHue |
		newColor := Color okl:  theLightness c:  newChroma h: theHue.
		oldAlpha := self color alpha.
		(oldAlpha = 1.0)
			ifFalse: [ newColor := newColor alpha: oldAlpha ].
		self setColor: newColor
	]
! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 14:16:28'!
setOKDarkness: newDarkness

	| newColor oldAlpha |
	self color oklchDo: [:oldLightness :theChroma :theHue |
		newColor :=  Color okl: (1 - newDarkness) c:  theChroma h: theHue.
		oldAlpha := self color alpha.
		(oldAlpha = 1.0)
			ifFalse: [ newColor := newColor alpha: oldAlpha ].
		self setColor: newColor		
	]
! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 14:10:04'!
setOKHue: newHue

	| newColor oldAlpha|
	self color oklchDo: [:theLightness :theChroma :oldHue |
		newColor := Color okl:  theLightness c:  theChroma h: newHue.
		oldAlpha := self color alpha.
		(oldAlpha = 1.0)
			ifFalse: [ newColor := newColor alpha: oldAlpha ].
		self setColor: newColor	
	]
! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 14:10:50'!
setOKLightness: newLightness

	| newColor oldAlpha|
	self color oklchDo: [:oldLightness :theChroma :theHue |
		newColor :=  Color okl:  newLightness c:  theChroma h: theHue.
		oldAlpha := self color alpha.
		(oldAlpha = 1.0)
			ifFalse: [ newColor := newColor alpha: oldAlpha ].
		self setColor: newColor		
	]
! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 2/Dec/2013 16:24:00'!
setRGBColorFromInteger: anInteger
	"Set my color from integer interpreted as RGB value"
	
	| aColor |
	aColor := Color 
					r: ((anInteger bitShift: -16) bitAnd: 255)	/ 255
					g: ((anInteger bitShift: -8) bitAnd: 255) / 255
					b: (anInteger bitAnd: 255) / 255.
			
	^ self setColor: aColor

! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025 13:46:39'!
setRGBColorFromInteger: anInteger alpha: alphaValue
	"Set my color from integer interpreted as RGB value"
	
	| aColor |
	aColor := Color 
					r: ((anInteger bitShift: -16) bitAnd: 255)	/ 255
					g: ((anInteger bitShift: -8) bitAnd: 255) / 255
					b: (anInteger bitAnd: 255) / 255.
	(alphaValue = 1.0)
		ifFalse: [ aColor := aColor alpha: alphaValue ].
			
	^ self setColor: aColor

! !

!ColorEditorModel methodsFor: 'initialization' stamp: 'KenD 19/Nov/2013 19:09:00'!
defaultColor

	^ Color teal
	! !

!ColorEditorModel methodsFor: 'initialization' stamp: 'KenD 23/Nov/2013 15:55:00'!
initialize

	super initialize.
	self setColor: self defaultColor.
	! !

!ColorEditorModel methodsFor: 'alpha scrolling' stamp: 'KenD 6/Feb/2022 14:32:00'!
alpha

	^ color alpha! !

!ColorEditorModel methodsFor: 'alpha scrolling' stamp: 'KenD 6/Feb/2022 14:36:00'!
alpha: zeroToOne
	"Note: 'color alpha: ..' may return a new Color instance."
	
	self setColor: (color alpha: zeroToOne)! !

!ColorEditorModel methodsFor: 'printing' stamp: 'jmv 13/Feb/2014 13:42:00'!
hexStringRGB
	"Answer my RGB as hex but with no 16r prefix"

"	^ (self red    printPaddedWith: $0 to: 2 base: 16) , 
	  (self green printPaddedWith: $0 to: 2 base: 16) , 
	  (self blue   printPaddedWith: $0 to: 2 base: 16)
	"
	^ self color hexStringRGB! !

!ColorEditorModel methodsFor: 'printing' stamp: 'jmv 13/Feb/2014 13:45:00'!
rgbValue
	"Answer my RGB as an integer"

	^ ( '16r',  self color hexStringRGB) asNumber! !

!ColorEditorModel class methodsFor: 'instance creation' stamp: 'KenD 23/Nov/2013 15:55:00'!
color: aColor

	^ self new setColor: aColor! !

!Color class methodsFor: '*ui-color-panel' stamp: 'KenD 2/Jan/2026 13:12:10'!
colorSelectionMenu
	"Open a popUp menu and let user select color selection option"
"
	Color colorSelectionMenu.
"
	| menu choices choicesSetter selectedIndex |
	choices := #( 'CSS3 (Web) Colors'   "1"
					'Crayon Colors'     "2"
					'NBSISCC Colors'  "3"
					'XKCD Colors'       "4"
					'RGB/HSV Edit'      "5"
					'OK-LCH Edit'	 "6"
					'Cancel'                "7"

				   ).
				
	choicesSetter := #(
				useCSS3ColorDict 
				useCrayonColorDict
				useNBSISCCColorDict
				useXKCDColorDict
				).
	
	menu := PopUpMenu labelArray: choices.
	selectedIndex := menu startUpWithCaption: 'Choose named colors or editor'.
	(selectedIndex = 5)
		ifTrue: [ (ColorEditorPanel open) openInWorld ].
	(selectedIndex = 6)
		ifTrue: [ (OKLCHEditPanel open) openInWorld ].
	((selectedIndex > 0) and: [selectedIndex < 5])
		ifTrue: [ | pickerPanel savedExtent |
			ColorPalette perform: ( choicesSetter at: selectedIndex ).
			pickerPanel := ImagePickerPanel namedColors. 
			savedExtent := pickerPanel extentInOwner. 
			pickerPanel openInWorld. "#openInWorld resets morphExtent!!"
			pickerPanel morphExtent: savedExtent. 
		].
	"else cancel -> no action"

	! !

!Color class methodsFor: '*ui-color-panel' stamp: 'KenD 2/Jan/2026 13:09:53'!
colorSelectionMenu: aColor
	"Open a popUp menu and let user select color selection option"
"
	Color colorSelectionMenu.
"
	| menu choices choicesSetter selectedIndex |
	choices := #( 'CSS3 (Web) Colors'   "1"
					'Crayon Colors'     "2"
					'NBSISCC Colors'  "3"
					'XKCD Colors'       "4"
					'RGB/HSV Edit'      "5"
					'OK-LCH Edit'	 "6"
					'Cancel'                "7"
				   ).
				
	choicesSetter := #(
				useCSS3ColorDict 
				useCrayonColorDict
				useNBSISCCColorDict
				useXKCDColorDict
				).
	
	menu := PopUpMenu labelArray: choices.
	selectedIndex := menu startUpWithCaption: 'Choose named colors or editor'.
	(selectedIndex = 5)
		ifTrue: [ (ColorEditorPanel openWithColor: aColor) openInWorld ].
	(selectedIndex = 6)
		ifTrue: [ (OKLCHEditPanel openWithColor: aColor ) openInWorld ].
	((selectedIndex > 0) and: [selectedIndex < 5])
		ifTrue: [ | pickerPanel savedExtent |
			ColorPalette perform: ( choicesSetter at: selectedIndex ).
			pickerPanel := ImagePickerPanel namedColors. 
			savedExtent := pickerPanel extentInOwner. 
			pickerPanel openInWorld. "#openInWorld resets morphExtent!!"
			pickerPanel morphExtent: savedExtent. 
		].
	"else cancel -> no action"

	! !
ColorPaneMorph initialize!
