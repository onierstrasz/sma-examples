"
Responsibilities:
- Transport a player who lands here back to another square
"
Class {
	#name : #SnakeSquare,
	#superclass : #BoardSquare,
	#instVars : [
		'back'
	],
	#category : #SnakesAndLadders
}

{ #category : #'instance creation' }
SnakeSquare class >> back: number [
	^ self new initializeBack: number
]

{ #category : #playing }
SnakeSquare >> destination [
	^ self backwardBy: back
]

{ #category : #'initialize-release' }
SnakeSquare >> initializeBack: aNumber [
	back := aNumber.
]

{ #category : #printing }
SnakeSquare >> printOn: aStream [
	aStream nextPutAll: '<-', back asString.
	super printOn: aStream.
]
