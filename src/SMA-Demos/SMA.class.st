"
""Demo scripts for SMA -- Software Modeling and Analysis.
Each of these demo scripts will create a Playground with snippets to run.""

SMA bigFonts.

SMA callGraphDemo.

SMA metaclassDemo.

SMA reflectionDemo.
"
Class {
	#name : #SMA,
	#superclass : #Object,
	#category : #'SMA-Demos'
}

{ #category : #scripts }
SMA class >> bigFonts [
	"Install big fonts for Pharo 5. (Thanks to Andrei Chis. Version 2016-08-12)"

	| pointSize normalFont |
	pointSize := 14.
	normalFont := 'Bitmap DejaVu Sans'.
	"codeFont := 'Source Code Pro'."
	StandardFonts
			setAllStandardFontsTo: (LogicalFont familyName: normalFont pointSize: pointSize);
			haloFont: (LogicalFont familyName: normalFont pointSize: pointSize - 1);
			balloonFont: (LogicalFont familyName: normalFont pointSize: pointSize - 1);
			windowTitleFont: (LogicalFont familyName: normalFont pointSize: pointSize + 1);
			listFont: (LogicalFont familyName: normalFont pointSize: pointSize);
			menuFont: (LogicalFont familyName: normalFont pointSize: pointSize);
			codeFont: (LogicalFont familyName: normalFont pointSize: pointSize)

]

{ #category : #scripts }
SMA class >> callGraphDemo [

	"Drag this to the Pharo 5 image to initialize demo mode and open a workspace of code snippets."
	"NB -- this file uses classic Mac OS linefeeds."

	GTPlayground openContents: '"CallGraph Demo snippets"
| cg callFile |
callFile := FileLocator imageDirectory asFileReference / ''pharo-local/iceberg/onierstrasz/sma-examples/CallGraphDemo/Calls.txt''.
cg := CallGraph new from: callFile contents.
cg calls size.

(CallGraph fromFile: callFile) calls size.

"Collection demo"
#(1 2 3 4) includes: 5.
#(1 2 3 4) size.
#(1 2 3 4) isEmpty.
#(1 2 3 4) contains: [:some | some < 0 ].
#(1 2 3 4) do:
  [:each | Transcript show: each ].
#(1 2 3 4) with: #(5 6 7 8)
  do: [:x : y | Transcript show: x+y; cr].
#(1 2 3 4) select: [:each | each odd ].
#(1 2 3 4) reject: [:each | each odd ].
#(1 2 3 4) detect: [:each | each odd ].
#(1 2 3 4) collect: [:each | each even ].
#(1 2 3 4) inject: 0
  into: [:sum :each | sum + each].

"Creating Calls, Methods and Classes"
(CallGraph fromFile: callFile) methods size.

"Duck Typing Symbols for Blocks"
#factorial value: 5.
[ :arg | arg factorial ] value: 5.

(Symbol>>#value:) browse.

"JClass"
(CallGraph fromFile: callFile) methods size.
(CallGraph fromFile: callFile) classes size.
((CallGraph fromFile: callFile) methods
  select: [ :m | m calls size > 1 ]) size.

((CallGraph fromFile: callFile) methods select: #isPolymorphic)
  collect: [ :each | each -> (each calls collect: #args) asSet ].

' label: 'CallGraph Demo'.

]

{ #category : #scripts }
SMA class >> metaclassDemo [

	"Drag this to the Pharo 5 image to initialize demo mode and open a workspace of code snippets."
	"NB -- this file uses classic Mac OS linefeeds."

	GTPlayground openContents: '"Snakes and Ladders Demo snippets"

SnakesAndLadders example.
SnakesAndLadders example2.

BoardSquare allSubclasses.
SnakeSquare allSubclasses.
SnakeSquare allInstances.
SnakeSquare instVarNames.
SnakeSquare back: 5.
SnakeSquare selectors.
SnakeSquare class selectors.
SnakeSquare canUnderstand: #initializeBack:.
SnakeSquare canUnderstand: #new.
SnakeSquare class canUnderstand: #new.

' label: 'Snakes and Ladders Demo'.

]

{ #category : #scripts }
SMA class >> reflectionDemo [

	"Drag this to the Pharo image to initialize demo mode and open a workspace of code snippets."

	GTPlayground openContents: '| anonClass set point logger |

"Hello World with reflection"
Object subclass: #HelloWorld
  instanceVariableNames: ''''
  classVariableNames: ''''
  category: ''HelloWorld''.
(Smalltalk at: #HelloWorld) compile: ''hello ^ ''''hello''''''.
((Smalltalk at: #HelloWorld) perform: #new) perform: #hello.

"Hello World without reflection"
HelloWorld new hello.

"Code metrics"
Collection allSuperclasses size.
Collection allSelectors size.
Collection allInstVarNames size.
Collection selectors size.
Collection instVarNames size.
Collection subclasses size.
Collection allSubclasses size.
Collection linesOfCode.

"SystemNavigation"
SystemNavigation default browseAllImplementorsOf: #,.

"Find all super-sends in Collection hierarchy"
((Collection withAllSubclasses flatCollect: #methodDict) select: #sendsToSuper) inspect.

"Finding super-sends to other methods"
((CompiledMethod allInstances select: #sendsToSuper)
  select: [ :m | 
    (m sendNodes select:
      [ :send | send isSuperSend and: [ m selector ~= send selector ] ])
    isNotEmpty ]) inspect.

"Accessing the stack"
thisContext inspect. self halt.
"Evaluate the above line, and then in the Inspector run: self stack inspect"

"Halt demo"
HaltDemo new foo. "does not halt"
HaltDemo new bar. "triggers debugger"

"Minimal objects"
point := 1@2.
LoggingProxy for: point.
point.
"inspect to see that the point has been replace by a proxy."

"Anonymous classes"
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
set add: 2.

"Method wrappers"

logger := LoggingMethodWrapper on: Integer>>#factorial.

logger invocationCount.
5 factorial.
logger invocationCount.

logger install.
[ 5 factorial ] ensure: [logger uninstall].
logger invocationCount.

10 factorial.
logger invocationCount.

' label: 'Reflection demo'.


]

{ #category : #scripts }
SMA class >> smallFonts [
	"Install small fonts for Pharo 5. (Thanks to Andrei Chis. Version 2016-08-12)"
	"self smallFonts"

	| pointSize normalFont |
	pointSize := 10.
	normalFont := 'Bitmap DejaVu Sans'.
	"codeFont := 'Source Code Pro'."
	StandardFonts
			setAllStandardFontsTo: (LogicalFont familyName: normalFont pointSize: pointSize);
			haloFont: (LogicalFont familyName: normalFont pointSize: pointSize - 1);
			balloonFont: (LogicalFont familyName: normalFont pointSize: pointSize - 1);
			windowTitleFont: (LogicalFont familyName: normalFont pointSize: pointSize + 1);
			listFont: (LogicalFont familyName: normalFont pointSize: pointSize);
			menuFont: (LogicalFont familyName: normalFont pointSize: pointSize);
			codeFont: (LogicalFont familyName: normalFont pointSize: pointSize)

]
