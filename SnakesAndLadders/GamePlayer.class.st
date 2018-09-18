"
Responsibilities:
- Keep track of your name and your current sqaure
- Move when requested
"
Class {
	#name : #GamePlayer,
	#superclass : #Object,
	#instVars : [
		'name',
		'square'
	],
	#category : #SnakesAndLadders
}

{ #category : #'instance creation' }
GamePlayer class >> named: aName [
	^ self new setName: aName
]

{ #category : #'initialize-release' }
GamePlayer >> invariant [
	^ square notNil
		and: [ name notNil ]
]

{ #category : #private }
GamePlayer >> leaveCurrentSquare [
	square notNil ifTrue: [ square remove: self ].
]

{ #category : #playing }
GamePlayer >> moveTo: aSquare [
	self leaveCurrentSquare.
	square := aSquare landHere: self.

]

{ #category : #playing }
GamePlayer >> moveWith: aDie [
	| roll destination |
	self assert: self invariant.
	roll := aDie roll.
	destination := square forwardBy: roll.
	self moveTo: destination.
	^ name, ' rolls ', roll asString, ' and lands at ', square asString
]

{ #category : #testing }
GamePlayer >> name [
	^ name
]

{ #category : #testing }
GamePlayer >> position [
	^ square position
]

{ #category : #printing }
GamePlayer >> printOn: aStream [
	aStream nextPutAll: name
]

{ #category : #'initialize-release' }
GamePlayer >> setName: aName [
	name := aName.
]
