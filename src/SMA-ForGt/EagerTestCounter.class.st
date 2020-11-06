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
EagerTestCounter >> eagerTestsDemo [
	"Find all eager tests without using a visitor"

	| allNodes eagerTests |
	allNodes := [ :node | 
			| withAllChildren traversal nextNode |
	withAllChildren := OrderedCollection new.
	traversal := OrderedCollection with: node.
	[ traversal notEmpty ]
		whileTrue: [ nextNode := traversal removeFirst.
			withAllChildren add: nextNode.
			traversal addAllFirst: nextNode children ].
	withAllChildren ].
	eagerTests := [ :aClass | 
	aClass methods
		select: [ :m | 
			| asserts |
			asserts := (allNodes value: m parseTree)
				select: [ :each | 
					(each isKindOf: RBMessageNode)
						and: [ each selector beginsWith: 'assert' ] ].
			asserts size > 1 ] ].
	^ eagerTests value: StringTest
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
