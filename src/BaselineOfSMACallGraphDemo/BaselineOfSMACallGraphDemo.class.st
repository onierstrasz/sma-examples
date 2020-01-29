Class {
	#name : #BaselineOfSMACallGraphDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfSMACallGraphDemo
}

{ #category : #baselines }
BaselineOfSMACallGraphDemo >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'SMA-Demos'.
			spec package: #'SMA-CallGraph' ]
]
