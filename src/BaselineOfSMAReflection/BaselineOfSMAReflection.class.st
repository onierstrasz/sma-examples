Class {
	#name : #BaselineOfSMAReflection,
	#superclass : #BaselineOf,
	#category : #BaselineOfSMAReflection
}

{ #category : #baselines }
BaselineOfSMAReflection >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'SMA-Reflection' ].

]
