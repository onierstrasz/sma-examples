Class {
	#name : #Superman,
	#superclass : #Man,
	#category : #'SMA-Extras'
}

{ #category : #'as yet unclassified' }
Superman >> self [
	^ 'super', super self
]

{ #category : #'as yet unclassified' }
Superman >> super [
	^ super super
]
