'From Cuis 6.0 [latest update: #5772] on 23 April 2023 at 4:14:21 pm'!
'Description '!
!provides: 'UI-Mold-Test' 1 3!
!requires: 'UI-Mold' 1 6 nil!
SystemOrganization addCategory: 'UI-Mold-Test'!


!classDefinition: #CheckboxFieldTest category: 'UI-Mold-Test'!
TestCase subclass: #CheckboxFieldTest
	instanceVariableNames: 'field model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Mold-Test'!
!classDefinition: 'CheckboxFieldTest class' category: 'UI-Mold-Test'!
CheckboxFieldTest class
	instanceVariableNames: ''!

!classDefinition: #DateFieldTest category: 'UI-Mold-Test'!
TestCase subclass: #DateFieldTest
	instanceVariableNames: 'field'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Mold-Test'!
!classDefinition: 'DateFieldTest class' category: 'UI-Mold-Test'!
DateFieldTest class
	instanceVariableNames: ''!

!classDefinition: #FieldTest category: 'UI-Mold-Test'!
TestCase subclass: #FieldTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Mold-Test'!
!classDefinition: 'FieldTest class' category: 'UI-Mold-Test'!
FieldTest class
	instanceVariableNames: ''!

!classDefinition: #FloatFieldTest category: 'UI-Mold-Test'!
TestCase subclass: #FloatFieldTest
	instanceVariableNames: 'field'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Mold-Test'!
!classDefinition: 'FloatFieldTest class' category: 'UI-Mold-Test'!
FloatFieldTest class
	instanceVariableNames: ''!

!classDefinition: #IntegerFieldTest category: 'UI-Mold-Test'!
TestCase subclass: #IntegerFieldTest
	instanceVariableNames: 'field'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Mold-Test'!
!classDefinition: 'IntegerFieldTest class' category: 'UI-Mold-Test'!
IntegerFieldTest class
	instanceVariableNames: ''!

!classDefinition: #MultiselectFieldTest category: 'UI-Mold-Test'!
TestCase subclass: #MultiselectFieldTest
	instanceVariableNames: 'field model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Mold-Test'!
!classDefinition: 'MultiselectFieldTest class' category: 'UI-Mold-Test'!
MultiselectFieldTest class
	instanceVariableNames: ''!

!classDefinition: #PercentageFieldTest category: 'UI-Mold-Test'!
TestCase subclass: #PercentageFieldTest
	instanceVariableNames: 'field'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Mold-Test'!
!classDefinition: 'PercentageFieldTest class' category: 'UI-Mold-Test'!
PercentageFieldTest class
	instanceVariableNames: ''!

!classDefinition: #SelectFieldTest category: 'UI-Mold-Test'!
TestCase subclass: #SelectFieldTest
	instanceVariableNames: 'field model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UI-Mold-Test'!
!classDefinition: 'SelectFieldTest class' category: 'UI-Mold-Test'!
SelectFieldTest class
	instanceVariableNames: ''!


!CheckboxFieldTest methodsFor: 'setUp/tearDown' stamp: 'hlsf 4/23/2023 12:27:50'!
setUp
	model := ValueHolder with: true.
	field := CheckboxField new
		on: #propertyValue of: model.! !

!CheckboxFieldTest methodsFor: 'tests' stamp: 'hlsf 4/23/2023 12:57:50'!
testCondition
	"Without condition, always valid"
	field validateInput.	
	self assert: field isValid.
	field inputMorphContents: false;
		validateInput.
	self assert: field isValid.
	
	field addCondition: [:input :value | input not] labeled: 'Answer must be false'.
	field validateInput.
	self assert: field isValid.
	field inputMorphContents: true;
		validateInput.
	self deny: field isValid.
	! !

!CheckboxFieldTest methodsFor: 'tests' stamp: 'hlsf 4/23/2023 12:54:53'!
testState
	self assert: field value.
	field inputMorphContents: false;
		validateInput.
	"field to false, model still true"
	self deny: field value.
	self assert: model propertyValue.
	"Model only updated at #save message sent."
	field save.
	self deny: model propertyValue.
	! !

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

!MultiselectFieldTest methodsFor: 'as yet unclassified' stamp: 'hlsf 4/23/2023 15:58:44'!
setUp
	model := ListMultiModel with: `{'P1' . 'P2' . 'P3' . 'P4' . 'P5'}`:: selectedIndexes: #(1).
	field := SelectMultipleField new
		on: #selectedIndexes of: model;
		beRequired ! !

!MultiselectFieldTest methodsFor: 'as yet unclassified' stamp: 'hlsf 4/23/2023 16:12:12'!
testConditon1
	field addCondition: [:input :value | input size >= 2]
		 labeled: 'Select at least two elements'.
	field validateInput.
	self deny: field isValid.
	""
	field inputMorphContents: #(1 3);
		validateInput.
	self assert: field isValid.
	""
	field inputMorphContents: #(2 5 3);
		validateInput.
	self assert: field isValid.
	""
	field inputMorphContents: #();
		validateInput.
	self deny: field isValid.
	! !

!MultiselectFieldTest methodsFor: 'as yet unclassified' stamp: 'hlsf 4/23/2023 16:14:04'!
testConditon2
	field addCondition: [:input :value | value includesAllOf: #('P5' 'P3' 'P1')]
		 labeled: 'Select at least P1, P3 and P5'.
	field validateInput.
	self deny: field isValid.
	""
	field inputMorphContents: #(1 3);
		validateInput.
	self deny: field isValid.
	""
	field inputMorphContents: #(1 5 3);
		validateInput.
	self assert: field isValid.
	""
	field inputMorphContents: #(5 2 3 1);
		validateInput.
	self assert: field isValid.
	""
	field inputMorphContents: #(5 2 1);
		validateInput.
	self deny: field isValid.
! !

!MultiselectFieldTest methodsFor: 'as yet unclassified' stamp: 'hlsf 4/23/2023 16:02:19'!
testState1
	field validateInput.
	self assert: field input equals: #(1) asOrderedCollection.
	self assert: field value equals:  #('P1') asOrderedCollection .
	self assert: field isValid.
	field inputMorphContents: #();
		validateInput.
	self deny: field isValid.
	"Model not changed"
	self assert: model selectedItems equals:  #('P1') asOrderedCollection .
	self assert: model selectedIndexes equals: #(1) asOrderedCollection.
! !

!MultiselectFieldTest methodsFor: 'as yet unclassified' stamp: 'hlsf 4/23/2023 16:07:51'!
testState2
	field inputMorphContents: #(3 5);
		validateInput.
	self assert: field isValid.
	self assert: field input equals: #(3 5) asOrderedCollection.
	self assert: field value equals:  #('P3' 'P5') asOrderedCollection .
	"Model unchanged"
	self assert: model selectedItems equals:  #('P1') asOrderedCollection .
	self assert: model selectedIndexes equals: #(1) asOrderedCollection.
	"Model updated"
	field save.
	self assert: model selectedItems equals:  #('P3' 'P5') asOrderedCollection .
	self assert: model selectedIndexes equals: #(3 5) asOrderedCollection.! !

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

!SelectFieldTest methodsFor: 'tests' stamp: 'hlsf 4/23/2023 14:06:11'!
testCondition1
	field addCondition: [:input :value | 		input = 1 and: [value = 'P1'] ]		 labeled: 'First element'.
	field validateInput.
	self assert: field isValid.
	""
	field inputMorphContents: 3; 
		validateInput.
	self deny: field isValid! !

!SelectFieldTest methodsFor: 'tests' stamp: 'hlsf 4/23/2023 14:06:45'!
testCondition2
	field addCondition: [:input :value | 		input = 3 and: [value = 'P3'] ]		 labeled: 'Third element'.
	field validateInput.
	self deny: field isValid.
	""
	field inputMorphContents: 3; 
		validateInput.
	self assert: field isValid! !

!SelectFieldTest methodsFor: 'tests' stamp: 'hlsf 4/23/2023 14:02:05'!
testState
	field validateInput.
	self assert: field isValid.
	self assert: field input equals: 1.
	self assert: field value equals: 'P1'.
	""
	field beRequired;
		inputMorphContents: 0;
		validateInput.
	self deny: field isValid.! !

!SelectFieldTest methodsFor: 'tests' stamp: 'hlsf 4/23/2023 14:02:34'!
testStateModel
	field inputMorphContents: 2;
		validateInput.
	self assert: field isValid.
	self assert: field input equals: 2.
	self assert: field value equals: 'P2'.
	self assert: model listIndex ~= 2.
	self assert: model selectedItem ~= 'P2'.
	field save.
	self assert: model listIndex equals: 2.
	self assert: model selectedItem equals: 'P2'.
! !

!SelectFieldTest methodsFor: 'setUp/tearDown' stamp: 'hlsf 4/23/2023 13:00:29'!
setUp
	model := ListModel with: `{'P1' . 'P2' . 'P3' . 'P4' . 'P5'}`.
	field := SelectField new
		on: #listIndex of: model.! !
