"
I am the Puissance 4 game visual board.

"
Class {
	#name : #Puissance4,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'Myg-Puissance4-UI'
}

{ #category : #accessing }
Puissance4 class >> helpText [

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
Puissance4 class >> launchPuissance4 [

	^ self openWithModel: P4Game new
]

{ #category : #'private - menu building' }
Puissance4 class >> menuAbout [

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
Puissance4 class >> menuBar [

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
Puissance4 class >> menuPlay [
	
	| menu |
	menu := ToMenu new.
	menu labelText: 'Play'.
	menu iconImage: (Smalltalk ui icons iconNamed: #glamorousAccept).
	menu whenClickedDo: [ self launchPuissance4 ].

	^ menu

	
]

{ #category : #'instance creation' }
Puissance4 class >> open [

	<script>
	| space bar |
	bar := self menuBar.

	bar addMenu: self menuPlay.
	bar addMenu: self menuAbout.
	space := BlSpace new.

	space root addChild: self title.
	space root addChild: bar.
	space extent: 700 @ 600.
	space show
]

{ #category : #'api - opening' }
Puissance4 class >> openWithModel: aModel [

	^ self openWithModel: aModel withMagnifier: 1
]

{ #category : #'api - opening' }
Puissance4 class >> openWithModel: aModel withMagnifier: aNumber [

	| aGameElement space |
	space := BlSpace new.
	aGameElement := self new
		                game: (aModel magnifier: aNumber);
		                yourself.

	space root addChild: aGameElement.

	space pulse.
	space extent: aGameElement extent.
	space resizable: false.
	space show.
	^ space
]

{ #category : #accessing }
Puissance4 class >> title [

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

{ #category : #accessing }
Puissance4 >> game [

	^ game
]

{ #category : #accessing }
Puissance4 >> game: aP4Game [

	game := aP4Game.
	self padding: (BlInsets all: 5 * game magnifier).
	self layout columnCount: game width.
	self layout rowCount: game height.
	game grid do: [ :aCell |
		| cellElement |
		cellElement := (P4CellElement new 
		color: aCell color;
		cell: aCell)
			               board: aP4Game;
			               positionInBoard: aCell position.
		self addChild: cellElement ]
]

{ #category : #initialization }
Puissance4 >> initialize [

	super initialize.

	self background: (BlBackground paint: (Color r: 0 g: 0 b: 200)).
	self layout: (BlGridLayout horizontal cellSpacing: 25).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ].

	
]

{ #category : #'as yet unclassified' }
Puissance4 >> updateColor [

	children do: [ :each |
		each cell isOccupied ifTrue: [ each color: each cell color ] ]
]
