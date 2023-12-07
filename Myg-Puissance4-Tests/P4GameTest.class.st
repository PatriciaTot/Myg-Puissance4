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

	super setUp.
	game := P4Game new
]

{ #category : #tests }
P4GameTest >> testCellsAreInitiallyWhite [

	1 to: game width do: [ :row |
		1 to: game height do: [ :col |
			self assert: (game grid at: row @ col) color equals: Color white ] ]
]

{ #category : #tests }
P4GameTest >> testCurrentPlayer [

	
	self assert: game currentPlayer color equals: Color red
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
