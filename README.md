# Cuis-Smalltalk-UI
Morphic UI widgets and components for general use

These packages are intended to replace 
Morphic-Misc1 and Morphic-Widgets-Extras 
with a more useful set of 
widgets and widget components 
for Morphic authoring.

Depricated/superceded packages also include
Morphic-ColorEditor and Morph-MetaProperties.


These packages are written for Cuis 6.0.

Morphs considered as components are in packages in the 'lib' directory

```smalltalk
Feature require: 'UI-Components'.
```

Morphs considered tools (LayoutEditor, ColorEditor, MetaProperties, ..) are in packages in the 'tools' directory

```smalltalk
Feature require: 'UI-Tools'.
```

## UI-Components Packages

UI-Base-Morphs
- WindowTitleMorph
- SqueezeLabelMorph
- EllipseMorph
- FrameMorph
- LineMorph
- PointerLineMorph

UI-Click-Select
- MultiMenuSelectMenu
- PluggableCheckboxMorph
- CheckGroup
- RadioGroup
- CheckButtonMorph
- RadioButtonMorph
- PluggableListOfMorph
- DropDownButtonMorph

UI-DragAndDrop
- SignMorph
- DropColorMorph
- ClickColorMorph
- FontMorph

UI-Entry
- OneLineEditorMorph
- SimpleEditor
- SimpleNumberEntryMorph

UI-Panel
- Panel
- DialogPanel
- EditPanel
- ValueEntryPanel
- CharacterEntryPanel
- PointEntryPanel
- PositiveIntegerEntryPanel
- PositiveFloatEntryPanel
- StringEntryPanel
- PluggableScrollBar

UI-Widgets
- WheelMorph
- ChevronMorph
- DropDownChevronMorph
- CircularToolbarMorph
- CircularSubToolbarMorph
- WaitSpinner
- WizardPanel

UI-Palette
- ImagePickerPanel
- PickAColorPalette
- PickAnIconPalette
- PickALargerIconPalette
- PaletteLayoutMorph
- InnerPluggableImagePalette
- PluggableImagePalette

UI-Shapes
- BezierQuadraticMorph
- BezierCubicMorph

## UI-Tools Packages

Color-Edit-Panel
- ColorEditorPanel
- ColorPalette
- ColorPaneMorph
- ColorEditorModel
- ColorSliderMorph

Layout-Edit-Panels
- LayoutMorphEditPanel
- LayoutSpecEditPanel

Morphic-MetaProperties
- VisualPropertyEditor
- VisualPropertyMenuItem
- OrdinaryPropertyMenuItem
- MetaProperty
- MetaPropertyFrom
- MetaPropertyOneOf
- MetaPropertyMultiSelect
- MetaPropertyRange
- MetaPropertyTransducer
- MetaPropertyViaTest

UI-Edit-Lens
- MorphEditLens

## Morph Visual Properties

Visual Proprtties of a Morph are in most cases simple values.

This allows to create a simple way to more fluidly view and gain access.

Visual Properties can be annotated with MetaProperties so that
their construction menu allows easy access.

The MetaProperties package is loaded with other 'UI-Tools'.

```smalltalk
Feature require: 'UI-Tools'.
```
Once you have done this, you cag open the World Menu and get a New Morph.

If you then command-click on this Morph, you see the construction handles.

Clicking on the blue Menu button, you will get the Morph's menu.
Click the push-pin on the upper right to keep this menu around.

Here is a view with a LabelMorph, an EllipseMorph, their associated menus,
as well as Color Palette and a Color Editor Panel.

![Visual Morph Properties](MorphVisualProps.jpeg)

The _purple_ menu items are Visual Properties.

Clicking on such a VisualPropertyMenuItem gives
either an editor or a choice of selection palettes.

You can also _drag_ values to or from a VisualPropertyMenuItem
to transfer values.

You can drag a Color to or from from the Color Editor or from a Color Palette
and drop onto any area which takes a Color.
