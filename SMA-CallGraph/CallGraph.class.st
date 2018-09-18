"
This class models a call graph that  has been reconstructed from a Javassist run-time log.
"
Class {
	#name : #CallGraph,
	#superclass : #Object,
	#instVars : [
		'calls',
		'methods',
		'classes'
	],
	#category : #'SMA-CallGraph'
}

{ #category : #examples }
CallGraph class >> example [
	^ self new from: '|java.lang.String:org.clapper.util.html.HTMLUtil.convertCharacterEntities:java.lang.String|STATIC_METHOD|java.lang.String|org.clapper.util.html.test.HTMLEntitiesTest.convertHTMLEntities:47
|org.clapper.util.text.XStringBufBase:org.clapper.util.text.XStringBufBase.append:java.lang.String|org.clapper.util.text.XStringBuffer|java.lang.String|org.clapper.util.html.HTMLUtil.convertCharacterEntities:240
|java.lang.Appendable:org.clapper.util.text.XStringBuffer.getBufferAsAppendable|org.clapper.util.text.XStringBuffer| |org.clapper.util.text.XStringBufBase.append:469
|java.lang.String:org.clapper.util.html.HTMLUtil.convertEntity:java.lang.String|STATIC_METHOD|java.lang.String|org.clapper.util.html.HTMLUtil.convertCharacterEntities:253
|java.util.ResourceBundle:org.clapper.util.html.HTMLUtil.getResourceBundle|STATIC_METHOD| |org.clapper.util.html.HTMLUtil.convertEntity:424'
]

{ #category : #'instance creation' }
CallGraph class >> fromFile: fileName [
  ^ self new from: fileName asFileReference contents
]

{ #category : #accessing }
CallGraph >> calls [
	^ calls
]

{ #category : #accessing }
CallGraph >> classes [
	^ classes
]

{ #category : #initialization }
CallGraph >> createCall: callString [
	| fields callee owner call |
	fields := $| split: callString.
	self assert: fields size = 5.
	self assert: (fields at: 1) size = 0.
	callee := self getMethod: (fields at: 2).
	owner := self getClass: (fields at: 3).
	callee owner: owner.
	call := Call new.
	call	callee: callee;
		args: (fields at:4);
		caller: (fields at: 5).
	callee addCall: call.
	^ call
]

{ #category : #initialization }
CallGraph >> from: aString [
			calls := ((Character cr split: aString)
				select: #notEmpty)
				collect: [ :each | self createCall: each ]
]

{ #category : #accessing }
CallGraph >> getClass: aClassName [ 
	^ classes at: aClassName ifAbsentPut: [ JClass new name: aClassName ]
]

{ #category : #accessing }
CallGraph >> getMethod: signature [
	| fields methodName returnType argTypes |
	fields := $: split: signature.
	returnType := self getClass: (fields at: 1).
	methodName := fields at: 2.
	argTypes := (fields copyFrom: 3 to: fields size) collect: [ :each | self getClass: each ].
	^ methods
		at: signature
		ifAbsentPut: [ 
			JMethod new
				name: methodName;
				returnType: returnType;
				argTypes: argTypes ]
]

{ #category : #initialization }
CallGraph >> initialize [
	methods := Dictionary new.
	classes := Dictionary new
]

{ #category : #accessing }
CallGraph >> methods [
	^ methods
]
