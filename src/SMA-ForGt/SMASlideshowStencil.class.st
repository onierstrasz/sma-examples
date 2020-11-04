"
I am an abstract superclass for SMA slideshow stencils, offering some useful methods to share.
"
Class {
	#name : #SMASlideshowStencil,
	#superclass : #GtSlideShowStencil,
	#category : #'SMA-ForGt-Slideshows'
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
SMASlideshowStencil >> nb: aString [
	^ aString asRopedText
		foreground: Color red;
		fontSize: 12
]
