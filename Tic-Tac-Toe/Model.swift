//
//  Model.swift
//  Tic Tac Toe
//
//

import Foundation

class GameModel {
    public static let instance = GameModel()
    var gameBoard = Array(repeating: Array(repeating: "0", count: 3), count: 3)
    
    func checkRow(theRow: Int) -> String {
        if gameBoard[theRow][0] != "0" {
            let checkThisPlayer: String = gameBoard[theRow][0]
            for n in 0..<gameBoard[theRow].count {
                guard gameBoard[theRow][n] == checkThisPlayer &&  gameBoard[theRow][n] != "0" else { return "0" }
                
                continue
            }
            return checkThisPlayer
        }
        return "0"
    }
    
    func checkColumn(theColumn: Int) -> String {
        if gameBoard[0][theColumn] != "0" {
            let checkThisPlayer: String = gameBoard[0][theColumn]
            for n in 0..<gameBoard[0].count {
                guard gameBoard[n][theColumn] == checkThisPlayer && gameBoard[n][theColumn] != "0" else { return "0" }
                continue
            }
            return checkThisPlayer
        }
        return "0"
    }
    
    func checkDiagonal() -> String {
        if gameBoard[0][0] != "0" {
            let checkThisPlayer: String = gameBoard[0][0]
            
            for n in 0..<gameBoard.count {
                for m in 0..<gameBoard[n].count {
                    guard n == m else { continue }
                    if gameBoard[n][m] == checkThisPlayer {
                        continue
                    } else {
                        return "0"
                    }
                }
                
            }
            return checkThisPlayer
        }
        return "0"
    }
    func checkDiagonalInvert() -> String {
        if gameBoard[0][gameBoard.count-1] != "0" {
            
            
            let checkThisPlayer: String = gameBoard[0][gameBoard.count-1]
            var nIndex = 0
            var mIndex = gameBoard.count-1
            
            while nIndex < gameBoard.count {
                if gameBoard[nIndex][mIndex] == checkThisPlayer {
                    nIndex += 1
                    mIndex -= 1
                } else {
                    return "0"
                }
                
            }
            return checkThisPlayer
        }
        
        return "0"
    }
    
    
    /// In this method, we iterate between all items to check rows and columns for any possible winner
    func checkWinner() -> String {
        var winner: String = "0"
        for index in 0...gameBoard.count - 1 {
            winner = checkRow(theRow: index)
            if (winner != "0") {
                return winner
            }
            winner = checkColumn(theColumn: index)
            if (winner != "0") {
                return winner
                
            }
            
            
        }
        winner = checkDiagonal()
        if winner == "0" { winner = checkDiagonalInvert() }
        if gameBoard.flatMap{ $0 }.filter({$0 == "0"}).isEmpty && winner == "0" {
            return "Draw"
        }
        return winner
            
    }
    
    func setMove(tag:Int, move:String) {
        var index = 0
        for n in 0..<gameBoard.count {
            for m in 0..<gameBoard[n].count {
                if index < tag {
                    index += 1
                } else if index == tag {
                    gameBoard[n][m] = move
                    return
                }
            }
        }
        
    }
    
    
    func resetGame() {
        self.gameBoard = Array(repeating: Array(repeating: "0", count: 3), count: 3)
    }
}
