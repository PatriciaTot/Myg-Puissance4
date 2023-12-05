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

{ #category : #public }
P4Cell >> fillWithToken [
	"change the cell color to the color of the currentPlayer

	self value: (value ifNil: [ 0 ] ifNotNil: [
			 value = 0
				 ifTrue: [ 1 ]
				 ifFalse: [ nil ] ])"

	
]

{ #category : #testing }
P4Cell >> isP4Cell [

	^ true
]
