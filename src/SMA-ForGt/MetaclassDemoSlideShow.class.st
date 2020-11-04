"
I am a live demo illustrating how the Metaclass hierarchy is constructed in Smalltalk, using a running example of a Snakes and Ladders game.

[[[
MetaclassDemoSlideShow new openInSpace
]]]


"
Class {
	#name : #MetaclassDemoSlideShow,
	#superclass : #SMASlideshowStencil,
	#category : #'SMA-ForGt-Slideshows'
}

{ #category : #accessing }
MetaclassDemoSlideShow >> create [
	| show |
	show := GtSlideShow new.
	show
		addSlide: (GtTitleSlide new titleText: (self title: 'Metaclass Demo')).
	show
		addSlide:
			(GtTextSlide new
				newText: 'These slides accompany the course "Software Modeling and Analysis". http://scg.unibe.ch/teaching/sma').
	show
		addSlide: (GtTitleSlide new titleText: (self subtitle: 'Snakes and Ladders')).
	show
		addSlide:
			(GtLabelAndElementSlide new
				newTextWithFormat: (self heading: 'The Snakes and Ladders class hierarchy');
				element: [ (GtInspector createOn: self snakesAndLaddersClassHierarchy)
						maximized ]).
	show
		addSlide:
			(GtLabelAndElementSlide new
				newTextWithFormat:
					(self heading: 'Playing the Snakes and Ladders Game in the Playground');
				newText:
					'Inspect the first snippet in the "Print" tab to initialize and view a new game. Then repeatedly inspect the second snippet to see the effect of playing a move.';
				element: [ GtPlaygroundSlide new
						snippets:
							{'game := SnakesAndLadders example2' . 'game playOneMove, Character cr asString, game printString'};
						asElement ]).
	show
		addSlide:
			(GtTitleSlide new
				titleText: (self subtitle: 'Metaclasses in 7 points')).
	show
		addSlide:
			(GtLabelAndElementSlide new
				newTextWithFormat: (self heading: 'Classes and Metaclasses');
				newText:
					'Here we see clearly two parallel hierarchies. The classes on the left are all instances of the classes on the right, each of which is an instance of Metaclass.';
				element: [ (GtInspector createOn: self snakesClassAndMetaclassHierarchy)
						maximized ]).
	show makeArrowsVisible.
	^ show
]

{ #category : #accessing }
MetaclassDemoSlideShow >> snakesAndLaddersClassHierarchy [
	^ self
		classHierarchyFor:
			({SnakesAndLadders.
			GamePlayer} asOrderedCollection
				addAll: BoardSquare withAllSubclasses;
				addAll: Die withAllSubclasses;
				yourself)
]

{ #category : #accessing }
MetaclassDemoSlideShow >> snakesClassAndMetaclassHierarchy [
	^ self
		classHierarchyFor:
			{Object.
			BoardSquare.
			SnakeSquare.
			Behavior.
			ClassDescription.
			Class.
			Object class.
			BoardSquare class.
			SnakeSquare class.
			Behavior class.
			ClassDescription class.
			Class class.
			Metaclass.
			Metaclass class} asOrderedCollection
]
