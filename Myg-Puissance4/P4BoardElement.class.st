Class {
	#name : #P4BoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board'
	],
	#category : #'Myg-Puissance4-UI'
}

{ #category : #accessing }
P4BoardElement >> board [

	^ board
]

{ #category : #accessing }
P4BoardElement >> board: anObject [

	board := anObject
]

{ #category : #initialization }
P4BoardElement >> initialize [

	super initialize.

	self background: (BlBackground paint: Color gray darker).
	self layout: (BlGridLayout horizontal cellSpacing: 20).

	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ]
]
