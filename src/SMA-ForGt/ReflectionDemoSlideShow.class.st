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
	"Not very interesting"

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
	show
		addSlide:
			(GtLabelAndElementSlide new
				newTextWithFormat: (self heading: 'A class is a holder of CompiledMethods');
				newText:
					'See how we can inspect the class (as an Object) and navigate (in the Raw tab) to its methods, their source code, bytecode and AST.';
				element: [ GtPlaygroundSlide new
						snippets: {'OrderedCollection'};
						asElement ]).
	show
		addSlide:
			(GtLabelAndElementSlide new
				newTextWithFormat: (self heading: 'Finding super-sends');
				newText:
					'Note that we are only looking for super-sends within the Collection hierarchy';
				element: [ GtPlaygroundSlide new
						snippets:
							{'(Collection withAllSubclasses 
  flatCollect: #methodDict)
    select: #sendsToSuper'};
						asElement ]).
	show
		addSlide:
			(GtLabelAndElementSlide new
				newTextWithFormat: (self heading: 'Finding super-sends to other methods');
				newText:
					'This will take a momeent as we are querying all methods in the system.';
				element: [ GtPlaygroundSlide new
						snippets:
							{'(CompiledMethod allInstances select: #sendsToSuper)
  select: [ :m | (m sendNodes select:
    [ :send | send isSuperSend 
      and: [ m selector ~= send selector ] ])
        isNotEmpty ]'};
						asElement ]).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'thisContext reifies the run-time stack');
				newText:
					'Evaluate (don''t inspect) to open both a debugger and am inspector on the stack.';
				element: [ GtPlaygroundSlide new
						snippets: {'thisContext inspect.
self halt'};
						asElement ]).
	show makeArrowsVisible.
	^ show
]
