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
PlayerTest >> testNumberOfTokens [

	self assert: player numberOfTokens equals: 21
]
