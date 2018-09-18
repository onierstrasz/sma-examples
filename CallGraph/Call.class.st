"
A Call instance represents a method invocation within a CallGraph
"
Class {
	#name : #Call,
	#superclass : #Object,
	#instVars : [
		'callee',
		'args',
		'caller'
	],
	#category : #CallGraph
}

{ #category : #accessing }
Call >> args [
	^ args
]

{ #category : #initialization }
Call >> args: argTypesString [ 
	args := argTypesString
]

{ #category : #initialization }
Call >> callee: aJMethod [ 
	callee := aJMethod
]

{ #category : #initialization }
Call >> caller: locationString [
	"NB: missing full signature, so we cannot identify the unique method"
	caller := locationString
]
