"
I am a live slideshow containing examples of typical kinds of slides.

[[[
GtLiveSlideExamples openInSpace
]]]

TODO: Migrate the rest from ${class:name=GtSlideShowExamples}$.

"
Class {
	#name : #GtLiveSlideExamples,
	#superclass : #Object,
	#category : #'SMA-ForGt-Slideshows'
}

{ #category : #accessing }
GtLiveSlideExamples class >> openInSpace [
	BlSpace new
		title: self name asString;
		extent: 1200 @ 600;
		addChild: (GtLiveShow createWithArrowsVisible: self new) create;
		withHalos;
		show
]

{ #category : #accessing }
GtLiveSlideExamples >> textAndPlaygroundSnippetsFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 2;
		newTextWithFormat: ('Slide with Text and Playground snippets.' asRopedText fontSize: 36);
		newText: 'You can adjust the space for the element between 0 and 1.';
		element: [ GtPlaygroundLiveSlide new
				snippets: {'3 + 4' . '''Hello world'''};
				asElement ];
		elementWeight: 0.5
]

{ #category : #accessing }
GtLiveSlideExamples >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat:
			('Title slide' asRopedText
				fontSize: 80;
				glamorousRegularFont;
				bold;
				yourself);
		subtitleWithFormat:
			('With subtitle' asRopedText
				fontSize: 50;
				glamorousRegularFont;
				thin)
]
