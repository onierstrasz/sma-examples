"
Play a rigged game and check the results.
"
Class {
	#name : #SnakesAndLaddersTest,
	#superclass : #TestCase,
	#instVars : [
		'eg',
		'loadedDie',
		'jack',
		'jill'
	],
	#category : #'SMA-SnakesAndLadders'
}

{ #category : #running }
SnakesAndLaddersTest >> example [
	^ SnakesAndLadders example
]

{ #category : #running }
SnakesAndLaddersTest >> setUp [
	eg := self example.
	loadedDie := LoadedDie new.
	eg setDie: loadedDie.
	jack := eg players first.
	jill := eg players last.
]

{ #category : #running }
SnakesAndLaddersTest >> testExample [
	self assert: eg currentPlayer equals: jack.
	loadedDie roll: 1.
	eg playOneMove.
	self assert: jack position equals: 6.
	self assert: eg currentPlayer equals: jill.
	loadedDie roll: 5.
	eg playOneMove.
	self assert: jill position equals: 1.
	self assert: eg currentPlayer equals: jack.
	loadedDie roll: 5.
	eg playOneMove.
	self assert: jack position equals: 5.
	self assert: eg currentPlayer equals: jill.
	loadedDie roll: 4.
	eg playOneMove.
	self assert: jill position equals: 1.
	self assert: eg currentPlayer equals: jack.
	loadedDie roll: 6.
	eg playOneMove.
	self assert: jack position equals: 5.
	self assert: eg currentPlayer equals: jill.
	loadedDie roll: 6.
	eg playOneMove.
	self assert: jill position equals: 9.
	self assert: eg currentPlayer equals: jack.
	loadedDie roll: 5.
	eg playOneMove.
	self assert: jack position equals: 10.
	self assert: eg currentPlayer equals: jill.
	loadedDie roll: 5.
	eg playOneMove.
	self assert: jill position equals: 1.
	self assert: eg currentPlayer equals: jack.
	loadedDie roll: 2.
	eg playOneMove.
	self assert: jack position equals: 12.
	self assert: eg isOver
]

{ #category : #running }
SnakesAndLaddersTest >> testStartPosition [
	self assert: eg lastPosition equals: 12.
	self assert: eg isNotOver.
	self assert: eg currentPlayer equals: jack.
	self assert: eg firstSquare isFirstSquare.
	self assert: eg firstSquare isLastSquare not.
	self assert: eg firstSquare position equals: 1.
	self assert: eg firstSquare isOccupied.
	self assert: (eg at: eg lastPosition) isFirstSquare not.
	self assert: (eg at: eg lastPosition) isLastSquare.
	self assert: (eg at: eg lastPosition) position equals: 12.
	self assert: (eg at: eg lastPosition) isOccupied not.
	self assert: jack name equals: 'Jack'.
	self assert: jill name equals: 'Jill'.
	self assert: jack position equals: 1.
	self assert: jill position equals: 1
]
