Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#instVars : [
		'player'
	],
	#category : #'Myg-Puissance4-Tests'
}

{ #category : #running }
PlayerTest >> setUp [

	super setUp.
	player := Player initialize
]
