'From Cuis7.9 [latest update: #8266] on 13 October 2026 at 1:12:52 pm'!
'Description I supply the RGB/HSB and OK-LCH ColorEditor Panels'!
!provides: 'UI-Color-Panel' 1 66!
!requires: 'Cuis-Base' 79 8266 nil!
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

!classDefinition: #HueSelectorPanel category: #'UI-Color-Panel'!
ValueEntryPanel subclass: #HueSelectorPanel
	instanceVariableNames: 'updateProc colorSwatch'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Color-Panel'!
!classDefinition: 'HueSelectorPanel class' category: #'UI-Color-Panel'!
HueSelectorPanel class
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
Color is absent (Color cyan lighter) where not supported by OKLCH.

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

!HueSelectorPanel commentStamp: '<historical>' prior: 0!
Simple panel with a Hue/BaseColor slider which allows to change
the Hue of the associated Morph Property. 

No change to Saturation, Brightness, or Alpha.

I present myself as a ColorEditorPanel to my ColorSliderMorph.

!

!HueArmMorph commentStamp: '<historical>' prior: 0!
I am like a clock hour arm but can be pivoted to any point in 0..360.
Degree is Hue in OKLCH Color Model.
Rotation is traditional with 1st quadrant upper right.
               90
                |
   180 --+-- 0
                |
              270!

!ColorEditorModel commentStamp: '<historical>' prior: 0!
I am the model (state holder) for a ColorEditor.!

!ColorSliderModel commentStamp: '<historical>' prior: 0!
I am the model (state holder) for a ColorSliderMorph.

I am used in place of a ColorPaneMorph to interface with a ColorSliderMorph.

My getter and setter are closures used to update some other model from me.!

!ColorPaneMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 1/Dec/2013, 2:33:00 am (UTC)'!
aboutToGrab: aMorph
	"submorph is being grabbed by a hand.
	Perform necessary adjustments (if any) and return the actual morph
	that should be added to the hand.
	Answer nil to reject the drag."

	^ DropColorMorph fromColor: self focusColor! !

!ColorPaneMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 1/Dec/2013, 2:35:00 am (UTC)'!
allowsSubmorphDrag
	"Answer whether our morphs can just be grabbed with the hand, instead of requiring the use of the halo. Redefined to answer true."
	
	"Click and hold"

	^ true! !

!ColorPaneMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 3/Mar/2022, 8:43:00 pm (UTC)'!
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

!ColorPaneMorph methodsFor: 'private' stamp: 'KenD 6/Dec/2013, 3:50:00 am (UTC)'!
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

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 27/Nov/2013, 10:48:00 pm (UTC)'!
colorPoint

	^ colorPoint ! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 7/Dec/2013, 10:17:00 pm (UTC)'!
colorPoint: aPoint

	(colorPoint = aPoint)
		ifFalse: [ 
			colorPoint := aPoint.
			self triggerEvent: #colorChanged with: self
		]! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 27/Nov/2013, 9:58:00 pm (UTC)'!
colorSelector

	^ #(red green blue hue saturation brightness) at: self zIndex ! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 6/Dec/2013, 3:20:00 am (UTC)'!
focusColor
	"Answer my focus color"
	
	^ (self colorConstructors at: zIndex) value: colorPoint x value: colorPoint y value: zValue 

! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 27/Nov/2013, 1:20:00 am (UTC)'!
focusMorph

	^ focusMorph! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 29/Nov/2013, 5:32:00 am (UTC)'!
pureColorForm
	"Create form from current color"

	^ self focusColor iconOrThumbnailOfSize: 256@256

! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 29/Nov/2013, 6:20:00 am (UTC)'!
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

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 27/Nov/2013, 1:27:00 am (UTC)'!
zIndex

	^ zIndex
! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 8:29:00 pm (UTC)'!
zValue

	^ zValue ! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 7/Dec/2013, 10:16:00 pm (UTC)'!
zValue: zeroTo255 "or ..100 or ..360"

	(zValue = zeroTo255)
		ifFalse: [ 
			zValue := zeroTo255.  "Does NOT change colorPoint"
			self triggerEvent: #colorChanged with: self.
		]
! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 27/Nov/2013, 12:48:00 am (UTC)'!
zeroPlaneForm

	^ zeroPlaneForm! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 27/Nov/2013, 12:04:00 am (UTC)'!
focusMorphDiameter
	
	^ 10! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 29/Nov/2013, 9:35:00 pm (UTC)'!
fromModel: model selector: aSelector

	zIndex := self zIndexFromSelector: aSelector.
	self updateColorFromModel: model
! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 27/Nov/2013, 1:43:00 am (UTC)'!
initialize

	super initialize.
	self image: (Form extent: 256@256 depth: 32).
	self makeFocusMorph.! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 27/Nov/2013, 1:43:00 am (UTC)'!
makeFocusMorph

	focusMorph := EllipseMorph new. 
	focusMorph 
		morphExtent: self focusMorphDiameter @ self focusMorphDiameter;
		color: Color transparent;
		borderWidth: 2;
		borderColor: Color orange;
		morphPosition: 0@0.
		
	self addMorph: self focusMorph.! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 8/Dec/2013, 3:07:00 pm (UTC)'!
zIndex: oneTo6 zValue: anInteger colorPoint: aPoint

	zIndex := oneTo6.
	zValue := anInteger.
	colorPoint := aPoint.
	self focusMorph morphPosition: (aPoint - (self focusMorphDiameter / 2)).
	self refreshForm;
		 triggerEvent: #colorChanged
! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 27/Nov/2013, 4:21:00 pm (UTC)'!
zIndexFromSelector: aSelector

	^ #(red green blue hue saturation brightness) 
			indexOf: aSelector asLowercase asSymbol
			ifAbsent: [ self error: 'Invalid selector' , aSelector asString ]! !

!ColorPaneMorph methodsFor: 'change processing' stamp: 'KenD 15/Dec/2025, 10:04:57 pm (UTC)'!
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

!ColorPaneMorph methodsFor: 'change processing' stamp: 'KenD 13/Oct/2026, 7:36:48 pm (UTC)'!
refreshForm
	"Create color pane from x,y base blending in z"

	| formMaker |
	formMaker := {
		[  "Red"
				self image: (self class gbForm copy). "(x,y,0)"
				self imageForm 
					copy: (0@0 corner: 256@256) 
					from: self rORgORbForm "(0,0,z)"
					to: 0@0 
					rule: 20. "rgbAdd (x,y,0) to (0,0,z)"
		].
		[  "Green"
				self image: (self class rbForm copy). "(x,y,0)"
				self imageForm 
					copy: (0@0 corner: 256@256) 
					from: self rORgORbForm "(0,0,z)"
					to: 0@0 
					rule: 20. "rgbAdd (x,y,0) to (0,0,z)"
		]. 
		[  "Blue"
				self image: (self class rgForm copy). "(x,y,0)"
				self imageForm 
					copy: (0@0 corner: 256@256) 
					from: self rORgORbForm "(0,0,z)"
					to: 0@0 
					rule: 20. "rgbAdd (x,y,0) to (0,0,z)"
		]. 
		[  "Hue"
			self image: ((Color h: zValue s:1 v: 1) iconOrThumbnailOfSize: 256@256). 
			self imageForm 
				copy: (0@0 corner: 256@256) 
				from: self class hueOverlay copy
				to: 0@0 
				rule: Form blend.		
		].
		[  "Saturation"
			self image: self class saturationForm copy.
			self imageForm 
				copyBits: self class saturationOverlay 
				at: 0@0 
				translucent: (100 - zValue  / 100) asFloat
		].
		[  "Brightness"
			self image: self class brightnessForm copy.
			self imageForm 
				copyBits:  (Color black iconOrThumbnailOfSize: 256@256)
				at: 0@0 
				translucent: (100 - zValue / 100) asFloat
		].
	}.
	(formMaker at: zIndex) value
	! !

!ColorPaneMorph methodsFor: 'change processing' stamp: 'KenD 2/Jan/2026, 8:41:38 pm (UTC)'!
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

!ColorPaneMorph methodsFor: 'events' stamp: 'KenD 5/Dec/2013, 4:52:00 am (UTC)'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"

	^ true! !

!ColorPaneMorph methodsFor: 'events' stamp: 'KenD 5/Dec/2013, 4:52:00 am (UTC)'!
handlesMouseOver: evt
	"Do I want to receive mouseEnter: and mouseLeave: when the button is up and the hand is empty?" 
	
	^ true! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 28/Sep/2021, 3:56:00 pm (UTC)'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	(self coversPixel: aMouseButtonEvent eventPosition)
		ifTrue: [ 
				self 
					colorPoint: localEventPosition;
					resetFocus;
					triggerEvent: #colorChanged
		]
! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 17/Sep/2019, 1:35:00 pm (UTC)'!
mouseEnter: event

	Cursor currentCursor: (Cursor cursorAt: #crossHairCursor)! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 17/Sep/2019, 1:35:00 pm (UTC)'!
mouseLeave: event

	Cursor currentCursor: (Cursor cursorAt: #normalCursor)! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 29/Nov/2013, 7:08:00 am (UTC)'!
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

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 9:33:00 pm (UTC)'!
blueIndex

	^ BlueIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 29/Nov/2013, 6:12:00 am (UTC)'!
brightnessForm

	^ BrightnessForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 9:34:00 pm (UTC)'!
brightnessIndex

	^ BrightnessIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 29/Nov/2013, 6:13:00 am (UTC)'!
brightnessOverlay

	^ BrightnessOverlay ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 29/Nov/2013, 5:59:00 am (UTC)'!
gbForm

	^ GBForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 9:33:00 pm (UTC)'!
greenIndex

	^ GreenIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 9:33:00 pm (UTC)'!
hueIndex

	^ HueIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 29/Nov/2013, 6:11:00 am (UTC)'!
hueOverlay

	^ HueOverlay! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 29/Nov/2013, 5:59:00 am (UTC)'!
rbForm

	^ RBForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 9:33:00 pm (UTC)'!
redIndex

	^ RedIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 29/Nov/2013, 5:59:00 am (UTC)'!
rgForm

	^ RGForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 29/Nov/2013, 6:12:00 am (UTC)'!
saturationForm

	^ SaturationForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 9:34:00 pm (UTC)'!
saturationIndex

	^ SaturationIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 29/Nov/2013, 6:13:00 am (UTC)'!
saturationOverlay

	^ SaturationOverlay! !

!ColorPaneMorph class methodsFor: 'initialization' stamp: 'KenD 4/Dec/2013, 4:28:00 am (UTC)'!
defaultColor

	^ Color transparent! !

!ColorPaneMorph class methodsFor: 'examples' stamp: 'KenD 27/Nov/2013, 1:22:00 am (UTC)'!
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

!ColorPaneMorph class methodsFor: 'new-morph participation' stamp: 'KenD 7/Dec/2013, 2:05:00 am (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 1/Dec/2013, 11:13:00 pm (UTC)'!
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

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025, 10:05:58 pm (UTC)'!
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

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025, 10:06:03 pm (UTC)'!
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

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025, 10:06:09 pm (UTC)'!
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

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025, 10:06:15 pm (UTC)'!
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

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025, 10:06:20 pm (UTC)'!
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

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025, 10:06:23 pm (UTC)'!
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

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 15/Dec/2025, 10:06:28 pm (UTC)'!
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

!ColorPaneMorph class methodsFor: 'geometry' stamp: 'KenD 16/Sep/2016, 10:48:00 pm (UTC)'!
minimumExtent
	"Also my maximum extent"
	^ 256@256! !

!ColorPaneMorph class methodsFor: 'instance creation' stamp: 'KenD 27/Nov/2013, 1:14:00 am (UTC)'!
zSelector: aSymbol zValue: anInteger colorPoint: aPoint

	^ self new 
			zIndex: (#(Red Green Blue Hue Saturation Brightness) 
						 indexOf: aSymbol
						 ifAbsent: [ self error: 'Invalid selector' , aSymbol asString ])
			zValue: anInteger 
			colorPoint: aPoint! !

!ColorRingMorph methodsFor: 'drawing' stamp: 'jmv 3/Feb/2026, 8:01:52 pm (UTC)'!
dotAt: circlePoint color: myColor
	"Draw a black dot relative to center at circlePoint"
	| myForm morphPoint |
	morphPoint := self circle2morph: circlePoint.
	myForm := image.
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
	self redrawNeeded.! !

!ColorRingMorph methodsFor: 'drawing' stamp: 'KenD 2/Jan/2026, 10:17:51 pm (UTC)'!
drawDots
	"Draw a circle of color-wheel dots at 10 degree increments"
	| innerRadius |
	innerRadius := radius - 20.
	0 to: 350 by: 10 do: [ :degrees |
		self dotAt: (Point r: innerRadius degrees: degrees) roundedHAFZ 
			color: ((Color okl: 0.58 c:  0.13 h:  degrees) adjustSaturation: 0.3 brightness: 0.2).
	]. ! !

!ColorRingMorph methodsFor: 'geometry' stamp: 'KenD 20/Dec/2025, 8:17:23 pm (UTC)'!
circle2morph: circlePoint
	"Given a point relative to centerPoint as (0,0), return the Morph's point relative to it's origin"
	
	^ (circlePoint x + center x) @ (circlePoint y - center y) negated.! !

!ColorRingMorph methodsFor: 'accessing' stamp: 'KenD 31/Jan/2026, 5:57:55 pm (UTC)'!
center 

	^ center! !

!ColorRingMorph methodsFor: 'accessing' stamp: 'KenD 31/Jan/2026, 5:58:08 pm (UTC)'!
radius 

	^ radius ! !

!ColorRingMorph methodsFor: 'initialization' stamp: 'KenD 20/Dec/2025, 8:34:16 pm (UTC)'!
radius: r

	radius := r.
	center := (r @ r).
	self color: Color transparent;
		drawDots;
		redrawNeeded;
		yourself
	! !

!ColorRingMorph class methodsFor: 'instance creation' stamp: 'KenD 23/Dec/2025, 4:04:28 pm (UTC)'!
initializedInstance
"
	self initializedInstance openInWorld.
"
 	^ self radius: 120! !

!ColorRingMorph class methodsFor: 'instance creation' stamp: 'KenD 20/Dec/2025, 8:35:06 pm (UTC)'!
radius: r

	| sideLength |
	sideLength := r * 2 + 1. "Want a center pixel"
	
	^(self newWith: (Form extent: (sideLength@sideLength) depth: 32)) radius: r.! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 5/Dec/2013, 5:03:00 am (UTC)'!
colorPane

	^ colorPane ! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 26/Dec/2013, 8:08:00 pm (UTC)'!
deltaPoint
	"Offset for slider to center on bar"
	
	^ -4  @ -5! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 6/Dec/2013, 2:38:00 am (UTC)'!
maxZValue

	^ maxZValue "100, 256, or 360"! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 15/Dec/2025, 10:11:20 pm (UTC)'!
scaledZPosition
	"Answer color Z value scaled to 0..255 as Y position (zero low .. 255 high)"
	"NB: must round result as coordinate cannot be a fraction"

	^ (255 - ((self colorPane zValue / self maxZValue) * 255))! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 11/Jan/2026, 8:49:50 pm (UTC)'!
setValue: newHue

	"Hue is already known from pane model"
	self resetSliderPosition 
	! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 5/Dec/2013, 5:03:00 am (UTC)'!
sliderMorph

	^ sliderMorph ! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 11/Jan/2026, 7:51:02 pm (UTC)'!
value

	^self scaledZPosition ! !

!ColorSliderMorph methodsFor: 'initialization' stamp: 'KenD 6/Dec/2013, 12:42:00 am (UTC)'!
colorPane: aColorPaneMorph

	colorPane := aColorPaneMorph.
	self 
		refreshColorFromModel; 
		redrawBackground.! !

!ColorSliderMorph methodsFor: 'initialization' stamp: 'KenD 15/May/2024, 10:13:00 pm (UTC)'!
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

!ColorSliderMorph methodsFor: 'events' stamp: 'KenD 6/Dec/2013, 12:52:00 am (UTC)'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"
	
	^ true! !

!ColorSliderMorph methodsFor: 'events' stamp: 'KenD 6/Dec/2013, 4:09:00 am (UTC)'!
mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition
	"Update visual feedback"

	super mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition.
	self colorPane zValue: (self zValueFromY: localEventPosition y).
	self resetSliderPosition.! !

!ColorSliderMorph methodsFor: 'events' stamp: 'KenD 1/Dec/2025, 9:28:00 pm (UTC)'!
mouseMove: aMouseMoveEvent localPosition: localEventPosition

	aMouseMoveEvent anyButtonPressed ifTrue: [
		self colorPane zValue: (self zValueFromY: localEventPosition y).
		self resetSliderPosition.
	]! !

!ColorSliderMorph methodsFor: 'event handling' stamp: 'KenD 13/Oct/2026, 7:37:04 pm (UTC)'!
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
	myForm  := self imageForm.
	0 to: 19 do: [ :x |
		0 to: 255 do:  [ :y | 
			myForm colorAt: x@y 
					    put: (colorMaker value: pointX 
											value: pointY 
											value: (scaleZ value: 255-y))
		]
	].
	self image: myForm.
	self resetSliderPosition.
	self redrawNeeded.! !

!ColorSliderMorph methodsFor: 'event handling' stamp: 'KenD 6/Dec/2013, 2:33:00 am (UTC)'!
refreshColorFromModel

	self resetSliderPosition.

	! !

!ColorSliderMorph methodsFor: 'event handling' stamp: 'KenD 26/Dec/2013, 8:06:00 pm (UTC)'!
resetSliderPosition
	"Center me over selected Z position"
	
	self sliderMorph morphPosition: self deltaPoint + (0 @ (self scaledZPosition)).! !

!ColorSliderMorph methodsFor: 'private' stamp: 'KenD 6/Dec/2013, 4:17:00 am (UTC)'!
zValueFromY: zeroTo255

	| newY |
	newY := (zeroTo255 min: 255 max: 0).

	^ ((255 - newY) / 255) * self maxZValue! !

!ColorSliderMorph class methodsFor: 'instance creation' stamp: 'KenD 6/Dec/2013, 12:31:00 am (UTC)'!
colorPane: aColorPaneMorph

	^ self new colorPane: aColorPaneMorph! !

!ColorSliderMorph class methodsFor: 'new-morph participation' stamp: 'KenD 7/Dec/2013, 2:06:00 am (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!OKLCHCircleMorph methodsFor: 'geometry' stamp: 'KenD 19/Dec/2025, 8:36:28 pm (UTC)'!
circle2morph: circlePoint
	"Given a point relative to centerPoint as (0,0), return the Morph's point relative to it's origin"
	| answer |
	answer := (circlePoint x + centerPoint x) @ (circlePoint y - centerPoint y) negated.
	"Transcript log: 'Circle Pt: ', circlePoint printString, ' -> Morph Pt : ', answer printString."
	^ answer
! !

!OKLCHCircleMorph methodsFor: 'geometry' stamp: 'KenD 21/Dec/2025, 8:46:19 pm (UTC)'!
colorRingOffset
	"Answer offset to set colorRing beyond our radius"
	| radius |
	radius := centerPoint x.
	^ radius // 5. ! !

!OKLCHCircleMorph methodsFor: 'geometry' stamp: 'KenD 21/Dec/2025, 8:35:56 pm (UTC)'!
hueArmOffset

	"Answer point to add to centerPoint for hueArm"
	| radius offset  |
	radius := centerPoint x.
	offset := radius // 20. 
	^(offset@offset) negated "Up and to left"! !

!OKLCHCircleMorph methodsFor: 'geometry' stamp: 'KenD 19/Dec/2025, 8:36:38 pm (UTC)'!
morph2circle: morphPoint
	"Given a point relative to centerPoint as (0,0), return the Morph's point relative to it's origin"
	| answer |
	answer := (morphPoint x - centerPoint x) @ (morphPoint y - centerPoint y) negated.
	"Transcript log: 'Morph Pt: ', morphPoint printString, ' -> Circle Pt : ', answer printString."
	^answer! !

!OKLCHCircleMorph methodsFor: 'geometry' stamp: 'KenD 21/Dec/2025, 10:03:35 pm (UTC)'!
radius

	^ centerPoint x "Same as centerPoint y"! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 10:26:38 pm (UTC)'!
chromaFrame

	^chromaFrame! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 10:27:00 pm (UTC)'!
chromaFrame: aFraneMorph

	chromaFrame := aFraneMorph! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 31/Jan/2026, 7:57:35 pm (UTC)'!
colorAbsenceColor

	"Answer this when no OKLCH color is present"
	^ `Color cyan lighter`! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 21/Dec/2025, 10:11:55 pm (UTC)'!
colorDrawingScale

	^colorDrawingScale! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 25/Dec/2025, 4:46:08 pm (UTC)'!
colorRing

	^colorRing! !

!OKLCHCircleMorph methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 8:31:52 pm (UTC)'!
hueArm

	^hueArm! !

!OKLCHCircleMorph methodsFor: 'initialization' stamp: 'KenD 31/Jan/2026, 8:02:47 pm (UTC)'!
addColorRing
	"The ColorRingMorph is like the numbers on a clock:
	a hue->degree position indicator."
	
	| radius colorRingOffset  centerDelta|
	radius := centerPoint x.
	colorRingOffset := (radius // 5) + 4. 
	colorRing := ColorRingMorph radius: radius + colorRingOffset.
	 "To simplify drawing, we are a submorph of the ColorRingMorph."
	colorRing addMorphFront: self.
	"Make colorRIng Center to be our Center"
	centerDelta := (colorRing morphExtent - self morphExtent) / 2.
	self morphPosition: centerDelta.! !

!OKLCHCircleMorph methodsFor: 'initialization' stamp: 'KenD 1/Feb/2026, 10:32:58 pm (UTC)'!
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
					].
				  ].! !

!OKLCHCircleMorph methodsFor: 'initialization' stamp: 'KenD 31/Jan/2026, 8:14:37 pm (UTC)'!
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
	hueArm hide. "My color will be reset; do not display me at original position"
	self addMorphFront: hueArm.
	

	! !

!OKLCHCircleMorph methodsFor: 'initialization' stamp: 'KenD 3/Feb/2026, 10:56:51 pm (UTC)'!
sideLength: numPixels l: llightness0to1 c: chroma0to1 h: hueIndegrees

	| center  |
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

!OKLCHCircleMorph methodsFor: 'drawing' stamp: 'jmv 3/Feb/2026, 8:02:34 pm (UTC)'!
dotAt: circlePoint
	"Draw a black dot relative to center at circlePoint"
	| myForm morphPoint |
	morphPoint := (self circle2morph: circlePoint) roundedHAFZ.
	myForm := image.
	-2 to: 2 do: [ :deltaX |
		-2 to: 2 do: [ :deltaY |
			myForm colorAt: morphPoint + (deltaX@deltaY) put: Color black.
		]
	].
	myForm colorAt: morphPoint + (3@0) put: Color black.
	myForm colorAt: morphPoint + (0@3) put: Color black.
	myForm colorAt: morphPoint + (-3@0) put: Color black.
	myForm colorAt: morphPoint + (0@-3) put: Color black.! !

!OKLCHCircleMorph methodsFor: 'color updating' stamp: 'jmv 3/Feb/2026, 8:03:38 pm (UTC)'!
beColorful: lightness0To1
 	"Chroma and Hue are constant for a given lightness.
	Map between Morpj (x,y) from (0,0) to Circle with centerPoint."
	| morphPoint circlePoint pixelColor myForm myRadius |
	myForm := image.
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
				ifFalse: [
					(circlePoint magnitude between: myRadius and: myRadius + 2.1)
						ifTrue: [ myForm colorAt: morphPoint put: Color purple ]
						ifFalse: [myForm colorAt: morphPoint put: Color transparent]
				].
		]
	].
	self dotAt: 0@0.  "Circle center"
	^self! !

!OKLCHCircleMorph methodsFor: 'color updating' stamp: 'KenD 1/Feb/2026, 9:24:21 pm (UTC)'!
newChromaAt: chroma0To1

	|  chromaFrameCenter |
	chromaFrameCenter := chromaFrame morphExtent / 2.
	"Center on Chroma.  Cap Chroma to radius."
	chromaFrame morphPosition: 
			((colorDrawingScale * chroma0To1) min: self radius)
			@ ((chromaFrameCenter y negated) + (hueArm morphExtent y // 2)).
	self redrawNeeded ! !

!OKLCHCircleMorph methodsFor: 'color updating' stamp: 'KenD 1/Feb/2026, 9:48:52 pm (UTC)'!
setColor:  aColor
	"Invoked by contaier on color change"
	aColor oklchDo: [ :lightness0To1 :chroma0to1 :hueInDegrees |
		self beColorful: lightness0To1.
		self newChromaAt: chroma0to1.
		self hueArm rotateToDegrees: hueInDegrees.
	].
	self redrawNeeded ! !

!OKLCHCircleMorph class methodsFor: 'new-morph participation' stamp: 'KenD 23/Dec/2025, 4:02:20 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!OKLCHCircleMorph class methodsFor: 'instance creation' stamp: 'KenD 23/Dec/2025, 3:59:50 pm (UTC)'!
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

!OKLCHCircleMorph class methodsFor: 'instance creation' stamp: 'KenD 18/Dec/2025, 1:35:49 am (UTC)'!
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

!SimpleEntryButton methodsFor: 'events' stamp: 'KenD 29/Dec/2025, 4:21:51 pm (UTC)'!
handlesMouseDown: aMouseButtonEvent
	^ true! !

!SimpleEntryButton methodsFor: 'events' stamp: 'KenD 29/Dec/2025, 4:21:44 pm (UTC)'!
handlesMouseOver: evt
	"implements #mouseEnter: and/or #mouseLeave:"
	^true! !

!SimpleEntryButton methodsFor: 'events' stamp: 'KenD 29/Dec/2025, 9:21:25 pm (UTC)'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	super mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition.
	entryMorph valueUpdator value: (entryMorph value + myDelta).
	entryMorph redrawNeeded 
! !

!SimpleEntryButton methodsFor: 'events' stamp: 'KenD 29/Dec/2025, 4:56:28 pm (UTC)'!
mouseEnter: aMouseEvent

	borderColor := OKLCHEditPanel swatchBorderColor.
	self redrawNeeded ! !

!SimpleEntryButton methodsFor: 'events' stamp: 'KenD 29/Dec/2025, 4:56:48 pm (UTC)'!
mouseLeave: aMouseEvent

	borderColor := Color black.
	self redrawNeeded ! !

!SimpleEntryButton methodsFor: 'initialization' stamp: 'KenD 29/Dec/2025, 9:20:57 pm (UTC)'!
entryModel: aSimpeNumberEntryMorph delta: aNumber

	entryMorph := aSimpeNumberEntryMorph.
	myDelta := aNumber.
! !

!SimpleEntryButton methodsFor: 'accessing' stamp: 'KenD 26/Jan/2026, 4:43:20 pm (UTC)'!
defaultBorderWidth

	^8! !

!SimpleEntryButton class methodsFor: 'instance creation' stamp: 'KenD 31/Dec/2025, 7:21:04 pm (UTC)'!
newDown: aSimpeNumberEntryMorph delta: aNumber
	
	| newMe |
	(aNumber > 0) ifTrue: [self error: 'newDown delta must be negative'].
	newMe :=  super newWith:  (BitBltCanvas arrowOfDirection: #down size: 16).
	^newMe borderWidth: 3;
			borderColor: Color black;
			entryModel:  aSimpeNumberEntryMorph delta: aNumber;
			yourself! !

!SimpleEntryButton class methodsFor: 'instance creation' stamp: 'KenD 31/Dec/2025, 7:21:09 pm (UTC)'!
newUp: aSimpeNumberEntryMorph delta: aNumber
	
	| newMe |
	(aNumber < 0) ifTrue: [self error: 'newUp delta must be positive'].
	newMe :=  super newWith:  (BitBltCanvas arrowOfDirection: #up size: 16).
	^newMe borderWidth: 3;
			borderColor: Color black;
			entryModel:  aSimpeNumberEntryMorph delta: aNumber;
			yourself! !

!SimpleEntryButton class methodsFor: 'new-morph participation' stamp: 'KenD 26/Jan/2026, 4:45:10 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ false! !

!ColorPalette class methodsFor: 'instance creation' stamp: 'KenD 16/Sep/2021, 9:15:00 pm (UTC)'!
initializedInstance

	^ ImagePickerPanel namedColors! !

!ColorPalette class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 10:04:00 pm (UTC)'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!ColorPalette class methodsFor: 'new-morph participation' stamp: 'KenD 25/Dec/2013, 12:55:00 am (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 25/Dec/2013, 2:57:00 am (UTC)'!
useCSS3ColorDict
"
	self useCSS3ColorDict.
"
	Feature require: 'CSS3-NamedColors'.
	Color setColorNamesDict: Color css3ColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 24/Jul/2015, 6:33:00 pm (UTC)'!
useCrayonColorDict
"
	ColorPalette useCrayonColorDict.
"

	Feature require: 'Crayon-NamedColors'.
	Color setColorNamesDict: Color crayonColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 25/Dec/2013, 2:57:00 am (UTC)'!
useNBSISCCColorDict
"
	self useNBSISCCColorDict.
"
	Feature require: 'NBSISCC-NamedColors'.
	Color setColorNamesDict: Color nbsisccColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 25/Dec/2013, 2:56:00 am (UTC)'!
useSmallColorDict

	Color setColorNamesDict: Color defaultColorNamesDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 25/Dec/2013, 2:56:00 am (UTC)'!
useXKCDColorDict
"
	self useXKCDColorDict.
"

	Feature require: 'XKCD-NamedColors'.
	Color setColorNamesDict: Color xkcdColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 25/Dec/2013, 2:59:00 am (UTC)'!
useXKCDFirst48ColorDict
"
	self useXKCDFirst48ColorDict.
"

	Color setColorNamesDict: Color xkcdFirst48ColorNamesDictionary.! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 27/Nov/2013, 4:27:00 am (UTC)'!
colorPane

	^ colorPane ! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 29/Oct/2015, 3:57:00 pm (UTC)'!
colorSelectionSymbol

	^ radioSelection ! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 29/Oct/2015, 3:57:00 pm (UTC)'!
colorSelectionSymbol: aSym

	radioSelection := aSym! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 20/Nov/2013, 4:15:00 am (UTC)'!
colorSwatch

	^ colorSwatch! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 20/Nov/2013, 4:14:00 am (UTC)'!
hsvRadio

	^ hsvRadio! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 10/Feb/2026, 9:41:50 pm (UTC)'!
resetExtent

	"Refreshing color name can resize.  Be minimal."
	self layoutMorph submorphs do: [ :s | s morphExtent: s minimumExtent ].
	self morphExtent: self minimumExtent! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 20/Nov/2013, 4:14:00 am (UTC)'!
rgbRadio

	^ rgbRadio! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 24/Nov/2013, 3:48:00 pm (UTC)'!
rgbString
	"Answer my rgbString StringMorph"
	^ rgbString! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 26/Nov/2013, 2:12:00 am (UTC)'!
sliderColumn

	^ sliderColumn! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 9/Feb/2022, 8:50:00 pm (UTC)'!
swatchBorderColor

	"Match with Visual Menu Item text color"
	^ (Color r: 0.5 g: 0.07 b: 0.5) ! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 11/Feb/2022, 8:18:00 pm (UTC)'!
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

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 1/Dec/2025, 9:19:00 pm (UTC)'!
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

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 7/Jan/2026, 7:30:55 pm (UTC)'!
buildMorphicWindow
" Our layout is a bit different to a traditional dialog, so we override as 
we don't need button area at the bottom and main panel is a row of morphs." 
	
	self layoutMorph gap: self defaultSeparation ;
		padding: 10;
		axisEdgeWeight: self defaultAlignement ;
		addMorph: self buildColorPaneColumn;
		addMorph: self buildSliderColumn;
		addMorph: self buildRadioButtonColumn;
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

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 14/Sep/2024, 10:14:00 pm (UTC)'!
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

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 7/Feb/2022, 6:24:00 pm (UTC)'!
buildSliderColumn

	sliderColumn := LayoutMorph newColumn.
	sliderColumn color: Color transparent.
	self 		
		buildAlphaSwatch;
		resetSliderColumn.
	
	^ sliderColumn 

	! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 14/Sep/2024, 10:14:00 pm (UTC)'!
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

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 29/Oct/2015, 4:01:00 pm (UTC)'!
resetSliderColumn

	self resetSliderColumn: self colorSelectionSymbol! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 14/Sep/2024, 10:14:00 pm (UTC)'!
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

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 24/Nov/2013, 12:09:00 am (UTC)'!
colorSwatchExtent

	^ 64 @ 64! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 4/Mar/2022, 8:32:00 pm (UTC)'!
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

!ColorEditorPanel methodsFor: 'initialization' stamp: 'hlsf 29/Dec/2021, 5:17:00 pm (UTC)'!
defaultAlignement
	^ #rowLeft! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 25/Nov/2013, 1:58:00 am (UTC)'!
defaultRadioSelector

	^ #Green! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 28/May/2022, 7:02:00 pm (UTC)'!
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

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 27/May/2022, 10:00:00 pm (UTC)'!
model: aColorModel
	
	model := aColorModel ! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 28/May/2022, 6:51:00 pm (UTC)'!
setColor: aColor

	self model setColor: aColor.
	self refreshColor.
! !

!ColorEditorPanel methodsFor: 'events-processing' stamp: 'KenD 29/Oct/2015, 4:02:00 pm (UTC)'!
fontPreferenceChanged

	super fontPreferenceChanged.
	self resetSliderColumn.! !

!ColorEditorPanel methodsFor: 'events-processing' stamp: 'KenD 29/Oct/2015, 4:01:00 pm (UTC)'!
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

!ColorEditorPanel methodsFor: 'events-processing' stamp: 'KenD 6/Feb/2022, 10:53:00 pm (UTC)'!
updateColorFromPane
	"Someone changed color in colorPane.  Update my model"
	
	self model setColor: 
		(self colorPane focusColor
			alpha: self model alpha)! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 30/Dec/2025, 7:48:39 pm (UTC)'!
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

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 12/Sep/2021, 10:41:00 pm (UTC)'!
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

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 10/Feb/2026, 8:53:37 pm (UTC)'!
refreshColor
	"model color has changed.  Refresh my views."
	
	self 
		refreshColorSwatch;
		refreshColorPane;
		refreshCloseColor;
		refreshAlphaSwatch;
		resetExtent ! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 27/Nov/2013, 9:43:00 pm (UTC)'!
refreshColorPane
	"When selector changes.."

	self colorPane updateColorFromModel: self model.! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 6/Feb/2022, 11:00:00 pm (UTC)'!
refreshColorSwatch
	"When color changes"
	
	colorSwatch image: (model baseColor iconOrThumbnailOfSize: self colorSwatchExtent).
	colorSwatch color: self model baseColor! !

!ColorEditorPanel methodsFor: 'accessing' stamp: 'KenD 5/Jun/2025, 7:44:00 pm (UTC)'!
defaultLayerNumber
	"Act like any other Morph with respect to Z-order"
	^100! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 28/Jul/2024, 1:56:00 am (UTC)'!
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

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 28/May/2022, 6:40:00 pm (UTC)'!
open
"
	self open 
"	
	^ self open: (ColorEditorModel color: self defaultColor)! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 7/Feb/2022, 7:25:00 pm (UTC)'!
open: model

	^ self open: model label: 'Color Editor'! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 2/Jan/2026, 7:19:49 pm (UTC)'!
openWithColor: aColor

	^ self open: (ColorEditorModel color: aColor) label: 'Color Editor'! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 13/Jan/2026, 4:55:25 pm (UTC)'!
openWithColor: aColor updateProc: ignored

	^ self openWithColor: aColor ! !

!ColorEditorPanel class methodsFor: 'initialization' stamp: 'KenD 24/Dec/2013, 4:26:00 pm (UTC)'!
defaultColor

	^ Color  r: 16r40/255 g: 16rA5/255 b: 16rD0/255.! !

!ColorEditorPanel class methodsFor: 'new-morph participation' stamp: 'KenD 14/Mar/2022, 10:02:00 pm (UTC)'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!ColorEditorPanel class methodsFor: 'new-morph participation' stamp: 'KenD 7/Dec/2013, 2:09:00 am (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025, 8:04:54 pm (UTC)'!
defaultAlignement
	^ #rowLeft! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025, 8:04:21 pm (UTC)'!
defaultLayerNumber
	"Act like any other Morph with respect to Z-order"
	^100! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 25/Dec/2025, 9:21:32 pm (UTC)'!
defaultSeparation

	^10! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 24/Dec/2025, 6:37:52 pm (UTC)'!
labelFont

	^ (FontFamily defaultFamilyPointSize: 16)! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 24/Dec/2025, 6:38:29 pm (UTC)'!
minorFont

	^ (FontFamily defaultFamilyPointSize: 10)! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025, 4:22:30 pm (UTC)'!
model: aColorModel
	
	model := aColorModel ! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 29/Dec/2025, 9:53:05 pm (UTC)'!
setColor: aColor
	" Set my model's color."
	
	self model setColor: aColor.
	"Invokes #colorChanged for refreshColor"! !

!OKLCHEditPanel methodsFor: 'accessing' stamp: 'KenD 24/Dec/2025, 8:19:02 pm (UTC)'!
swatchBorderColor

	"Match with Visual Menu Item text color"
	^ (Color r: 0.5 g: 0.07 b: 0.5) ! !

!OKLCHEditPanel methodsFor: 'initialization' stamp: 'KenD 31/Jan/2026, 7:52:00 pm (UTC)'!
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

!OKLCHEditPanel methodsFor: 'color updating' stamp: 'KenD 29/Dec/2025, 9:35:57 pm (UTC)'!
colorChanged

	self refreshColor
		

! !

!OKLCHEditPanel methodsFor: 'color updating' stamp: 'KenD 27/Dec/2025, 8:54:19 pm (UTC)'!
refreshAlphaSwatch
	"When color changes"
	
	(alphaSwatch color = self model color)
	ifFalse: [ | newColor | 
		newColor := self model color.
		alphaSwatch image: 
			(newColor iconOrThumbnailOfSize: 32@32).
		alphaSwatch color: newColor
	]! !

!OKLCHEditPanel methodsFor: 'color updating' stamp: 'KenD 27/Dec/2025, 9:23:41 pm (UTC)'!
refreshCircleMorph

	circleMorph setColor: self model color! !

!OKLCHEditPanel methodsFor: 'color updating' stamp: 'KenD 1/Feb/2026, 9:22:37 pm (UTC)'!
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

!OKLCHEditPanel methodsFor: 'color updating' stamp: 'KenD 23/Dec/2025, 9:26:35 pm (UTC)'!
refreshColorSwatch
	"When color changes"
	
	colorSwatch image: (model baseColor iconOrThumbnailOfSize: self class colorSwatchExtent).
	colorSwatch color: self model baseColor "NB: No alpha here. Alpha=1"! !

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 31/Jan/2026, 7:54:55 pm (UTC)'!
buildColorCircleColumn

	| circleLayout |
	circleLayout := LayoutMorph newColumn :: 
		axisEdgeWeight: #center;
		color: Color transparent.
						
	"circleMorph := OKLCHCircleMorph sideLength: 260 color: self model color."
	circleMorph layoutSpec: (LayoutSizeSpec new offAxisEdgeWeight: #center).
	circleMorph hueArm model: self model.
	circleMorph chromaFrame setProperty: #model toValue: self model.
	
	^circleLayout 
		addMorph: circleMorph colorRing; "Ring contains circleMorph"
		yourself
! !

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 2/Jan/2026, 7:18:05 pm (UTC)'!
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

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 31/Jan/2026, 7:55:43 pm (UTC)'!
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
	self
		colorSwatchesBeDroppable;
		refreshColor;
		redrawNeeded.
	circleMorph hueArm show.

	^self
! !

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 31/Dec/2025, 7:48:21 pm (UTC)'!
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

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 29/Dec/2025, 9:26:26 pm (UTC)'!
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

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 31/Jan/2026, 7:00:58 pm (UTC)'!
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
								ifFalse: [ newDeg + 360 ]).
					];
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

!OKLCHEditPanel methodsFor: 'GUI building' stamp: 'KenD 29/Dec/2025, 9:54:11 pm (UTC)'!
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

!OKLCHEditPanel methodsFor: 'events-processing' stamp: 'KenD 30/Dec/2025, 2:58:50 pm (UTC)'!
fontPreferenceChanged

	"No action taken here"! !

!OKLCHEditPanel methodsFor: 'geometry testing' stamp: 'KenD 30/Dec/2025, 7:24:29 pm (UTC)'!
submorphsMightProtrude

	^true "ColorRingMorph, hueArmMorph"! !

!OKLCHEditPanel class methodsFor: 'instance creation' stamp: 'KenD 2/Jan/2026, 7:13:34 pm (UTC)'!
color: aColor

	^ self new setColor: aColor! !

!OKLCHEditPanel class methodsFor: 'instance creation' stamp: 'KenD 2/Jan/2026, 7:20:09 pm (UTC)'!
initializedInstance
"
	self initializedInstance openInWorld.
"
 	^self new
		model: (ColorEditorModel color: self defaultColor) ;
		buildMorphicWindow;
		setLabel: self titleString.
		! !

!OKLCHEditPanel class methodsFor: 'instance creation' stamp: 'KenD 24/Dec/2025, 8:34:38 pm (UTC)'!
open
"
	self open 
"	
	^ self openWithColor: self defaultColor! !

!OKLCHEditPanel class methodsFor: 'instance creation' stamp: 'KenD 2/Jan/2026, 7:20:16 pm (UTC)'!
openWithColor: aColor

	^ self new
		model: (ColorEditorModel color: aColor) ;
		buildMorphicWindow;
		setLabel: self titleString! !

!OKLCHEditPanel class methodsFor: 'instance creation' stamp: 'KenD 13/Jan/2026, 4:56:00 pm (UTC)'!
openWithColor: aColor updateProc: ignored

	^ self openWithColor: aColor ! !

!OKLCHEditPanel class methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025, 9:25:49 pm (UTC)'!
colorSwatchExtent

	^ 64 @ 64! !

!OKLCHEditPanel class methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025, 8:31:53 pm (UTC)'!
defaultCircleMorphSideLength

	^260 "Pixels"! !

!OKLCHEditPanel class methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025, 7:59:45 pm (UTC)'!
defaultColor

	^ Color  r: 16r40/255 g: 16rA5/255 b: 16rD0/255.! !

!OKLCHEditPanel class methodsFor: 'accessing' stamp: 'KenD 31/Dec/2025, 7:23:16 pm (UTC)'!
swatchBorderColor

	"Match with Visual Menu Item text color"
	^ `(Color r: 0.5 g: 0.07 b: 0.5)`! !

!OKLCHEditPanel class methodsFor: 'accessing' stamp: 'KenD 26/Dec/2025, 6:14:53 pm (UTC)'!
titleString

	^ 'OK-LCH Color Editor'
	 ! !

!OKLCHEditPanel class methodsFor: 'new-morph participation' stamp: 'KenD 23/Dec/2025, 7:57:33 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!HueSelectorPanel methodsFor: 'GUI building' stamp: 'KenD 12/Jan/2026, 11:03:39 pm (UTC)'!
addColorSwatch
	
	| entryLayout colorFrame |
	entryLayout := layoutMorph submorphs last.
	colorSwatch := DropColorMorph fromColor: model color.
	self refreshColorSwatch.
	colorFrame := FrameMorph new ::
		morphExtent: colorSwatch morphExtent + 8;
		borderColor: self swatchBorderColor; 
		borderWidth: 4; 	
		addMorph: colorSwatch;
		"Make color swatch draggable"
		setProperty: #allowsSubmorphDrag toValue: true;
		"Flash when mouseover"
		setProperty: #handlesMouseOver: 
				toValue: true;
		yourself.
	colorSwatch morphPosition: 4@4;
				setBalloonText: 'Drag this Color'.
	colorFrame  setProperty: #mouseEnter:   
				toValue: [ :ignoredEvent | colorFrame flash ].
	entryLayout addMorph: colorFrame layoutSpec: (LayoutSpec keepMorphExtent).
! !

!HueSelectorPanel methodsFor: 'GUI building' stamp: 'KenD 12/Jan/2026, 10:37:33 pm (UTC)'!
buildMorphicWindow

	super buildMorphicWindow.
	self addColorSwatch.
	self morphExtent: self minimumExtent.! !

!HueSelectorPanel methodsFor: 'access' stamp: 'KenD 13/Jan/2026, 8:13:04 pm (UTC)'!
accept
	| oldColor newColor |
	oldColor := model color.
	newColor := (Color  
		"slider value is 0..255 and opposite degree value: 0..359"
					h: (359 - (entry value * (359/255)))
					s: oldColor saturation 
					v: oldColor brightness 
					alpha: oldColor alpha).
	"A model may propogate an update event"
	model ifNotNil: [ model propertyValue: newColor ].		
	"We may have a registered closure to do a direct update."
	updateProc ifNotNil: [ updateProc value: newColor ].
	"My job is done here."
	self delete. 
! !

!HueSelectorPanel methodsFor: 'access' stamp: 'KenD 11/Jan/2026, 8:04:40 pm (UTC)'!
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

!HueSelectorPanel methodsFor: 'access' stamp: 'KenD 11/Jan/2026, 10:46:36 pm (UTC)'!
colorPoint

	"Answer Saturation @ Brightness  from HSV"
	| myCurrentColor |
	myCurrentColor := model color.
	^ (myCurrentColor saturation @ myCurrentColor brightness) * 255! !

!HueSelectorPanel methodsFor: 'access' stamp: 'KenD 12/Jan/2026, 10:40:38 pm (UTC)'!
colorSwatchExtent

	^ 64 @ 64! !

!HueSelectorPanel methodsFor: 'access' stamp: 'KenD 12/Jan/2026, 10:31:49 pm (UTC)'!
swatchBorderColor

	"Match with Visual Menu Item text color"
	^ (Color r: 0.5 g: 0.07 b: 0.5) ! !

!HueSelectorPanel methodsFor: 'access' stamp: 'KenD 12/Jan/2026, 10:14:47 pm (UTC)'!
updateProc: oneArgClosure "Takes a color"

	updateProc := oneArgClosure ! !

!HueSelectorPanel methodsFor: 'access' stamp: 'KenD 11/Jan/2026, 7:18:12 pm (UTC)'!
zIndex

	^ 4  "ColorSliderMorph index for Hue"! !

!HueSelectorPanel methodsFor: 'access' stamp: 'KenD 11/Jan/2026, 11:53:39 pm (UTC)'!
zValue

"Transcript log: 'zValue=hue ', model color hue printString."
	^ model color hue! !

!HueSelectorPanel methodsFor: 'access' stamp: 'KenD 12/Jan/2026, 10:46:20 pm (UTC)'!
zValue: sliderValue

	| oldColor |
	oldColor := model color.
"Transcript log: 'zValue: ', sliderValue printString."
	model color: (Color 
					h: sliderValue 
					s: oldColor saturation 
					v: oldColor brightness 
					alpha: oldColor alpha).
	self refreshColorSwatch.! !

!HueSelectorPanel methodsFor: 'event handling' stamp: 'KenD 12/Jan/2026, 11:06:38 pm (UTC)'!
refreshColorSwatch
	"When color changes"
	
	| newColor |
	newColor := model color.
	colorSwatch image: (newColor iconOrThumbnailOfSize: self colorSwatchExtent);
				color: newColor.  "DropColorMorph uses this"! !

!HueSelectorPanel methodsFor: 'initialization' stamp: 'KenD 12/Jan/2026, 10:21:16 pm (UTC)'!
withColorModel: aColorEditorModel

	^self withColorModel: aColorEditorModel updateProc: nil
	
	! !

!HueSelectorPanel methodsFor: 'initialization' stamp: 'KenD 13/Jan/2026, 8:25:10 pm (UTC)'!
withColorModel: aColorEditorModel updateProc: oneArgClosure

	super initialize.
	self color: Color veryVeryLightGray.
	model := aColorEditorModel.
	updateProc := oneArgClosure.
	entry := ColorSliderMorph colorPane: self.
	entry redrawBackground;
		  resetSliderPosition.
	self addMorphFront: layoutMorph.
	^self
	
	! !

!HueSelectorPanel class methodsFor: 'accessing' stamp: 'KenD 11/Jan/2026, 10:16:57 pm (UTC)'!
defaultColor

	^Color h: 186 s: 71 v: 69! !

!HueSelectorPanel class methodsFor: 'instance creation' stamp: 'KenD 13/Jan/2026, 4:20:23 pm (UTC)'!
initializedInstance
"
	self initializedInstance openInWorld.
"
 	^ self openWithColor: self defaultColor ! !

!HueSelectorPanel class methodsFor: 'instance creation' stamp: 'KenD 13/Jan/2026, 4:22:56 pm (UTC)'!
openWithColor: aColor

	^ self openWithColor: aColor updateProc: nil! !

!HueSelectorPanel class methodsFor: 'instance creation' stamp: 'KenD 13/Jan/2026, 4:21:31 pm (UTC)'!
openWithColor: aColor updateProc: oneArgClosure

	^(self new withColorModel: (ColorEditorModel color: aColor) updateProc: oneArgClosure ::
		buildMorphicWindow;
		setLabel: 'Hue/Color';
		yourself)! !

!HueSelectorPanel class methodsFor: 'new-morph participation' stamp: 'KenD 11/Jan/2026, 8:19:14 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ true! !

!HueArmMorph methodsFor: 'events' stamp: 'KenD 27/Dec/2025, 9:27:26 pm (UTC)'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"
	
	^ true! !

!HueArmMorph methodsFor: 'events' stamp: 'KenD 28/Dec/2025, 2:11:59 am (UTC)'!
handlesMouseOver: aMouseEvent

	^true! !

!HueArmMorph methodsFor: 'events' stamp: 'KenD 28/Dec/2025, 2:09:58 am (UTC)'!
mouseEnter: igniredMouseEvent

	self borderColor: OKLCHEditPanel swatchBorderColor! !

!HueArmMorph methodsFor: 'events' stamp: 'KenD 28/Dec/2025, 2:10:23 am (UTC)'!
mouseLeave: igniredMouseEvent

	self borderColor: Color black! !

!HueArmMorph methodsFor: 'events' stamp: 'KenD 1/Feb/2026, 9:30:53 pm (UTC)'!
mouseMove: aMouseMoveEvent localPosition: localEventPosition

	aMouseMoveEvent anyButtonPressed ifTrue: [
		self model setOKHue: self currentDegrees - localEventPosition degrees.
		"Model update event causes redraw"
	]! !

!HueArmMorph methodsFor: 'geometry' stamp: 'KenD 31/Dec/2025, 3:42:44 pm (UTC)'!
currentDegrees

	"Rotation opposite of default"
	^location degrees negated
	! !

!HueArmMorph methodsFor: 'geometry' stamp: 'KenD 31/Jan/2026, 8:25:26 pm (UTC)'!
rotateToDegrees: newDegrees
	"Like rotateBy: but to absolute degrees."

	"reset to 0 because #rotateBy: is from current position"
	self rotateBy: location radians negated.
	
      "Rotation is Clockwise, but Hue rotates CounterClockwise.
	 #rotateBy: from zero."
	self	rotateBy: newDegrees degreesToRadians negated.
	
	
! !

!HueArmMorph methodsFor: 'geometry' stamp: 'KenD 21/Dec/2025, 4:39:03 pm (UTC)'!
rotationCenter

	| circleDelta |
	circleDelta := self morphExtent y // 2.
	^(circleDelta @ circleDelta)! !

!HueArmMorph methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 9:59:25 pm (UTC)'!
model

	^model! !

!HueArmMorph methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 9:59:49 pm (UTC)'!
model: aColorEditorModel

	model := aColorEditorModel! !

!HueArmMorph methodsFor: 'testing' stamp: 'KenD 1/Feb/2026, 9:18:40 pm (UTC)'!
submorphsMightProtrude

	^ true  "chromaFrame"! !

!HueArmMorph class methodsFor: 'new-morph participation' stamp: 'KenD 23/Dec/2025, 4:02:34 pm (UTC)'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 6/Feb/2022, 9:25:00 pm (UTC)'!
baseColor
	"Answer a color without alpha translucency"
	
	^ Color r: color red g: color green  b: color blue ! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 3:53:00 am (UTC)'!
blue
	"Answer my blue component 0..255"

	^ (self color blue * 255) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 11:42:00 pm (UTC)'!
blue: zeroTo255

	self setColor: (Color 
		r: self color red
		g: self color green
		b: (zeroTo255 / 255) asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 1:52:00 am (UTC)'!
blueFactor
	"Answer my blueness 0..1"

	^ self color blue! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013, 2:05:00 am (UTC)'!
blueFactor: zeroToOne

	self setColor: (Color 
		r: self color red
		g: self color green
		b: (zeroToOne * 255 / 255) asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 11:44:00 pm (UTC)'!
brightness
	"Answer percent brightness"

	^ (self color brightness * 100) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 11:43:00 pm (UTC)'!
brightness: aPercent

	self setColor: (Color
		h: self color hue
		s: self color saturation
		v: (aPercent / 100) asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 1:53:00 am (UTC)'!
brightnessFactor
	"Answer my brightness 0..1"

	^ self color brightness! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013, 2:04:00 am (UTC)'!
brightnessFactor: zeroToOne

	self setColor: (Color
		h: self color hue
		s: self color saturation
		v: zeroToOne asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 10:54:00 pm (UTC)'!
color

	^ color! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/Jan/2026, 8:11:17 pm (UTC)'!
color: aColor
	"Set my color [prim]"
	
	color := aColor

! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025, 9:39:39 pm (UTC)'!
getOKChroma

	^self color oklchChroma! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 9:18:01 pm (UTC)'!
getOKDarkness

	^(1 - self color oklchLightness)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025, 9:39:33 pm (UTC)'!
getOKHue

	^self color oklchHue! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Dec/2025, 9:39:27 pm (UTC)'!
getOKLightness

	^self color oklchLightness! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 3:53:00 am (UTC)'!
green
	"Answer my green component 0..255"

	^ (self color green * 255) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 11:41:00 pm (UTC)'!
green: zeroTo255

	self setColor: (Color 
		r: self color red
		g: (zeroTo255 / 255) asFloat 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 1:51:00 am (UTC)'!
greenFactor
	"Answer my greenness 0..1"

	^ self color green! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 28/Nov/2013, 3:09:00 am (UTC)'!
greenFactor: zeroToOne

	self setColor: (Color 
		r: self color red
		g: (zeroToOne * 255 / 255) asFloat 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 11:44:00 pm (UTC)'!
hue
	"Answer my hue 0..360 (degrees)"

	^ self color hue rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 11:40:00 pm (UTC)'!
hue: zeroTo360

	self setColor: (Color 
		h: zeroTo360
		s: (self color saturation) 
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 1:55:00 am (UTC)'!
hueFactor
	"Answer my hue 0..1"

	^ (self color hue / 360) asFloat! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013, 2:02:00 am (UTC)'!
hueFactor: zeroToOne

	self setColor: (Color 
		h: (zeroToOne * 360) asFloat
		s: (self color saturation) 
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 28/Dec/2025, 1:55:13 am (UTC)'!
maxOKChroma
	"Answer max Chroma at this hue and lightness."

	^(self color oklchDo: [:theLightness :oldChroma :theHue |
			"Values beyond the max anserert the max"
			(Color okl:  theLightness c:  0.9 h: theHue) oklchChroma 
		])
! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/Jan/2026, 7:46:01 pm (UTC)'!
propertyValue

	^color! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/Jan/2026, 7:48:47 pm (UTC)'!
propertyValue: aColor

	(aColor is: #Color) 
		ifFalse: [ self error: 'Expected a Color; got: ', aColor printString ].
	color := aColor! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 3:53:00 am (UTC)'!
red
	"Answer my red component 0..255"

	^ (self color red * 255) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 11:42:00 pm (UTC)'!
red: zeroTo255

	self setColor: (Color 
		r: (zeroTo255 / 255) asFloat 
		g: self color green 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 1:51:00 am (UTC)'!
redFactor
	"Answer my redness 0..1"

	^ self color red! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013, 2:06:00 am (UTC)'!
redFactor: zeroToOne

	self setColor: (Color 
		r: (zeroToOne * 255 / 255) asFloat 
		g: self color green 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 11:45:00 pm (UTC)'!
saturation
	"Answer my percent saturation"

	^ (self color saturation * 100) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 23/Nov/2013, 11:42:00 pm (UTC)'!
saturation: aPercent

	self setColor: (Color 
		h: (self color hue) 
		s: (aPercent / 100) asFloat
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 26/Nov/2013, 1:56:00 am (UTC)'!
saturationFactor
	"Answer my saturation 0..1"

	^ self color saturation ! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 25/Nov/2013, 2:01:00 am (UTC)'!
saturationFactor: zeroToOne

	self setColor: (Color 
		h: (self color hue) 
		s: zeroToOne asFloat
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/Jan/2026, 8:11:39 pm (UTC)'!
setColor: aColor
	"Set my color and trigger #colorChanged passing me (the model)"
	
	(color == aColor) ifTrue: [ ^self ].
	self color: aColor.
	self triggerEvent: #colorChanged with: self.
	^ self

! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 9:08:34 pm (UTC)'!
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

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 9:16:28 pm (UTC)'!
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

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 9:10:04 pm (UTC)'!
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

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 9:10:50 pm (UTC)'!
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

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 2/Dec/2013, 11:24:00 pm (UTC)'!
setRGBColorFromInteger: anInteger
	"Set my color from integer interpreted as RGB value"
	
	| aColor |
	aColor := Color 
					r: ((anInteger bitShift: -16) bitAnd: 255)	/ 255
					g: ((anInteger bitShift: -8) bitAnd: 255) / 255
					b: (anInteger bitAnd: 255) / 255.
			
	^ self setColor: aColor

! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 27/Dec/2025, 8:46:39 pm (UTC)'!
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

!ColorEditorModel methodsFor: 'initialization' stamp: 'KenD 20/Nov/2013, 2:09:00 am (UTC)'!
defaultColor

	^ Color teal
	! !

!ColorEditorModel methodsFor: 'initialization' stamp: 'KenD 23/Nov/2013, 10:55:00 pm (UTC)'!
initialize

	super initialize.
	self setColor: self defaultColor.
	! !

!ColorEditorModel methodsFor: 'alpha scrolling' stamp: 'KenD 6/Feb/2022, 9:32:00 pm (UTC)'!
alpha

	^ color alpha! !

!ColorEditorModel methodsFor: 'alpha scrolling' stamp: 'KenD 6/Feb/2022, 9:36:00 pm (UTC)'!
alpha: zeroToOne
	"Note: 'color alpha: ..' may return a new Color instance."
	
	self setColor: (color alpha: zeroToOne)! !

!ColorEditorModel methodsFor: 'printing' stamp: 'jmv 13/Feb/2014, 8:42:00 pm (UTC)'!
hexStringRGB
	"Answer my RGB as hex but with no 16r prefix"

"	^ (self red    printPaddedWith: $0 to: 2 base: 16) , 
	  (self green printPaddedWith: $0 to: 2 base: 16) , 
	  (self blue   printPaddedWith: $0 to: 2 base: 16)
	"
	^ self color hexStringRGB! !

!ColorEditorModel methodsFor: 'printing' stamp: 'jmv 13/Feb/2014, 8:45:00 pm (UTC)'!
rgbValue
	"Answer my RGB as an integer"

	^ ( '16r',  self color hexStringRGB) asNumber! !

!ColorEditorModel class methodsFor: 'instance creation' stamp: 'KenD 23/Nov/2013, 10:55:00 pm (UTC)'!
color: aColor

	^ self new setColor: aColor! !

!Color class methodsFor: '*ui-color-panel' stamp: 'KenD 2/Jan/2026, 8:12:10 pm (UTC)'!
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

!Color class methodsFor: '*ui-color-panel' stamp: 'KenD 13/Jan/2026, 4:23:47 pm (UTC)'!
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
					'Select Hue'		 "7"
					'Cancel'                "8"
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
	(selectedIndex = 7)
		ifTrue: [ (HueSelectorPanel openWithColor: aColor ) openInWorld ].
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

!Color class methodsFor: '*ui-color-panel' stamp: 'KenD 13/Jan/2026, 4:58:46 pm (UTC)'!
colorSelectionMenu: aColor updateProc: oneArgClosure
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
					'Select Hue'		 "7"
					'Cancel'                "8"
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
		ifTrue: [ (ColorEditorPanel openWithColor: aColor updateProc: oneArgClosure) openInWorld ].
	(selectedIndex = 6)
		ifTrue: [ (OKLCHEditPanel openWithColor: aColor  updateProc: oneArgClosure) openInWorld ].
	(selectedIndex = 7)
		ifTrue: [ (HueSelectorPanel openWithColor: aColor  updateProc: oneArgClosure) openInWorld ].
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
