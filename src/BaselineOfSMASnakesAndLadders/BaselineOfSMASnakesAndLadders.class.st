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
		do: [ spec
				baseline: 'SMA-Demos'
				with: [ spec repository: 'github://onierstrasz/sma-examples/src' ].
			spec
				package: #'SMA-SnakesAndLadders'
				with: [ spec requires: 'SMA-Demos' ] ]
]
