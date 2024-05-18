'From Cuis7.1 [latest update: #6378] on 18 May 2024 at 4:37:15 pm'!
'Description '!
!provides: 'UI-Preference' 1 26!
!requires: 'UI-Click-Select' 1 31 nil!
!requires: 'UI-Panel' 1 51 nil!
!requires: 'UI-Widgets' 1 22 nil!
SystemOrganization addCategory: #'UI-Preference'!


!classDefinition: #PreferenceBrowser category: #'UI-Preference'!
DialogPanel subclass: #PreferenceBrowser
	instanceVariableNames: 'categoriesListMorph preferencesGroup visitor categories category pane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Preference'!
!classDefinition: 'PreferenceBrowser class' category: #'UI-Preference'!
PreferenceBrowser class
	instanceVariableNames: ''!

!classDefinition: #PreferenceBrowserVisitor category: #'UI-Preference'!
Object subclass: #PreferenceBrowserVisitor
	instanceVariableNames: 'views'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Preference'!
!classDefinition: 'PreferenceBrowserVisitor class' category: #'UI-Preference'!
PreferenceBrowserVisitor class
	instanceVariableNames: ''!

!classDefinition: #PreferenceModel category: #'UI-Preference'!
Object subclass: #PreferenceModel
	instanceVariableNames: 'preference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Preference'!
!classDefinition: 'PreferenceModel class' category: #'UI-Preference'!
PreferenceModel class
	instanceVariableNames: ''!

!classDefinition: #PreferenceModelClosure category: #'UI-Preference'!
PreferenceModel subclass: #PreferenceModelClosure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Preference'!
!classDefinition: 'PreferenceModelClosure class' category: #'UI-Preference'!
PreferenceModelClosure class
	instanceVariableNames: ''!

!classDefinition: #PreferenceType category: #'UI-Preference'!
Object subclass: #PreferenceType
	instanceVariableNames: 'preferenceName preferenceSet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Preference'!
!classDefinition: 'PreferenceType class' category: #'UI-Preference'!
PreferenceType class
	instanceVariableNames: ''!


!PreferenceBrowser commentStamp: 'hlsf 7/3/2022 22:24:23' prior: 0!
I browse a PreferenceSet instance. The user can edit the preferences
	- model : an instance of a PreferenceSet  to browse. 
	If nil, I browse all the preferences in the system!

!PreferenceBrowserVisitor commentStamp: '<historical>' prior: 0!
I visit a preference to provide its morphic view
- views: dictionary of labels and activable morph to edit the preference!

!PreferenceModel commentStamp: '<historical>' prior: 0!
An abstract PreferenceType. My sublcass are used to describe the type of a preference.!

!PreferenceType commentStamp: '<historical>' prior: 0!
I am an abstract preference type. My subclasses describe the behavior of a preference using me as a type. 
I am used with the PreferenceBrowser and visitors to present a preference in a meaningfull way the user can manipulate.
See uses in DrGeo preferences browser.!

!PreferenceBrowser methodsFor: 'GUI building' stamp: 'hlsf 4/26/2022 00:17:32'!
buildMorphicWindow
	super buildMorphicWindow.
	titleMorph showButtonsNamed: #(close expand).! !

!PreferenceBrowser methodsFor: 'GUI building' stamp: 'hlsf 4/25/2022 17:55:24'!
newButtonArea
	^ nil! !

!PreferenceBrowser methodsFor: 'GUI building' stamp: 'hlsf 5/26/2022 15:11:41'!
newPane
	^ pane  _ LayoutMorph newRow ::
		addMorph: categoriesListMorph proportionalWidth: 0.3;
		addAdjusterMorph;
		addMorphUseAll: preferencesGroup ;
		yourself! !

!PreferenceBrowser methodsFor: 'initialization' stamp: 'jmv 5/17/2024 18:08:40'!
initialize
	super initialize.
	categoriesListMorph := PluggableListMorph 
		withModel: self listGetter: #categoryNames indexGetter: #categoryIndex indexSetter: #categoryIndex: ::
		autoDeselect: false ;
		yourself.
	preferencesGroup :=  PluggableScrollPane new ::
		color: self color;
		layoutSpec: LayoutSpec useAll! !

!PreferenceBrowser methodsFor: 'initialization' stamp: 'hlsf 7/3/2022 22:27:16'!
model: aPreferenceSet
	model _ aPreferenceSet ifNil: [Preferences] ifNotNil: [aPreferenceSet].
	categories _ model categories sorted! !

!PreferenceBrowser methodsFor: 'accessing' stamp: 'hlsf 7/3/2022 22:27:43'!
categoryIndex
	^ categories indexOf: category! !

!PreferenceBrowser methodsFor: 'accessing' stamp: 'hlsf 7/3/2022 22:28:00'!
categoryIndex: anIndex
	| group |
	category _ categories at: anIndex.
	visitor _ PreferenceBrowserVisitor new.
	(model selectCategory: category) do: [:preference | preference accept: visitor].	
	visitor views do: [:view | view adoptWidgetsColor: widgetsColor ].
	group _ LabelGroup with: visitor sortedViews.
	preferencesGroup 	scroller: group.
	self redrawNeeded.
	group morphWidth: preferencesGroup viewableWidth - 20. "No reliable :-("
	 ! !

!PreferenceBrowser methodsFor: 'accessing' stamp: 'hlsf 7/3/2022 22:28:07'!
categoryNames
	^ categories collect: [:aSymbol | aSymbol asString capitalized ]! !

!PreferenceBrowser methodsFor: 'menus' stamp: 'hlsf 4/26/2022 00:34:44'!
expand
	super expand.
	self fullScreen ! !

!PreferenceBrowser methodsFor: 'geometry' stamp: 'hlsf 5/18/2022 16:36:34'!
minimumExtent
	^ 900@600! !

!PreferenceBrowserVisitor methodsFor: 'visitors type' stamp: 'hlsf 7/6/2022 10:52:51'!
visitAbstractFontPreference: aPref
	
	views at: aPref nameDetailed put: (LabelMorph contents: aPref value asString)! !

!PreferenceBrowserVisitor methodsFor: 'visitors type' stamp: 'hlsf 7/6/2022 10:52:47'!
visitArrayClassPreference: aPref
"My type is an Array Class, I have no selection"
	
	views at: aPref nameDetailed put: (
		TextParagraphMorph contents: aPref value asString, Character cr asString ::
			borderWidth: 0;
			color: Color transparent)! !

!PreferenceBrowserVisitor methodsFor: 'visitors type' stamp: 'jmv 5/17/2024 18:09:07'!
visitArrayPreference: aPref
	| list listMorph |
	aPref isTypeAClass ifTrue: [^ self visitArrayClassPreference: aPref].
	listMorph  := DropDownListMorph 
		withModel: (list := ListModel with: aPref type) 
		listGetter: #list 
		indexGetter: #listIndex 
		indexSetter: #listIndex: ::
		autoDeselect: false;
		setBalloonText: aPref description.
	list listIndex: (aPref type indexOf: aPref value).
	list when: #listSelectionChanged send: #changedList:for: to: self withArguments: {list. aPref}.
	views at: aPref nameDetailed put: listMorph! !

!PreferenceBrowserVisitor methodsFor: 'visitors type' stamp: 'hlsf 7/6/2022 10:53:10'!
visitBlockClosurePreference: aPref
	| codeView typeModel |
	typeModel _ PreferenceModelClosure with: aPref.
	codeView _ TextModelMorph textProvider: typeModel textGetter: #sourceCode textSetter: #sourceCode:.
	codeView setBalloonText: aPref description.
	views at: aPref nameDetailed put: codeView
	! !

!PreferenceBrowserVisitor methodsFor: 'visitors type' stamp: 'hlsf 7/6/2022 10:53:16'!
visitBooleanPreference: aPref
	| check |
	check _ CheckButtonMorph new ::
		selected: aPref value;
		setBalloonText: aPref description;
		yourself.
	check when: #checkSelection send: #changedCheck:for:  to: self withArguments: {check. aPref} .
	views at: aPref nameDetailed put: check! !

!PreferenceBrowserVisitor methodsFor: 'visitors type' stamp: 'hlsf 9/25/2022 10:07:30'!
visitCharacterSequencePreference: aPreference 
	self visitStringPreference: aPreference! !

!PreferenceBrowserVisitor methodsFor: 'visitors type' stamp: 'hlsf 9/25/2022 09:45:43'!
visitMetaclassPreference: aPref
"Present a text entry to edit the class name"
	| entry |
	entry _ TextEntryMorph contents: aPref value asString ::
		setBalloonText: aPref description;
		yourself.
	entry crAction: [aPref value: (Smalltalk at: entry value asSymbol)].
	views at: aPref nameDetailed put: entry.
! !

!PreferenceBrowserVisitor methodsFor: 'visitors type' stamp: 'hlsf 7/6/2022 10:53:22'!
visitSmallIntegerPreference: aPref
	| entry |
	entry _ SimpleNumberEntryMorph 
		integerDefault: aPref value maxNumChars: SmallInteger maxVal asString size ::
		valueUpdator: [:newValue | aPref value: newValue];
		setBalloonText: aPref description.
	views at: aPref nameDetailed put: entry.
! !

!PreferenceBrowserVisitor methodsFor: 'visitors type' stamp: 'hlsf 7/6/2022 10:53:27'!
visitStringPreference: aPref
	| entry |
	entry _ TextEntryMorph contents: aPref value ::
		setBalloonText: aPref description;
		yourself.
	entry crAction: [aPref value: entry value].
	views at: aPref nameDetailed put: entry.
! !

!PreferenceBrowserVisitor methodsFor: 'events-handling' stamp: 'hlsf 5/15/2022 12:24:13'!
changedCheck: checkButton for: aPref
	aPref value: checkButton isSelected! !

!PreferenceBrowserVisitor methodsFor: 'events-handling' stamp: 'hlsf 5/15/2022 12:24:37'!
changedList: listModel for: aPref
	aPref value: listModel selectedItem ! !

!PreferenceBrowserVisitor methodsFor: 'accessing' stamp: 'hlsf 6/5/2022 13:09:59'!
sortedViews
"Sorted view according to their label"
	^ views associations sort: [:a :b | a key contents < b key contents]
		
		! !

!PreferenceBrowserVisitor methodsFor: 'accessing' stamp: 'hlsf 5/15/2022 12:04:54'!
views
	^ views! !

!PreferenceBrowserVisitor methodsFor: 'initialization' stamp: 'hlsf 5/15/2022 12:08:03'!
initialize
	super initialize.
	views _ Dictionary new.! !

!PreferenceModel methodsFor: 'accessing' stamp: 'hlsf 5/15/2022 10:51:34'!
preference: aPref
	preference _ aPref ! !

!PreferenceModel class methodsFor: 'instance creation' stamp: 'hlsf 5/15/2022 10:51:41'!
with: aPref
	^ self new ::
		preference: aPref;
		yourself! !

!PreferenceModelClosure methodsFor: 'accessing' stamp: 'hlsf 5/15/2022 10:58:17'!
sourceCode
" decompile the closure and answer it as string "
	^ (preference instVarNamed: #value) decompile decompileString! !

!PreferenceModelClosure methodsFor: 'accessing' stamp: 'hlsf 5/15/2022 10:59:58'!
sourceCode: aString
	"Compile and adjust the value of the preference"! !

!PreferenceType methodsFor: 'accessing' stamp: 'hlsf 6/3/2022 22:00:55'!
preference: aSymbol
	preferenceName _ aSymbol ! !

!PreferenceType methodsFor: 'accessing' stamp: 'hlsf 7/3/2022 22:37:16'!
preferenceSet: aPreferenceSet
	preferenceSet _ aPreferenceSet ! !

!PreferenceType methodsFor: 'accessing' stamp: 'hlsf 7/3/2022 22:37:28'!
value
	^ preferenceSet at: preferenceName ! !

!PreferenceType methodsFor: 'accessing' stamp: 'hlsf 7/3/2022 22:37:35'!
value: newValue
	preferenceSet at: preferenceName put: newValue ! !

!PreferenceType class methodsFor: 'instance creation' stamp: 'hlsf 7/3/2022 22:40:20'!
with: aPreferenceName in: aPreferenceSet
	^ self new ::
	preference: aPreferenceName ;
	preferenceSet: aPreferenceSet ;
	yourself! !
