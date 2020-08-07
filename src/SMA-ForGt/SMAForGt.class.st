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
	aPage title: 'CallGraph Demo snippets'.
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
SMAForGt class >> openSnippetPlaygrounds [
	| pages spaces |
	pages := {('CallGraph Demo' -> SMAForGt callGraphPlaygroundPage)}.
	spaces := pages
		collect: [ :assoc | 
			BlSpace new
				title: assoc key;
				addChild:
					(GtPlaygroundStencil new create removeAllPages addWrapped: assoc value);
				withHalos ].
	GtWorld openWithSpaces: spaces
]