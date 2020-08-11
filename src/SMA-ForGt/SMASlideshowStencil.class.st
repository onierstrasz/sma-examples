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
	| view |
	view := GtMondrian new.
	view nodes
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
	view edges
		fromCenterBottom;
		toCenterTop;
		connectFrom: #superclass.
	view layout tree levelDistance: 20.
	^ view
]

{ #category : #accessing }
SMASlideshowStencil >> heading: aString [
	^ aString asRopedText fontSize: 36
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
SMASlideshowStencil >> openInNewSpace [
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
