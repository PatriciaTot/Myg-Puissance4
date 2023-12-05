Class {
	#name : #P4GameTest,
	#superclass : #TestCase,
	#category : #'Myg-Puissance4-Tests'
}

{ #category : #running }
P4GameTest >> setUp [

	super setUp
]

{ #category : #tests }
P4GameTest >> testCurrentPlayer [

	| game  |
	game := P4Game new.

	self assert: game currentPlayer color equals: Color red
]

{ #category : #tests }
P4GameTest >> testNumberOfPlayers [

	| game |
	game := P4Game new.
	self assert: game numberOfPlayers equals: 2
]

{ #category : #tests }
P4GameTest >> testSwitchToNextPlayer [

	| game firstPlayer |
	game := P4Game new.

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

	| game |
	game := P4Game new.
	
self assert: game width equals: 7
]
