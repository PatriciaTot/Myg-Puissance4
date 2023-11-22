"
I am a player of the Puissance 4 game.
"
Class {
	#name : #P4Player,
	#superclass : #Object,
	#instVars : [
		'color',
		'name',
		'tokens'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #initialization }
P4Player class >> initializeWithName: aName color: aColor [

	^ self new
		  name: aName;
		  color: aColor;
		  tokens: 21;
		yourself
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
P4Player >> name [

	^ name
]

{ #category : #accessing }
P4Player >> name: anObject [

	name := anObject
]

{ #category : #initialization }
P4Player >> removeToken [

	tokens > 0
		ifTrue: [
			tokens := tokens - 1]
]

{ #category : #accessing }
P4Player >> tokens [

	^ tokens
]

{ #category : #accessing }
P4Player >> tokens: anObject [

	tokens := anObject
]
