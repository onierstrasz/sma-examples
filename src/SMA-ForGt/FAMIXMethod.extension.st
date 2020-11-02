Extension { #name : #FAMIXMethod }

{ #category : #'*SMA-ForGt' }
FAMIXMethod >> assertionInvocationNodes [
	| asserts astNode |
	asserts := OrderedCollection new.
	astNode := self gtASTNode.
	astNode
		ifNotNil: [ astNode
				allNodesOfType: JavaMethodInvocationNode
				do: [ :node | 
					(node name value beginsWith: 'assert')
						ifTrue: [ asserts add: node ] ] ].
	^ asserts
]
