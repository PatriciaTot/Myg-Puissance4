"
I reprensent a cell in puissance 4 game.
"
Class {
	#name : #P4Cell,
	#superclass : #MygAbstractBox,
	#instVars : [
		'color'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #accessing }
P4Cell >> color [

	^ color
]

{ #category : #accessing }
P4Cell >> color: anObject [

	color := anObject
]

{ #category : #public }
P4Cell >> fillWithToken [
	"change the cell's color to the color of the currentPlayer

	self value: (value ifNil: [ 0 ] ifNotNil: [
			 value = 0
				 ifTrue: [ 1 ]
				 ifFalse: [ nil ] ])"

	
]

{ #category : #initialization }
P4Cell >> initialize [

	super initialize.
	color := Color white
]

{ #category : #testing }
P4Cell >> isP4Cell [

	^ true
]
