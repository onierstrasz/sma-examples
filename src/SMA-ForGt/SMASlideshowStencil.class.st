"
I am an abstract superclass for SMA slideshow stencils, offering some useful methods to share.
"
Class {
	#name : #SMASlideshowStencil,
	#superclass : #BrStencil,
	#category : #'SMA-ForGt'
}

{ #category : #accessing }
SMASlideshowStencil >> classHierarchyFor: classes [
	| m |
	m := GtMondrian new.
	m nodes
		shape: [ :node | 
			BlTextElement new
				border: (BlBorder paint: Color black);
				text: node name asRopedText;
				padding:
					(BlInsets
						top: 5
						right: 5
						bottom: 5
						left: 5) ];
		with: classes.
	m edges
		fromCenterBottom;
		toCenterTop;
		connectFrom: #superclass.
	m layout tree levelDistance: 20.
	^ m
]

{ #category : #accessing }
SMASlideshowStencil >> compile: methodSource inClass: aClass [
	aClass compile: (OpalCompiler new format: methodSource)
]

{ #category : #accessing }
SMASlideshowStencil >> ensureClassDefined: classNameSymbol [
	(Smalltalk at: classNameSymbol asSymbol ifAbsent: [ nil ]) isClass
		ifFalse: [ Object
				subclass: classNameSymbol
				instanceVariableNames: ''
				classVariableNames: ''
				package: classNameSymbol asString ]
]

{ #category : #accessing }
SMASlideshowStencil >> heading: aString [
	^ aString asRopedText fontSize: 36
]

{ #category : #accessing }
SMASlideshowStencil >> methodCoderForClass: aClass withSource: methodSource [
	^ self methodCoderForClass: aClass withSources: {methodSource}
]

{ #category : #accessing }
SMASlideshowStencil >> methodCoderForClass: aClass withSources: methodSourceCollection [
	| container |
	container := BlElement new.
	container layout: BlLinearLayout vertical alignCenter.
	methodSourceCollection
		do: [ :methodSource | 
			container
				addChild:
					((GtMethodCoder
						forClass: aClass
						source: (OpalCompiler new format: methodSource))
						expanded: true;
						asElement) ].
	^ container
]

{ #category : #accessing }
SMASlideshowStencil >> methodCoderForMethod: aMethod [
	^ self methodCoderForMethods: {aMethod}
]

{ #category : #accessing }
SMASlideshowStencil >> methodCoderForMethods: aMethodList [
	| container |
	container := BlElement new.
	container layout: BlLinearLayout vertical alignCenter.
	aMethodList
		do: [ :aMethod | 
			container
				addChild: ((GtMethodCoder forMethod: aMethod) expanded: true) asElement ].
	^ container
]

{ #category : #accessing }
SMASlideshowStencil >> methodCodersElementFor: aMethodCollection [
"Create an element containing multiple method coders"
	| container |
	container := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	aMethodCollection
		do: [ :method | 
			container
				addChild: ((GtMethodCoder forMethod: method) expanded: true) asElement ].
	^ container
]

{ #category : #accessing }
SMASlideshowStencil >> nb: aString [
	^ aString asRopedText
		foreground: Color red;
		fontSize: 12
]

{ #category : #accessing }
SMASlideshowStencil >> openInSpace [
	self openSlideshowInNewSpace: (self create)
]

{ #category : #accessing }
SMASlideshowStencil >> openSlideshowInNewSpace: aSlideshow [
	BlSpace new
		title: 'Space';
		extent: 1200 @ 600;
		addChild: aSlideshow makeArrowsVisible create;
		withHalos;
		show
]

{ #category : #accessing }
SMASlideshowStencil >> subtitle: aString [
	^ aString asRopedText fontSize: 50; foreground: Color gray
]

{ #category : #accessing }
SMASlideshowStencil >> title: aString [
	^ aString asRopedText fontSize: 70
]