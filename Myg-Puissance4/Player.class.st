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

{ #category : #initialization }
Player class >> initializeWithName: aName color: aColor [

	^ self new
		  name: aName;
		  color: aColor;
		  tokens: 21;
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

{ #category : #initialization }
Player >> initialize [
        super initialize.
        tokens := 21
]

{ #category : #accessing }
Player >> name [

	^ name
]

{ #category : #accessing }
Player >> name: anObject [

	name := anObject
]

{ #category : #initialization }
Player >> removeToken [

	tokens > 0
		ifTrue: [
			tokens := tokens - 1]
]

{ #category : #accessing }
Player >> tokens [

	^ tokens
]

{ #category : #accessing }
Player >> tokens: anObject [

	tokens := anObject
]
