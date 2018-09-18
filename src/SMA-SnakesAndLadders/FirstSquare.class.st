"
Responsibilities:
- Allows multiple players to be added or removed [normal squares can only hold a single player]
"
Class {
	#name : #FirstSquare,
	#superclass : #BoardSquare,
	#instVars : [
		'players'
	],
	#category : #'SMA-SnakesAndLadders'
}

{ #category : #printing }
FirstSquare >> contents [
	^ players inject: '' into:
			[ :list :each | list , ' ', each asString ]
]

{ #category : #'initialize-release' }
FirstSquare >> initialize [
	players := OrderedCollection new.
]

{ #category : #testing }
FirstSquare >> isOccupied [
	^ players size > 0
]

{ #category : #'initialize-release' }
FirstSquare >> landHere: aPlayer [
	players add: aPlayer.
]

{ #category : #playing }
FirstSquare >> remove: aPlayer [
	self assert: (players includes: aPlayer).
	players remove: aPlayer.
]
