//
//  GameControls.swift
//  TicTacToe
//
//  Created by Daniel Rodriguez on 1/16/22.
//

import Foundation
import UIKit

extension ViewController {
// MARK: - Turn Enablers
    func disableTurn(){
        button1x1.isEnabled = false
        button1x2.isEnabled = false
        button1x3.isEnabled = false
        
        button2x1.isEnabled = false
        button2x2.isEnabled = false
        button2x3.isEnabled = false
            
        button3x1.isEnabled = false
        button3x2.isEnabled = false
        button3x3.isEnabled = false
    }
        
    func enableTurn(){
        let gb = GameBoard.gameBoard
        if(gb[0] == "."){
            button1x1.isEnabled = true
        }
        if(gb[1] == "."){
            button1x2.isEnabled = true
        }
        if(gb[2] == "."){
            button1x3.isEnabled = true
        }
        if(gb[3] == "."){
            button2x1.isEnabled = true
        }
        if(gb[4] == "."){
            button2x2.isEnabled = true
        }
        if(gb[5] == "."){
            button2x3.isEnabled = true
        }
        if(gb[6] == "."){
            button3x1.isEnabled = true
        }
        if(gb[7] == "."){
            button3x2.isEnabled = true
        }
        if(gb[8] == "."){
            button3x3.isEnabled = true
        }
    }
    
// MARK: - Turn Handler for Human Player
    func humansTurn(currentTag: Int, sender: UIButton){
        //set place
        let spotIsAvailable = playersChoice(spot: currentTag)
        if(spotIsAvailable){
            sender.setTitle("X", for: .normal)
            //disable human player's turn for cpu player
            DispatchQueue.main.async {
                self.disableTurn()
            }
            currentPlayer = "O"
        } else {
            //message - spot take
            let message = UIAlertController(title: "Alert", message: "Spot is unavailable, pick a different spot.", preferredStyle: .alert)
                // Present alert to user
            self.present(message, animated: true, completion: nil)
        }
    }
    
// MARK: - Checks if spot available
    func playersChoice(spot: Int) -> Bool{
        if(GameBoard.gameBoard[spot] == "."){
            print("[Player \(currentPlayer)'s Move] Spot \(spot) is available.")
            GameBoard.gameBoard[spot] = currentPlayer
            return true
        }
        print("[Player \(currentPlayer)'s Move] Spot \(spot) is not available.")
        return false
    }
    
// MARK: - Change of Interface
    func inputCPUsTurn(cpuChoice: Int){
        let currentPlayer = "O"
        let currentColor: UIColor = .black
        switch cpuChoice {
            case 0:
                button1x1.setTitle(currentPlayer, for: .normal)
                button1x1.setTitleColor(currentColor, for: .normal)
            case 1:
                button1x2.setTitle(currentPlayer, for: .normal)
                button1x2.setTitleColor(currentColor, for: .normal)
            case 2:
                button1x3.setTitle(currentPlayer, for: .normal)
                button1x3.setTitleColor(currentColor, for: .normal)
            case 3:
                button2x1.setTitle(currentPlayer, for: .normal)
                button2x1.setTitleColor(currentColor, for: .normal)
            case 4:
                button2x2.setTitle(currentPlayer, for: .normal)
                button2x2.setTitleColor(currentColor, for: .normal)
            case 5:
                button2x3.setTitle(currentPlayer, for: .normal)
                button2x3.setTitleColor(currentColor, for: .normal)
            case 6:
                button3x1.setTitle(currentPlayer, for: .normal)
                button3x1.setTitleColor(currentColor, for: .normal)
            case 7:
                button3x2.setTitle(currentPlayer, for: .normal)
                button3x2.setTitleColor(currentColor, for: .normal)
            case 8:
                button3x3.setTitle(currentPlayer, for: .normal)
                button3x3.setTitleColor(currentColor, for: .normal)
            default:
                print("")
        }
    }
    

    func resetGame(){
        GameBoard.gameBoard = [".", ".", ".", ".", ".", ".", ".", ".", "."]
        DispatchQueue.main.async {
            self.button1x1.setTitle("", for: .normal)
            self.button1x2.setTitle("", for: .normal)
            self.button1x3.setTitle("", for: .normal)
            self.button2x1.setTitle("", for: .normal)
            self.button2x2.setTitle("", for: .normal)
            self.button2x3.setTitle("", for: .normal)
            self.button3x1.setTitle("", for: .normal)
            self.button3x2.setTitle("", for: .normal)
            self.button3x3.setTitle("", for: .normal)
            self.whosTurnLabel.text = "It's your turn"
        }
    }
}
