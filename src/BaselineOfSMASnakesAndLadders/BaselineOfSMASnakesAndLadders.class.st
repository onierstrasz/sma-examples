Class {
	#name : #BaselineOfSMASnakesAndLadders,
	#superclass : #BaselineOf,
	#category : #BaselineOfSMASnakesAndLadders
}

{ #category : #baselines }
BaselineOfSMASnakesAndLadders >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'SMA-Demos'.
			spec package: #'SMA-SnakesAndLadders' ]
]
