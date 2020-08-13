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
SMAForGt class >> openSlideshowOverview [
	"SMAForGt openSlideshowOverview"

	| helper container |
	helper := GtHomeSlideShowsSection new.
	container := helper newCardsContainer.
	container
		addChild:
			(helper
				newShowCardWithTitle: 'Pharo 101 Demo'
				slideshow: [ GtPharo101 new create ]
				description: 'The basics of Pharo and Gt.').
	container
		addChild:
			(helper
				newShowCardWithTitle: 'Callgraph Demo'
				slideshow: [ CallGraphSlideShow new create ]
				description:
					'A quick introduction to Smalltalk and GT using a running example of call graph analysis.').
	container
		addChild:
			(helper
				newShowCardWithTitle: 'Metaclass Demo'
				slideshow: [ MetaclassDemoSlideShow new create ]
				description:
					'A live demo illustrating Smalltalk''s Metaclass hierarchy with a running example.').
	container
		addChild:
			(helper
				newShowCardWithTitle: 'Reflection Demo'
				slideshow: [ ReflectionDemoSlideShow new create ]
				description:
					'A live demo of some of the key reflective features of Pharo Smalltalk.').
	BlSpace new
		title: 'Space';
		extent: 800 @ 600;
		addChild: container;
		withHalos;
		show
]
