"
I offer Playground snippet creator just for Gt, not plain Pharo.
"
Class {
	#name : #SMAForGt,
	#superclass : #Object,
	#category : #'SMA-ForGt'
}

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
SMAForGt class >> openSnippetPlaygrounds [
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



	'"Finding super-sends to other methods"
(CompiledMethod allInstances select: #sendsToSuper)
  select: [ :m | 
    (m sendNodes select:
      [ :send | send isSuperSend and: [ m selector ~= send selector ] ])
    isNotEmpty ]' . 
    
    
    
    
    '"Accessing the stack"
thisContext inspect. self halt.
"Evaluate the above line, and then in the Inspector run: self stack inspect"'.
	'"Halt demo"
HaltDemo new foo. "does not halt"' . 'HaltDemo new bar. "triggers debugger"'.
	'"Minimal objects"
point := 1@2.
LoggingProxy for: point.
point.
"inspect to see that the point has been replace by a proxy."'.
	'"Anonymous classes"
Transcript open.
anonClass := Class new.
anonClass
	superclass: Set;
	setFormat: Set format.
anonClass
	compile:
		''add: anObject
		Transcript show: ''''adding '''', anObject printString; cr.
		^ super add: anObject''.
set := Set new.
set add: 1.
set primitiveChangeClassTo: anonClass basicNew.
set add: 2' . '"Method wrappers"

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
