Class {
	#name : #LoggingMethodWrapperTest,
	#superclass : #TestCase,
	#category : #'SMA-Reflection'
}

{ #category : #running }
LoggingMethodWrapperTest >> testDelegation [

	| logger |
	logger := LoggingMethodWrapper on: Integer >> #slowFactorial.

	self assert: logger invocationCount equals: 0.
	5 slowFactorial.
	self assert: logger invocationCount equals: 0.

	logger install.
	[ 5 slowFactorial ] ensure: [ logger uninstall ].
	self assert: logger invocationCount equals: 6.

	Integer flushCache.

	10 slowFactorial.
	self assert: logger invocationCount equals: 6
]
