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

## Setup
To run this project, close it locally and then run.

## Project Explanation
Project consist of a
 - `ViewController` which coltrol the view.
 - `Model` which is the model controlling the state of the game
 - `Main.storyBoard` which is the design.

#### `ViewController`
  `activePlayer` => a boolean that defines which player to start. `true` => `X`; `false` => `O`
  `cellState` => an array which holds the state of each cell, so users can't select a cell which is already selected
  
  when a cell tapped, we first check if the cell is empty of not by getting cell's `tag` index comparing to the `cellState` array.
  if the cell is not selected (it contains `"0"`) the we set the cell to the current player's image. 
  
  Each time a cell changes, we call `setMove` method to alert the `model` that there is a new move. we will use it later. 
  
  Each time a cell changes, we call `checkWinner` method from `Model` to check for any possbile winner. 
    if `checkWinner` returns `0` means there is no winner and the game is still going.
    if `checkWinner` return `X` => `Player 1` has won the game.
    if `checkWinner` return `O` => `Player 2` has won the game.
    if `checkWinner` return `Draw` => means there is no winner and no cell is empty. GameOver!
    
#### `GameModel`
  First we create an array to holds the state of each cell.
  each time the `checkWinner` methods get calls, it iterate through all cells starting from [0][0] by calling `checkRow` & `checkColumn` for each row/column.
  if there is no winner, it then call `checkDiagonal` and `checkDiagonalReverese` for any possible winner.
  and then it returns the winner.(if any, if not `0` or `Draw`)

  ##### How `checkWinner` Works?
  By each change to any cell, we iterate all cells to see any pattern of a winner. 
  - `checkRow` start from the first row and gets it's first element state (`0`,`X`,`O`) and then compare it with the next cells in the same row.
  - `checkColumn` starts from the first column and gets it's first element state (`0`,`X`,`O`) and then compare it with the next cells in the same column.
  - `checkDiagonal` starts from [0][0] and get it's state (`0`,`X`,`O`) and goes to the next cell in Diagonal wich is [1][1] and go on [2][2] etc. 
  - In all these methods if it finds that all elements are the same, then we have a winner and it return it's element. if not, it returns `0`.
