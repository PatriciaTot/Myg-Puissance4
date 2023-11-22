Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'Myg-Puissance4-Tests'
}

{ #category : #running }
PlayerTest >> setUp [

	super setUp.
]

{ #category : #tests }
PlayerTest >> testColor [

	| player |
	player := Player new.
	player color: Color red.
	self assert: player color equals: Color red
]

{ #category : #tests }
PlayerTest >> testInitialization [

	| player |
	player := Player initializeWithName: 'Player1' color: Color blue.
	self assert: player name equals: 'Player1'.
	self assert: player color equals: Color blue.
	self assert: player tokens equals: 21
]

{ #category : #tests }
PlayerTest >> testTokens [

	| player |
	player := Player new.
	self assert: player tokens equals: 21
]
