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

{ #category : #'private - menu building' }
P4GameElement class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar
		background: Color veryVeryLightGray;
		border: (BlBorder paint: Color veryDarkGray).
	^ bar
]
