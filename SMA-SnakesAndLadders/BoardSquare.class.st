"
Responsibilities:
- Remember position in the board
- Keep track of any players on this square
- Send on any players passing through
- Displays itself with its position and any player who might be on it, e.g., [7 Jack]
"
Class {
	#name : #BoardSquare,
	#superclass : #Object,
	#instVars : [
		'position',
		'player',
		'board'
	],
	#category : #'SMA-SnakesAndLadders'
}

{ #category : #playing }
BoardSquare >> backwardBy: squares [ 
	^ squares = 0 
		ifTrue: [self destination]
		ifFalse: 
			[self isFirstSquare 
				ifTrue: [self nextSquare forwardBy: squares - 1]
				ifFalse: [self previousSquare backwardBy: squares - 1]]
]

{ #category : #printing }
BoardSquare >> contents [
	^ self isOccupied
		ifTrue: [ ' ', player asString ]
		ifFalse: [ '' ]
]

{ #category : #playing }
BoardSquare >> destination [
	^ self
]

{ #category : #playing }
BoardSquare >> forwardBy: squares [
	self assert: self invariant.
	^ squares = 0 
		ifTrue: [self destination]
		ifFalse: 
			[self isLastSquare 
				ifFalse: [self nextSquare forwardBy: squares - 1]
				ifTrue: [self previousSquare backwardBy: squares - 1]]
]

{ #category : #'initialize-release' }
BoardSquare >> initializePosition: aNumber board: aBoard [ 
	position := aNumber.
	board := aBoard
]

{ #category : #'initialize-release' }
BoardSquare >> invariant [
	^ ((board notNil
		and: [ position notNil ])
		and: [ position >= 0 ])
		and: [ position <= board lastPosition]
]

{ #category : #testing }
BoardSquare >> isFirstSquare [
	^ position = 1
]

{ #category : #testing }
BoardSquare >> isLastSquare [
	^ position = board lastPosition
]

{ #category : #testing }
BoardSquare >> isOccupied [
	^ player notNil
]

{ #category : #playing }
BoardSquare >> landHere: aPlayer [
	^ self isOccupied
		ifTrue: [ board firstSquare landHere: aPlayer ]
		ifFalse: [ player := aPlayer. self ]
]

{ #category : #playing }
BoardSquare >> nextSquare [
	self assert: self isLastSquare not.
	^ board at: position + 1
]

{ #category : #testing }
BoardSquare >> position [
	^ position
]

{ #category : #playing }
BoardSquare >> previousSquare [
	self assert: self isFirstSquare not.
	^ board at: position - 1
]

{ #category : #printing }
BoardSquare >> printOn: aStream [
	aStream nextPutAll: '[', position printString, self contents, ']'.
]

{ #category : #playing }
BoardSquare >> remove: aPlayer [
	self assert: player = aPlayer.
	player := nil.
]
