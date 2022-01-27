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
- RadioGroup
- CheckButtonMorph
- RadioButtonMorph

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

