# Visual Morph Properties are described by MetaProperties

MetaProperties are immutable, shared, and fairly lightweight objects.

The MetaProperty class keeps a dictionary of typical MetaProperties by name.

For example, **acceptsPoint**.
````Smalltalk 
In MetaProperty class >> initializeDictionaries
...
  props at: #acceptsPoint 
        put: (MetaProperty 
                kind: Point
                editProc: [ :morph :metaProp :menuItem | 
                        PointEntryPanel 
                                open: menuItem 
                                label: (menuItem name asString) ::
                                morphPosition: morph morphPositionInWorld 
                                               + morph morphExtentInOwner;
				fitInWorld
		]).
````

MetaProperties are inherited.
For example, BoxedMorph inherits from PlacedMorph.
````Smalltalk
VisualPropertyEditor class >> initialize
...
  classDict := MetaProperty metaPropsDictForClass: PlacedMorph.
  classDict at: #layoutSpec   put: (propsDict at: #acceptsLayoutSpec). 

  classDict := MetaProperty metaPropsDictForClass: BoxedMorph.
  classDict at: #morphExtent   put: (propsDict at: #acceptsPositivePoint). 
  classDict at: #morphPosition put: (propsDict at: #acceptsPoint). 
  classDict at: #color put: (propsDict at: #acceptsColor). 
  classDict at: #borderColor put: (propsDict at: #acceptsColor). 
  classDict at: #borderWidth put: (propsDict at: #acceptsPositiveInteger).
````

To get the complete selt of MetaProperties for a Morph, one
gathers based on the class and its superclasses.
````Smalltalk
MetaProperty class >> metaPropsForMorph: aMorph
 "Answer a combined Dictionary of name->metaProp
  by collecting all inherited MetaProps"
        
  | metaPropDict |
        
  metaPropDict := self metaPropsDictForClass: aMorph class.
  aMorph class allSuperclassesDo: [ :sc | | dict |
         dict := self metaPropsDictForClass: sc.
         "supers w same name are ignored, else added"
          dict keysAndValuesDo: [ :k :v |
	        metaPropDict at: k ifAbsentPut: [ v ] ] 
          ].
                
        ^ metaPropDict
````

Morph ````VisualPropertyMenuItem````s then know how
to get, set, display, and edit their associated
visual property values.
````Smalltalk
VisualPropertyMenuItem >> 
  propName: aSymbol 
  morph: aMorph 
  propMeta: aPropertyDescriptor 
  accessProc: getterClosure 
  updateProc: setterClosure

        super initialize.
        name := aSymbol.
        targetMorph := aMorph.
        metaProperty := aPropertyDescriptor.
        prevValue := getterClosure value.       
        accessProc := getterClosure.
        updateProc := setterClosure.
        self
          contents: (self displayStringForWidth:
	  	    	  (self owner
                          	ifNil: [60] 
                                ifNotNil: [(self owner morphWidth) - 30])
		    );
          setIcon: prevValue icon;
          target: self selector: #edit arguments: nil;
          "Show menuItems are special by text color"
          color: ((Color r: 0.6 g: 0.07 b: 0.6) adjustBrightness:  -0.2)
````

That's it!  That is the gist of how a Morph's visual properties are handled.
