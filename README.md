# Cuis-Smalltalk-UI
Morphic UI widgets and components for general use

These packages are intended to replace 
Morphic-Misc1 and Morphic-Widgets-Extras 
with a more useful set of 
widgets and widget components 
for Morphic authoring.

Deprecated/superceded packages also include
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
### UI-Click-Select
- MultiMenuSelectMenu
- PluggableCheckboxMorph
- CheckGroup
- RadioGroup
- CheckButtonMorph
- RadioButtonMorph
- PluggableListOfMorph
- DropDownButtonMorph

### UI-Core
Model and helper classes.
- ListModel
- ListMultiModel
- ValueHolder
- WindowTitleMorph
- SqueezeLabelMorph

### UI-DragAndDrop
- SignMorph
- DropColorMorph
- ClickColorMorph
- FontMorph

### UI-Entry
- OneLineEditorMorph
- SimpleEditor
- SimpleNumberEntryMorph

### UI-Panel
- Panel
- DialogPanel
- EditPanel
- PluggablePanel
- ValueEntryPanel
- FloatEntryPanel
- RangeFloatEntryPanel
- CharacterEntryPanel
- PointEntryPanel
- PositiveIntegerEntryPanel
- PositiveFloatEntryPanel
- StringEntryPanel
- PluggableScrollBar
- WizardPanel

### UI-Widgets
- ChevronMorph
- DropDownChevronMorph
- CircularToolbarMorph
- CircularSubToolbarMorph
- LabelGroup
- WaitSpinner
- WheelMorph

## UI-Tools Packages
### UI-Color-Panel
- ColorEditorPanel
- ColorPalette
- ColorPaneMorph
- ColorEditorModel
- ColorSliderMorph

### UI-Edit-Lens
- MorphEditLens

### UI-Layout-Panel
- LayoutMorphEditPanel
- LayoutSpecEditPanel

### UI-MetaProperties
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

### UI-Mold, UI-Mold-Test
A helper tool to describe dialog panel for user input and validation.

### UI-Packager
Save combined Morph into a package which requires its dependent code.

### UI-Palette
- ImagePickerPanel
- PickAColorPalette
- PickAnIconPalette
- PickALargerIconPalette
- PaletteLayoutMorph
- InnerPluggableImagePalette
- PluggableImagePalette

### UI-Preference
A dialog panel to edit system or application preferences

### UI-Shapes
- EllipseMorph
- FrameMorph
- LineMorph
- PointerLineMorph
- BezierQuadraticMorph
- BezierCubicMorph

## Morph Visual Properties

Visual Properties of a Morph are in most cases simple values.

As a result, flexible viewing and accessing approaches for these values can be created easily.

Visual Properties can be annotated with MetaProperties so that
their construction menu allows easy access.

The MetaProperties package is loaded with other 'UI-Tools'.

```smalltalk
Feature require: 'UI-Tools'.
```
Once you have done this, you can open the World Menu and get a New Morph.

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

You can drag a Color to or from the Color Editor or from a Color Palette
and drop onto any area which takes a Color.

The basic mechanics of this are described in files
'https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-UI/blob/main/VisualMetaPropGist.md'
and
'https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/blob/master/Documentation/DragAndDrop.md' 

Also included is the package 'Morphic-Packager'.
Note the "save me as a Package" menu item.
This lets you save a composite Morph (one with submorphs) as a Package
which in turn requires the packages containing the code implementing
the composite Morph.

One can then go to a base image and "Feature require:" the created Package
whose initializer restores the saved composite Morph.

