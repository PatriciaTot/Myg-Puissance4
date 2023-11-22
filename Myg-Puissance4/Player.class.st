"
I am a player of the Puissance 4 game.
"
Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'color',
		'name',
		'tokens'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #'instance creation' }
Player class >> initialize [

	^ self new
		  numberOfTokens: 21;
		  yourself
]

{ #category : #accessing }
Player >> color [

	^ color
]

{ #category : #accessing }
Player >> color: anObject [

	color := anObject
]

{ #category : #accessing }
Player >> tokens [

	^ tokens
]

{ #category : #accessing }
Player >> tokens: anObject [

	tokens := anObject
]
