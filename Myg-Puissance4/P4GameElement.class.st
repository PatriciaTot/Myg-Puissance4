"
I am the Puissance 4 game visual board.

"
Class {
	#name : #P4GameElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'Myg-Puissance4-UI'
}

{ #category : #accessing }
P4GameElement class >> helpText [

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

{ #category : #'private - menu building' }
P4GameElement class >> menuAbout [

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
			             background: Color lightCyan;
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
P4GameElement class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar
		background: Color veryVeryLightGray;
		border: (BlBorder paint: Color veryDarkGray).
	^ bar
]

{ #category : #'private - menu building' }
P4GameElement class >> menuPlay [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Play'.
	menu iconImage: (Smalltalk ui icons iconNamed: #solidMenu).
	"menu whenClickedDo: [ P4BoardElement launchPuissance4 ]."
	menu whenClickedDo: [ MFieldElement launchSmall ].

	^ menu
]

{ #category : #'private - menu building' }
P4GameElement class >> open [

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

{ #category : #'private - menu building' }
P4GameElement class >> title [

	| title |
	title := BlElement new background: Color lightCyan.
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text:
			  (('Puissance 4' asRopedText fontName: 'Phosphate') fontSize: 70))
			 constraintsDo: [ :c |
				 c frame horizontal alignCenter.
				 c frame vertical alignCenter ]).
	^ title
]

{ #category : #accessing }
P4GameElement >> game [

	^ game
]

{ #category : #accessing }
P4GameElement >> game: aP4Game [

	game := aP4Game.
	self padding: (BlInsets all: 5 * game magnifier).
	self layout columnCount: game width.
	game grid do: [ :aCell |
		| cellElement |
		cellElement := (P4CellElement createWithCell: aCell)
			               board: aP4Game;
			               positionInBoard: aCell position.
		self addChild: cellElement ]
]

{ #category : #initialization }
P4GameElement >> initialize [

	super initialize.

	self background: (BlBackground paint: Color veryVeryLightGray).
	self layout: (BlGridLayout horizontal cellSpacing: 5).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]
