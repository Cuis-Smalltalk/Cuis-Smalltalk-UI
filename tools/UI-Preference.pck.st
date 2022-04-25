'From Cuis 6.0 [latest update: #5113] on 26 April 2022 at 12:53:27 am'!
'Description '!
!provides: 'UI-Preference' 1 5!
!requires: 'UI-Click-Select' 1 32 nil!
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

!PreferenceBrowser methodsFor: 'initialization' stamp: 'hlsf 4/26/2022 00:32:23'!
initialize
	super initialize.
	categories _ Preferences categories asOrderedCollection.
	categoriesListMorph _ PluggableListMorph 
		model: self listGetter: #categories indexGetter: #categoryIndex indexSetter: #categoryIndex: ::
		autoDeselect: false ;
		yourself.
	preferencesGroup _  PluggableScrollPane new ::
		color: self color;
		layoutSpec: LayoutSpec useAll! !

!PreferenceBrowser methodsFor: 'accessing' stamp: 'hlsf 4/25/2022 23:29:42'!
categories
	^ categories collect: [:aSymbol | aSymbol asString capitalized ]! !

!PreferenceBrowser methodsFor: 'accessing' stamp: 'hlsf 4/25/2022 23:22:31'!
categoryIndex
	^ categories indexOf: category! !

!PreferenceBrowser methodsFor: 'accessing' stamp: 'hlsf 4/26/2022 00:41:07'!
categoryIndex: anIndex
	| preferences preferenceButtons |
	category _ categories at: anIndex.
	preferences _ Preferences select: category.
	preferenceButtons _ CheckGroup fromList: (preferences collect: [:each | each name capitalized]).
	preferenceButtons buttons withIndexDo: [:button :index | | preference |
		preference _ preferences at: index.
		button setBalloonText: preference help.
		button isSelected: ((preference preferenceValue is: #Boolean) ifTrue: [preference preferenceValue] ifFalse: [false]).
		button when: #checkSelection send: #togglePreferenceValue to: preference 	].
	preferencesGroup 	scroller: preferenceButtons.
	self redrawNeeded 
	 ! !

!PreferenceBrowser methodsFor: 'menus' stamp: 'hlsf 4/26/2022 00:34:44'!
expand
	super expand.
	self fullScreen ! !

!PreferenceBrowser methodsFor: 'geometry' stamp: 'hlsf 4/26/2022 00:20:17'!
minimumExtent
	^ 800@600! !

!Preference methodsFor: '*UI-Preference' stamp: 'hlsf 4/25/2022 22:55:59'!
categories
	^ categoryList ! !

!Preference methodsFor: '*UI-Preference' stamp: 'hlsf 4/25/2022 23:49:56'!
help
	^ helpString ! !

!Preferences class methodsFor: '*UI-Preference' stamp: 'hlsf 4/25/2022 22:59:00'!
categories
	| categories |
	categories _ Set new.
	self preferencesDictionary values do: [:aPreference | categories addAll: aPreference categories].
	^ categories sorted! !

!Preferences class methodsFor: '*UI-Preference' stamp: 'hlsf 4/25/2022 23:40:32'!
select: aCategory
" I select each preference in the given category "
	^ self preferencesDictionary values select: [:aPreference | aPreference categories includes: aCategory ]! !
