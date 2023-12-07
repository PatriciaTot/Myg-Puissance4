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
	player := P4Player initializeWithColor: Color blue.
	self assert: player color equals: Color blue.
	self assert: player tokens equals: 21
]

{ #category : #tests }
P4PlayerTest >> testTokens [

	| player |
	player := P4Player new.
	self assert: player tokens equals: 21
]
