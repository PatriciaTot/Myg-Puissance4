Class {
	#name : #Puissance4,
	#superclass : #Object,
	#instVars : [
		'board',
		'currentPlayer'
	],
	#category : #Puissance4
}

{ #category : #initialization }
Puissance4 >> announceWin [
    "Announce the winner and stop the game"
    Transcript show: currentPlayer, ' wins!'.
    currentPlayer := nil.

]

{ #category : #initialization }
Puissance4 >> checkForWin: column atRow: row [
    "Check if the current move resulted in a win"
    | directions |
    directions := { { 0 . 1 } . { 1 . 0 } . { 1 . 1 } . { 1 . -1 } }.

    directions do: [ :direction |
        | count |
        count := 1.

        (1 to: 3) do: [ :i |
            | newRow newColumn |
            newRow := row + (direction at: 1) * i.
            newColumn := column + (direction at: 2) * i.

            (newRow >= 1 and: [ newRow <= 6 and: [ newColumn >= 1 and: [ newColumn <= 7 ] ] ])
                ifTrue: [
                    ((board at: newColumn) at: newRow) = currentPlayer
                        ifTrue: [ count := count + 1 ]
                        ifFalse: [ count := 0 ] ]
                ifFalse: [ count := 0 ].

            count = 4 ifTrue: [ self announceWin ] ].
    ].
]

{ #category : #initialization }
Puissance4 >> initialize [
    "Initialize the game"
    board := { { nil . nil . nil . nil . nil . nil }.
               { nil . nil . nil . nil . nil . nil }.
               { nil . nil . nil . nil . nil . nil }.
               { nil . nil . nil . nil . nil . nil }.
               { nil . nil . nil . nil . nil . nil }.
               { nil . nil . nil . nil . nil . nil }.
               { nil . nil . nil . nil . nil . nil } } asOrderedCollection.
    currentPlayer := 'X'.
]

{ #category : #initialization }
Puissance4 >> makeMove: column [
    "Make a move in the specified column"
    | rowIndex |
    "Find the first empty slot in the specified column from the bottom"
    rowIndex := (board at: column) indexOf: nil ifAbsent: [ 7 ].

    rowIndex > 0 ifTrue: [
        (board at: column) at: rowIndex put: currentPlayer.
        self printBoard.
        self checkForWin: column atRow: rowIndex.
        currentPlayer := currentPlayer = 'X' ifTrue: [ 'O' ] ifFalse: [ 'X' ] ].

]

{ #category : #initialization }
Puissance4 >> printBoard [
    "Print the current state of the board"
    (6 to: 1 by: -1) do: [ :row |
        (1 to: 7) do: [ :col |
            | cell |
            cell := (board at: col) at: row.
            cell
                ifNil: [ Transcript show: '|_ ' ]
                ifNotNil: [ Transcript show: '|', cell asString, ' ' ] ].
        Transcript show: '|'; cr ].
    Transcript cr.
]
