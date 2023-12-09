"
I reprensent a cell in puissance 4 game.
"
Class {
	#name : #P4Cell,
	#superclass : #MygAbstractBox,
	#instVars : [
		'color'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #accessing }
P4Cell >> color [

	^ color
]

{ #category : #accessing }
P4Cell >> color: anObject [

	color := anObject
]

{ #category : #initialization }
P4Cell >> initialize [

	super initialize.
	color := Color white
]

{ #category : #testing }
P4Cell >> isOccupied [

	 ^ color ~= Color white
]

{ #category : #accessing }
P4Cell >> playerOne [

	color := Color red
]

{ #category : #accessing }
P4Cell >> playerTwo [

	color := Color yellow
]

{ #category : #initialization }
P4Cell >> setPlayer: aP4Player [

	self color: aP4Player color
]
