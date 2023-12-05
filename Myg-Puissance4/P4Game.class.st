"
I represent a board in the Puissance 4 game.
"
Class {
	#name : #P4Game,
	#superclass : #MygBoard,
	#instVars : [
		'cells',
		'magnifier'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #creating }
P4Game class >> createWithMatrix: aMatrix [

	^ self new
		  configureGrid: aMatrix;
		  yourself
]

{ #category : #creating }
P4Game class >> matrix6x7 [

	^ self createWithMatrix: (CTNewArray2D
			   width: 6
			   height: 7
			   tabulate: [ :column :row | P4Cell new ])
]

{ #category : #adding }
P4Game >> addCell: aCell [

	cells add: aCell
]

{ #category : #accessing }
P4Game >> at: anInteger at: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #accessing }
P4Game >> at: anInteger at: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #accessing }
P4Game >> atColumn: anInteger atRow: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #accessing }
P4Game >> atColumn: anInteger atRow: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #accessing }
P4Game >> atPosition: aCpPositionable [

	^ grid at: aCpPositionable x @ aCpPositionable y
]

{ #category : #accessing }
P4Game >> configureGrid: aCTNewArray2D [

	super configureGrid: aCTNewArray2D.
	self
		setCells
]

{ #category : #accessing }
P4Game >> height [

	^ grid height
]

{ #category : #initialization }
P4Game >> initialize [

	super initialize.
	cells := OrderedCollection new
]

{ #category : #accessing }
P4Game >> magnifier [

	^ magnifier
]

{ #category : #accessing }
P4Game >> magnifier: aNumber [

	magnifier := aNumber
]

{ #category : #initialization }
P4Game >> setCells [

	grid do: [ :each |
		each isP4Cell ifTrue: [ self addCell: each ] ]
]

{ #category : #accessing }
P4Game >> width [

	^ grid width
]
