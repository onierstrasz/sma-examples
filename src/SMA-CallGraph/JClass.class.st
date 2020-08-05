"
Represents a Java class within a CallGraph
"
Class {
	#name : #JClass,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'SMA-CallGraph'
}

{ #category : #testing }
JClass >> isStatic [
	^ name = 'STATIC_METHOD'
]

{ #category : #accessing }
JClass >> name: classNameOrStatic [ 
	name := classNameOrStatic
]

{ #category : #printing }
JClass >> printOn: aStream [
	aStream
		nextPutAll: name;
		cr

]
