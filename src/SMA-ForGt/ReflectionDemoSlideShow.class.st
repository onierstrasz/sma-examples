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
ReflectionDemoSlideShow >> addIntercessionSlidesTo: show [
	show
		addSlide: (GtTitleSlide new titleText: (self subtitle: 'Intercession')).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'Logging message sends with a minimal object');
				newText: 'A LoggingProxy intercepts messages sent to a subject.';
				newText:
					'The proxy is initially its own subject. When it is a applied to a subject, the references are swapped with #become:.';
				element: [ (GtCoder forMethod: LoggingProxy>>#doesNotUnderstand:) createInPager
					"maximized" ];
				elementWeight: 0.7).
	show
		addSlide:
			(GtLabelAndElementSlide new
				newTextWithFormat: (self heading: 'Installing a proxy');
				newText:
					'Note that only after installing the proxy, can the point respond to "invocationCount".';
				element: [ GtPlaygroundSlide new
						snippets:
							{'point := 1@2.
point class canUnderstand: #invocationCount'.
							'LoggingProxy for: point.
point class canUnderstand: #invocationCount'.
							'point invocationCount' . 'point + 3@4. point invocationCount'};
						asElement ]).
	show
		addSlide:
			(GtLabelAndElementSlide new
				newTextWithFormat: (self heading: 'Anonymous classes');
				"newText: '';"
					element: [ GtPlaygroundSlide new
						snippets:
							{'anonClass := Set newAnonymousSubclass.
anonClass compile: ''add: anObject
      Transcript show: ''''adding '''', anObject printString; cr.
      ^ super add: anObject''.
anonClass' . 'set := Set new.
set add: 1.
set' . 'set primitiveChangeClassTo: anonClass basicNew.
set add: 2.
set' . 'Transcript'};
						asElement ]).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'A Logging Method Wrapper');
				newText:
					'A method wrapper installs instelf in place of a CompiledMethod in the method dictionary of a class.';
				newText: 'The #run:with:in: method implements its behavior.';
				element:
						[ (GtCoder forMethod: LoggingMethodWrapper >> #install) createInPager ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'Installing a method wrapper');
				newText:
					'It is critical to ensure that the method wrapper is correctly unintalled no matter what happens during its execution.';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"Install the slow, recursive factorial implementation."
Integer compile: ''factorial
			self > 0 ifTrue: [ ^ self * (self - 1) factorial ].
			self = 0 ifTrue: [ ^ 1 ].
			self error: ''''Not valid for negative integers'''''''.
							'logger := LoggingMethodWrapper on: Integer>>#factorial.
logger invocationCount'.
							'5 factorial.
logger invocationCount' . 'logger install.
[ 10 factorial ] ensure: [ logger uninstall].
logger invocationCount' . 'logger initialize.
10 factorial.
logger invocationCount'};
						asElement ];
				elementWeight: 0.6)
]

{ #category : #accessing }
ReflectionDemoSlideShow >> addIntrospectionSlidesTo: show [
	show
		addSlide: (GtTitleSlide new titleText: (self subtitle: 'Introspection')).
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
						asElement ])
]

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
			(GtTextSlide new
				newText:
					'These slides accompany the course "Software Modeling and Analysis". http://scg.unibe.ch/teaching/sma').
	"self addIntrospectionSlidesTo: show."
	self addIntercessionSlidesTo: show. 
	show makeArrowsVisible.
	^ show
]
