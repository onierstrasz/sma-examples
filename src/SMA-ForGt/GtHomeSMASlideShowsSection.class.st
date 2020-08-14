"
I offer demo slideshows for Gt instead of Playground snippets for Pharo.

I will be added automatically to the GtHome when this repo is loaded.

Run this to open the overview in a separate window:

[[[
GtHomeSMASlideShowsSection openInSpace
]]]


"
Class {
	#name : #GtHomeSMASlideShowsSection,
	#superclass : #GtHomeSection,
	#category : #'SMA-ForGt-SMA-ForGt'
}

{ #category : #accessing }
GtHomeSMASlideShowsSection class >> openInSpace [
	BlSpace new
		title: 'Space';
		extent: 800 @ 600;
		addChild: GtHomeSMASlideShowsSection new create;
		withHalos;
		show
]

{ #category : #accessing }
GtHomeSMASlideShowsSection >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer
		addChild: (self newSectionTitle: 'Software Modeling and Analysis Slideshows').
	cardsContainer := self newCardsContainer.
	cardsContainer
		addChild:
			(self
				newShowCardWithTitle: 'Callgraph Demo'
				slideshow: [ CallGraphSlideShow new create ]
				description:
					'A quick introduction to Smalltalk and GT using a running example of call graph analysis.').
	cardsContainer
		addChild:
			(self
				newShowCardWithTitle: 'Metaclass Demo'
				slideshow: [ MetaclassDemoSlideShow new create ]
				description:
					'A live demo illustrating Smalltalk''s Metaclass hierarchy with a running example.').
	cardsContainer
		addChild:
			(self
				newShowCardWithTitle: 'Reflection Demo'
				slideshow: [ ReflectionDemoSlideShow new create ]
				description:
					'A live demo of some of the key reflective features of Pharo Smalltalk.').
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
