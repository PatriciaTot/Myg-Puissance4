"
I represent a board in the Puissance 4 game.
"
Class {
	#name : #P4Game,
	#superclass : #MygBoard,
	#instVars : [
		'magnifier',
		'players',
		'currentPlayer'
	],
	#category : #'Myg-Puissance4-Core'
}

{ #category : #creating }
P4Game class >> createWithMatrix: aMatrix [

	^ self new
		  configureGrid: aMatrix;
		  yourself
]

{ #category : #accessing }
P4Game class >> helpText [

	^ '
**Welcome to Puissance 4!**

Puissance 4 is a classic strategy game where two players compete to align four of their colored tokens horizontally, vertically, or diagonally on a 7-column by 6-row grid.

**How to play:**
1. **Choose your color:** Each player is assigned a color, either Red or Yellow.
2. **Take turns:** Players take turns placing a token of their color into one of the columns on the board.
3. **Objective:** The goal is to align four tokens of your color consecutively on the board.
4. **Winning:** The first player to achieve a horizontal, vertical, or diagonal alignment of four tokens wins the game!

**How to play here:**
- **Click on a column:** To place a token, click on the column of your choice. The token will drop into the first empty space at the bottom of the column.
- **Strategy:** Anticipate your opponent''s moves and create opportunities for your own alignments.

**Tips:**
- **Block your opponent:**
Try to block potential alignments by your opponent while working on your own.
'
]

{ #category : #creating }
P4Game class >> matrix6x7 [

	^ self createWithMatrix: (CTNewArray2D
			   width: 7
			   height: 6
			   tabulate: [ :column :row | P4Cell new ])
]

{ #category : #'private - menu building' }
P4Game class >> menuAbout [

	| menu |
	menu := ToMenu new.
	menu labelText: 'About'.
	menu iconImage: (Smalltalk ui icons iconNamed: #glamorousHelp).
	menu whenClickedDo: [
		| container lab space |
		lab := ToLabel text:
			       (self helpText asRopedText foreground: Color white).
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: (Color r: 0 g: 100 b: 240);
			             padding: (BlInsets all: 40);
			             layout: BlLinearLayout vertical;
			             constraintsDo: [ :c |
				             c horizontal fitContent.
				             c vertical fitContent ].
		container addChild: lab.
		space := BlSpace new.
		space root
			layout: BlFrameLayout new;
			addChild: container;
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent ].
		space pulse.
		space extent: container extent.
		space show ].
	^ menu
]

{ #category : #'private - menu building' }
P4Game class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar
		background: Color white;
		border: (BlBorder paint: Color black).
	^ bar
]

{ #category : #'private - menu building' }
P4Game class >> menuPlay [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Play'.
	menu iconImage: (Smalltalk ui icons iconNamed: #solidMenu).
	menu whenClickedDo: [ P4GameElement launchPuissance4 ].

	^ menu
]

{ #category : #'instance creation' }
P4Game class >> open [

	<script>
	| space playMenu aboutMenu bar title |
	playMenu := self menuPlay.
	aboutMenu := self menuAbout.
	bar := self menuBar.
	title := self title.

	bar addMenu: playMenu.
	bar addMenu: aboutMenu.
	space := BlSpace new.


	space root addChild: title.
	space root addChild: bar.
	space extent: 300 @ 300.
	space show
]

{ #category : #player }
P4Game class >> player1 [

	^ P4Player initializeWithColor: Color red
]

{ #category : #player }
P4Game class >> player2 [

	^ P4Player initializeWithColor: Color yellow
]

{ #category : #accessing }
P4Game class >> title [

	| title |
	title := BlElement new background: (Color r: 0 g: 100 b: 240).
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text:
			  (('Puissance 4' asRopedText fontName: 'Phosphate') fontSize: 80))
			 constraintsDo: [ :c |
				 c frame horizontal alignCenter.
				 c frame vertical alignCenter ]).
	^ title
]

{ #category : #adding }
P4Game >> addCell: aCell [

	cells add: aCell
]

{ #category : #accessing }
P4Game >> at: anInteger at: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #accessing }
P4Game >> at: anInteger at: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #accessing }
P4Game >> atColumn: anInteger atRow: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #accessing }
P4Game >> atColumn: anInteger atRow: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #accessing }
P4Game >> atPosition: aCpPositionable [

	^ grid at: aCpPositionable x @ aCpPositionable y
]

{ #category : #accessing }
P4Game >> configureGrid: aCTNewArray2D [

	super configureGrid: aCTNewArray2D.
	self
		setCells
]

{ #category : #accessing }
P4Game >> height [

	^ grid height
]

{ #category : #initialization }
P4Game >> initialize [

	super initialize.
	cells := OrderedCollection new
]

{ #category : #accessing }
P4Game >> magnifier [

	^ magnifier
]

{ #category : #accessing }
P4Game >> magnifier: aNumber [

	magnifier := aNumber
]

{ #category : #initialization }
P4Game >> setCells [

	grid do: [ :each |
		each isP4Cell ifTrue: [ self addCell: each ] ]
]

{ #category : #accessing }
P4Game >> width [

	^ grid width
]
