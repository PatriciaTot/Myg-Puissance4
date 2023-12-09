"
I am the Puissance 4 game visual board.

"
Class {
	#name : #P4GameElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'Myg-Puissance4-UI'
}

{ #category : #creating }
P4GameElement class >> launchPuissance4 [

	^ self withMatrix6x7WithMagnifier: 1
]

{ #category : #'api - opening' }
P4GameElement class >> openWithModel: aModel [

	^ self openWithModel: aModel withMagnifier: 0.5
]

{ #category : #'api - opening' }
P4GameElement class >> openWithModel: aModel withMagnifier: aNumber [

	| aGameElement space |
	space := BlSpace new.
	aGameElement := self new
		                game: (aModel magnifier: aNumber);
		                yourself.

	space root addChild: aGameElement.

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: aGameElement extent.
	space resizable: false.
	space show.
	^ space
]

{ #category : #accessing }
P4GameElement >> game [

	^ game
]

{ #category : #accessing }
P4GameElement >> game: aP4Game [

	game := aP4Game.
	self padding: (BlInsets all: 5 * game magnifier).
	self layout columnCount: game width.
	game grid do: [ :aCell |
		| cellElement |
		cellElement := (P4CellElement createWithCell: aCell)
			               board: aP4Game;
			               positionInBoard: aCell position.
		self addChild: cellElement ]
]

{ #category : #initialization }
P4GameElement >> initialize [

	super initialize.

	self background: (BlBackground paint: (Color r: 0 g: 0 b: 200)).
	self layout: (BlGridLayout horizontal cellSpacing: 25).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]
