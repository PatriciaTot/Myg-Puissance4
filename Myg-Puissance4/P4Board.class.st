"
I represent a board in the Puissance 4 game.
"
Class {
	#name : #P4Board,
	#superclass : #MygBoard,
	#instVars : [
		'magnifier'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #'finding/searching' }
P4Board >> cellAtRow: row column: col [
        ^ cells at: row at: col

]

{ #category : #'finding/searching' }
P4Board >> findEmptyRowInColumn: col [
	"Trouve la première rangée vide dans une colonne donnée."

	(rows to: 1 by: -1) do: [ :row |
		(self cellAtRow: row column: col) isTransparent ifTrue: [ ^ row ] ].
	^ nil
]

{ #category : #accessing }
P4Board >> height [

	^ grid height
]

{ #category : #'finding/searching' }
P4Board >> setCellColor: aColor atRow: row column: col [
	"Définit la couleur d'une cellule à une certaine position."

	cells at: row at: col put: aColor
]

{ #category : #accessing }
P4Board >> width [

	^ grid width
]
