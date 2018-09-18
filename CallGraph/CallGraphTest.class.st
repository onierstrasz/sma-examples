Class {
	#name : #CallGraphTest,
	#superclass : #TestCase,
	#category : #CallGraph
}

{ #category : #tests }
CallGraphTest >> testNumberOfCalls [
	self assert: CallGraph example calls size equals: 5
]

{ #category : #tests }
CallGraphTest >> testNumberOfClasses [
	self assert: CallGraph example classes size equals: 6
]

{ #category : #tests }
CallGraphTest >> testNumberOfMethods [
	self assert: CallGraph example methods size equals: 5
]

{ #category : #tests }
CallGraphTest >> testNumberOfMultiplyCalledMethods [
	self assert: (CallGraph example methods select: [ :m | m calls size > 1 ]) size equals: 0
]

{ #category : #tests }
CallGraphTest >> testNumberOfPolymorphicMethods [
	self assert: (CallGraph example methods select: #isPolymorphic) size equals: 0
]

{ #category : #tests }
CallGraphTest >> testNumberOfStaticMethods [
	self assert: (CallGraph example methods select: #isStatic) size equals: 3
]
