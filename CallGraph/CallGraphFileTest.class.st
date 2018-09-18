Class {
	#name : #CallGraphFileTest,
	#superclass : #TestCase,
	#instVars : [
		'cg'
	],
	#category : #CallGraph
}

{ #category : #running }
CallGraphFileTest >> setUp [
	cg := CallGraph fromFile: 'Calls.txt'.
]

{ #category : #tests }
CallGraphFileTest >> testNumberOfCalls [
	self assert: cg calls size equals: 2475
]

{ #category : #tests }
CallGraphFileTest >> testNumberOfClasses [
	self assert: cg classes size equals: 67
]

{ #category : #tests }
CallGraphFileTest >> testNumberOfMethods [
	self assert: cg methods size equals: 168
]

{ #category : #tests }
CallGraphFileTest >> testNumberOfMultiplyCalledMethods [
	self assert: (cg methods select: [ :m | m calls size > 1 ]) size equals: 141
]

{ #category : #tests }
CallGraphFileTest >> testNumberOfPolymorphicMethods [
	self assert: (cg methods select: #isPolymorphic) size equals: 10
]

{ #category : #tests }
CallGraphFileTest >> testNumberOfStaticMethods [
	self assert: (cg methods select: #isStatic) size equals: 10
]
