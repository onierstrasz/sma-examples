Class {
	#name : #BaselineOfSMAForGt,
	#superclass : #BaselineOf,
	#category : #BaselineOfSMAForGt
}

{ #category : #baselines }
BaselineOfSMAForGt >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'SMA-Demos'.
			spec package: #'SMA-ForGt'.
			"spec package: #'SMA-CallGraph'."
			spec package: #'SMA-SnakesAndLadders'.
			spec package: #'SMA-Reflection' ]
]
