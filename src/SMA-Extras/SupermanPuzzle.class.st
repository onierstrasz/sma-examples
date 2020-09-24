"
I am a puzzle about how self and super work.

[[[
SupermanPuzzle new openInSpace
]]]


"
Class {
	#name : #SupermanPuzzle,
	#superclass : #SMASlideshowStencil,
	#category : #'SMA-Extras'
}

{ #category : #accessing }
SupermanPuzzle >> create [
	"SupermanPuzzle new openInSpace"

	| show |
	show := GtSlideShow new.
	show
		addSlide:
			(GtTextAndElementSlide new
				newTextWithFormat: (self heading: 'Understanding self & super');
				newText:
					'Inspect the code of the methods called "self" and "super" in the class "Man" and its subclass "Superman".';
				newText:
					'Can you figure out what each snippet will return without evaluating it?';
				element: [ GtPlaygroundSlide new
						snippets:
							{'man := Man new.
superman := Superman new.'.
							'man self' . 'superman self' . 'man super' . 'superman super'};
						asElement ];
				elementWeight: 0.7).
	show makeArrowsVisible.
	^ show
]
