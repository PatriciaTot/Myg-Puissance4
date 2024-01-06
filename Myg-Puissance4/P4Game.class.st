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
		'gameEnded',
		'emptyCellPosition'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #adding }
P4Game >> addCell: aCell [

	cells add: aCell
]

{ #category : #adding }
P4Game >> addPlayer: aP4Player [

	players add: aP4Player.

]

{ #category : #testing }
P4Game >> canPlay: aNumber [

	^ (self isColumnFull: (self grid atColumn: aNumber) )not
]

{ #category : #accessing }
P4Game >> cellAt: aColumn at: aRow [

	^ grid atColumn: aColumn atRow: aRow
]

{ #category : #testing }
P4Game >> checkForAlignments [
	"Check for all three types of alignments: horizontal, vertical, and diagonal"

	(self hasHorizontalAlignment or: [
		 self hasVerticalAlignment or: [ self hasDiagonalAlignment ] ])
		ifTrue: [ self endGame ]
]

{ #category : #'managing cells' }
P4Game >> clickOnColumn: aColumn [
	| selectedCell |
	selectedCell := self findEmptyCell: (self selectColumnAt: aColumn).
	self playTokenInSelectedCell: selectedCell.
	emptyCellPosition := aColumn @ selectedCell position y

	
]

{ #category : #'managing players' }
P4Game >> currentPlayer [

	^ currentPlayer
]

{ #category : #accessing }
P4Game >> emptyCellPosition [
    ^ emptyCellPosition
]

{ #category : #'managing cells' }
P4Game >> findEmptyCell: aColumnCells [
    "Find the first empty cell from the bottom in a column."

    | current |
    current := aColumnCells size.

    [ (aColumnCells at: current) isOccupied ] 
        whileTrue: [ 
            current := current - 1.
            current < 1 ifTrue: [ ^ nil ] ].

    ^ aColumnCells at: current.

]

{ #category : #accessing }
P4Game >> gameEnded [

	^ gameEnded
]

{ #category : #accessing }
P4Game >> gameEnded: aBoolean [

	gameEnded := aBoolean
]

{ #category : #testing }
P4Game >> hasDiagonalAlignment [
	"Check if there is a diagonal alignment of 4 same colors."

	| currentColor |
	currentColor := currentPlayer color.

	"Check for diagonal alignment from bottom-left to top-right."
	1 to: self height - 3 do: [ :row |
		1 to: self width - 3 do: [ :col |
			| color1 color2 color3 color4 |
			color1 := (self cellAt: col at: row) color.
			color2 := (self cellAt: col + 1 at: row + 1) color.
			color3 := (self cellAt: col + 2 at: row + 2) color.
			color4 := (self cellAt: col + 3 at: row + 3) color.

			(color1 = currentColor and: [
				 color2 = currentColor and: [
					 color3 = currentColor and: [ color4 = currentColor ] ] ])
				ifTrue: [ ^ true ] ] ].

	"Check for diagonal alignment from top-left to bottom-right."
	4 to: self height do: [ :row |
		1 to: self width - 3 do: [ :col |
			| color1 color2 color3 color4 |
			color1 := (self cellAt: col at: row) color.
			color2 := (self cellAt: col + 1 at: row - 1) color.
			color3 := (self cellAt: col + 2 at: row - 2) color.
			color4 := (self cellAt: col + 3 at: row - 3) color.

			(color1 = currentColor and: [
				 color2 = currentColor and: [
					 color3 = currentColor and: [ color4 = currentColor ] ] ])
				ifTrue: [ ^ true ] ] ].

	^ false
]

{ #category : #testing }
P4Game >> hasHorizontalAlignment [

	| consecutiveCount currentColor |
	consecutiveCount := 0.
	currentColor := currentPlayer color.

	1 to: self height do: [ :row |
		1 to: self width do: [ :col |
			consecutiveCount := (grid at: col @ row) color = currentColor
				                    ifTrue: [ consecutiveCount + 1 ]
				                    ifFalse: [ 0 ].

			consecutiveCount >= 4 ifTrue: [ ^ true ] ] ].

	^ false
]

{ #category : #testing }
P4Game >> hasVerticalAlignment [
    "Check if there is a vertical alignment of 4 same colors."

    | consecutiveCount currentColor |
    consecutiveCount := 0.
    currentColor := currentPlayer color.

    1 to: self width do: [ :column |
        1 to: self height do: [ :row |
            consecutiveCount := (self cellAt: column at: row) color = currentColor
                                    ifTrue: [ consecutiveCount + 1 ]
                                    ifFalse: [ 0 ].

            consecutiveCount >= 4 ifTrue: [ ^ true ] ] ].

    ^ false

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
	currentPlayer := players at: 1.
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

{ #category : #playing }
P4Game >> playTokenInSelectedCell: aCell [
	"Plays a token in a cell based on the current player's color."

	aCell color: currentPlayer color.
	self removeOneToken
]

{ #category : #playing }
P4Game >> playTurn: aNumber [
	"Plays a turn in the specified column if possible."

	(self canPlay: aNumber) ifFalse: [ ^ false ].

	self clickOnColumn: aNumber.
	self switchToNextPlayer.
	^ true
]

{ #category : #accessing }
P4Game >> players [

	^ players
]

{ #category : #removing }
P4Game >> removeOneToken [
    "Decrements the tokens by 1 if the player has tokens left."
    
    (currentPlayer tokens > 0) ifTrue: [currentPlayer tokens: currentPlayer tokens - 1].
]

{ #category : #'managing cells' }
P4Game >> selectColumnAt: aNumber [

	^ grid atColumn: aNumber
]

{ #category : #adding }
P4Game >> setCells [

	grid do: [ :each |
		 self addCell: each  ]
]

{ #category : #adding }
P4Game >> setPlayers [

self addPlayer: P4Player player1.
	self addPlayer: P4Player player2.
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
