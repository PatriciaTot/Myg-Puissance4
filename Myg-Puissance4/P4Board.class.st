"
I represent a board in the Puissance 4 game.
"
Class {
	#name : #P4Board,
	#superclass : #MygBoard,
	#instVars : [
		'cells'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #creating }
P4Board class >> createWithMatrix: aMatrix [

	^ self new
		  configureGrid: aMatrix;
		  yourself
]

{ #category : #creating }
P4Board class >> matrix6x7 [

	^ self createWithMatrix: (CTNewArray2D
			   width: 6
			   height: 7
			   tabulate: [ :column :row | P4Cell new ])
]

{ #category : #adding }
P4Board >> addCell: aCell [

	cells add: aCell
]

{ #category : #accessing }
P4Board >> at: anInteger at: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #accessing }
P4Board >> at: anInteger at: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #accessing }
P4Board >> atColumn: anInteger atRow: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #accessing }
P4Board >> atColumn: anInteger atRow: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #accessing }
P4Board >> atPosition: aCpPositionable [

	^ grid at: aCpPositionable x @ aCpPositionable y
]

{ #category : #accessing }
P4Board >> configureGrid: aCTNewArray2D [

	super configureGrid: aCTNewArray2D.
	self
		setCells
]

{ #category : #accessing }
P4Board >> height [

	^ grid height
]

{ #category : #initialization }
P4Board >> initialize [

	super initialize.
	cells := OrderedCollection new
]

{ #category : #initialization }
P4Board >> setCells [

	grid do: [ :each |
		each isP4Cell ifTrue: [ self addCell: each ] ]
]

{ #category : #accessing }
P4Board >> width [

	^ grid width
]
