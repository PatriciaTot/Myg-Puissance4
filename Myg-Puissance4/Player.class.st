"
I am a player of the Puissance 4 game.
"
Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'numberOfTokens',
		'color'
	],
	#category : #'Myg-Puissance4-Model'
}

{ #category : #accessing }
Player >> color [

	^ color
]

{ #category : #accessing }
Player >> color: anObject [

	color := anObject
]

{ #category : #accessing }
Player >> numberOfTokens [

	
	^ numberOfTokens
]

{ #category : #accessing }
Player >> numberOfTokens: anObject [

	numberOfTokens := anObject
]
