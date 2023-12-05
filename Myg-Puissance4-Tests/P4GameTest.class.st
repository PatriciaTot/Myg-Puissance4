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
