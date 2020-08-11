"
I am the Pharo CallGraph demo, migrated to work with Gt.

I show students how Smalltalk, Pharo and Gt can be leveraged to quickly develop a simple CallGraph analyzer.

[[[
CallGraphSlideShow new openInSpace
]]]


"
Class {
	#name : #CallGraphSlideShow,
	#superclass : #SMASlideshowStencil,
	#category : #'SMA-ForGt-SMA-ForGt'
}

{ #category : #accessing }
CallGraphSlideShow >> addCallGraphCollectionsAPITo: show [
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'Modeling Calls, Methods and Classes.');
				newText:
					'We want to build up a Call object for each line of the log. To do this, we need some help from the Collection classes.';
				newTextWithFormat: (self nb: 'How to fix alignment?');
				element: [ ((GtMethodCoder forMethod: CallGraph >> #initializeFrom:)
						expanded: true) asElement ];
				elementWeight: 0.5).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'The Collection Hierarchy');
				newText:
					'The most important collections classes to remember are OrderedCollection, Array, String, Symbol and Dictionary';
				newTextWithFormat:
					(self
						nb:
							'When the mondrian is embedded this way I cannot click on the classes and navigate to the Code. How can I embed this in sliding panes, without using a snippet?');
				element: [ self collectionHierarchy asElement ];
				elementWeight: 0.75).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'The Collection API');
				newText: 'All collections provide acommon API, which should be mostly obvious';
				element: [ GtPlaygroundSlide new
						snippets:
							{'#(1 2 3 4) includes: 5' . '#(1 2 3 4) size' . '#(1 2 3 4) isEmpty not'.
							'#(1 2 3 4) contains: [:some | some < 0 ]'.
							'#(1 2 3 4) asOrderedCollection'};
						asElement ];
				elementWeight: 0.75).
	show
		addSlide:
			(GtTextAndElementSlide new
				newText:
					'select: and reject: return subcollections that match the block (or not).';
				newText: 'detect: returns the first matching value.';
				newText: 'collect: applies a transformation.';
				newText:
					'inject:into: is a "fold" operation, suitable for computing sums or products.';
				element: [ GtPlaygroundSlide new
						snippets:
							{'#(1 2 3 4) select: [:each | each odd ]'.
							'#(1 2 3 4) reject: [:each | each odd ]'.
							'#(1 2 3 4) detect: [:each | each odd ]'.
							'#(1 2 3 4) collect: [:each | each even ]'.
							'#(1 2 3 4) inject: 0
into: [:sum :each | sum + each]'};
						asElement ];
				elementWeight: 0.75).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'Blocks');
				newText: 'Blocks are first-class, anonymous functions ("valuable" objects).';
				newText:
					'Note how Symbols like #factorial behave like 1-argument blocks by implementing the #value: method.';
				element: [ GtPlaygroundSlide new
						snippets:
							{'5 factorial' . '[ :arg | arg factorial ] value: 5'.
							'#factorial value: 5' . 'Symbol>>#value:' . '5 perform: #factorial'};
						asElement ];
				elementWeight: 0.75) . show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'Booleans');
				newText: 'A Boolean is simply an object that can choose between two alternatives.';
				newText: 'true and false are just the unique instances of the classes True and False.';
				element: [ GtPlaygroundSlide new
						snippets:
							{'(11 factorial + 1) isPrime
  ifTrue: [ ''yes'' ]
  ifFalse: [ ''no'' ]'.
  'Boolean subclasses'.
  'Boolean>>#ifTrue:ifFalse:'.
 'True>>#ifTrue:ifFalse:'.
 'False>>#ifTrue:ifFalse:'.
  'Boolean>>#not'
  
  
  
  };
						asElement ];
				elementWeight: 0.75)
]

{ #category : #accessing }
CallGraphSlideShow >> addCallGraphExplorationTo: show [ 

	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading:'Exploring the Call Graph');
				newTextWithFormat: (self nb: 'still working here ...');
				element: [ GtPlaygroundSlide new
						snippets:
							{'CallGraph fromFile: ''Calls.txt''' . '((CallGraph fromFile: ''Calls.txt'') methods
select: [ :m | m calls size > 1 ]) size'.
							'((CallGraph fromFile: ''Calls.txt'') methods select: #isPolymorphic)
collect: [ :each | each -> (each calls collect: #args) asSet ]'};
						asElement ]).
]

{ #category : #accessing }
CallGraphSlideShow >> addCallGraphGettingStartedTo: show [
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'Getting started.');
				newText: 'You can download Gt from https://gtoolkit.com/download/';
				newText:
					'Evaluate the two snippets to load this project from github, and instantiate this slideshow';
				newTextWithFormat: (self nb: 'How can I format the URL to be a live link?');
				element: [ GtPlaygroundSlide new
						snippets:
							{'Metacello new baseline: ''SMAForGt''; repository: ''github://onierstrasz/sma-examples/src''; load.'.
							'SMAForGt openSlideshowsOverview'};
						asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'The Playground.');
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
				newTextWithFormat: (self heading: 'Opening a file');
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
				newTextWithFormat: (self heading: 'Navigating to implementors and sender' );
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
				newTextWithFormat: (self heading: 'Navigating to classes' );
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
CallGraphSlideShow >> addCallGraphImplementingTo: show [
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
CallGraphSlideShow >> addCallGraphTitleTo: show [
	show
		addSlide:
			(GtTitleSlide new
				titleText: ('CallGraph Demo' asRopedText fontSize: 70))
]

{ #category : #accessing }
CallGraphSlideShow >> callGraphSlideshow [
	"SMAForGt openSlideshowInNewSpace: SMAForGt callGraphSlideshow"

	| show |
	show := GtSlideShow new.
	self addCallGraphTitleTo: show.
	self addCallGraphGettingStartedTo: show.
	self addCallGraphImplementingTo: show.
	self addCallGraphCollectionsAPITo: show.
	self addCallGraphExplorationTo: show.
	show makeArrowsVisible.
	^ show
]

{ #category : #accessing }
CallGraphSlideShow >> collectionHierarchy [
	<gtExample>
	^ self 
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

{ #category : #accessing }
CallGraphSlideShow >> create [
	"SMAForGt openSlideshowInNewSpace: SMAForGt callGraphSlideshow"

	| show |
	show := GtSlideShow new.
	self addCallGraphTitleTo: show.
	self addCallGraphGettingStartedTo: show.
	self addCallGraphImplementingTo: show.
	self addCallGraphCollectionsAPITo: show.
	self addCallGraphExplorationTo: show.
	show makeArrowsVisible.
	^ show
]
