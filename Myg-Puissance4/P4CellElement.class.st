"
UI of the cells.
"
Class {
	#name : #P4CellElement,
	#superclass : #BlElement,
	#instVars : [
		'cell',
		'board',
		'positionInBoard'
	],
	#category : #'Myg-Puissance4-UI'
}

{ #category : #accessing }
P4CellElement >> board [

	^ board
]

{ #category : #accessing }
P4CellElement >> board: aP4Game [

	board := aP4Game.
	self size: 70 @ 70 * aP4Game magnifier
]

{ #category : #accessing }
P4CellElement >> cell [

	^ cell
]

{ #category : #accessing }
P4CellElement >> cell: anObject [

	cell := anObject
]

{ #category : #accessing }
P4CellElement >> color: aColor [

self background: aColor
]

{ #category : #initialization }
P4CellElement >> initialize [

	super initialize.
	self geometry: BlCircleGeometry new. 

	self clipChildren: false
]

{ #category : #accessing }
P4CellElement >> positionInBoard [

	^ positionInBoard
]

{ #category : #accessing }
P4CellElement >> positionInBoard: aPoint [

	positionInBoard := aPoint
]
