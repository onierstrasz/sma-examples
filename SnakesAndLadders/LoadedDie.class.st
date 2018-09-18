"
For testing purposes. When rolled, a loaded die returns a fixed value.
"
Class {
	#name : #LoadedDie,
	#superclass : #Die,
	#instVars : [
		'roll'
	],
	#category : #SnakesAndLadders
}

{ #category : #playing }
LoadedDie >> roll [
	self assert: roll notNil.
	^ roll
]

{ #category : #playing }
LoadedDie >> roll: aNumber [
	self assert: ((1 to: 6) includes: aNumber).
	roll := aNumber.
]
