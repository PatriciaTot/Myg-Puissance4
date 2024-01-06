Class {
	#name : #P4GameTest,
	#superclass : #TestCase,
	#instVars : [
		'game'
	],
	#category : #'Myg-Puissance4-Tests'
}

{ #category : #running }
P4GameTest >> setUp [
	"
    1    2     3     4     5     6      7
  +--------------------------------------+
1 | B     B     B     B     B     B     B|
  +--------------------------------------+
2 | B     B     B     B     B     B     B|
  +--------------------------------------+
3 | B     B     B     B     B     B     B|
  +--------------------------------------+
4 | B     B     B     B     B     B     B|
  +--------------------------------------+
5 | B     B     B     B     B     B     B|
  +--------------------------------------+
6 | B     B     B     B     B     B     B|
  +--------------------------------------+
"

	super setUp.
	game := P4Game new
]

{ #category : #tests }
P4GameTest >> testCanPlay [

	game clickOnColumn: 1.
	self assert: (game canPlay: 1).
	
	game clickOnColumn: 1.
	self assert: (game canPlay: 1)
]

{ #category : #tests }
P4GameTest >> testCannotPlay [

	1 to: game height do: [  :each | game clickOnColumn: 1 ].
	self deny: (game canPlay: 1)
]

{ #category : #tests }
P4GameTest >> testCellsAreInitiallyNotOccupied [

	1 to: game width do: [ :row |
		1 to: game height do: [ :col |
		self deny: (game grid at: row @ col) isOccupied ] ]
]

{ #category : #tests }
P4GameTest >> testCellsAreInitiallyWhite [

	1 to: game width do: [ :row |
		1 to: game height do: [ :col |
			self assert: (game grid at: row @ col) color equals: Color white.
		 ] ]
]

{ #category : #tests }
P4GameTest >> testCheckForAlignments [

	1 to: game width do: [ :column |
		1 to: game height do: [ :row | game clickOnColumn: column ] ].

	self assert: game checkForAlignments
]

{ #category : #tests }
P4GameTest >> testCheckForBoardFull [

	1 to: game width do: [ :column |
		1 to: game height do: [ :row | game clickOnColumn: column ] ].

	self assert: game checkForBoardFull.
	self assert: game checkGameFinished
]

{ #category : #tests }
P4GameTest >> testCheckGameFinished [

	self deny: game checkGameFinished.
	
	1 to: game width do: [ :column |
		1 to: game height do: [ :row | game clickOnColumn: column ] ].

	self assert: game checkGameFinished
]

{ #category : #tests }
P4GameTest >> testClickOnColumn [
	"    
	  1  
  +-----+
1 |  B  |
  +-----+
2 |  B  |
  +-----+
3 |  B  |
  +-----+
4 |  B  |
  +-----+
5 |  R  |
  +-----+
6 |  R  |
  +-----+
"

	self deny: (game cellAt: 1 at: 6) isOccupied.
	game clickOnColumn: 1.
	self assert: (game cellAt: 1 at: 6) isOccupied.

	self deny: (game cellAt: 1 at: 5) isOccupied.
	game clickOnColumn: 1.
	self assert: (game cellAt: 1 at: 5) isOccupied
]

{ #category : #accessing }
P4GameTest >> testCurrentPlayer [

	
	self assert: game currentPlayer color equals: Color red
]

{ #category : #tests }
P4GameTest >> testFindBottomEmptyCellInColumn [

	| cell |
	cell := game findEmptyCell: (game selectColumnAt: 1).

	self assert: cell isOccupied not.
	self assert: cell position x equals: 1.
	self assert: cell position y equals: 6.
]

{ #category : #tests }
P4GameTest >> testFindEmptyCell [

	| selectedCell |
	"Initial state"
	selectedCell := game findEmptyCell: (game selectColumnAt: 1).
	self assert: selectedCell position equals: 1 @ 6.

	"After clicking on column 1"
	game clickOnColumn: 1.
	selectedCell := game findEmptyCell: (game selectColumnAt: 1).
	self assert: selectedCell position equals: 1 @ 5.

	"After clicking again on column 1"
	game clickOnColumn: 1.
	selectedCell := game findEmptyCell: (game selectColumnAt: 1).
	self assert: selectedCell position equals: 1 @ 4
]

{ #category : #tests }
P4GameTest >> testFindEmptyCellWithTwoCellsOccupiedInColumn [
	"    
	  1  
  +-----+
1 |  B  |
  +-----+
2 |  B  |
  +-----+
3 |  B  |
  +-----+
4 |  B  |
  +-----+
5 |  R  |
  +-----+
6 |  R  |
  +-----+
"

	| cell |
	((game selectColumnAt: 1) at: 6) playerOne.
	((game selectColumnAt: 1) at: 5) playerOne.
	cell := game findEmptyCell: (game selectColumnAt: 1).

	self assert: cell isOccupied not.
	self assert: cell position x equals: 1.
	self assert: cell position y equals: 4
]

{ #category : #tests }
P4GameTest >> testHasDiagonalAlignment [
	"
      1    2     3     4     5     6      7
    +--------------------------------------+
    | B     B     B     B     B     B     B|
    +--------------------------------------+
    | B     B     B     B     B     B     B|
    +--------------------------------------+
    | B     B     B     R     B     B     B|
    +--------------------------------------+
    | B     B     R     X     B     B     B|
    +--------------------------------------+
    | B     R     X     X     B     B     B|
    +--------------------------------------+
    | R     X     X     X     X     B     B|
    +--------------------------------------+
    "

	| moves |
	moves := #( 1 2 2 3 3 3 4 4 4 4 ).
	self deny: game hasDiagonalAlignment.
	self deny: game checkGameFinished.
	self deny: game checkForAlignments.

	moves do: [ :column | game clickOnColumn: column ].

	self assert: game hasDiagonalAlignment.
	self assert: game checkGameFinished.
	self assert: game checkForAlignments
]

{ #category : #tests }
P4GameTest >> testHasDiagonalAlignmentTopLeftToBottomRight [
	"
      1    2     3     4     5     6      7
    +--------------------------------------+
    | B     B     B     B     B     B     B|
    +--------------------------------------+
    | B     B     B     B     B     B     B|
    +--------------------------------------+
    | B     R     B     B     B     B     B|
    +--------------------------------------+
    | B     B     R     B     B     B     B|
    +--------------------------------------+
    | B     B     B     R     B     B     B|
    +--------------------------------------+
    | B     B     B     B     R     B     B|
    +--------------------------------------+
    "

	| moves |
	moves := #( 5 4 4 3 3 3 2 2 2 2 ).
	self deny: game hasDiagonalAlignment.
	self deny: game checkGameFinished.
	self deny: game checkForAlignments.

	moves do: [ :column | game clickOnColumn: column ].

	self assert: game hasDiagonalAlignment.
	self assert: game checkGameFinished.
	self assert: game checkForAlignments
]

{ #category : #tests }
P4GameTest >> testHasHorizontalAlignment [
	"
  1    2     3     4     5     6      7
+--------------------------------------+
| B     B     B     B     B     B     B|
+--------------------------------------+
| B     B     B     B     B     B     B|
+--------------------------------------+
| B     B     B     B     B     B     B|
+--------------------------------------+
| B     B     B     B     B     B     B|
+--------------------------------------+
| B     B     B     B     B     B     B|
+--------------------------------------+
| B     B     R     R     R     R     B|
+--------------------------------------+
"

	"At the beginnning there is no horizontal alignment"

	self deny: game hasHorizontalAlignment.

	4 to: 6 do: [ :index |
		game clickOnColumn: index.
		self deny: game hasHorizontalAlignment.
		self deny: game checkGameFinished.
		self deny: game checkForAlignments ].

	"Now, adding the fourth token to complete the horizontal alignment."
	game clickOnColumn: 3.
	self assert: game hasHorizontalAlignment.
	self assert: game checkGameFinished.
	self assert: game checkForAlignments
]

{ #category : #tests }
P4GameTest >> testHasVerticalAlignment [
	"
    1    2     3     4     5     6      7
  +--------------------------------------+
1 | B     B     B     B     B     B     B|
  +--------------------------------------+
2 | B     B     B     B     B     B     B|
  +--------------------------------------+
3 | R     B     B     B     B     B     B|
  +--------------------------------------+
4 | R     B     B     B     B     B     B|
  +--------------------------------------+
5 | R     B     B     B     B     B     B|
  +--------------------------------------+
6 | R     B     B     B     B     B     B|
  +--------------------------------------+
"

	game clickOnColumn: 1.
	game clickOnColumn: 1.
	game clickOnColumn: 1.
	self deny: game hasVerticalAlignment.
	self deny: game checkGameFinished.
	self deny: game checkForAlignments.

	"Now, adding the fourth token to complete the vertical alignment."
	game clickOnColumn: 1.
	self assert: game hasVerticalAlignment.
	self assert: game checkGameFinished.
	self assert: game checkForAlignments
]

{ #category : #accessing }
P4GameTest >> testHeight [


	self assert: game height equals: 6
]

{ #category : #tests }
P4GameTest >> testIsColumnFillable [
	"Selecting column 1 and filling in cells 2 to 6, leaving cell 1 empty.
	  1  
  +-----+
1 |  B  |
  +-----+
2 |  R  |
  +-----+
3 |  R  |
  +-----+
4 |  R  |
  +-----+
5 |  R  |
  +-----+
6 |  R  |
  +-----+
"

	2 to: game height do: [ :index |
	((game selectColumnAt: 1) at: index) playerOne ].

	self deny: (game isColumnFull: (game selectColumnAt: 1))
]

{ #category : #tests }
P4GameTest >> testIsColumnFull [
	"Selecting column 1 and filling in all the cells
	  1  
  +-----+
1 |  R  |
  +-----+
2 |  R  |
  +-----+
3 |  R  |
  +-----+
4 |  R  |
  +-----+
5 |  R  |
  +-----+
6 |  R  |
  +-----+"

	1 to: game height do: [ :index |
	((game selectColumnAt: 1) at: index) playerOne ].
	self assert: (game isColumnFull: (game selectColumnAt: 1))
]

{ #category : #accessing }
P4GameTest >> testNumberOfPlayers [


	self assert: game numberOfPlayers equals: 2
]

{ #category : #'game scenarios' }
P4GameTest >> testPlayScenarioWithDiagonalAlignment [
	"
    Player 1 is R and Player 2 is Y
          1    2     3     4     5     6      7
        +--------------------------------------+
     1  | X     X     X     X     X     X     X|
        +--------------------------------------+
     2  | X     X     X     X     X     X     X|
        +--------------------------------------+
     3  | X     X     X     R     X     X     X|
        +--------------------------------------+
     4  | X     X     R     R     X     X     X|
        +--------------------------------------+
     5  | Y     R     R     Y     X     X     X|
        +--------------------------------------+
     6  | R     Y     Y     Y     X     X     X|
        +--------------------------------------+
    "

	| moves |
	moves := #( 1 2 2 3 3 4 3 4 4 1 ).
	self deny: game checkGameFinished.

	moves do: [ :column |
		game playTurn: column.
		self deny: game checkGameFinished ].

	"Now player1 plays in column 4 and makes a diagonal alignment"
	game playTurn: 4.
	self assert: game checkGameFinished.
]

{ #category : #'game scenarios' }
P4GameTest >> testPlayScenarioWithHorizontalAlignment [
	"
	player1 is R and player2 is Y
      1    2     3     4     5     6      7
    +--------------------------------------+
    | X     X     X     X     X     X     X|
    +--------------------------------------+
    | X     X     X     X     X     X     X|
    +--------------------------------------+
    | X     X     X     X     X     X     X|
    +--------------------------------------+
    | X     X     X     X     X     X     X|
    +--------------------------------------+
    | Y     Y     Y     X     X     X     X|
    +--------------------------------------+
    | R     R     R     X     X     X     X|
    +--------------------------------------+
    "

	| moves |
	moves := #( 1 1 2 2 3 3 ).
	self deny: game checkGameFinished.

	moves do: [ :column |
		game playTurn: column.
		self deny: game checkGameFinished ].

	"Now player1 plays in column 4 and makes an horizontal alignment"
	game playTurn: 4.
	self assert: game checkGameFinished
]

{ #category : #'game scenarios' }
P4GameTest >> testPlayScenarioWithVerticalAlignment [
	"
    Player 1 is R and Player 2 is Y
          1    2     3     4     5     6      7
        +--------------------------------------+
        | X     X     X     X     X     X     X|
        +--------------------------------------+
        | X     X     X     X     X     X     X|
        +--------------------------------------+
        | R     X     X     X     X     X     X|
        +--------------------------------------+
        | R     X     X     X     X     X     X|
        +--------------------------------------+
        | R     x     x     X     X     X     X|
        +--------------------------------------+
        | R     Y     Y     Y     X     X     X|
        +--------------------------------------+
    "

	| moves |
	moves := #( 1 2 1 3 1 4 ).
	self deny: game checkGameFinished.

	moves do: [ :column |
		game playTurn: column.
		self deny: game checkGameFinished ].

	"Now player1 plays in column 1 and makes a vertical alignment"
	game playTurn: 1.
	self assert: game checkGameFinished
]

{ #category : #tests }
P4GameTest >> testPlayTokenInSelectedCell [

	| selectedCell |
	selectedCell := game findEmptyCell: (game selectColumnAt: 1).
	self deny: selectedCell isOccupied.

	game playTokenInSelectedCell: selectedCell.

	self assert: selectedCell isOccupied.
	self assert: selectedCell color equals: game currentPlayer color.
	self assert: game currentPlayer tokens equals: 20
]

{ #category : #tests }
P4GameTest >> testPlayTurnFillsTheCell [

	self assert: (game playTurn: 1).
	self assert: (game cellAt: 1 at: 6) color equals: Color red
]

{ #category : #tests }
P4GameTest >> testPlayTurnRemovesAToken [

	| currentPlayer |
	currentPlayer := game currentPlayer.
	self assert: currentPlayer tokens equals: 21.
	self assert: (game playTurn: 1).

	self assert: currentPlayer tokens equals: 20
]

{ #category : #tests }
P4GameTest >> testPlayWhenColumnIsFull [
	"
	  1  
  +-----+
1 |  R  |
  +-----+
2 |  R  |
  +-----+
3 |  R  |
  +-----+
4 |  R  |
  +-----+
5 |  R  |
  +-----+
6 |  R  |
  +-----+"

	1 to: game height do: [ :index |
	((game selectColumnAt: 1) at: index) playerOne ].

	self deny: (game playTurn: 1)
]

{ #category : #tests }
P4GameTest >> testPlayerCanPlayWhenColumnNotFull [

	self assert: (game playTurn: 1).
]

{ #category : #tests }
P4GameTest >> testPlayerCannotPlayWhenColumnIsFull [

	1 to: game height do: [ :index |
	((game selectColumnAt: 1) at: index) playerOne ].

	self deny: (game playTurn: 1)
]

{ #category : #accessing }
P4GameTest >> testRemoveOneToken [


	self assert: game currentPlayer tokens equals: 21.
	game removeOneToken.

	self assert: game currentPlayer tokens equals: 20
]

{ #category : #accessing }
P4GameTest >> testSetPlayers [

	self assert: game players size equals: 2.
]

{ #category : #tests }
P4GameTest >> testSwitchToNextPlayer [

	|  firstPlayer |

	"On vérifie que le joueur initial est rouge"
	firstPlayer := game currentPlayer.
	self assert: firstPlayer color equals: Color red.

	"On passe au joueur suivant, le jaune"
	game switchToNextPlayer.
	self assert: game currentPlayer color equals: Color yellow.

	"On passe au joueur suivant, le rouge"
	game switchToNextPlayer.
	self assert: game currentPlayer color equals: Color red
]

{ #category : #accessing }
P4GameTest >> testWidth [

	self assert: game width equals: 7
]
