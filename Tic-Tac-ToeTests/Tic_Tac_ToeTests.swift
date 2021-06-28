//
//  Tic_Tac_ToeTests.swift
//  Tic Tac ToeTests
//
//

import XCTest
@testable import Tic_Tac_Toe

class Tic_Tac_ToeTests: XCTestCase {

    var gameModel:GameModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        gameModel = GameModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        gameModel = nil
        try super.tearDownWithError()
    }

    /// I have writen 3 XCTAsser for each function to check each winner or draw
    /// Therefore, for each test function, 1 XCTAssert will pass and 2 shall fail
    /// This is showing the correct functionality of the `model`
    
    
    func testFirstRowPlayerOneWin() {
        // given
        let gameBoard = [["X","X","X"],["0","0","0"],["0","0","0"]]
        gameModel.gameBoard = gameBoard
        // when
        let result = gameModel.checkRow(theRow: 0)
        
        // then
        XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong") /// Pass test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Failed test
    }
    func testSecondRowPlayerOneWin() {
        // given
        let gameBoard = [["0","0","0"],["X","X","X"],["0","0","0"]]
        gameModel.gameBoard = gameBoard
        // when
        let result = gameModel.checkRow(theRow: 1)
        
        // then
        XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong") /// Pass test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Failed test
    }
    func testThirdRowPlayerOneWin() {
        // given
        let gameBoard = [["0","0","0"],["0","0","0"],["X","X","X"]]
        gameModel.gameBoard = gameBoard
        // when
        let result = gameModel.checkRow(theRow: 2)
        
        // then
        XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong") /// Pass test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Failed test
    }
    
    func testFirstRowPlayerTwoWin() {
        // given
        let gameBoard = [["O","O","O"],["0","0","0"],["0","0","0"]]
        gameModel.gameBoard = gameBoard
        // when
        let result = gameModel.checkRow(theRow: 0)
        
        // then
        //XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")   /// Failed test
        XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Pass test
    }
    func testSecondRowPlayerTwoWin() {
        // given
        let gameBoard = [["0","0","0"],["O","O","O"],["0","0","0"]]
        gameModel.gameBoard = gameBoard
        // when
        let result = gameModel.checkRow(theRow: 1)
        
        // then
        //XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")   /// Failed test
        XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Pass test
    }
    func testThirdRowPlayerTwoWin() {
        // given
        let gameBoard = [["0","0","0"],["0","0","0"],["O","O","O"]]
        gameModel.gameBoard = gameBoard
        // when
        let result = gameModel.checkRow(theRow: 2)
        
        // then
        //XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")   /// Failed test
        XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Pass test
    }
    
    func testFirstColumnPlayerOneWin() {
        // given
        let gameBoard = [["X","0","0"],["X","0","0"],["X","O","O"]]
        gameModel.gameBoard = gameBoard
        
        
        // when
        let result = gameModel.checkColumn(theColumn: 0)
        
        // then
        XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong")   /// Pass test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "O","Winner computed from gameBoard is wrong")   /// Failed test
    }
    

    func testThirdColumnPlayerTwoWin() {
        // given
        let gameBoard = [["X","0","O"],["X","0","O"],["0","O","O"]]
        gameModel.gameBoard = gameBoard
        
        
        // when
        let result = gameModel.checkColumn(theColumn: 2) /// arrays index start at 0
        
        // then
        //XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")   /// Failed test
        XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Pass test
    }

    func testDiagonalPlayerOneWin() {
        // given
        let gameBoard = [["X","0","O"],["0","X","0"],["0","O","X"]]
        gameModel.gameBoard = gameBoard
        
        
        // when
        let result = gameModel.checkDiagonal()
        
        // then
        XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong")   /// Pass test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Failed test
    }
    func testDiagonalPlayerTwoWin() {
        // given
        let gameBoard = [["X","0","O"],["0","O","0"],["O","O","X"]]
        gameModel.gameBoard = gameBoard
        
        
        // when
        let result = gameModel.checkDiagonalInvert()
        
        // then
        //XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")       /// Failed test
        XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Pass test
    }
    
    func testWinnerFuncPlayerTwoWin() {
        // given
        let gameBoard = [["X","0","O"],["0","O","0"],["O","O","X"]]
        gameModel.gameBoard = gameBoard
        
        
        // when
        let result = gameModel.checkWinner()
        
        // then
        //XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong")   /// Failed test
        //XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")       /// Failed test
        XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Pass test
    }
    
    func testDraw() {
        
        // given
        let gameBoard = [["X","X","O"],["O","O","X"],["X","O","X"]]
        gameModel.gameBoard = gameBoard
        
        
        // when
        let result = gameModel.checkWinner()
        
        // then
        //XCTAssertEqual(result, "X","Winner computed from gameBoard is Wrong")   /// Failed test
        XCTAssertEqual(result, "Draw","Draw computed from gameBoard is Wrong")       /// Pass test
        //XCTAssertEqual(result, "O","Winner computed from gameBoard is Wrong")   /// Failed test
    }
    
    
    func testSetMove() {
        // given
        let gameBoard = [["X","X","O"],["O","0" /* we want to change this cell*/,"X"],["X","O","X"]]
        gameModel.gameBoard = gameBoard
        
        
        // when
        gameModel.setMove(tag: 4, move: "X")
        
        // then
        let gameBoardNew = [["X","X","O"],["O","X","X"],["X","O","X"]]
        XCTAssertEqual(gameBoardNew, gameModel.gameBoard, "Seting new move is incorrect") // test pass
        
    }
    
    func testResetGame() {
        
        // given
        let gameBoard = [["X","X","O"],["O","O","X"],["X","O","X"]]
        gameModel.gameBoard = gameBoard
        
        
        // when
        gameModel.resetGame()
        
        // then
        let gameBoardNew = [["0","0","0"],["0","0","0"],["0","0","0"]]
        XCTAssertEqual(gameBoardNew, gameModel.gameBoard, "reseting gameboard is incorrect") // test pass
    }
    func testModelPerformance() {
        // given
        let gameBoard = [["X","X","O"],["O","O","X"],["X","O","X"]]
        gameModel.gameBoard = gameBoard
        
        
        measure(metrics: [
        XCTClockMetric(), /// To measures elapsed time
        XCTCPUMetric(),     /// To keeps track of CPU activity
        XCTStorageMetric(), /// data the tested code writes to storage.
        XCTMemoryMetric() /// tracks the amount of used physical memory
        ])
        {
            gameModel.checkWinner()
        }
    }
}
