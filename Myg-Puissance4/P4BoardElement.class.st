"
I represent the board in Puissance 4 game.
"
Class {
	#name : #P4BoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board'
	],
	#category : #'Myg-Puissance4-UI'
}

{ #category : #'instance creation' }
P4BoardElement class >> launchPuissance4 [

	^ self withMatrixForBoard
]

{ #category : #'instance creation' }
P4BoardElement class >> openWithModel: aModel [

	^ self openWithModel: aModel
]

{ #category : #'instance creation' }
P4BoardElement class >> withMatrixForBoard [

	^ self openWithModel: P4Board matrix6x7
]

{ #category : #accessing }
P4BoardElement >> board [

	^ board
]

{ #category : #accessing }
P4BoardElement >> board: aP4Board [

	self padding: (BlInsets all: 5 * board magnifier).
	self layout columnCount: board width.
]

{ #category : #initialization }
P4BoardElement >> initialize [

	super initialize.

	self background: (BlBackground paint: Color veryVeryLightGray).
	self layout: (BlGridLayout horizontal cellSpacing: 5).
	self constraintsDo: [ :aLayoutConstraints | 
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]
