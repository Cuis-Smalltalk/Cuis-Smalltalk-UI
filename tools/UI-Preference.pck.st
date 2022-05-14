'From Cuis 6.0 [latest update: #5163] on 14 May 2022 at 11:18:14 am'!
'Description '!
!provides: 'UI-Preference' 1 8!
!requires: 'UI-Click-Select' 1 31 nil!
SystemOrganization addCategory: 'UI-Preference'!


!classDefinition: #PreferenceBrowser category: 'UI-Preference'!
DialogPanel subclass: #PreferenceBrowser
	instanceVariableNames: 'categoriesListMorph preferencesGroup categories category pane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Preference'!
!classDefinition: 'PreferenceBrowser class' category: 'UI-Preference'!
PreferenceBrowser class
	instanceVariableNames: ''!

!classDefinition: #PreferenceVisitor category: 'UI-Preference'!
Object subclass: #PreferenceVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Preference'!
!classDefinition: 'PreferenceVisitor class' category: 'UI-Preference'!
PreferenceVisitor class
	instanceVariableNames: ''!

!classDefinition: #PreferenceBrowserVisitor category: 'UI-Preference'!
PreferenceVisitor subclass: #PreferenceBrowserVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Preference'!
!classDefinition: 'PreferenceBrowserVisitor class' category: 'UI-Preference'!
PreferenceBrowserVisitor class
	instanceVariableNames: ''!


!PreferenceBrowser commentStamp: 'hlsf 5/14/2022 10:24:23' prior: 0!
I browse a selected set of preference categories. The user can edit the preferences
	- model : an array of preference categories (symbols) to browse. 
	If nil, I browse all the preferences in the system!

!PreferenceBrowser methodsFor: 'GUI building' stamp: 'hlsf 4/26/2022 00:17:32'!
buildMorphicWindow
	super buildMorphicWindow.
	titleMorph showButtonsNamed: #(close expand).! !

!PreferenceBrowser methodsFor: 'GUI building' stamp: 'hlsf 4/25/2022 17:55:24'!
newButtonArea
	^ nil! !

!PreferenceBrowser methodsFor: 'GUI building' stamp: 'hlsf 4/26/2022 00:23:53'!
newPane
	^ pane  _ LayoutMorph newRow ::
		addMorph: categoriesListMorph proportionalWidth: 0.3;
		addAdjusterMorph;
		addMorph: preferencesGroup ;
		yourself! !

!PreferenceBrowser methodsFor: 'initialization' stamp: 'hlsf 5/14/2022 10:25:12'!
initialize
	super initialize.
	categoriesListMorph _ PluggableListMorph 
		model: self listGetter: #categoryNames indexGetter: #categoryIndex indexSetter: #categoryIndex: ::
		autoDeselect: false ;
		yourself.
	preferencesGroup _  PluggableScrollPane new ::
		color: self color;
		layoutSpec: LayoutSpec useAll! !

!PreferenceBrowser methodsFor: 'initialization' stamp: 'hlsf 5/14/2022 10:21:47'!
model: selectedCategories
	selectedCategories 
		ifNil:  [model _ PreferenceNG categories sorted]
		ifNotNil: [	model _ selectedCategories sorted]! !

!PreferenceBrowser methodsFor: 'accessing' stamp: 'hlsf 5/14/2022 10:20:09'!
categoryIndex
	^ model indexOf: category! !

!PreferenceBrowser methodsFor: 'accessing' stamp: 'hlsf 5/14/2022 10:20:17'!
categoryIndex: anIndex
	| preferences preferenceButtons |
	category _ model at: anIndex.
	preferences _ PreferenceNG select: category.
	preferenceButtons _ CheckGroup fromList: (preferences collect: [:each | each name capitalized]).
	preferenceButtons buttons withIndexDo: [:button :index | | preference |
		preference _ preferences at: index.
		button setBalloonText: preference description .
		button isSelected: ((preference type == Boolean) ifTrue: [preference value] ifFalse: [false]).
		button when: #checkSelection send: #togglePreferenceValue to: preference 	].
	preferencesGroup 	scroller: preferenceButtons.
	self redrawNeeded 
	 ! !

!PreferenceBrowser methodsFor: 'accessing' stamp: 'hlsf 5/14/2022 10:19:17'!
categoryNames
	^ model collect: [:aSymbol | aSymbol asString capitalized ]! !

!PreferenceBrowser methodsFor: 'menus' stamp: 'hlsf 4/26/2022 00:34:44'!
expand
	super expand.
	self fullScreen ! !

!PreferenceBrowser methodsFor: 'geometry' stamp: 'hlsf 4/26/2022 00:20:17'!
minimumExtent
	^ 800@600! !

!PreferenceVisitor methodsFor: 'as yet unclassified' stamp: 'hlsf 5/14/2022 10:52:37'!
visitBoolean: aPref
	self subclassResponsibility ! !

!PreferenceBrowserVisitor methodsFor: 'as yet unclassified' stamp: 'hlsf 5/14/2022 11:00:00'!
visitBoolean: aPref! !
