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
		do: [ spec package: #'SMA-CallGraph'.
			spec package: #CallGraph.
			spec package: #'SMA-SnakesAndLadders'.
			spec package: #'SMA-Reflection'.
			spec
				package: #'SMA-ForGt'
				with: [ spec requires: #'SMA-CallGraph'.
					spec requires: #CallGraph.
					spec requires: #'SMA-SnakesAndLadders'.
					spec requires: #'SMA-Reflection' ].
			spec
				package: 'SMA-Demos'
				with: [ spec requires: #'SMA-CallGraph'.
					spec requires: #'SMA-SnakesAndLadders'.
					spec requires: #'SMA-Reflection' ] ].
	spec package: #'SMA-Extras' with: [ spec requires: #'SMA-ForGt' ]
]
