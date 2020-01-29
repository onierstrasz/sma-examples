Class {
	#name : #BaselineOfSMADemos,
	#superclass : #BaselineOf,
	#category : #BaselineOfSMADemos
}

{ #category : #baselines }
BaselineOfSMADemos >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'SMA-Demos' ].

]
