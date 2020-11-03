"
Sample usage:

[[[]
StringTest methods select: [: m |
	| visitor |
	visitor := EagerTestCounter new.
	m parseTree acceptVisitor: visitor.
	visitor count > 1 ]
]]]


"
Class {
	#name : #EagerTestCounter,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'count'
	],
	#category : #'SMA-ForGt-Moose'
}

{ #category : #accessing }
EagerTestCounter >> count [
	^ count
]

{ #category : #accessing }
EagerTestCounter >> initialize [
	super initialize.
	count := 0
]

{ #category : #accessing }
EagerTestCounter >> visitMessageNode: aMessageNode [
	(aMessageNode selector beginsWith: 'assert')
		ifTrue: [ count := count + 1 ]
]
