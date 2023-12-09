"
I am a player of the Puissance 4 game.
"
Class {
	#name : #P4Player,
	#superclass : #Object,
	#instVars : [
		'color',
		'tokens'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #initialization }
P4Player class >> initializeWithColor: aColor [

	^ self new
		  color: aColor;
		  tokens: 21;
		  yourself
]

{ #category : #player }
P4Player class >> player1 [

	^ self initializeWithColor: Color red
]

{ #category : #player }
P4Player class >> player2 [

	^ self initializeWithColor: Color yellow
]

{ #category : #accessing }
P4Player >> color [

	^ color
]

{ #category : #accessing }
P4Player >> color: anObject [

	color := anObject
]

{ #category : #initialization }
P4Player >> initialize [
        super initialize.
        tokens := 21
]

{ #category : #accessing }
P4Player >> tokens [

	^ tokens
]

{ #category : #accessing }
P4Player >> tokens: anObject [

	tokens := anObject
]
