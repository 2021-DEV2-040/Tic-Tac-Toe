# Tic-Tac-Toe


## Table of contents
* [General info](#general-info)
* [Rules](#rules)
* [Technologies](#technologies)
* [Setup](#setup)
* [Project Explanation](#project-explanation)
## General info
This project is a simple Tic-Tac-Toe game as a Kata test.
	
## Rules

The rules are described below :

    X always goes first.
    Players cannot play on a played position.
    Players alternate placing X’s and O’s on the board until either:
        One player has three in a row, horizontally, vertically or diagonally
        All nine squares are filled.
    If a player is able to draw three X’s or three O’s in a row, that player wins.
    If all nine squares are filled and neither player has three in a row, the game is a draw.

## Technologies
Project is created with:
* Xcode version: 12.5
* Swift version: 5.4
* Design Patterns used: Singleton pattern & MVC
* TDD & CleanCode

## Setup
To run this project, close it locally and then run.

## Project Explanation
Project consist of a
 - `ViewController` which controls the view(UI).
 - `GameModel` which is the model controlling the state of the game.
 - `Main.storyBoard` which is the design.
 - Default Gameboard is 3x3 but project can handle more dimensions without any changes. 

#### `ViewController`
  `activePlayer` => a boolean that defines which player to start. `true` => `X`; `false` => `O`
  `cellState` => an array which holds the state of each cell, so users can't select a cell which is already selected
  
  when a cell tapped, we first check if the cell is empty or not by getting cell's `tag` index comparing to the `cellState` array.
  if the cell is not selected (it contains `"0"`) the we set the cell to the current player's image and update the `cellState` array.
  
  Each time a cell changes, we call `setMove` of the `GameModel`  to alert it, that there is a new move.
  
  Each time a cell changes, we call `checkWinner` method from `GameModel` to check for any possbile winner. 
    if `checkWinner` returns `0` means there is no winner and the game is still going.
    if `checkWinner` return `X` => `Player 1` has won the game.
    if `checkWinner` return `O` => `Player 2` has won the game.
    if `checkWinner` return `Draw` => means there is no winner and no cell is empty. GameOver!
    
#### `GameModel`
  First we create an array to holds the state of each cell.
  each time the `checkWinner` methods get calls, it iterates through all cells starting from [0][0] by calling `checkRow` & `checkColumn` for each row/column.
  if there is no winner, it then calls `checkDiagonal` and `checkDiagonalReverese` for any possible winner.
  and then it returns the winner.(if any, if not `0` or `Draw`)

  ##### How `checkWinner` Works?
  By each change to any cell, we iterate all cells to see any pattern of a winner. 
  - `checkRow` start from the first row and gets its first element state (`0`,`X`,`O`) and then compare it with the next cells in the same row.
  - `checkColumn` starts from the first column and gets its first element state (`0`,`X`,`O`) and then compare it with the next cells in the same column.
  - `checkDiagonal` starts from [0][0] and get its state (`0`,`X`,`O`) and goes to the next cell in Diagonal wich is [1][1] and go on [2][2] etc. 
  - `checkDiagonalInvert` starts from the last cell of the first row, and iterate through all other cells in reverse Diagonal. ( 1st cell => `[0][2]`, 2nd cell => `[1][1]`, 3rd cell => `[2][0]`)
  - In all these methods if it finds that all elements are the same, then we have a winner and it return it's element. if not, it returns `0`.

### TDD
For each method in `GameModel`, there is a `TestCase` and each one contains 3 `XCTAssert` to check each state of that method.
