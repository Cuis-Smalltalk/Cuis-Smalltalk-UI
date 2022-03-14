'From Cuis 6.0 [latest update: #5093] on 14 March 2022 at 3:21:57 pm'!
'Description I supply the ColorEditor Panel'!
!provides: 'Color-Edit-Panel' 1 16!
!requires: 'UI-DragAndDrop' 1 3 nil!
!requires: 'CSS3-NamedColors' 1 1 nil!
!requires: 'UI-Click-Select' 1 2 nil!
!requires: 'Color-Extras' 1 9 nil!
!requires: 'UI-Panel' 1 5 nil!
!requires: 'UI-Palette' 1 8 nil!
!requires: 'Graphics-Files-Additional' 1 24 nil!
SystemOrganization addCategory: 'Color-Edit-Panel'!


!classDefinition: #ColorPaneMorph category: 'Color-Edit-Panel'!
ImageMorph subclass: #ColorPaneMorph
	instanceVariableNames: 'zeroPlaneForm zIndex zValue colorPoint focusMorph'
	classVariableNames: 'BlueIndex BrightnessForm BrightnessIndex BrightnessOverlay GBForm GreenIndex HueIndex HueOverlay RBForm RGForm RedIndex SaturationForm SaturationIndex SaturationOverlay'
	poolDictionaries: ''
	category: 'Color-Edit-Panel'!
!classDefinition: 'ColorPaneMorph class' category: 'Color-Edit-Panel'!
ColorPaneMorph class
	instanceVariableNames: ''!

!classDefinition: #ColorSliderMorph category: 'Color-Edit-Panel'!
ImageMorph subclass: #ColorSliderMorph
	instanceVariableNames: 'colorPane sliderMorph maxZValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Color-Edit-Panel'!
!classDefinition: 'ColorSliderMorph class' category: 'Color-Edit-Panel'!
ColorSliderMorph class
	instanceVariableNames: ''!

!classDefinition: #ColorEditorPanel category: 'Color-Edit-Panel'!
DialogPanel subclass: #ColorEditorPanel
	instanceVariableNames: 'alphaFrame alphaSlider alphaSwatch colorPane colorSwatch sliderColumn closeColorSwatch closeColorLabel closestRGB radioSelection rgbRadio hsvRadio closestColordictColor rgbString'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Color-Edit-Panel'!
!classDefinition: 'ColorEditorPanel class' category: 'Color-Edit-Panel'!
ColorEditorPanel class
	instanceVariableNames: ''!

!classDefinition: #ColorPalette category: 'Color-Edit-Panel'!
ImagePickerPanel subclass: #ColorPalette
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Color-Edit-Panel'!
!classDefinition: 'ColorPalette class' category: 'Color-Edit-Panel'!
ColorPalette class
	instanceVariableNames: ''!

!classDefinition: #ColorEditorModel category: 'Color-Edit-Panel'!
Object subclass: #ColorEditorModel
	instanceVariableNames: 'color'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Color-Edit-Panel'!
!classDefinition: 'ColorEditorModel class' category: 'Color-Edit-Panel'!
ColorEditorModel class
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

!ColorEditorPanel commentStamp: 'hlsf 12/29/2021 10:42:51' prior: 0!
I present the ColorEditor UI

Usage: 
	ColorEditorPanel open.
	ColorEditorPanel open: Color forestGreen.!

!ColorPalette commentStamp: '<historical>' prior: 0!
I am just a way to get a Color palette.  See my class side.!

!ColorEditorModel commentStamp: '<historical>' prior: 0!
I am the model (state holder) for a ColorEditor.!

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 3/13/2022 12:45:22'!
initializedInstance
"
	self initializedInstance openInWorld.
"
 	| panel |
	panel _ self new
		model: self defaultColor ;
		buildMorphicWindow.
	^ panel 	
		widgetsColor: panel windowColor ;
		yourself! !

!ColorPalette class methodsFor: 'instance creation' stamp: 'KenD 9/16/2021 14:15:59'!
initializedInstance

	^ ImagePickerPanel namedColors! !

!ColorPaneMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/30/2013 19:33'!
aboutToGrab: aMorph
	"submorph is being grabbed by a hand.
	Perform necessary adjustments (if any) and return the actual morph
	that should be added to the hand.
	Answer nil to reject the drag."

	^ DropColorMorph fromColor: self focusColor! !

!ColorPaneMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/30/2013 19:35'!
allowsSubmorphDrag
	"Answer whether our morphs can just be grabbed with the hand, instead of requiring the use of the halo. Redefined to answer true."
	
	"Click and hold"

	^ true! !

!ColorPaneMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 3/3/2022 13:43:07'!
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

!ColorPaneMorph methodsFor: 'private' stamp: 'KenD 12/5/2013 20:50'!
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

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 11/27/2013 15:48'!
colorPoint

	^ colorPoint ! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 12/7/2013 15:17'!
colorPoint: aPoint

	(colorPoint = aPoint)
		ifFalse: [ 
			colorPoint := aPoint.
			self triggerEvent: #colorChanged with: self
		]! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 11/27/2013 14:58'!
colorSelector

	^ #(red green blue hue saturation brightness) at: self zIndex ! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 12/5/2013 20:20'!
focusColor
	"Answer my focus color"
	
	^ (self colorConstructors at: zIndex) value: colorPoint x value: colorPoint y value: zValue 

! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 11/26/2013 18:20'!
focusMorph

	^ focusMorph! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 11/28/2013 22:32'!
pureColorForm
	"Create form from current color"

	^ self focusColor iconOrThumbnailOfSize: 256@256

! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 11/28/2013 23:20'!
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

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 11/26/2013 18:27'!
zIndex

	^ zIndex
! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 11/26/2013 13:29'!
zValue

	^ zValue ! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 12/7/2013 15:16'!
zValue: zeroTo255 "or ..100 or ..360"

	(zValue = zeroTo255)
		ifFalse: [ 
			zValue := zeroTo255.  "Does NOT change colorPoint"
			self triggerEvent: #colorChanged with: self.
		]
! !

!ColorPaneMorph methodsFor: 'accessing' stamp: 'KenD 11/26/2013 17:48'!
zeroPlaneForm

	^ zeroPlaneForm! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 11/26/2013 17:04'!
focusMorphDiameter
	
	^ 10! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 11/29/2013 14:35'!
fromModel: model selector: aSelector

	zIndex := self zIndexFromSelector: aSelector.
	self updateColorFromModel: model
! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 11/26/2013 18:43'!
initialize

	super initialize.
	self image: (Form extent: 256@256 depth: 32).
	self makeFocusMorph.! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 11/26/2013 18:43'!
makeFocusMorph

	focusMorph := EllipseMorph new. 
	focusMorph 
		morphExtent: self focusMorphDiameter @ self focusMorphDiameter;
		color: Color transparent;
		borderWidth: 2;
		borderColor: Color orange;
		morphPosition: 0@0.
		
	self addMorph: self focusMorph.! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 12/8/2013 08:07'!
zIndex: oneTo6 zValue: anInteger colorPoint: aPoint

	zIndex := oneTo6.
	zValue := anInteger.
	colorPoint := aPoint.
	self focusMorph morphPosition: (aPoint - (self focusMorphDiameter / 2)).
	self refreshForm;
		 triggerEvent: #colorChanged
! !

!ColorPaneMorph methodsFor: 'initialization' stamp: 'KenD 11/27/2013 09:21'!
zIndexFromSelector: aSelector

	^ #(red green blue hue saturation brightness) 
			indexOf: aSelector asLowercase asSymbol
			ifAbsent: [ self error: 'Invalid selector' , aSelector asString ]! !

!ColorPaneMorph methodsFor: 'change processing' stamp: 'KenD 12/5/2013 17:13'!
hackHSVform
	"answer a base form for color plane over (x,y) with constant z.
	This is turtle slow, but accurate"

	| colorMaker displayForm |
	displayForm := Form extent: 256@256 depth: 32.
	colorMaker := self colorConstructors at: self zIndex.
	1 to: 256 do: [ :x |
		1 to: 256 do:  [ :y | 
			displayForm colorAt: x @ y put: (colorMaker value: x value: y value: self zValue)
		]
	].
	self image: displayForm

	! !

!ColorPaneMorph methodsFor: 'change processing' stamp: 'KenD 12/1/2013 18:15'!
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

!ColorPaneMorph methodsFor: 'change processing' stamp: 'KenD 12/5/2013 19:41'!
resetFocus

	self focusMorph morphPosition: (colorPoint - (self focusMorphDiameter / 2)).
	self focusMorph borderColor: self focusColor negated. "Show up against background"
	self triggerEvent: #resetFocus.
	! !

!ColorPaneMorph methodsFor: 'events' stamp: 'KenD 12/4/2013 21:52'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"

	^ true! !

!ColorPaneMorph methodsFor: 'events' stamp: 'KenD 12/4/2013 21:52'!
handlesMouseOver: evt
	"Do I want to receive mouseEnter: and mouseLeave: when the button is up and the hand is empty?" 
	
	^ true! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 9/28/2021 08:56:44'!
mouseButton1Up: aMouseButtonEvent localPosition: localEventPosition

	(self coversPixel: aMouseButtonEvent eventPosition)
		ifTrue: [ 
				self 
					colorPoint: localEventPosition;
					resetFocus;
					triggerEvent: #colorChanged
		]
! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 9/17/2019 06:35:23'!
mouseEnter: event

	Cursor currentCursor: (Cursor cursorAt: #crossHairCursor)! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 9/17/2019 06:35:45'!
mouseLeave: event

	Cursor currentCursor: (Cursor cursorAt: #normalCursor)! !

!ColorPaneMorph methodsFor: 'events-processing' stamp: 'KenD 11/29/2013 00:08'!
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

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/26/2013 14:33'!
blueIndex

	^ BlueIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2013 23:12'!
brightnessForm

	^ BrightnessForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/26/2013 14:34'!
brightnessIndex

	^ BrightnessIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2013 23:13'!
brightnessOverlay

	^ BrightnessOverlay ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2013 22:59'!
gbForm

	^ GBForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/26/2013 14:33'!
greenIndex

	^ GreenIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/26/2013 14:33'!
hueIndex

	^ HueIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2013 23:11'!
hueOverlay

	^ HueOverlay! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2013 22:59'!
rbForm

	^ RBForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/26/2013 14:33'!
redIndex

	^ RedIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2013 22:59'!
rgForm

	^ RGForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2013 23:12'!
saturationForm

	^ SaturationForm! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/26/2013 14:34'!
saturationIndex

	^ SaturationIndex ! !

!ColorPaneMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2013 23:13'!
saturationOverlay

	^ SaturationOverlay! !

!ColorPaneMorph class methodsFor: 'initialization' stamp: 'KenD 12/3/2013 21:28'!
defaultColor

	^ Color transparent! !

!ColorPaneMorph class methodsFor: 'examples' stamp: 'KenD 11/26/2013 18:22'!
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

!ColorPaneMorph class methodsFor: 'new-morph participation' stamp: 'KenD 12/6/2013 19:05'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 12/1/2013 16:13'!
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

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 12/1/2013 16:12'!
makeBrightnessForm
	"Briightness is the slider; This is a background/base slice of hue and value"

	| hueFactor briteForm |
	hueFactor := 256 / 360.
	briteForm := Form extent: 256@256 depth:  32.
	1 to: 256 do: [ :x |
		1 to: 256 do:  [ :y | 
			briteForm colorAt: x @ y put: (Color h: (x / hueFactor) s: (y / 256) v: 1.0)
		]
	].

	^ briteForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 12/1/2013 18:28'!
makeGBForm
	"(x,y)=(g,b), slider value adds z=red"
"
	(ImageMorph new image: ColorPaneMorph makeGBForm) openInWorld.
"
	| rbForm |
	rbForm := Form extent: 256@256 depth:  32.
	0 to: 256 do: [ :x |
		0 to: 256 do:  [ :y | 
			rbForm colorAt: x @ y put: (Color r: 0 g: x/256 b: y/256)
		]
	].

	^ rbForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 12/1/2013 18:29'!
makeHueOverlay
	"This is a combination of Saturation+Brightness which is mixed with a Hue"
"
	(ImageMorph new image: ColorPaneMorph makeHueOverlay) openInWorld.
"
	| hueForm valForm satForm |
	"Brightness (Value) component [y] from Black to White"
	valForm := Form extent: 256@256 depth:  32.
	0 to: 256 do: [ :x |
		0 to: 256 do:  [ :y | 
			valForm colorAt: x @ y put: ((Color h: 0 s: 0 v: (y/256)) alpha: (256-y)/256)
		]
	].
	"Saturation component [x] white mixed in from full to none"
	satForm := Form extent: 256@256 depth:  32.
	1 to: 256 do: [ :x |
		1 to: 256 do:  [ :y |
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

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 12/1/2013 18:29'!
makeRBForm
	"(x,y)=(r,b), slider value adds z=green"
"
	(ImageMorph new image: ColorPaneMorph makeRBForm) openInWorld.
"
	| rbForm |
	rbForm := Form extent: 256@256 depth:  32.
	0 to: 256 do: [ :x |
		0 to: 256 do:  [ :y | 
			rbForm colorAt: x @ y put: (Color r: x/256 g: 0 b: y/256)
		]
	].

	^ rbForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 12/1/2013 18:29'!
makeRGForm
	"(x,y)=(r,g), slider value adds z=blue"
"
	(ImageMorph new image: ColorPaneMorph makeRGForm) openInWorld.
"
	| rbForm |
	rbForm := Form extent: 256@256 depth:  32.
	0 to: 256 do: [ :x |
		0 to: 256 do:  [ :y | 
			rbForm colorAt: x @ y put: (Color r: x/256 g: y/256 b: 0)
		]
	].

	^ rbForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 12/1/2013 18:29'!
makeSaturationForm
	"Saturation is the slider.  Hue is the base and Brightness/Value the overlay"
"
	(ImageMorph new image: ColorPaneMorph makeSaturationForm) openInWorld.
"
	| hueFactor satForm |
	hueFactor := 256 / 360.
	satForm := Form extent: 256@256 depth:  32.
	0 to: 256 do: [ :x |
		0 to: 256 do:  [ :y | 
			satForm colorAt: x @ y put: (Color h: (x / hueFactor) s: 1.0 v: (y / 256))
		]
	].

	^ satForm
! !

!ColorPaneMorph class methodsFor: 'class initialization' stamp: 'KenD 12/1/2013 18:29'!
makeSaturationOverlay
	"Overlay is Value/Brightness"
"
	(ImageMorph new image: ColorPaneMorph makeSaturationOverlay) openInWorld.
"
	| satOverlay |
	satOverlay := Form extent: 256@256 depth:  32.
	0 to: 256 do: [ :x |
		0 to: 256 do:  [ :y | 
			satOverlay colorAt: x @ y put: (Color h: 0 s: 0 v: (y / 256))
		]
	].

	^ satOverlay
! !

!ColorPaneMorph class methodsFor: 'geometry' stamp: 'KenD 9/16/2016 15:48:34'!
minimumExtent
	"Also my maximum extent"
	^ 256@256! !

!ColorPaneMorph class methodsFor: 'instance creation' stamp: 'KenD 11/26/2013 18:14'!
zSelector: aSymbol zValue: anInteger colorPoint: aPoint

	^ self new 
			zIndex: (#(Red Green Blue Hue Saturation Brightness) 
						 indexOf: aSymbol
						 ifAbsent: [ self error: 'Invalid selector' , aSymbol asString ])
			zValue: anInteger 
			colorPoint: aPoint! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 12/4/2013 22:03'!
colorPane

	^ colorPane ! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 12/26/2013 13:08'!
deltaPoint
	"Offset for slider to center on bar"
	
	^ -4  @ -5! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 12/5/2013 19:38'!
maxZValue

	^ maxZValue "100, 256, or 360"! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 3/2/2015 15:23'!
scaledZPosition
	"Answer color Z value scaled to 0..256 as Y position (zero low .. 256 high)"
	"NB: must round result as coordinate cannot be a fraction"

	^ (256 - ((self colorPane zValue / self maxZValue) * 256))! !

!ColorSliderMorph methodsFor: 'accessing' stamp: 'KenD 12/4/2013 22:03'!
sliderMorph

	^ sliderMorph ! !

!ColorSliderMorph methodsFor: 'initialization' stamp: 'KenD 12/5/2013 17:42'!
colorPane: aColorPaneMorph

	colorPane := aColorPaneMorph.
	self 
		refreshColorFromModel; 
		redrawBackground.! !

!ColorSliderMorph methodsFor: 'initialization' stamp: 'KenD 10/16/2020 15:38:33'!
initialize

	super initialize.
	sliderMorph := BoxedMorph new.
	sliderMorph 
		color: Color transparent;
		borderColor: Color black;
		borderWidth: 3;
		morphExtent:28@10;
		morphPosition: -4@5.
		
	maxZValue := 256. "Default"

	self 
		image: (Form extent: 20@256 depth: 32);
		layoutSpec: (LayoutSpec 
							fixedWidth: 28 
							fixedHeight: 256 
							offAxisEdgeWeight: #center);
		addMorph: sliderMorph.! !

!ColorSliderMorph methodsFor: 'events' stamp: 'KenD 12/5/2013 17:52'!
handlesMouseDown: aMouseButtonEvent
	"Do I want to receive mouseDown events (mouseDown:, mouseMove:, mouseUp:)?"
	
	^ true! !

!ColorSliderMorph methodsFor: 'events' stamp: 'KenD 12/5/2013 21:09'!
mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition
	"Update visual feedback"

	super mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition.
	self colorPane zValue: (self zValueFromY: localEventPosition y).
	self resetSliderPosition.! !

!ColorSliderMorph methodsFor: 'events' stamp: 'jmv 2/13/2014 14:20'!
mouseMove: aMouseMoveEvent localPosition: localEventPosition

	self colorPane zValue: (self zValueFromY: localEventPosition y).
	self resetSliderPosition.! !

!ColorSliderMorph methodsFor: 'event handling' stamp: 'KenD 12/5/2013 21:11'!
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
	myForm  := self form.
	1 to: 20 do: [ :x |
		0 to: 255 do:  [ :y | 
			myForm colorAt: x@y 
					    put: (colorMaker value: pointX 
											value: pointY 
											value: (scaleZ value: 255-y))
		]
	].
	self resetSliderPosition.
	self redrawNeeded.! !

!ColorSliderMorph methodsFor: 'event handling' stamp: 'KenD 12/5/2013 19:33'!
refreshColorFromModel

	self resetSliderPosition.

	! !

!ColorSliderMorph methodsFor: 'event handling' stamp: 'KenD 12/26/2013 13:06'!
resetSliderPosition
	"Center me over selected Z position"
	
	self sliderMorph morphPosition: self deltaPoint + (0 @ (self scaledZPosition)).! !

!ColorSliderMorph methodsFor: 'private' stamp: 'KenD 12/5/2013 21:17'!
zValueFromY: zeroTo255

	| newY |
	newY := (zeroTo255 min: 255 max: 0).

	^ ((255 - newY) / 255) * self maxZValue! !

!ColorSliderMorph class methodsFor: 'instance creation' stamp: 'KenD 12/5/2013 17:31'!
colorPane: aColorPaneMorph

	^ self new colorPane: aColorPaneMorph! !

!ColorSliderMorph class methodsFor: 'new-morph participation' stamp: 'KenD 12/6/2013 19:06'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ false! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 11/26/2013 21:27'!
colorPane

	^ colorPane ! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 10/29/2015 08:57'!
colorSelectionSymbol

	^ radioSelection ! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 10/29/2015 08:57'!
colorSelectionSymbol: aSym

	radioSelection := aSym! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 11/19/2013 21:15'!
colorSwatch

	^ colorSwatch! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 11/19/2013 21:14'!
hsvRadio

	^ hsvRadio! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 11/19/2013 21:14'!
rgbRadio

	^ rgbRadio! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 11/24/2013 08:48'!
rgbString
	"Answer my rgbString StringMorph"
	^ rgbString! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 11/25/2013 19:12'!
sliderColumn

	^ sliderColumn! !

!ColorEditorPanel methodsFor: 'private' stamp: 'KenD 2/9/2022 13:50:51'!
swatchBorderColor

	"Match with Visual Menu Item text color"
	^ (Color r: 0.5 g: 0.07 b: 0.5) ! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 2/11/2022 13:18:15'!
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
Color plus ˆ' .
	
	^alphaFrame
	! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 3/13/2022 10:42:34'!
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
		separation: 1;
		color: Color transparent;
		addMorph: (LabelMorph new contents: '16r') layoutSpec: (LayoutSpec keepMorphExtent);
		addMorph: self rgbString;
		addMorph: (LabelMorph new contents: ' hexRGB').
		
	alphaSlider := PluggableScrollBar new ::
		model: self model setValueSelector: #alpha: refreshValueSelector: #alpha ; 
		morphExtent: (256 @ ScrollBar scrollbarThickness) ;   "Horizontal"
		setProperty: #balloonText toValue: 'set alpha transparency' ;
		adoptWidgetsColor: Color orange darker darker ;
		refreshValueFromModel . 
	
	column := LayoutMorph newColumn.
	column
		addMorph: colorPane ;
		addMorph: hexDisplayLayout; 
		addMorph: alphaSlider ;
		addMorph: (LabelMorph contents: 'transparent <-ˆ-> opaque') ;
		axisEdgeWeight: #columnTop;
		separation: 4;
		color: Color transparent.
	
	^ column! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 3/4/2022 13:29:22'!
buildMorphicWindow
" Our layout is a bit different to a traditional dialog, so we override as 
we don't need button area at the bottom and main panel is a row of morphs." 
	
	self layoutMorph separation: self defaultSeparation ;
		axisEdgeWeight: self defaultAlignement ;
		addMorph: self buildColorPaneColumn;
		addMorph: self buildSliderColumn;
		addMorph: self buildRadioButtonColumn;
		morphExtent: self minimumExtent.
	self model 
		when: #colorChanged 
		send: #refreshColor 
		to: self.
	^self
		colorSwatchesBeDroppable;
		refreshCloseColor;
		yourself
! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 12/30/2021 12:42:57'!
buildRadioButtonColumn

	| radioCol setupEntryMorph valueEntryMorph |
	rgbRadio := RadioGroup fromList: #(Red Green Blue).
	rgbRadio separation: 2.
	hsvRadio := RadioGroup fromList: #(Hue Saturation Brightness).
	hsvRadio separation: 2.
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
		separation: 0;
		axisEdgeWeight: #columnTop;
		addMorph: rgbRadio;
		addMorph: hsvRadio;
		addMorph: self buildSwatchLayout;
		color: Color transparent;
		yourself
	! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 2/7/2022 11:24:08'!
buildSliderColumn

	sliderColumn := LayoutMorph newColumn.
	sliderColumn color: Color transparent.
	self 		
		buildAlphaSwatch;
		resetSliderColumn.
	
	^ sliderColumn 

	! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 2/11/2022 13:17:54'!
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
		axisEdgeWeight: #center;
		separation: 3;
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
Color without ˆ' .

	swatchLayout := LayoutMorph newRow.
	^ swatchLayout 
		separation: 6;
		addMorph: colorFrame layoutSpec: (LayoutSpec keepMorphExtent);
		addMorph: labelColumn;
		color: Color transparent;
		yourself
	! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 10/29/2015 09:01'!
resetSliderColumn

	self resetSliderColumn: self colorSelectionSymbol! !

!ColorEditorPanel methodsFor: 'GUI building' stamp: 'KenD 2/7/2022 11:30:01'!
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
		separation: 6;
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

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 11/23/2013 17:09'!
colorSwatchExtent

	^ 64 @ 64! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 3/4/2022 13:32:24'!
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

!ColorEditorPanel methodsFor: 'initialization' stamp: 'hlsf 12/29/2021 10:17:42'!
defaultAlignement
	^ #rowLeft! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 11/24/2013 18:58'!
defaultRadioSelector

	^ #Green! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 12/30/2021 13:03:46'!
initialize

	super initialize.
	self beRow.
	self color: Color veryVeryLightGray.
	self titleMorph showButtonsNamed: #( close collapse ).
	model          := ColorEditorModel new.
	colorSwatch := DropColorMorph fromColor: model color.
	rgbString     := SimpleNumberEntryMorph hexRGBEntry.
	closestRGB  := LabelMorph new contents: ''.
	self 
		colorSelectionSymbol: self defaultRadioSelector;
		refreshColorSwatch;
		yourself

	! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'hlsf 12/29/2021 10:42:37'!
model: aColor
	self setColor: aColor! !

!ColorEditorPanel methodsFor: 'initialization' stamp: 'KenD 10/29/2015 13:33'!
setColor: aColor

	self model setColor: aColor.
	self refreshColorSwatch.
! !

!ColorEditorPanel methodsFor: 'events-processing' stamp: 'KenD 10/29/2015 09:02'!
fontPreferenceChanged

	super fontPreferenceChanged.
	self resetSliderColumn.! !

!ColorEditorPanel methodsFor: 'events-processing' stamp: 'KenD 10/29/2015 09:01'!
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

!ColorEditorPanel methodsFor: 'events-processing' stamp: 'KenD 2/6/2022 15:53:06'!
updateColorFromPane
	"Someone changed color in colorPane.  Update my model"
	
	self model setColor: 
		(self colorPane focusColor
			alpha: self model alpha)! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 2/6/2022 16:23:20'!
refreshAlphaSwatch
	"When color changes"
	
	(alphaSwatch color = self model color)
	ifFalse: [ | newColor |
		newColor := self model color alpha: alphaSlider value.
		alphaSwatch image: 
		(newColor 
			iconOrThumbnailOfSize: 32@32).
		alphaSwatch color: newColor
	]! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 9/12/2021 15:41:40'!
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

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 2/6/2022 16:12:50'!
refreshColor
	"model color has changed.  Refresh my views."
	
	self 
		refreshColorSwatch;
		refreshColorPane;
		refreshCloseColor;
		refreshAlphaSwatch! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 11/27/2013 14:43'!
refreshColorPane
	"When selector changes.."

	self colorPane updateColorFromModel: self model.! !

!ColorEditorPanel methodsFor: 'color updating' stamp: 'KenD 2/6/2022 16:00:39'!
refreshColorSwatch
	"When color changes"
	
	colorSwatch image: (model baseColor iconOrThumbnailOfSize: self colorSwatchExtent).
	colorSwatch color: self model baseColor! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'hlsf 12/29/2021 10:52:14'!
open
"
	self open 
"	
	^ self open: self defaultColor! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 2/7/2022 12:25:02'!
open: model

	^ self open: model label: 'Color Editor'! !

!ColorEditorPanel class methodsFor: 'instance creation' stamp: 'KenD 1/10/2022 13:22:18'!
openWithColor: aColor

	^ self open: aColor label: 'Color Editor'! !

!ColorEditorPanel class methodsFor: 'initialization' stamp: 'KenD 12/24/2013 09:26'!
defaultColor

	^ Color  r: 16r40/255 g: 16rA5/255 b: 16rD0/255.! !

!ColorEditorPanel class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 15:02:52'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!ColorEditorPanel class methodsFor: 'new-morph participation' stamp: 'KenD 12/6/2013 19:09'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!ColorPalette class methodsFor: 'new-morph participation' stamp: 'KenD 3/14/2022 15:04:08'!
categoryInNewMorphMenu

	^ 'User Interface'! !

!ColorPalette class methodsFor: 'new-morph participation' stamp: 'KenD 12/24/2013 17:55'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 12/24/2013 19:57'!
useCSS3ColorDict
"
	self useCSS3ColorDict.
"
	Feature require: 'CSS3-NamedColors'.
	Color setColorNamesDict: Color css3ColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 7/24/2015 11:33'!
useCrayonColorDict
"
	ColorPalette useCrayonColorDict.
"

	Feature require: 'Crayon-NamedColors'.
	Color setColorNamesDict: Color crayonColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 12/24/2013 19:57'!
useNBSISCCColorDict
"
	self useNBSISCCColorDict.
"
	Feature require: 'NBSISCC-NamedColors'.
	Color setColorNamesDict: Color nbsisccColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 12/24/2013 19:56'!
useSmallColorDict

	Color setColorNamesDict: Color defaultColorNamesDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 12/24/2013 19:56'!
useXKCDColorDict
"
	self useXKCDColorDict.
"

	Feature require: 'XKCD-NamedColors'.
	Color setColorNamesDict: Color xkcdColorDictionary.! !

!ColorPalette class methodsFor: 'color dictionary' stamp: 'KenD 12/24/2013 19:59'!
useXKCDFirst48ColorDict
"
	self useXKCDFirst48ColorDict.
"

	Color setColorNamesDict: Color xkcdFirst48ColorNamesDictionary.! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 2/6/2022 14:25:45'!
baseColor
	"Answer a color without alpha translucency"
	
	^ Color r: color red g: color green  b: color blue ! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/22/2013 20:53'!
blue
	"Answer my blue component 0..255"

	^ (self color blue * 255) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:42'!
blue: zeroTo255

	self setColor: (Color 
		r: self color red
		g: self color green
		b: (zeroTo255 / 255) asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/25/2013 18:52'!
blueFactor
	"Answer my blueness 0..1"

	^ self color blue! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/24/2013 19:05'!
blueFactor: zeroToOne

	self setColor: (Color 
		r: self color red
		g: self color green
		b: (zeroToOne * 255 / 255) asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:44'!
brightness
	"Answer percent brightness"

	^ (self color brightness * 100) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:43'!
brightness: aPercent

	self setColor: (Color
		h: self color hue
		s: self color saturation
		v: (aPercent / 100) asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/25/2013 18:53'!
brightnessFactor
	"Answer my brightness 0..1"

	^ self color brightness! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/24/2013 19:04'!
brightnessFactor: zeroToOne

	self setColor: (Color
		h: self color hue
		s: self color saturation
		v: zeroToOne asFloat)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 15:54'!
color

	^ color! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/22/2013 20:53'!
green
	"Answer my green component 0..255"

	^ (self color green * 255) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:41'!
green: zeroTo255

	self setColor: (Color 
		r: self color red
		g: (zeroTo255 / 255) asFloat 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/25/2013 18:51'!
greenFactor
	"Answer my greenness 0..1"

	^ self color green! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/27/2013 20:09'!
greenFactor: zeroToOne

	self setColor: (Color 
		r: self color red
		g: (zeroToOne * 255 / 255) asFloat 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:44'!
hue
	"Answer my hue 0..360 (degrees)"

	^ self color hue rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:40'!
hue: zeroTo360

	self setColor: (Color 
		h: zeroTo360
		s: (self color saturation) 
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/25/2013 18:55'!
hueFactor
	"Answer my hue 0..1"

	^ (self color hue / 360) asFloat! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/24/2013 19:02'!
hueFactor: zeroToOne

	self setColor: (Color 
		h: (zeroToOne * 360) asFloat
		s: (self color saturation) 
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/22/2013 20:53'!
red
	"Answer my red component 0..255"

	^ (self color red * 255) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:42'!
red: zeroTo255

	self setColor: (Color 
		r: (zeroTo255 / 255) asFloat 
		g: self color green 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/25/2013 18:51'!
redFactor
	"Answer my redness 0..1"

	^ self color red! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/24/2013 19:06'!
redFactor: zeroToOne

	self setColor: (Color 
		r: (zeroToOne * 255 / 255) asFloat 
		g: self color green 
		b: self color blue)! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:45'!
saturation
	"Answer my percent saturation"

	^ (self color saturation * 100) rounded! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 16:42'!
saturation: aPercent

	self setColor: (Color 
		h: (self color hue) 
		s: (aPercent / 100) asFloat
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/25/2013 18:56'!
saturationFactor
	"Answer my saturation 0..1"

	^ self color saturation ! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/24/2013 19:01'!
saturationFactor: zeroToOne

	self setColor: (Color 
		h: (self color hue) 
		s: zeroToOne asFloat
		v: (self color brightness) )! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 11/23/2013 20:59'!
setColor: aColor
	"Set my color and trigger #colorChanged passing me (the model)"
	
	(color == aColor) ifTrue: [ ^self ].
	color := aColor.
	self triggerEvent: #colorChanged with: self.
	^ self

! !

!ColorEditorModel methodsFor: 'accessing' stamp: 'KenD 12/2/2013 16:24'!
setRGBColorFromInteger: anInteger
	"Set my color from integer interpreted as RGB value"
	
	| aColor |
	aColor := Color 
					r: ((anInteger bitShift: -16) bitAnd: 255)	/ 255
					g: ((anInteger bitShift: -8) bitAnd: 255) / 255
					b: (anInteger bitAnd: 255) / 255.
			
	^ self setColor: aColor

! !

!ColorEditorModel methodsFor: 'initialization' stamp: 'KenD 11/19/2013 19:09'!
defaultColor

	^ Color teal
	! !

!ColorEditorModel methodsFor: 'initialization' stamp: 'KenD 11/23/2013 15:55'!
initialize

	super initialize.
	self setColor: self defaultColor.
	! !

!ColorEditorModel methodsFor: 'alpha scrolling' stamp: 'KenD 2/6/2022 14:32:26'!
alpha

	^ color alpha! !

!ColorEditorModel methodsFor: 'alpha scrolling' stamp: 'KenD 2/6/2022 14:36:08'!
alpha: zeroToOne
	"Note: 'color alpha: ..' may return a new Color instance."
	
	self setColor: (color alpha: zeroToOne)! !

!ColorEditorModel methodsFor: 'printing' stamp: 'jmv 2/13/2014 13:42'!
hexStringRGB
	"Answer my RGB as hex but with no 16r prefix"

"	^ (self red    printPaddedWith: $0 to: 2 base: 16) , 
	  (self green printPaddedWith: $0 to: 2 base: 16) , 
	  (self blue   printPaddedWith: $0 to: 2 base: 16)
	"
	^ self color hexStringRGB! !

!ColorEditorModel methodsFor: 'printing' stamp: 'jmv 2/13/2014 13:45'!
rgbValue
	"Answer my RGB as an integer"

	^ ( '16r',  self color hexStringRGB) asNumber! !

!ColorEditorModel class methodsFor: 'instance creation' stamp: 'KenD 11/23/2013 15:55'!
color: aColor

	^ self new setColor: aColor! !

!Color class methodsFor: '*color-edit-panel' stamp: 'hlsf 12/29/2021 11:10:21'!
colorSelectionMenu
	"Open a popUp menu and let user select color selection option"
"
	Color colorSelectionMenu.
"
	| menu choices choicesSetter selectedIndex |
	choices := #( 'CSS3 (Web) Colors'      "1"
					'Crayon Colors'   "2"
					'NBSISCC Colors' "3"
					'XKCD Colors'     "4"
					'ColorMix Editor'           "5"
					'Cancel'                        "6"
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
		ifTrue: [ ColorEditorPanel open].
	((selectedIndex > 0) and: [selectedIndex < 5])
		ifTrue: [ | pickerPanel savedExtent |
			ColorPalette perform: ( choicesSetter at: selectedIndex ).
			pickerPanel := ImagePickerPanel namedColors. 
			savedExtent := pickerPanel morphExtentInOwner. 
			pickerPanel openInWorld. "#openInWorld resets morphExtent!!"
			pickerPanel morphExtent: savedExtent. 
		].
	"else cancel -> no action"

	! !

!Color class methodsFor: '*color-edit-panel' stamp: 'KenD 1/10/2022 13:21:32'!
colorSelectionMenu: originalColor
	"Open a popUp menu and let user select color selection option.
	 If the user selects ColorMix Editor, set the color from originalColor"
"
	Color colorSelectionMenu.
"
	| menu choices choicesSetter selectedIndex |
	choices := #( 'CSS3 (Web) Colors'      "1"
					'Crayon Colors'   "2"
					'NBSISCC Colors' "3"
					'XKCD Colors'     "4"
					'ColorMix Editor'           "5"
					'Cancel'                        "6"
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
		ifTrue: [ ColorEditorPanel openWithColor: originalColor].
	((selectedIndex > 0) and: [selectedIndex < 5])
		ifTrue: [ | pickerPanel savedExtent |
			ColorPalette perform: ( choicesSetter at: selectedIndex ).
			pickerPanel := ImagePickerPanel namedColors. 
			savedExtent := pickerPanel morphExtentInOwner. 
			pickerPanel openInWorld. "#openInWorld resets morphExtent!!"
			pickerPanel morphExtent: savedExtent. 
		].
	"else cancel -> no action"

	! !
ColorPaneMorph initialize!
