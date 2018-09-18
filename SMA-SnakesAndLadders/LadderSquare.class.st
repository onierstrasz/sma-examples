"
Responsibilities:
- Transport a player who lands here forward to another square
"
Class {
	#name : #LadderSquare,
	#superclass : #BoardSquare,
	#instVars : [
		'forward'
	],
	#category : #'SMA-SnakesAndLadders'
}

{ #category : #'instance creation' }
LadderSquare class >> forward: number [
	^ self new initializeForward: number
]

{ #category : #playing }
LadderSquare >> destination [
	^ self forwardBy: forward
]

{ #category : #'initialize-release' }
LadderSquare >> initializeForward: aNumber [
	forward := aNumber.
]

{ #category : #printing }
LadderSquare >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: forward asString, '+>'.
]
