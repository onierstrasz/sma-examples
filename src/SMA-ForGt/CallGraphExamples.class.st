Class {
	#name : #CallGraphExamples,
	#superclass : #Object,
	#category : #'SMA-ForGt-Slideshows'
}

{ #category : #accessing }
CallGraphExamples >> fiveLineExample [
	<gtExample>
	| cg |
	cg := CallGraph example.
	self assert: cg calls size equals: 5.
	^ cg
]
