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
    1    2     3     4     5     6     7
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
P4GameTest >> testCellsAreInitiallyNotOccupied [

	1 to: game width do: [ :row |
		1 to: game height do: [ :col |
		self deny: (game grid at: row @ col) isOccupied ] ]
]

{ #category : #tests }
P4GameTest >> testCellsAreInitiallyWhite [

	1 to: game width do: [ :row |
		1 to: game height do: [ :col |
			self assert: (game grid at: row @ col) color equals: Color white. self deny: (game grid at: row @ col) isOccupied ] ]
]

{ #category : #tests }
P4GameTest >> testCurrentPlayer [

	
	self assert: game currentPlayer color equals: Color red
]

{ #category : #tests }
P4GameTest >> testFindBottomEmptyCellInColumn1 [

	| cell |
	cell := game findEmptyCell: (game selectColumnAt: 1).

	self assert: cell isOccupied not.
	self assert: cell position x equals: 1.
	self assert: cell position y equals: 6
]

{ #category : #tests }
P4GameTest >> testFindWithTwoCellInColumn1 [

	| cell |
	((game selectColumnAt: 1) at: 6) playerOne.
	((game selectColumnAt: 1) at: 5) playerOne.
	cell := game findEmptyCell: (game selectColumnAt: 1).

	self assert: cell isOccupied not.
	self assert: cell position x equals: 1.
	self assert: cell position y equals: 4
]

{ #category : #tests }
P4GameTest >> testHeight [


	self assert: game height equals: 6
]

{ #category : #tests }
P4GameTest >> testNumberOfPlayers [


	self assert: game numberOfPlayers equals: 2
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

{ #category : #tests }
P4GameTest >> testWidth [

	self assert: game width equals: 7
]

{ #category : #tests }
P4GameTest >> testisColumnFillable [

	((game selectColumnAt: 1) at: 2) playerOne.
	((game selectColumnAt: 1) at: 3) playerOne.
	((game selectColumnAt: 1) at: 4) playerOne.
	((game selectColumnAt: 1) at: 6) playerOne.
	((game selectColumnAt: 1) at: 5) playerOne.
	self deny: (game isColumnFull: (game selectColumnAt: 1))
]

{ #category : #tests }
P4GameTest >> testisColumnFull [

	((game selectColumnAt: 1) at: 1) playerOne.
	((game selectColumnAt: 1) at: 2) playerOne.
	((game selectColumnAt: 1) at: 3) playerOne.
	((game selectColumnAt: 1) at: 4) playerOne.
	((game selectColumnAt: 1) at: 6) playerOne.
	((game selectColumnAt: 1) at: 5) playerOne.
	self assert: (game isColumnFull: (game selectColumnAt: 1))
]
