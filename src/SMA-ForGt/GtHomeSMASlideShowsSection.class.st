Class {
	#name : #GtHomeSMASlideShowsSection,
	#superclass : #GtHomeSection,
	#category : #'SMA-ForGt-SMA-ForGt'
}

{ #category : #accessing }
GtHomeSMASlideShowsSection >> create [
	<gtHomeSection>
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Slideshows').
	cardsContainer := self newCardsContainer.
	cardsContainer
		addChild:
			(self
				newShowCardWithTitle: 'Pharo 101 Demo'
				slideshow: [ GtPharo101 new create ]
				description: 'The basics of Pharo and Gt.').
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
