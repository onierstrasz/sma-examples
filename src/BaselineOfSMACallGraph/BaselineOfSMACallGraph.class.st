Class {
	#name : #BaselineOfSMACallGraph,
	#superclass : #BaselineOf,
	#category : #BaselineOfSMACallGraph
}

{ #category : #baselines }
BaselineOfSMACallGraph >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'SMA-Demos'.
			spec package: #'SMA-CallGraph' ]
]
