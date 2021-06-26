//
//  ViewController.swift
//  Tic Tac Toe
//
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = true //Cross
    var cellState = [String](repeating: "0", count: 9)

    let gameModel = GameModel.instance
    var alert : UIAlertController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func BtnTapped(_ sender: UIButton) {
        /// First we check if the cell has already a value or not
        guard cellState[sender.tag-1] == "0" else { return }
        
        
        /// Depends on the active player, mark the cell proper image
        switch activePlayer {
        case true:
            /// Set the image
            sender.setImage(UIImage(named: "Cross"), for: UIControl.State.normal)
            
            /// Change player
            activePlayer.toggle()
            
            /// Mark the cell occupied so can't be changed again
            cellState[sender.tag-1] = "X"
            
            /// pass the move to model for winner calculation
            gameModel.setMove(tag: sender.tag-1, move: "X")
        case false:
            sender.setImage(UIImage(named: "Naught.png"), for: UIControl.State.normal)
            activePlayer.toggle()
            cellState[sender.tag-1] = "O"
            gameModel.setMove(tag: sender.tag-1, move: "O")
        }
        
        /// every time a cell change, we check for any possible winner
        let winner = gameModel.checkWinner()
        
        /// if there is a winner, it will return non `0`
        guard winner != "0" else { return }
        switch winner {
        case "X":
            alert = UIAlertController(title: "Win", message: "Player 1 WON!", preferredStyle: UIAlertController.Style.alert)
        case "O":
            alert = UIAlertController(title: "Win", message: "Player 2 WON!", preferredStyle: UIAlertController.Style.alert)
        case "Draw":
            alert = UIAlertController(title: "Draw", message: "GameOVER!", preferredStyle: UIAlertController.Style.alert)
        default:
            break
        }
        
        alert?.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { [self] _ in
            
            /// we call the method to reset the game
            gameModel.resetGame()
            
            /// reset all cell states to default
            cellState = [String](repeating: "0", count: 9)
            
            /// Reset the images
            resetBtns()
            
            
            /// Change the `activePlayer` to `Cross`
            activePlayer = true
        }))
        self.present(alert!, animated: true, completion: nil)
        
        
    }
    
    func resetBtns() {
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State.normal)
        }
    }
}

