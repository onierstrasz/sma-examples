Class {
	#name : #DynamicAccessorsTest,
	#superclass : #TestCase,
	#category : #'SMA-Reflection'
}

{ #category : #running }
DynamicAccessorsTest >> tearDown [
	DynamicAccessors removeSelector: #x
]

{ #category : #running }
DynamicAccessorsTest >> testAccessors [
	self deny: (DynamicAccessors methodDict keys includes: #x).
	self assert: DynamicAccessors new x equals: nil.
	self assert: (DynamicAccessors methodDict keys includes: #x).
]
