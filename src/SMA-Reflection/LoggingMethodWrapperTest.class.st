Class {
	#name : #LoggingMethodWrapperTest,
	#superclass : #TestCase,
	#category : #'SMA-Reflection'
}

{ #category : #running }
LoggingMethodWrapperTest >> testDelegation [
	| logger |
	logger := LoggingMethodWrapper on: Integer>>#factorial.
	
	self assert: logger invocationCount equals: 0.
	5 factorial.
	self assert: logger invocationCount equals: 0.
	
	logger install.
	[ 5 factorial ] ensure: [logger uninstall].
	self assert: logger invocationCount equals: 6.
	
	Integer flushCache.
	
	10 factorial.
	self assert: logger invocationCount equals: 6.
	
]
