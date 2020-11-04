"
I am a demo showing how to detect dead code by query FAMIX models.

[[[
DeadCodeSlideShow new openInSpace
]]]


"
Class {
	#name : #DeadCodeSlideShow,
	#superclass : #SMASlideshowStencil,
	#category : #'SMA-ForGt-Slideshows'
}

{ #category : #accessing }
DeadCodeSlideShow >> addCompleteReachableClassesPlaygroundTo: show [
	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets:
							{'"Lazily load the model"
model := MooseModelExamples argoUML.'.
							self reachableMethodsSnippet.
							self reachableClassesSnippet};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> addCompleteReachableMethodsPlaygroundTo: show [
	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets:
							{'"Lazily load the model"
model := MooseModelExamples argoUML.'.
							self reachableMethodsSnippet};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> addCompleteRecursivelyReachableClassesPlaygroundTo: show [
	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets:
							{'"Lazily load the model"
model := MooseModelExamples argoUML.'.
							self reachableMethodsSnippet.
							self reachableClassesSnippet.
							self recursivelyReachableClassesSnippet};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> addFulWekaScriptTo: show [ 
	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets:
							{'"Lazily load the model"
model := MooseModelExamples weka.'.
							self reachableMethodsSnippet.
							self reachableClassesSnippet.
							self recursivelyReachableClassesSnippet.
							self unreachableClassesSnippet.
							self viewSnippet};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> addFullArgoUMLScriptTo: show [
	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets:
							{'"Lazily load the model"
model := MooseModelExamples argoUML.'.
							self reachableMethodsSnippet.
							self reachableClassesSnippet.
							self recursivelyReachableClassesSnippet.
							self unreachableClassesSnippet.
							self viewSnippet};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> addFullScriptTo: show [
	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets:
							{'"Lazily load the model"
model := MooseModelExamples argoUML.'.
							self reachableMethodsSnippet.
							self reachableClassesSnippet.
							self recursivelyReachableClassesSnippet.
							self unreachableClassesSnippet.
							self viewSnippet};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> addLoadModelPlaygroundTo: show [
	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets:
							{'"Lazily load the model"
model := MooseModelExamples argoUML.' . '"TO DO: How do we identify the dead code (unreachable classes)?"'};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> addReachableClassesPlaygroundTo: show [
	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets:
							{'"Lazily load the model"
model := MooseModelExamples argoUML.'.
							self reachableMethodsSnippet.
							'"Find the classes of reachable methods"
reachableClasses := reachableMethods collect: #parentType.

"TO DO: What other classes must be included for the code to run?"

reachableClasses.'};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> addReachableMethodsPlaygroundTo: show [
	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets: {'"Lazily load the model"
model := MooseModelExamples argoUML.' . '"Find all methods reachable from main."
reachableMethods := Set new.
methodsToCheck := (model allModelMethods select: [:m | m name = ''main'']) entities.

"TO DO: Recursively find reachable methods ..."

reachableMethods.'};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> addRecursivelyReachableClassesPlaygroundTo: show [ 

	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets:
							{'"Lazily load the model"
model := MooseModelExamples argoUML.'.
							self reachableMethodsSnippet.
							self reachableClassesSnippet.
							 '"Recursively add all classes referenced from reachable classes"
newTypes := reachableClasses  flatCollect: #allProviderTypes.
newTypes removeAllFoundIn: reachableClasses.
"TO DO: recursively add new, reachable classes"

newTypes.
reachableClasses.'};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> addUnreachableClassesPlaygroundTo: show [
	show
		addSlide:
			(GtLabelAndElementLiveSlide new
				element: [ GtPlaygroundLiveSlide new
						snippets:
							{'"Lazily load the model"
model := MooseModelExamples argoUML.'.
							self reachableMethodsSnippet.
							self reachableClassesSnippet.
							self recursivelyReachableClassesSnippet.
							self unreachableClassesSnippet};
						asElement ])
]

{ #category : #accessing }
DeadCodeSlideShow >> create [
	| show |
	show := GtSlideShow new.
	show
		addSlide: (GtTitleSlide new titleText: (self title: 'Dead Code Detection Demo')).
	self addLoadModelPlaygroundTo: show.
	self addReachableMethodsPlaygroundTo: show.
	self addCompleteReachableMethodsPlaygroundTo: show.
	self addReachableClassesPlaygroundTo: show.
	self addCompleteReachableClassesPlaygroundTo: show.
	self addRecursivelyReachableClassesPlaygroundTo: show.
	self addCompleteRecursivelyReachableClassesPlaygroundTo: show.
	self addUnreachableClassesPlaygroundTo: show.
	self addFullArgoUMLScriptTo: show.
	self addFulWekaScriptTo: show.
	show makeArrowsVisible.
	^ show
]

{ #category : #accessing }
DeadCodeSlideShow >> openSlideshowInNewSpace: aSlideshow [
	BlSpace new
		title: 'Space';
		extent: 1200 @ 1200;
		addChild: aSlideshow makeArrowsVisible create;
		withHalos;
		show
]

{ #category : #accessing }
DeadCodeSlideShow >> reachableClassesSnippet [
	^ '"Find the classes of reachable methods"
reachableClasses := reachableMethods collect: #parentType.
"Add classes accessed by reachable  methods"
reachableClasses addAll: ((((reachableMethods flatCollect:#accesses) collect: #variable) select: #isAttribute) collect: #parentType).
"Add all superclasses"
reachableClasses addAll: (reachableClasses flatCollect: #withSuperclassHierarchy).
"Add all subclasses (?)"
"reachableClasses addAll: (reachableClasses flatCollect: #withSubclassHierarchy)."
"Add all classes referenced from reachable methods"
reachableClasses addAll:(reachableMethods flatCollect: #providerTypes).'
]

{ #category : #accessing }
DeadCodeSlideShow >> reachableMethodsSnippet [
	^ '"Find all methods reachable from main."
reachableMethods := Set new.
methodsToCheck := (model allModelMethods select: [:m | m name = ''main'']) entities.
[ methodsToCheck notEmpty] whileTrue: [ | m |
	m := methodsToCheck removeFirst.
	m invokedMethods do: [ :each |
		(reachableMethods includes: each) ifFalse: [
			methodsToCheck add: each.
			reachableMethods add: each ] ] ].
reachableMethods.'
]

{ #category : #accessing }
DeadCodeSlideShow >> recursivelyReachableClassesSnippet [
	^ '"Recursively add all classes referenced from reachable classes"
newTypes := reachableClasses  flatCollect: #allProviderTypes.
newTypes removeAllFoundIn: reachableClasses.
[ newTypes notEmpty]
	whileTrue: [ 
		reachableClasses addAll: newTypes.
		newTypes := reachableClasses  flatCollect: #allProviderTypes.
		newTypes removeAllFoundIn: reachableClasses ].
newTypes.
reachableClasses.'
]

{ #category : #accessing }
DeadCodeSlideShow >> unreachableClassesSnippet [
	^ '"Unreachable classes are the complement of the reachable ones"
unReachableClasses := model allModelClasses copy.
unReachableClasses removeAllFoundIn: reachableClasses.
"Ignore inner classes"
unReachableClasses removeAllSuchThat: #isInnerClass. 
unReachableClasses.'
]

{ #category : #accessing }
DeadCodeSlideShow >> viewSnippet [
^ '"Color unreachable root classes red."
view := GtMondrian new.
view nodes
	shape: [:m |
		BlElement new
			size: 5@5;
			geometry: BlCircle new;
			background: ((m fanIn = 0)
				ifTrue: [ Color red ]
				ifFalse: [ Color gray])];
	with:  unReachableClasses.
view edges connectFromAll: #providerTypes.
view layout force. 
view.'
]
