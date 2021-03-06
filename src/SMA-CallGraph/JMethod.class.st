"
A JMethod represents a Java method in a Java CallGraph. (NB: the calss Method already exists in the system.)
"
Class {
	#name : #JMethod,
	#superclass : #Object,
	#instVars : [
		'name',
		'owner',
		'calls',
		'returnType',
		'argTypes'
	],
	#category : #'SMA-CallGraph'
}

{ #category : #initialization }
JMethod >> addCall: aCall [ 
	calls add: aCall
]

{ #category : #initialization }
JMethod >> argTypes: aJClassCollection [
	argTypes := aJClassCollection
]

{ #category : #accessing }
JMethod >> calls [
	^ calls
]

{ #category : #initialization }
JMethod >> initialize [
	super initialize.
	calls := OrderedCollection new
]

{ #category : #querying }
JMethod >> isPolymorphic [
	^ (calls collect: #args) asSet size > 1
]

{ #category : #querying }
JMethod >> isStatic [
	^ owner isStatic
]

{ #category : #accessing }
JMethod >> name [
	^ name
]

{ #category : #initialization }
JMethod >> name: aString [ 
	name := aString
]

{ #category : #initialization }
JMethod >> owner: aJClass [ 
	owner := aJClass
]

{ #category : #printing }
JMethod >> printOn: aStream [
	aStream
		nextPutAll: name;
		cr

]

{ #category : #initialization }
JMethod >> returnType: aJClass [
	returnType := aJClass
]
