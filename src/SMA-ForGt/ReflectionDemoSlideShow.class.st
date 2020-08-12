"
I am a live demo illustrating the reflective features of Pharo Smalltalk.

[[[
ReflectionDemoSlideShow new openInSpace
]]]


"
Class {
	#name : #ReflectionDemoSlideShow,
	#superclass : #SMASlideshowStencil,
	#category : #'SMA-ForGt-SMA-ForGt'
}

{ #category : #accessing }
ReflectionDemoSlideShow >> compiledMethodClassHierarchy [
	^ self
		classHierarchyFor:
			{Behavior.
			ClassDescription.
			Class.
			Metaclass.
			MethodDictionary.
			CompiledMethod.
			RBMethodNode.
			RBMessageNode} asOrderedCollection
]

{ #category : #accessing }
ReflectionDemoSlideShow >> create [
	| show |
	show := GtSlideShow new.
	show
		addSlide: (GtTitleSlide new titleText: (self title: 'Reflection Demo')).
	"show
		addSlide:
			(GtLabelAndElementSlide new
				newTextWithFormat: (self heading: 'CompiledMethods');
				element:
						[ (GtInspector createOn: self compiledMethodClassHierarchy) maximized ])."
	show makeArrowsVisible.
	^ show
]
