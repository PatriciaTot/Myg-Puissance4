"
I represent a board in the Puissance 4 game.


Yes we know we are not really using well the board API
"
Class {
	#name : #P4Game,
	#superclass : #MygBoard,
	#instVars : [
		'magnifier',
		'players',
		'currentPlayer',
		'cells',
		'gameEnded'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #adding }
P4Game >> addCell: aCell [

	cells add: aCell
]

{ #category : #'managing players' }
P4Game >> addPlayer: aP4Player [

	players add: aP4Player.

]

{ #category : #testing }
P4Game >> canPlay: aNumber [

	^ (self isColumnFull: (self grid atColumn: 1))
]

{ #category : #accessing }
P4Game >> cellAt: x at: y [

	^ grid at: x @ y
]

{ #category : #'managing players' }
P4Game >> currentPlayer [

	^ currentPlayer
]

{ #category : #'as yet unclassified' }
P4Game >> findEmptyCell: aColumnCells [

	| current |
	current := 1.

	[
	(aColumnCells at: current) isOccupied | (current = aColumnCells size) ]
		whileFalse: [ current := current + 1 ].
	current = aColumnCells size ifTrue: [ ^ aColumnCells at: current ].
	^ aColumnCells at: current - 1
]

{ #category : #accessing }
P4Game >> height [

	^ grid height
]

{ #category : #initialization }
P4Game >> initialize [

	super initialize.
	gameEnded := false.
	players := OrderedCollection new.
	cells := OrderedCollection new.
	self setPlayers.
	self configureGrid: (CTNewArray2D
			 width: 7
			 height: 6
			 tabulate: [ :column :row | P4Cell new ]).
	self setCells.
	currentPlayer := players at: 1
]

{ #category : #testing }
P4Game >> isColumnFull: aCollection [ 
	
	^ aCollection first isOccupied 
]

{ #category : #accessing }
P4Game >> magnifier [

	^ magnifier
]

{ #category : #accessing }
P4Game >> magnifier: aNumber [

	magnifier := aNumber
]

{ #category : #accessing }
P4Game >> numberOfPlayers [

^ players size
]

{ #category : #'as yet unclassified' }
P4Game >> playTurn: aNumber [

	| selectedCase |
	(self canPlay: 1)
		ifTrue: [ ^ false ]
		ifFalse: [
			selectedCase := self findEmptyCell: (self selectColumnAt: aNumber).
			currentPlayer color = Color red ifTrue: [ selectedCase playerOne ].
			currentPlayer color = Color yellow ifTrue: [
				selectedCase playerTwo ].
			self removeOneToken.
			self switchToNextPlayer.
			^ true ]
]

{ #category : #accessing }
P4Game >> players [

	^ players
]

{ #category : #removing }
P4Game >> removeOneToken [
	"Decrements the tokens by 1 if the player has tokens left."

	| tokens |
	self halt.
	tokens := currentPlayer tokens.
	tokens > 0 ifTrue: [ tokens := tokens - 1 ]
]

{ #category : #'as yet unclassified' }
P4Game >> selectColumnAt: aNumber [

	^ grid atColumn: aNumber
]

{ #category : #'as yet unclassified' }
P4Game >> setCells [

	grid do: [ :each |
		 self addCell: each  ]
]

{ #category : #'managing players' }
P4Game >> setPlayers [

self addPlayer: self class player1.
	self addPlayer: self class player2.
]

{ #category : #'managing players' }
P4Game >> switchToNextPlayer [

	| currentIndex nextIndex |
    currentIndex := players indexOf: currentPlayer.
    nextIndex := (currentIndex = players size) ifTrue: [1] ifFalse: [currentIndex + 1].
    currentPlayer := players at: nextIndex.
]

{ #category : #accessing }
P4Game >> width [

	^ grid width
]
