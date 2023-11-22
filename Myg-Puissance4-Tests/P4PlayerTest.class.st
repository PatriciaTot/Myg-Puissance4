Class {
	#name : #P4PlayerTest,
	#superclass : #TestCase,
	#category : #'Myg-Puissance4-Tests'
}

{ #category : #running }
P4PlayerTest >> setUp [

	super setUp.
]

{ #category : #tests }
P4PlayerTest >> testColor [

	| player |
	player := P4Player new.
	player color: Color red.
	self assert: player color equals: Color red
]

{ #category : #tests }
P4PlayerTest >> testInitialization [

	| player |
	player := P4Player initializeWithName: 'Player1' color: Color blue.
	self assert: player name equals: 'Player1'.
	self assert: player color equals: Color blue.
	self assert: player tokens equals: 21
]

{ #category : #tests }
P4PlayerTest >> testRemoveToken [

	| player |
	player := P4Player initializeWithName: 'Player1' color: Color blue.
	player removeToken.
	self assert: player tokens equals: 20
]

{ #category : #tests }
P4PlayerTest >> testTokens [

	| player |
	player := P4Player new.
	self assert: player tokens equals: 21
]
