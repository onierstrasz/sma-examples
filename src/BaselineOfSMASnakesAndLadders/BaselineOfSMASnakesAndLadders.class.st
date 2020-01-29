Class {
	#name : #BaselineOfSMASnakesAndLadders,
	#superclass : #BaselineOf,
	#category : #BaselineOfSMASnakesAndLadders
}

{ #category : #baselines }
BaselineOfSMASnakesAndLadders >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
		package: #'SMA-SnakesAndLadders' with: [ spec requires: 'SMA-Demos' ] ].

]
