"
I offer demo slideshows for Gt instead of Playground snippets for Pharo.

Run this to open the overview:

[[[
SMAForGt openSlideshowsOverview
]]]


"
Class {
	#name : #SMAForGt,
	#superclass : #Object,
	#category : #'SMA-ForGt'
}

{ #category : #accessing }
SMAForGt class >> addCallGraphCollectionsAPITo: show [
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('Modeling Calls, Methods and Classes.' asRopedText fontSize: 36);
				newText:
					'We want to build up a Call object for each line of the log. To do this, we need some help from the Collection classes.';
				newTextWithFormat:
					('How to fix alignment?' asRopedText
						foreground: Color red;
						fontSize: 10);
				element: [ ((GtMethodCoder forMethod: CallGraph >> #initializeFrom:)
						expanded: true) asElement ];
				elementWeight: 0.5).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('The Collection Hierarchy' asRopedText fontSize: 36);
				newText:
					'The most important collections classes to remember are OrderedCollection, Array, String, Symbol and Dictionary';
				newTextWithFormat:
					('When the mondrian is embedded this way I cannot click on the classes and navigate to the Code. How can I embed this in sliding panes, without using a snippet?' asRopedText
						foreground: Color red;
						fontSize: 10);
				element: [ self new collectionHierarchy asElement ];
				elementWeight: 0.75).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('The Collection API' asRopedText fontSize: 36);
				newText: '...';
				newTextWithFormat:
					('Still working on this ...' asRopedText
						foreground: Color red;
						fontSize: 10);
				element: [ GtPlaygroundSlide new
						snippets:
							{'#(1 2 3 4) includes: 5' . '#(1 2 3 4) size' . '#(1 2 3 4) isEmpty'.
							'#(1 2 3 4) contains: [:some | some < 0 ]'};
						asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('The Transcript.' asRopedText fontSize: 36);
				newText: 'The Transcript is a kind of system log';
				element: [ GtPlaygroundSlide new
						snippets:
							{'Transcript open' . '#(1 2 3 4) do:
[:each | Transcript show: each ]' . '#(1 2 3 4) with: #(5 6 7 8)
do: [:x : y | Transcript show: x+y; cr]'};
						asElement ]).
	show
		addSlide:
			(GtTextAndElementSlide new
				newText: 'More collections API';
				element: [ GtPlaygroundSlide new
						snippets:
							{'#(1 2 3 4) select: [:each | each odd ]'.
							'#(1 2 3 4) reject: [:each | each odd ]'.
							'#(1 2 3 4) detect: [:each | each odd ]'.
							'#(1 2 3 4) collect: [:each | each even ]'.
							'#(1 2 3 4) inject: 0
into: [:sum :each | sum + each]'};
						asElement ];
				elementWeight: 0.8).
	show
		addSlide:
			(GtTextAndElementSlide new
				newText: 'Blocks are first-class, anonymous functions';
				newText: 'Duck Typing Symbols for Blocks';
				element: [ GtPlaygroundSlide new
						snippets:
							{'5 factorial' . '[ :arg | arg factorial ] value: 5'.
							'#factorial value: 5' . 'Symbol>>#value:' . '5 perform: #factorial'};
						asElement ])
]

{ #category : #accessing }
SMAForGt class >> addCallGraphExplorationTo: show [ 

	show
		addSlide:
			(GtTextAndElementSlide new
				newText: 'Exploring the Call Graph';
				element: [ GtPlaygroundSlide new
						snippets:
							{'CallGraph fromFile: ''Calls.txt''' . '((CallGraph fromFile: ''Calls.txt'') methods
select: [ :m | m calls size > 1 ]) size'.
							'((CallGraph fromFile: ''Calls.txt'') methods select: #isPolymorphic)
collect: [ :each | each -> (each calls collect: #args) asSet ]'};
						asElement ]).
]

{ #category : #accessing }
SMAForGt class >> addCallGraphGettingStartedTo: show [
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('Getting started.' asRopedText fontSize: 36);
				newText: 'You can download Gt from https://gtoolkit.com/download/';
				newText:
					'Evaluate the two snippets to load this project from github, and instantiate this slideshow';
								newTextWithFormat: ('How can I format the URL to be a live link?.' asRopedText foreground: Color red; fontSize: 12);
				element: [ GtPlaygroundSlide new
						snippets:
							{'Metacello new baseline: ''SMAForGt''; repository: ''github://onierstrasz/sma-examples/src''; load.'.
							'SMAForGt openSlideshowsOverview'};
						asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('The Playground.' asRopedText fontSize: 36);
				newText:
					'The Playground is a place to evaluate arbitrary Smalltalk expressions.';
				newText:
					'Right-click next to the expression to see what you can do. Also see the tooltip descriptions of the various buttons.';
				newText: 'Inspecting an expression opens an Inspector on the result.';
				newText:
					'Lifting up the gray bar at the bottom of the Inpsctor reveals a new evaluation pane for that object. Evaluate ''self size'' there.';
				element: [ GtPlaygroundSlide new
						snippets: {'''Hello world'''};
						asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('Opening a file' asRopedText fontSize: 36);
				newText:
					'Evaluate the snippet to obtain a view of the File object. (NB: First copy the file Calls.txt to the image directory.)';
				newText:
					'You can also evaluate ''self contents'' on the result to obtain the contents of the File as a String object.';
				newText: 'We should encapsulate this data in a CallGraph object ...';
				element: [ GtPlaygroundSlide new
						snippets:
							{'
''Calls.txt'' asFileReference'};
						asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('Navigating to implementors and sender' asRopedText fontSize: 36);
				newText:
					'How is asFileReference implemented? Just click on the little triangle to the right of the message.';
				newText:
					'Which classes implement this method? Select the message and type <CMD>-M (for iMplementors).';
				newText: 'Also try <CMD>-N (for seNders).';
				element: [ GtPlaygroundSlide new
						snippets:
							{'
''Calls.txt'' asFileReference'};
						asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('Navigating to classes' asRopedText fontSize: 36);
				newText:
					'There are many ways to navigate to a class browser. One easy way is to go to the Meta tab.';
				newText: 'You can also ask an object for its class';
				newText:
					'Click on the "book" icon of the inspector to open a dedicated code browser.';
				element: [ GtPlaygroundSlide new
						snippets:
							{'
''Calls.txt'' asFileReference' . '
(''Calls.txt'' asFileReference) class'};
						asElement ];
				elementWeight: 0.6)
]

{ #category : #accessing }
SMAForGt class >> addCallGraphImplementingTo: show [
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('Implementing the CallGraph class' asRopedText fontSize: 36);
				newText:
					'You can create a new class programmatically by sending a message to its superclass.';
				newText:
					'You can also create a new class in the Playground by clicking on the "wrench" icon.';
				newTextWithFormat:
					('Is it easy to point to the icon?.' asRopedText
						foreground: Color red;
						fontSize: 10);
				element: [ GtPlaygroundSlide new
						snippets:
							{'Object subclass: #CallGraph
  instanceVariableNames: ''''
  classVariableNames: ''''
  package: ''CallGraph'''.
							'MyCallGraph new'};
						asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('The Class Coder' asRopedText fontSize: 36);
				newText: 'The class coder is a dedicated browser for editing classes.';
				newText: 'Be sure to always write a class comment!';
				newTextWithFormat:
					('Can I get a full Coder with the missing icons and buttons?'
						asRopedText
						foreground: Color red;
						fontSize: 10);
				element: [ (GtClassCoder forClass: CallGraph) asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('Defining methods' asRopedText fontSize: 36);
				newText:
					'The "from:" method will split the input "aString" into lines (by the character "carriage return"), and assign it  to the "calls" instance variable.';
				newText:
					'The "calls" method is an accessor, returning the value of the calls variable.';
				newTextWithFormat:
					('How can I align the element to the center?' asRopedText
						foreground: Color red;
						fontSize: 10);
				element: [ self
						methodCodersElementFor:
							{(CallGraph >> #from:).
							(CallGraph >> #calls)} ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat:
					('How many calls are there in the call graph?' asRopedText
						fontSize: 36);
				newText: 'We just need to inspect the calls variable.';
				element: [ GtPlaygroundSlide new
						snippets:
							{'| cg |
cg := CallGraph new from: ''Calls.txt'' asFileReference contents.
cg calls size'};
						asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('Improving the interface' asRopedText fontSize: 36);
				newText:
					'Factory methods and other "static" methods are defined on the "class side".';
				newText:
					'Browse the "fromFileNamed:" method to see it is a "class" method, not an "instance" method. ';
				newTextWithFormat:
					('How can I open the coder with the fromFileNamed: method in focus and expanded?'
						asRopedText
						foreground: Color red;
						fontSize: 10);
				element: [ (GtClassCoder forClass: CallGraph) asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('Defining tests' asRopedText fontSize: 36);
				newText:
					'Tests in GT consist of methods containing assertions and returning an example object.';
				newText: 'Example objects can be composed.';
				newText:
					'The <gtExample> pragma allows example methods to be run from the browser.';
				newTextWithFormat:
					('Is there a way to have the snippet already evaluated?' asRopedText
						foreground: Color red;
						fontSize: 10);
				element: [ (GtPlaygroundSlide new
						snippets: {'CallGraphExamples>>#fiveLineExample'}) asElement ];
				elementWeight: 0.6)
]

{ #category : #accessing }
SMAForGt class >> addCallGraphTitleTo: show [
	show
		addSlide:
			(GtTitleSlide new
				titleText: ('CallGraph Demo' asRopedText fontSize: 70))
]

{ #category : #scripts }
SMAForGt class >> callGraphPlaygroundPage [
	<gtExample>
	| aPage |
	aPage := GtPlayPage newDefault.
	aPage snippets first
		sourceCode:
			'"CallGraph Demo snippets"
"NB: First copy the file Calls.txt to the image directory.'.
	{'"Open a file in an inspector page"
''Calls.txt'' asFileReference'.
	'"Collections API"
#(1 2 3 4) includes: 5'.
	'#(1 2 3 4) size' . '#(1 2 3 4) isEmpty' . '#(1 2 3 4) contains: [:some | some < 0 ]'.
	'"The Transcript is a kind of system log"
Transcript open'.
	'#(1 2 3 4) do:
  [:each | Transcript show: each ]' . '#(1 2 3 4) with: #(5 6 7 8)
  do: [:x : y | Transcript show: x+y; cr]'.
	'#(1 2 3 4) select: [:each | each odd ]'.
	'#(1 2 3 4) reject: [:each | each odd ]'.
	'#(1 2 3 4) detect: [:each | each odd ]'.
	'#(1 2 3 4) collect: [:each | each even ]'.
	'#(1 2 3 4) inject: 0
  into: [:sum :each | sum + each]' . '"Blocks are first-class, anonymous functions"
[ :arg | arg factorial ] value: 5'.
	'"Duck Typing Symbols for Blocks"
#factorial value: 5' . 'Symbol>>#value:' . '5 perform: #factorial'.
	'"Exploring the Call Graph"
CallGraph fromFile: ''Calls.txt'''.
	'((CallGraph fromFile: ''Calls.txt'') methods
  select: [ :m | m calls size > 1 ]) size'.
	'((CallGraph fromFile: ''Calls.txt'') methods select: #isPolymorphic)
  collect: [ :each | each -> (each calls collect: #args) asSet ]'}
		do:
			[ :source | aPage addSnippet: (GtCoderSnippet new sourceCode: source) ].
	^ aPage
]

{ #category : #accessing }
SMAForGt class >> callGraphSlideshow [
	"SMAForGt openSlideshowInNewSpace: SMAForGt callGraphSlideshow"

	| show |
	show := GtSlideShow new.
	self addCallGraphTitleTo: show.
	self addCallGraphGettingStartedTo: show.
	self addCallGraphImplementingTo: show.
	self addCallGraphCollectionsAPITo: show.
	"self addCallGraphExplorationTo: show."
	show makeArrowsVisible.
	^ show
]

{ #category : #accessing }
SMAForGt class >> classHierarchyFor: classes [
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
SMAForGt class >> metaclassDemoPlaygroundPage [
	<gtExample>
	<todo: 'Annotate with some explanations'>
	| aPage |
	aPage := GtPlayPage newDefault.
	aPage snippets first sourceCode: '"Snakes and Ladders Demo snippets"
SnakesAndLadders example'.
	{ 'SnakesAndLadders example2'.
	'BoardSquare allSubclasses' . 'SnakeSquare allSubclasses'.
	'SnakeSquare allInstances' . 'SnakeSquare instVarNames'.
	'SnakeSquare back: 5' . 'SnakeSquare selectors' . 'SnakeSquare class selectors'.
	'SnakeSquare canUnderstand: #initializeBack:'.
	'SnakeSquare canUnderstand: #new' . 'SnakeSquare class canUnderstand: #new'}
		do:
			[ :source | aPage addSnippet: (GtCoderSnippet new sourceCode: source) ].
	^ aPage
]

{ #category : #accessing }
SMAForGt class >> methodCodersElementFor: aMethodCollection [
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
SMAForGt class >> openSlideshowInNewSpace: aSlideshow [
	BlSpace new
		title: 'Space';
		extent: 1200 @ 600;
		addChild: aSlideshow makeArrowsVisible create;
		withHalos;
		show
]

{ #category : #accessing }
SMAForGt class >> openSlideshowOverview [
	"SMAForGt openSlideshowOverview"

	| helper container |
	helper := GtHomeSlideShowsSection new.
	container := helper newCardsContainer.
	container
		addChild:
			(helper
				newShowCardWithTitle: 'Callgraph Demo'
				slideshow: [ SMAForGt callGraphSlideshow ]
				description:
					'A quick introduction to Smalltalk and GT using a running example of call graph analysis.').
	"sectionContainer addChild: cardsContainer."
	BlSpace new
		title: 'Space';
		extent: 800 @ 600;
		addChild: container;
		withHalos;
		show
]

{ #category : #accessing }
SMAForGt class >> openSnippetPlaygrounds [
	"SMAForGt openSnippetPlaygrounds"

	| pages spaces |
	pages := {('CallGraph Demo' -> SMAForGt callGraphPlaygroundPage).
	('Reflection Demo' -> SMAForGt reflectionDemoPlaygroundPage).
	('Metaclass Demo' -> SMAForGt metaclassDemoPlaygroundPage)}.
	spaces := pages
		collect: [ :assoc | 
			BlSpace new
				title: assoc key;
				addChild:
					(GtPlaygroundStencil new create removeAllPages addWrapped: assoc value);
				withHalos ].
	GtWorld openWithSpaces: spaces
]

{ #category : #accessing }
SMAForGt class >> reflectionDemoPlaygroundPage [
	<gtExample>
	| aPage |
	aPage := GtPlayPage newDefault.
	aPage snippets first
		sourceCode:
			'| anonClass set point logger |

"Hello World with reflection"
Object subclass: #HelloWorld
  instanceVariableNames: ''''
  classVariableNames: ''''
  category: ''HelloWorld''.
(Smalltalk at: #HelloWorld) compile: ''hello ^ ''''hello''''''.
((Smalltalk at: #HelloWorld) perform: #new) perform: #hello'.
	{'"Hello World without reflection"
HelloWorld new hello' . '"Code metrics"
Collection allSuperclasses' . 'Collection allSelectors'.
	'Collection allInstVarNames' . 'Collection selectors'.
	'Collection instVarNames' . 'Collection subclasses'.
	'Collection allSubclasses' . 'Collection linesOfCode'.
	'"Find implementors in Pharo (in Morphic World)"
SystemNavigation default browseAllImplementorsOf: #,'.
	'"Find implementors in Gt"
#, gtImplementors'.
	'"Find all super-sends in Collection hierarchy"
(Collection withAllSubclasses flatCollect: #methodDict) select: #sendsToSuper'.
	'"Finding super-sends to other methods.
Sending a different message to super is considered a bad smell -- you should send to self instead.
Explore the result and see if you agree."
(CompiledMethod allInstances select: #sendsToSuper)
  select: [ :m | 
    (m sendNodes select:
      [ :send | send isSuperSend and: [ m selector ~= send selector ] ])
    isNotEmpty ]' .
    
    
     '"In case the snippet above fails due to a syntactically incorrect CompiledMethod!"
(CompiledMethod allInstances select: #sendsToSuper)
  select: [ :m | 
    [(m sendNodes select:
      [ :send | send isSuperSend and: [ m selector ~= send selector ] ])
    isNotEmpty] on: Error do: [ false ] ]'.
    
    
    
	'"Accessing the stack"
thisContext inspect. self halt.
"Evaluate the above line. This will open an Inspector and a Debugger. In the Inspector inspect: 
  self stack
Compare the Inspector view with the Debugger view."'.



	'"Halt demo. Illustrates conditional breakpoints."
HaltDemo new foo "does not halt"' . 



'"The breakpoint is only applied if the caller is ''bar''"
HaltDemo new bar "triggers debugger"'.




'"Minimal objects.
Open an Inspector window to see that the point has been replaced by a proxy."
| point |
point := 1@2.
LoggingProxy for: point.
point inspect'.



'"Anonymous classes
CONTINUE HERE"


| anonClass set |
anonClass := Set newAnonymousSubclass.


anonClass
	compile:
		''add: anObject
		Transcript show: ''''adding '''', anObject printString; cr.
		^ super add: anObject''.
set := Set new.
set add: 1.
set primitiveChangeClassTo: anonClass basicNew.
set add: 2




' . 


'"Method wrappers"
| logger |
logger := LoggingMethodWrapper on: Integer>>#factorial.

logger invocationCount.
5 factorial.
logger invocationCount.

logger install.
[ 5 factorial ] ensure: [logger uninstall].
logger invocationCount.

10 factorial.
logger invocationCount.

'}
		do:
			[ :source | aPage addSnippet: (GtCoderSnippet new sourceCode: source) ].
	^ aPage
]

{ #category : #accessing }
SMAForGt >> collectionHierarchy [
	<gtExample>
	^ self class
		classHierarchyFor:
			{Object.
			Collection.
			SequenceableCollection.
			ArrayedCollection.
			Array.
			String.
			ByteString.
			Symbol.
			Text.
			OrderedCollection.
			SortedCollection.
			LinkedList.
			Interval.
			Heap.
			HashedCollection.
			Set.
			Dictionary.
			IdentityDictionary.
			Bag}
]
