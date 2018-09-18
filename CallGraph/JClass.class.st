"
Represents a Java class within a CallGraph
"
Class {
	#name : #JClass,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #CallGraph
}

{ #category : #'as yet unclassified' }
JClass >> isStatic [
	^ name = 'STATIC_METHOD'
]

{ #category : #'as yet unclassified' }
JClass >> name: classNameOrStatic [ 
	name := classNameOrStatic
]
