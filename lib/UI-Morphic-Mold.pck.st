'From Cuis 6.0 [latest update: #5769] on 20 April 2023 at 8:53:35 pm'!
'Description '!
!provides: 'UI-Morphic-Mold' 1 21!
!requires: 'UI-Entry' 1 37 nil!
SystemOrganization addCategory: 'UI-Morphic-Mold'!


!classDefinition: #DateFieldTest category: 'UI-Morphic-Mold'!
TestCase subclass: #DateFieldTest
	instanceVariableNames: 'field'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'DateFieldTest class' category: 'UI-Morphic-Mold'!
DateFieldTest class
	instanceVariableNames: ''!

!classDefinition: #FieldTest category: 'UI-Morphic-Mold'!
TestCase subclass: #FieldTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'FieldTest class' category: 'UI-Morphic-Mold'!
FieldTest class
	instanceVariableNames: ''!

!classDefinition: #FloatFieldTest category: 'UI-Morphic-Mold'!
TestCase subclass: #FloatFieldTest
	instanceVariableNames: 'field'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'FloatFieldTest class' category: 'UI-Morphic-Mold'!
FloatFieldTest class
	instanceVariableNames: ''!

!classDefinition: #IntegerFieldTest category: 'UI-Morphic-Mold'!
TestCase subclass: #IntegerFieldTest
	instanceVariableNames: 'field'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'IntegerFieldTest class' category: 'UI-Morphic-Mold'!
IntegerFieldTest class
	instanceVariableNames: ''!

!classDefinition: #PercentageFieldTest category: 'UI-Morphic-Mold'!
TestCase subclass: #PercentageFieldTest
	instanceVariableNames: 'field'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'PercentageFieldTest class' category: 'UI-Morphic-Mold'!
PercentageFieldTest class
	instanceVariableNames: ''!

!classDefinition: #Field category: 'UI-Morphic-Mold'!
Object subclass: #Field
	instanceVariableNames: 'isRequired conditions errors label value callback modifyBlock input widget'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'Field class' category: 'UI-Morphic-Mold'!
Field class
	instanceVariableNames: ''!

!classDefinition: #CheckboxField category: 'UI-Morphic-Mold'!
Field subclass: #CheckboxField
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'CheckboxField class' category: 'UI-Morphic-Mold'!
CheckboxField class
	instanceVariableNames: ''!

!classDefinition: #DateField category: 'UI-Morphic-Mold'!
Field subclass: #DateField
	instanceVariableNames: 'format'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'DateField class' category: 'UI-Morphic-Mold'!
DateField class
	instanceVariableNames: ''!

!classDefinition: #FloatField category: 'UI-Morphic-Mold'!
Field subclass: #FloatField
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'FloatField class' category: 'UI-Morphic-Mold'!
FloatField class
	instanceVariableNames: ''!

!classDefinition: #PercentageField category: 'UI-Morphic-Mold'!
FloatField subclass: #PercentageField
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'PercentageField class' category: 'UI-Morphic-Mold'!
PercentageField class
	instanceVariableNames: ''!

!classDefinition: #IntegerField category: 'UI-Morphic-Mold'!
Field subclass: #IntegerField
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'IntegerField class' category: 'UI-Morphic-Mold'!
IntegerField class
	instanceVariableNames: ''!

!classDefinition: #PasswordField category: 'UI-Morphic-Mold'!
Field subclass: #PasswordField
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'PasswordField class' category: 'UI-Morphic-Mold'!
PasswordField class
	instanceVariableNames: ''!

!classDefinition: #SelectField category: 'UI-Morphic-Mold'!
Field subclass: #SelectField
	instanceVariableNames: 'listModel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'SelectField class' category: 'UI-Morphic-Mold'!
SelectField class
	instanceVariableNames: ''!

!classDefinition: #TextField category: 'UI-Morphic-Mold'!
Field subclass: #TextField
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'TextField class' category: 'UI-Morphic-Mold'!
TextField class
	instanceVariableNames: ''!

!classDefinition: #TimeField category: 'UI-Morphic-Mold'!
Field subclass: #TimeField
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'TimeField class' category: 'UI-Morphic-Mold'!
TimeField class
	instanceVariableNames: ''!

!classDefinition: #Mold category: 'UI-Morphic-Mold'!
Object subclass: #Mold
	instanceVariableNames: 'fields'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'Mold class' category: 'UI-Morphic-Mold'!
Mold class
	instanceVariableNames: ''!

!classDefinition: #MoldExample category: 'UI-Morphic-Mold'!
ProtoObject subclass: #MoldExample
	instanceVariableNames: 'mold format'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Morphic-Mold'!
!classDefinition: 'MoldExample class' category: 'UI-Morphic-Mold'!
MoldExample class
	instanceVariableNames: ''!


!Field commentStamp: '<historical>' prior: 0!
A field is a basic unit of Form I/O. It render a composite widget with the input morph, the example morph, and the errors morphs. It validates input from the user, and generates a bona-fide object of the appropriate type.

A default requirement condition always exist. Set to false by default, it can be toggled at run time.

Widget is packed as follow:

+------------------------+
| LayoutMorph Column                                |
|+------------------------+
| LayoutMorph row                                      |  
| +---------+     +---------+  |
| | Input Morph      |      | ExampleMorph |   |
| +---------+     +---------+  |
+------------------------+
| Error1 Morph                                            |
| Error2 Morph                                            |
| ../..                                                            |
+------------------------+
!

!SelectField commentStamp: 'hlsf 4/20/2023 15:32:44' prior: 0!
With selection from a list, there is no risk of misformed input. 
input and value attributes both represent the index of the selected item in the list, there are redundant.!

!Mold commentStamp: '<historical>' prior: 0!
This class is little more than a composite of Fields, where Fields do most of the work. 
To use a Mold, you typically create and store it in an instance variable of your Morph component. 

 | mold |
	mold := Mold new.
	(mold stringField)
		label: 'My label';
		on: #propertyValue of: ValueHolder new;
		example: 'This is an example';
		customize: [:widget :input :example | 
			widget color: Color black.
			input color: Color blue; backgroundColor: Color cyan.
			example color: Color white];
		addCondition: [:input| input size >= 4] 
		labeled: [:input | 'You  only key in ', input size asString, ' character(s), a minimum of 4 is required.'];
		beRequired.
	mold renderForms openInWorld.
	mold fields first inspect

!

!DateFieldTest methodsFor: 'running' stamp: 'KenTreis 8/9/2010 18:50'!
setUp
	field := DateField new! !

!DateFieldTest methodsFor: 'tests' stamp: 'hlsf 4/18/2023 17:25:41'!
testDefaultFormat
	self assert: field formatString = 'DD/MM/YYYY'! !

!DateFieldTest methodsFor: 'tests' stamp: 'KenTreis 8/25/2010 10:05'!
testDisinfectISO
	field formatString: 'YYYY-MM-DD'.
	self assert: (field disinfect: '2010-08-06') = (Date year: 2010 month: 8 day: 6).
	self assert: (field disinfect: '1234-11-22') = (Date year: 1234 month: 11 day: 22).
	self assert: (field disinfect: '2009-1-14') = (Date year: 2009 month: 1 day: 14).
	self assert: (field disinfect: '2009-10-2') = (Date year: 2009 month: 10 day: 2).
	self shouldnt: [ field disinfect: '1234-11-32' ] raise: Error.	"invalid, but some implementations just jump to the next month"
	self assert: (field disinfect: '1-1') isNil.
	self assert: (field disinfect: 'blah') isNil! !

!DateFieldTest methodsFor: 'tests' stamp: 'KenTreis 8/25/2010 10:05'!
testDisinfectUK
	field formatString: 'DD/MM/YYYY'.
	self assert: (field disinfect: '09/08/2010') = (Date year: 2010 month: 8 day: 9).
	self shouldnt: [ field disinfect: '09/13/2010' ] raise: Error "invalid, but some implementations just jump to the next month"! !

!DateFieldTest methodsFor: 'tests' stamp: 'KenTreis 8/9/2010 22:03'!
testDisinfectUS
	field formatString: 'MM/DD/YYYY'.
	self assert: (field disinfect: '08/09/2010') = (Date year: 2010 month: 8 day: 9)! !

!DateFieldTest methodsFor: 'tests' stamp: 'KenTreis 8/9/2010 22:02'!
testInfectISO
	field formatString: 'YYYY-MM-DD'.
	self assert: (field infect: (Date year: 1999 month: 12 day: 31)) = '1999-12-31'! !

!DateFieldTest methodsFor: 'tests' stamp: 'KenTreis 8/9/2010 18:56'!
testInfectUK
	field formatString: 'DD/MM/YYYY'.
	self assert: (field infect: (Date year: 1999 month: 12 day: 31)) = '31/12/1999'! !

!DateFieldTest methodsFor: 'tests' stamp: 'KenTreis 8/9/2010 22:04'!
testInfectUS
	field formatString: 'MM/DD/YYYY'.
	self assert: (field infect: (Date year: 1999 month: 12 day: 31)) = '12/31/1999'.
	self assert: (field infect: (Date year: 2009 month: 7 day: 8)) = '07/08/2009'! !

!DateFieldTest methodsFor: 'tests' stamp: 'hlsf 4/18/2023 17:28:55'!
testValidateInput
	field inputMorphContents: String new.
	field validateInput.
	self assert: field isValid.
	field beRequired.
	field validateInput.
	self deny: field isValid.
	field input: ''! !

!DateFieldTest methodsFor: 'tests' stamp: 'hlsf 4/18/2023 20:20:29'!
testValidationOnDate
	field beRequired.
	field addCondition: [ :input :disinfected | disinfected > (Date year: 2010 month: 1 day: 1) or: [disinfected = (Date year: 2010 month: 1 day: 1)] ].
	field inputMorphContents: '12/31/2009'.
	field validateInput.
	self deny: field isValid.
	field inputMorphContents: '01/01/2010'.
	field validateInput.
	self assert: field isValid! !

!FieldTest methodsFor: 'running' stamp: 'hlsf 4/20/2023 09:26:14'!
testRequired
	| field |
	field := Field new.
	field beRequired.
	field inputMorphContents: ''.
	field validateInput.
	self deny: field isValid.
	field beOptional.
	field inputMorphContents: ''.
	field validateInput.
	self assert: field isValid.
	self assert: field value isNil.
	field beRequired.
	field inputMorphContents: 'text'.
	field validateInput.
	self assert: field isValid.
	self assert: field value = 'text'! !

!FieldTest methodsFor: 'running' stamp: 'hlsf 4/18/2023 20:47:04'!
testValidateInput
	| field |
	field := Field new.
	field inputMorphContents: 'Foo Bar'.
	field validateInput.
	self assert: field input = 'Foo Bar'.
	field inputMorphContents: ''.
	field validateInput.
	self assert: field input isEmpty.
	self shouldnt: [field input: true] raise: Error "Not a CheckboxField"
! !

!FloatFieldTest methodsFor: 'running' stamp: 'KenTreis 8/5/2010 17:10'!
assertValueEquals: aFloat within: aTolerance
	self assert: (field value - aFloat) abs < aTolerance! !

!FloatFieldTest methodsFor: 'running' stamp: 'kdt 7/15/2009 18:02'!
setUp
	field := FloatField new! !

!FloatFieldTest methodsFor: 'running' stamp: 'hlsf 4/18/2023 20:20:41'!
testBlankInput
	field inputMorphContents: ''.
	field validateInput.
	self assert: field isValid.
	field beRequired.
	field inputMorphContents: ''.
	field validateInput.
	self deny: field isValid! !

!FloatFieldTest methodsFor: 'running' stamp: 'hlsf 4/18/2023 20:21:57'!
testInput
	field inputMorphContents: '5'.
	field validateInput.
	self assert: field isValid.
	self assert: field value = 5.
	field inputMorphContents: '0.2'.
	field validateInput.
	self assert: field isValid.
	self assertValueEquals: 0.2 within: 0.01.
	field inputMorphContents: 'asdf'.
	field validateInput.
	self deny: field isValid.
	field inputMorphContents: '.87'.
	field validateInput.
	self assert: field isValid.
	self assertValueEquals: 0.87 within: 0.001! !

!IntegerFieldTest methodsFor: 'running' stamp: 'kdt 4/4/2008 11:21'!
setUp
	field := IntegerField new! !

!IntegerFieldTest methodsFor: 'running' stamp: 'hlsf 4/18/2023 20:21:09'!
testBlankInput
	field inputMorphContents: ''.
	field validateInput.
	self assert: field isValid.
	field beRequired.
	field inputMorphContents: ''.
	field validateInput.
	self deny: field isValid! !

!IntegerFieldTest methodsFor: 'running' stamp: 'hlsf 4/18/2023 20:21:21'!
testInput
	field inputMorphContents: '5'.
	field validateInput.
	self assert: field isValid.
	self assert: field value = 5.
	field inputMorphContents: '0.2'.
	field validateInput.
	self deny: field isValid.
	field inputMorphContents: '.9'.
	field validateInput.
	self deny: field isValid! !

!PercentageFieldTest methodsFor: 'running' stamp: 'KenTreis 8/5/2010 17:09'!
assertValueEquals: aFloat within: aTolerance
	self assert: (field value - aFloat) abs < aTolerance! !

!PercentageFieldTest methodsFor: 'running' stamp: 'hlsf 4/18/2023 20:21:43'!
testBlankInput
	field
		inputMorphContents: '';
		validateInput.
	self assert: field isValid.
	field
		beRequired;
		inputMorphContents: '';
		validateInput.
	self deny: field isValid! !

!PercentageFieldTest methodsFor: 'running' stamp: 'hlsf 4/18/2023 20:21:35'!
testInput
	field inputMorphContents: '5'.
	field validateInput.
	self assert: field isValid.
	self assertValueEquals: 0.05 within: 0.001.
	field inputMorphContents: '0.2'.
	field validateInput.
	self assert: field isValid.
	self assertValueEquals: 0.002 within: 0.0001.
	field inputMorphContents: '.9'.
	field validateInput.
	self assert: field isValid.
	self assertValueEquals: 0.009 within: 0.0001! !

!PercentageFieldTest methodsFor: 'initialize-release'!
setUp
	field := PercentageField new! !

!Field methodsFor: 'accessing widget' stamp: 'hlsf 4/15/2023 21:24:09'!
errorsColumn
" Return a column layout morph where to plug the error messages "
	^ widget firstSubmorph ! !

!Field methodsFor: 'accessing widget' stamp: 'hlsf 4/15/2023 21:22:13'!
exampleMorph
" A label morph, it may not exist if no example was provided "
	^ self inputColumn submorphCount = 1 
		ifTrue: [nil] 
		ifFalse: [self inputColumn firstSubmorph ]! !

!Field methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 10:58:07'!
highlightInputMorph
	self inputMorph backgroundColor: (self isValid 
		ifTrue: [self inputMorph defaultBackgroundColor]
		ifFalse: [Color red muchLighter])! !

!Field methodsFor: 'accessing widget' stamp: 'hlsf 4/15/2023 21:24:16'!
inputColumn
	^ widget lastSubmorph! !

!Field methodsFor: 'accessing widget' stamp: 'hlsf 4/15/2023 21:19:45'!
inputMorph
"The widget morph the represent the model "
	^ self inputColumn lastSubmorph ! !

!Field methodsFor: 'accessing widget' stamp: 'hlsf 4/15/2023 12:56:07'!
inputMorphContents
	^ self inputMorph contents! !

!Field methodsFor: 'accessing widget' stamp: 'hlsf 4/16/2023 16:48:38'!
inputMorphContents: anInput
	self inputMorph contents: anInput! !

!Field methodsFor: 'accessing widget' stamp: 'hlsf 4/16/2023 11:32:01'!
labelAndWidget
	modifyBlock ifNotNil: [ " Last minute user customization "
		modifyBlock valueWithPossibleArgs: 
			(Array with: widget with: self inputMorph with: self exampleMorph with: self errorsColumn)].
	^ label  -> widget! !

!Field methodsFor: 'accessing' stamp: 'kdt 1/28/2008 22:04'!
addCondition: aBlock 
	self addCondition: aBlock labeled: 'Invalid entry'! !

!Field methodsFor: 'accessing' stamp: 'kdt 1/28/2008 22:04'!
addCondition: aBlock labeled: aStringOrBlock 
	conditions add: aStringOrBlock -> aBlock! !

!Field methodsFor: 'accessing' stamp: 'kdt 4/4/2008 13:48'!
beOptional
	isRequired := false! !

!Field methodsFor: 'accessing' stamp: 'kdt 4/4/2008 13:49'!
beRequired
	isRequired := true! !

!Field methodsFor: 'accessing' stamp: 'kdt 4/4/2008 13:50'!
beRequired: aStringOrBlock 
	self beRequired.
	self requirementCondition key: aStringOrBlock! !

!Field methodsFor: 'accessing' stamp: 'kdt 1/28/2008 22:04'!
callback: aBlock 
	callback := aBlock! !

!Field methodsFor: 'accessing' stamp: 'kdt 1/28/2008 22:04'!
customize: aBlock 
	modifyBlock := aBlock! !

!Field methodsFor: 'accessing' stamp: 'hlsf 4/16/2023 17:37:16'!
example: aString
| exampleString |
	exampleString := (String streamContents: [:s | s nextPut: $( ; nextPutAll: aString ; nextPut: $)]) asText italic.
	self exampleMorph 
		ifNil: [ "Instantiate a new label and add it below the input morph "
			self inputColumn 
				addMorph: (LabelMorph contents: exampleString )
				layoutSpec: LayoutSpec keepMorphExtent]
		ifNotNil: [	:labelMorph |
			labelMorph contents: exampleString ]! !

!Field methodsFor: 'accessing' stamp: 'kdt 1/28/2008 22:03'!
input
	^ input! !

!Field methodsFor: 'accessing' stamp: 'hlsf 4/16/2023 17:00:35'!
input: val 
"The input value as keyin by the user. A string most of the time "
	| trimmed |
	trimmed := ((val respondsTo: #withBlanksTrimmed) and: [ val isSymbol not ]) 
		ifTrue: [ val withBlanksTrimmed ]
		ifFalse: [ val ].
	input := ((trimmed respondsTo: #isEmpty) and: [ trimmed isEmpty ]) 
		ifTrue: [ nil ]
		ifFalse: [ trimmed ]! !

!Field methodsFor: 'accessing' stamp: 'hlsf 4/15/2023 09:59:33'!
label: aString
	label := aString ! !

!Field methodsFor: 'accessing' stamp: 'hlsf 4/20/2023 14:59:41'!
on: accessor of: model
	self value: (model perform: accessor ).
	self inputMorphContents: input.
	self 
		callback: [:val | model perform: (accessor, ':') asSymbol with: val]! !

!Field methodsFor: 'accessing' stamp: 'AnthonyKaufman 7/6/2010 09:51'!
save
	callback
		ifNotNil: [ 
			callback numArgs = 1
				ifTrue: [ callback value: value ]
				ifFalse: [ callback value ] ]! !

!Field methodsFor: 'accessing' stamp: 'kdt 1/28/2008 22:01'!
value
	^ value! !

!Field methodsFor: 'accessing' stamp: 'hlsf 4/18/2023 20:45:39'!
value: anObject
"The model I will present an object "
	value := anObject .
	input := self infect: anObject .
	self valueChanged! !

!Field methodsFor: 'private' stamp: 'hlsf 4/18/2023 12:46:59'!
addRequirementCondition
	self addCondition: [:userInput :theValue| isRequired not or: [	theValue notNil]]
		labeled: 'Field required or unvalid.'! !

!Field methodsFor: 'private' stamp: 'hlsf 4/18/2023 20:41:26'!
disinfect: aString
	"Convert aString into the type of object that this field ultimately represents"
	^aString! !

!Field methodsFor: 'private' stamp: 'hlsf 4/16/2023 11:39:47'!
evaluate: aBlockOrString withPossibleArguments: anArray
	^ aBlockOrString isBlock
		ifFalse: [aBlockOrString asString ]
		ifTrue: [aBlockOrString valueWithPossibleArgs: anArray]
! !

!Field methodsFor: 'private' stamp: 'hlsf 4/15/2023 14:45:59'!
infect: model
	"Convert the model into the type of object that this field's widget expects for a value"
	
	^model ifNil: ['']! !

!Field methodsFor: 'private' stamp: 'kdt 4/4/2008 13:50'!
requirementCondition
	^ conditions first! !

!Field methodsFor: 'private' stamp: 'hlsf 4/16/2023 17:12:54'!
validateConditions
	^ self validateUserConditions ! !

!Field methodsFor: 'private' stamp: 'hlsf 4/20/2023 10:58:20'!
validateInput
	errors := OrderedCollection new.
	self input: self inputMorphContents. "retrieve the input from the input Morph"
	self validateConditions.
	self isValid ifTrue: [ self value: (input ifNotNil: [ self disinfect: input ]) ].
	self errorsColumn removeAllMorphs.
	errors do: [:errorMsg | 
		self errorsColumn 
			addMorph: (LabelMorph contents: '• ', errorMsg :: color: Color red)		
			layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0)			].
	self  highlightInputMorph ! !

!Field methodsFor: 'private' stamp: 'hlsf 4/18/2023 12:35:27'!
validateUserConditions
	| disinfected arguments |
	disinfected := [ self disinfect: input ] on: Error do: [ :ex | nil ].
	arguments := Array with: input with: disinfected.
	conditions
		do: [ :each |
			(self evaluate: each value withPossibleArguments: arguments)
				ifFalse: [ 
					errors add: (self evaluate: each key withPossibleArguments: arguments).
					each = self requirementCondition
						ifTrue: [ ^ self ] ] ]! !

!Field methodsFor: 'private'!
valueChanged! !

!Field methodsFor: 'initialize-release' stamp: 'hlsf 4/18/2023 12:05:15'!
initialize
	conditions := OrderedCollection new.
	errors := OrderedCollection new.
	widget := LayoutMorph newColumn ::
		color: Color transparent;
		separation: 4@2;
		addMorph: (LayoutMorph newRow name: 'input' :: 
				color: Color transparent; 
				separation: 4@2);  
		addMorph: (LayoutMorph newColumn name: 'error' :: 
				color: Color transparent) . 
	isRequired := false.
	label := 'unammed label'.
	self setInputWidget.
	self addRequirementCondition! !

!Field methodsFor: 'initialize-release' stamp: 'hlsf 4/20/2023 14:23:42'!
inputMorphInstance
"
	Subclass according to the nature of the input 
	For most input we need a text entry morph, so make it the default one 
"
	^ TextEntryMorph new! !

!Field methodsFor: 'initialize-release' stamp: 'hlsf 4/20/2023 14:23:43'!
setInputWidget
	self inputColumn
		addMorph: self inputMorphInstance layoutSpec: (LayoutSpec morphHeightProportionalWidth: 1)! !

!Field methodsFor: 'testing' stamp: 'kdt 4/4/2008 13:45'!
isRequired
	^ isRequired! !

!Field methodsFor: 'testing' stamp: 'kdt 1/28/2008 22:02'!
isValid
	^ errors isEmpty! !

!CheckboxField methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 20:51:30'!
highlightInputMorph
	self inputMorph borderColor: (self isValid 
		ifTrue: [self inputMorph defaultColor]
		ifFalse: [Color red muchLighter])! !

!CheckboxField methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 19:52:51'!
inputMorphContents
	^ self inputMorph isSelected! !

!CheckboxField methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 19:53:01'!
inputMorphContents: anInput
	self inputMorph isSelected: anInput ! !

!CheckboxField methodsFor: 'initialize-release' stamp: 'hlsf 4/20/2023 19:49:36'!
inputMorphInstance
	^ CheckButtonMorph new! !

!CheckboxField methodsFor: 'initialize-release' stamp: 'hlsf 4/20/2023 19:56:51'!
setInputWidget
	self inputColumn
		addMorph: self inputMorphInstance layoutSpec: LayoutSpec keepMorphExtent! !

!CheckboxField methodsFor: 'private' stamp: 'hlsf 4/20/2023 20:46:16'!
infect: model
	^ model ifNil: [false]! !

!DateField methodsFor: 'private' stamp: 'hlsf 4/16/2023 17:19:33'!
disinfect: aString
	| year month day rs |
	rs := aString readStream.
	^ [ 
	format
		do: [ :token | 
			(#('YYYY' 'MM' 'DD') includes: token)
				ifTrue: [ 
					token = 'YYYY'
						ifTrue: [ year := Number readFrom: rs ].
					token = 'MM'
						ifTrue: [ 
							month := Number readFrom: rs.
							month = 0
								ifTrue: [ ^ nil ] ].
					token = 'DD'
						ifTrue: [ 
							day := Number readFrom: rs.
							day = 0
								ifTrue: [ ^ nil ] ] ]
				ifFalse: [ rs next: token size ] ].
	Date year: year month: month day: day ] on: Error do: [ :ex | nil ]! !

!DateField methodsFor: 'private' stamp: 'hlsf 4/14/2023 16:47:04'!
format: aDate dayOn: ws
	ws nextPutAll: (aDate dayOfMonth  printStringBase: 10 length: 2 padded: true)! !

!DateField methodsFor: 'private' stamp: 'hlsf 4/14/2023 16:46:37'!
format: aDate monthOn: ws
	ws nextPutAll: (aDate monthIndex  printStringBase: 10 length: 2 padded: true)! !

!DateField methodsFor: 'private' stamp: 'KenTreis 8/9/2010 19:08'!
format: aDate token: aToken on: ws
	| map function |
	map := Dictionary new.
	map
		at: 'MM' put: #format:monthOn:;
		at: 'DD' put: #format:dayOn:;
		at: 'YYYY' put: #format:yearOn:.
	function := map at: aToken ifAbsent: [ ^ ws nextPutAll: aToken ].
	self perform: function with: aDate with: ws! !

!DateField methodsFor: 'private' stamp: 'hlsf 4/14/2023 16:46:10'!
format: aDate yearOn: ws
	ws nextPutAll: (aDate yearNumber  printStringBase: 10 length: 4 padded: true)! !

!DateField methodsFor: 'private' stamp: 'hlsf 4/16/2023 16:23:04'!
infect: aDate
	| ws |
	aDate ifNil: [^''].
	ws := String new writeStream.
	format do: [ :token | self format: aDate token: token on: ws ].
	^ ws contents! !

!DateField methodsFor: 'private' stamp: 'hlsf 4/16/2023 16:54:15'!
initialize
	super initialize.
	self formatString: 'DD/MM/YYYY'! !

!DateField methodsFor: 'private' stamp: 'hlsf 4/16/2023 17:24:09'!
validateConditions
	(input notNil and: [(self disinfect: input) isNil])
		ifTrue: [ errors add: 'Date not in format ', (String streamContents: [:s | format asStringOn: s delimiter: '' last: '']) ].
	self validateUserConditions! !

!DateField methodsFor: 'accessing' stamp: 'KenTreis 8/9/2010 22:37'!
formatString
	| ws |
	ws := String new writeStream.
	format do: [ :token | ws nextPutAll: token ].
	^ ws contents! !

!DateField methodsFor: 'accessing' stamp: 'hlsf 4/16/2023 16:29:58'!
formatString: aString
	"aString should be some combination of MM, DD, and YYYY (use whatever separator you want).
	Note that the input parser doesn't require leading zeros like 'MM' or 'DD' implies, but it prints them in its output.
	
	Examples:
		(ISO format): YYYY-MM-DD
		(USA format): MM/DD/YYYY
		(British): DD/MM/YYYY
		(Swiss) DD.MM.YY
	"

	| chunks |
	self example: aString.
	chunks := OrderedCollection with: aString.
	#('MM' 'DD' 'YYYY')
		do: [ :placeholder | 
			| tokens |
			tokens := OrderedCollection new.
			chunks
				do: [ :each | 
					| index |
					index := each findString: placeholder.
					index = 0
						ifTrue: [ tokens add: each ]
						ifFalse: [ 
							| pre post |
							pre := each copyFrom: 1 to: index - 1.
							pre isEmpty
								ifFalse: [ tokens add: pre ].
							tokens add: placeholder.
							post := each copyFrom: index + placeholder size to: each size.
							post isEmpty
								ifFalse: [ tokens add: post ] ] ].
			chunks := tokens ].
	format := chunks asArray! !

!FloatField methodsFor: 'private' stamp: 'hlsf 4/18/2023 20:30:11'!
disinfect: aString
	| disinfected  |
	disinfected := aString select: [ :char | '+-1234567890.' includes: char ].
	disinfected ifEmpty: [ ^ nil ].
	(disinfected first = $. and: [ (disinfected occurrencesOf: $.) = 1 ])
		ifTrue: [ disinfected := '0' , disinfected ].
	^ [ Number readFrom: disinfected readStream ] on: Error do: [ :ex | nil ]! !

!FloatField methodsFor: 'private' stamp: 'hlsf 4/18/2023 20:45:29'!
infect: aNumber 
	^ aNumber 
		ifNotNil: [aNumber asFloat printString]
		ifNil: ['']! !

!FloatField methodsFor: 'private' stamp: 'kdt 7/15/2009 18:02'!
validateConditions
	super validateConditions.
	self isValid ifFalse: [ ^ self ].
	input ifNil: [ ^ self ].
	(self disinfect: input) ifNil: [ errors add: 'Invalid number.' ]! !

!PercentageField methodsFor: 'private' stamp: 'AlanWostenberg 5/17/2010 16:25'!
disinfect: aString 
	^ (super disinfect: aString) ifNotNilDo: [ :number | (number / 100) asFloat ]! !

!PercentageField methodsFor: 'private' stamp: 'hlsf 4/18/2023 20:47:37'!
infect: aNumber 
	^aNumber ifNil: [''] ifNotNil: [super infect: aNumber * 100]! !

!IntegerField methodsFor: 'private' stamp: 'hlsf 4/18/2023 12:46:11'!
disinfect: aString 
	('+-1234567890' includesAllOf: aString) ifFalse: [^nil].
	^ [aString asNumber] on: Error do: [:ex | nil ]! !

!IntegerField methodsFor: 'private' stamp: 'hlsf 4/18/2023 12:03:05'!
infect: anInteger 
	^ anInteger ifNil: [''] ifNotNil: [anInteger printString]! !

!IntegerField methodsFor: 'private' stamp: 'kdt 7/15/2009 18:07'!
validateConditions
	super validateConditions.
	self isValid ifFalse: [ ^ self ].
	input ifNil: [ ^ self ].
	(self disinfect: input) isInteger ifFalse: [ errors add: 'Fractions and decimals are not allowed here.' ]! !

!SelectField methodsFor: 'initialization' stamp: 'hlsf 4/20/2023 15:48:17'!
inputMorphInstance
	^ PluggableListMorph new! !

!SelectField methodsFor: 'accessing' stamp: 'hlsf 4/20/2023 15:29:38'!
input: anIndex
	input := anIndex ! !

!SelectField methodsFor: 'accessing' stamp: 'hlsf 4/20/2023 15:55:00'!
on: accessor of: model
	"̈Copy the model, so it is only saved at validation time, not at operating time"
	listModel := model copy.
	"Update the inputMoprh accordingly "
	self inputMorph model: listModel listGetter: #list indexGetter: #listIndex indexSetter: #listIndex: mainView: nil menuGetter: nil keystrokeAction: nil.
	value := input := listModel listIndex.
	self inputMorphContents: input.
	" Save operation done on the original model "
	self callback: [:val | model perform: (accessor, ':') asSymbol with: val]! !

!SelectField methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 15:58:32'!
highlightInputMorph
	self inputMorph color: (self isValid 
		ifTrue: [self inputMorph defaultColor]
		ifFalse: [Color red muchLighter])! !

!SelectField methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 15:21:18'!
inputMorphContents
" The inputMorph had already changed the listModel, ask its listIndex "
	^ listModel listIndex ! !

!SelectField methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 15:55:24'!
inputMorphContents: index
" Inform the index of the select item in the list model just changed "
	listModel changed: #listIndex! !

!SelectField methodsFor: 'private' stamp: 'hlsf 4/20/2023 16:01:09'!
addRequirementCondition
	self addCondition: [:userInput :theValue| isRequired not or: [	theValue isZero not]]
		labeled: 'Field required.'! !

!SelectField methodsFor: 'private' stamp: 'hlsf 4/20/2023 15:28:37'!
infect: object
" When index is zero, no item selected "	
	^object ifNil: [0]! !

!TextField methodsFor: 'initialize-release' stamp: 'hlsf 4/20/2023 14:23:43'!
inputMorphInstance
	^ TextModelMorph textProvider: self textGetter: #contents ! !

!TextField methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 10:46:52'!
contents
" Getter for the TextModelMorph. I return the contents to provide to the inputWidget "
	^ input ifNil: ['']! !

!TextField methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 11:07:16'!
highlightInputMorph
	self inputMorph color: (self isValid 
		ifTrue: [self inputMorph defaultColor]
		ifFalse: [Color red muchLighter])! !

!TextField methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 11:28:32'!
inputMorphContents
	^ self inputMorph model actualContents asString! !

!TextField methodsFor: 'accessing widget' stamp: 'hlsf 4/20/2023 10:35:29'!
inputMorphContents: anInput
" Inform the inputWidget its input field must be updated "
	self changed: #contents! !

!TimeField methodsFor: 'private' stamp: 'hlsf 4/20/2023 09:34:22'!
disinfect: aString
	^Time fromString: aString withBlanksTrimmed! !

!TimeField methodsFor: 'private' stamp: 'hlsf 4/18/2023 20:46:28'!
infect: aTime
	^aTime ifNil: [''] ifNotNil: [aTime asString]! !

!Mold methodsFor: 'accessing' stamp: 'kdt 4/4/2008 11:20'!
at: aKey 
	^ fields detect: [:each | each key = aKey] ifNone: [nil]! !

!Mold methodsFor: 'accessing'!
fields
	^fields! !

!Mold methodsFor: 'accessing'!
save
	fields do: #save! !

!Mold methodsFor: 'accessing' stamp: 'kdt 8/26/2008 21:32'!
validate
	fields do: [ :each | each validateInput ]! !

!Mold methodsFor: 'accessing'!
valueAt: aKey
	^(self at: aKey) value! !

!Mold methodsFor: 'initialize-release' stamp: 'kdt 1/28/2008 22:15'!
initialize
	fields := OrderedCollection new! !

!Mold methodsFor: 'fields'!
checkboxField
	^fields add: CheckboxField new! !

!Mold methodsFor: 'fields' stamp: 'KenTreis 8/9/2010 22:38'!
dateField
	^ fields add: DateField new! !

!Mold methodsFor: 'fields' stamp: 'hlsf 4/20/2023 20:22:57'!
emailField
	^ self stringField
		addCondition: 
				[ :val | 
				val isNil or: [ val includesAllOf: '@.'.
					"val matchesRegex: '([-_\w]\.?)+@[-\w]+\.[-\w]+(\.\w+)*'"
					 ] ]
			labeled: 'Invalid email address';
		yourself! !

!Mold methodsFor: 'fields' stamp: 'hlsf 4/18/2023 20:57:55'!
floatField
	^fields add: FloatField new! !

!Mold methodsFor: 'fields'!
integerField
	^fields add: IntegerField new! !

!Mold methodsFor: 'fields'!
passwordField
	^fields add: PasswordField new! !

!Mold methodsFor: 'fields'!
percentageField
	^self percentageField: 'Invalid percentage'! !

!Mold methodsFor: 'fields' stamp: 'kdt 4/4/2008 11:14'!
percentageField: anErrorMessage 
	^ fields 
		add: (PercentageField new addCondition: 
					[:val | 
					val isNil or: 
							[(val matchesRegex: '(\d)+(.\d+)?%?') 
								or: [val matchesRegex: '(\d)*.(\d)+%?']]]
				labeled: anErrorMessage)! !

!Mold methodsFor: 'fields'!
selectField
	^fields add: SelectField new! !

!Mold methodsFor: 'fields' stamp: 'hlsf 4/20/2023 09:25:05'!
stringField
	^fields add: Field new! !

!Mold methodsFor: 'fields'!
textField
	^fields add: TextField new! !

!Mold methodsFor: 'fields'!
timeField
	^fields add: TimeField new! !

!Mold methodsFor: 'fields' stamp: 'hlsf 4/20/2023 09:26:07'!
zipCodeField
	^fields add: (Field new 
				addCondition: [:val | val isNil or: [val matchesRegex: '(\d\d\d\d\d)(-\d\d\d\d)?']]
				labeled: 'Invalid zip code')! !

!Mold methodsFor: 'rendering' stamp: 'hlsf 4/18/2023 21:12:21'!
openDialog: title
	| panel |
	panel := nil.
	panel := PluggableDialogPanel 
		open: self
		label: title 
		view: #renderForms 
		accept: [self validate.
			panel morphExtent: panel minimumExtent. "I don't like to do it manually"
			self isValid 	ifTrue: [
				self save.
				panel delete] ]! !

!Mold methodsFor: 'rendering' stamp: 'hlsf 4/20/2023 11:43:40'!
renderForms
	^ LabelGroup with: (fields collect: #labelAndWidget) ::
		doAdoptWidgetsColor;
		yourself
	! !

!Mold methodsFor: 'testing' stamp: 'KenTreis 7/27/2011 13:49'!
isValid
	self validate.
	^ fields allSatisfy: #isValid! !

!Mold methodsFor: 'removing' stamp: 'kdt 4/4/2008 11:18'!
remove: aKey
	| field |
	field := self at: aKey.
	fields remove: field! !

!Mold methodsFor: 'removing' stamp: 'kdt 4/4/2008 11:18'!
remove: aKey ifAbsent: exceptionBlock 
	| field |
	field := self at: aKey.
	fields remove: field ifAbsent: exceptionBlock! !

!MoldExample class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/20/2023 20:40:37'!
eight
"
	MoldExample eight
"
 | mold fullname email confirmEmail |
	mold := Mold new.
	fullname := mold stringField
		on: #propertyValue of: ValueHolder new;
		label: 'Your Name';
		beRequired;
		addCondition: [ :val | val includesSubString: ' ']
			labeled: 
				[ :wrong | 
				'Please enter your first and last name. I couldn''t find a space in {1}' format:  {wrong} ].
	email := mold emailField
		on: #propertyValue of: ValueHolder new;
		label: 'Email Address:'.
	confirmEmail := mold emailField
		on: #propertyValue of: ValueHolder new;
		label: 'Confirm Email:'.
	email 
		addCondition: [ :input | input = confirmEmail input ]
		labeled: 'Email addresses did not match.'.
	confirmEmail 
		addCondition: [ :input | input = email input ]
		labeled: 'Email addresses did not match.'.
	mold textField
		on: #propertyValue of: ValueHolder new;
		label: 'About yourself.';
		beRequired.
	mold checkboxField
		on: #propertyValue of: (ValueHolder with: true);
		label: 'Sign for the newsletter';
		addCondition: [ :val | fullname isValid not or: [ val not or: [ fullname value first = $K ] ] ]
			labeled: 'Sorry, you may not opt out of our spam unless your first name starts with K.'.
	mold openDialog: 'Example Eight'! !

!MoldExample class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/20/2023 10:43:12'!
five
"
	MoldExample five
"
 | mold  |
	mold := Mold new.
	(mold timeField)
		label: 'Dawn time (Taipei)';
		on: #propertyValue of: (ValueHolder with: Time now);
		example: 'hh:mm';
		addCondition: [:input :value| value < `Time fromString: '8:00am'`] 		
		labeled: [:input :value| 'Sunrise is never {1} at Taipei.' format: {value}];
		beRequired.
	mold openDialog: 'Example Five'! !

!MoldExample class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/19/2023 00:12:12'!
four
"
	MoldExample four
"
 | mold  |
	mold := Mold new.
	(mold floatField )
		label: 'α';
		on: #propertyValue of: ValueHolder new;
		example: ' -1 ≤ α ≤ 1 ';
		addCondition: [:input :value| value >= -1] 		labeled: 'α < -1!!';
		addCondition: [:input :value| value <= 1] 		labeled: 'α >  1!!';
		beRequired.
	mold openDialog: 'Example Four'! !

!MoldExample class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/20/2023 16:04:02'!
one
"
	MoldExample one
"
	| mold |
	mold := Mold new.
	(mold stringField)
		label: 'Firstname:';
		on: #propertyValue of: ValueHolder new;
		beRequired.
	(mold stringField)
		label: 'Lastname:';
		on: #propertyValue of: ValueHolder new;
		addCondition: [:input| input size >= 2] 
		labeled: 'There is no such short name.';
		beRequired: 'Lastname required.'.
	(mold dateField )
		label: 'Birth date:';
		on: #propertyValue of: ValueHolder new;
		beRequired.
	mold openDialog: 'Example One' ! !

!MoldExample class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/20/2023 16:24:16'!
seven
"
	MoldExample seven
"
 | mold  |
	mold := Mold new.
	(mold selectField)
		label: 'Période 1';
		on: #listIndex of: (ListModel with: `{'P1' . 'P2' . 'P3' . 'P4' . 'P5'}`);
		beRequired.
	(mold selectField)
		label: 'Période 2';
		on: #listIndex of: (ListModel with: `{'H1' . 'H2' . 'H3' . 'H4' . 'H5'}`);
		beRequired;
		addCondition: [:value | value = 4] labeled: 'Select H4 to validate.'.
	(mold selectField)
		label: 'Période 3';
		on: #listIndex of: (ListModel with: `{'P6' . 'P7' . 'P8' . 'P9' . 'P10'}`).
	mold openDialog: 'Example Seven'! !

!MoldExample class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/20/2023 16:03:32'!
six
"
	MoldExample six
"
 | mold  |
	mold := Mold new.
	(mold textField)
		label: 'Description 1';
		on: #propertyValue of: (ValueHolder with: 'Some text...');
		beRequired.
	(mold textField)
		label: 'Description 2';
		on: #propertyValue of: ValueHolder new;
		addCondition: [:input | input size >= 20] labeled: 'Text too short. Minimum 20 characters.';
		beRequired.
	mold openDialog: 'Example Six'! !

!MoldExample class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/18/2023 21:13:52'!
three
"
	MoldExample three
"
 | mold |
	mold := Mold new.
	(mold integerField)
		label: 'Slot value';
		on: #propertyValue of: ValueHolder new;
		example: 'an integer value';
		addCondition: [:input :value| value >= 4] 		labeled: 'Value must be greater or equal to 4.';
		addCondition: [:input :value| value <= -10] 		labeled: 'Value must be lower or equal to -10.';
		beRequired.
	mold openDialog: 'Example Three' ! !

!MoldExample class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/18/2023 21:14:06'!
two
"
	MoldExample two
"
 | mold |
	mold := Mold new.
	(mold stringField)
		label: 'My label';
		on: #propertyValue of: ValueHolder new;
		example: 'This is an example';
		customize: [:widget :input :example | 
			widget color: Color black.
			input color: Color blue; backgroundColor: Color cyan.
			example color: Color orange];
		addCondition: [:input| input size >= 4] 
		labeled: [:input | 'You  only key in ', input size asString, ' character(s), a minimum of 4 is required.'];
		beRequired.
	mold openDialog: 'Example Two'! !
