"
I represent a board in the Puissance 4 game.
"
Class {
	#name : #P4Board,
	#superclass : #Object,
	#instVars : [
		'rows',
		'columns',
		'cells'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #'finding/searching' }
P4Board >> cellAtRow: row column: col [
        ^ cells at: row at: col

]

{ #category : #accessing }
P4Board >> cells [

	^ cells
]

{ #category : #accessing }
P4Board >> columns [

	^ 7
]

{ #category : #'finding/searching' }
P4Board >> findEmptyRowInColumn: col [
	"Trouve la première rangée vide dans une colonne donnée."

	(rows to: 1 by: -1) do: [ :row |
		(self cellAtRow: row column: col) isTransparent ifTrue: [ ^ row ] ].
	^ nil
]

{ #category : #initialization }
P4Board >> initialize [

	cells := Array2D
		         rows: rows
		         columns: columns
		         tabulate: [ :row :column | Color white ]
]

{ #category : #accessing }
P4Board >> rows [

	^ 6
]

{ #category : #'finding/searching' }
P4Board >> setCellColor: aColor atRow: row column: col [
	"Définit la couleur d'une cellule à une certaine position."

	cells at: row at: col put: aColor
]
