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

{ #category : #accessing }
P4Board >> cells [

	^ cells
]

{ #category : #accessing }
P4Board >> columns [

	^ 7
]

{ #category : #initialization }
P4Board >> initialize [

	cells := Array2D
		         rows: rows
		         columns: columns
		         "tabulate: [ :row :column | Color veryVeryDarkGray ]"
]

{ #category : #accessing }
P4Board >> rows [

	^ 6
]
