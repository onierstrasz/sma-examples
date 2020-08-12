"
I show some typical examples of how to create slides.
"
Class {
	#name : #ExampleSlideShow,
	#superclass : #SMASlideshowStencil,
	#category : #'SMA-ForGt-SMA-ForGt'
}

{ #category : #accessing }
ExampleSlideShow >> create [
	| show |
	show := GtSlideShow new.
	show
		addSlide: (GtTitleSlide new titleText: ('Title slide' asRopedText fontSize: 70)).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'Slide with Text and Playground snippets.');
				newText: 'You can adjust the space for the element between 0 and 1.';
				element: [ GtPlaygroundSlide new
						snippets: {'3 + 4' . '''Hello world'''};
						asElement ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('Embedding a full Class Coder' asRopedText fontSize: 36);
				element: [ (GtCoder forClass: Boolean) createInPager maximized ];
				elementWeight: 0.6).
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: ('New method definitions' asRopedText fontSize: 36);
				newText:
					'These method definitions must be accepted before they will be compiled.';
				element: [ self
						methodCoderForClass: Object
						withSources: {'foo ^ ''foo''' . 'bar ^ ''bar'''} ];
				elementWeight: 0.6).
					show
		addSlide:
			(GtLabelAndElementSlide new
				newTextWithFormat: (self heading: 'A Class Hierarchy');
				newText: 'Note that diagram is live, so you can click on the classes.';
				newText:
					'This example also shows how to embed a full Inspector on a given object.';
				element:
						[ (GtInspector createOn: ((self classHierarchyFor:(Boolean withAllSubclasses) ))) maximized ]).
	show makeArrowsVisible.
	^ show
]
