//
//  ViewController.swift
//  TicTacToe
//
//  Created by Daniel Rodriguez on 1/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1x1: UIButton!
    @IBOutlet weak var button1x2: UIButton!
    @IBOutlet weak var button1x3: UIButton!
    @IBOutlet weak var button2x1: UIButton!
    @IBOutlet weak var button2x2: UIButton!
    @IBOutlet weak var button2x3: UIButton!
    @IBOutlet weak var button3x1: UIButton!
    @IBOutlet weak var button3x2: UIButton!
    @IBOutlet weak var button3x3: UIButton!
    @IBOutlet weak var whosTurnLabel: UILabel!
    
    var currentPlayer = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("The view has loaded....")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("The view has appeared....")
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.playGame()
        }
    }
    
    @IBAction func FirstRowButtons(_ sender: UIButton) {
        let currentTag = sender.tag
        humansTurn(currentTag: currentTag, sender: sender)
        
    }
    
    @IBAction func SecondRowButtons(_ sender: UIButton) {
        let currentTag = sender.tag
        humansTurn(currentTag: currentTag, sender: sender)
    }
    
    @IBAction func ThirdRowButtons(_ sender: UIButton) {
        let currentTag = sender.tag
        humansTurn(currentTag: currentTag, sender: sender)
    }
    
    func playGame(){
        
        var someoneWon = ""
        
        while(someoneWon == ""){
            if(currentPlayer == "X"){ //human
                DispatchQueue.main.async {
                    self.whosTurnLabel.text = "It's your turn"
                    self.enableTurn()
                }
                print("It is the human player's turn")
                //check if anyone has won
                someoneWon = WinningPatterns.checkForWinningPattern()
                if(someoneWon == "O" || someoneWon == "X"){
                    DispatchQueue.main.async {
                        self.disableTurn()
                        self.winningMsg(winningPlayer: someoneWon)
                        self.whosTurnLabel.text = "You won!"
                    }
                    //break
                }
            } else { //computer
                DispatchQueue.main.async {
                    self.whosTurnLabel.text = "It's player O's (CPU) turn"
                }
                var spotIsOpen = false
                while(!spotIsOpen){
                    sleep(5)
                    let cpuChoice = Int.random(in: 0...8)
                    print("[Move] The CPU chose spot \(cpuChoice)")
                    spotIsOpen = self.playersChoice(spot: cpuChoice)
                    if (spotIsOpen) {
                        DispatchQueue.main.async {
                            self.inputCPUsTurn(cpuChoice: cpuChoice)
                        }
                    }
                }
                
                //check if anyone has won
                someoneWon = WinningPatterns.checkForWinningPattern()
                if(someoneWon == "O" || someoneWon == "X"){
                    DispatchQueue.main.async {
                        self.disableTurn()
                        self.winningMsg(winningPlayer: someoneWon)
                        self.whosTurnLabel.text = "Player O's (CPU) won!"
                    }
                    //break
                }
                //enable human player's turn
                currentPlayer = "X"
            }
        }
    }
    
    func winningMsg(winningPlayer: String){
        let message: UIAlertController
        var alertTitle: String
        var alertMsg: String
        
        if(winningPlayer == "X"){
            alertTitle = "Congrats, you won!"
            alertMsg = "Would you like to play again?"
        } else {
            alertTitle = "Sorry, you lost. Player O (CPU) won."
            alertMsg = "Would you like to play again?"
        }
        
        message = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            self.currentPlayer = "X"
            self.resetGame()
            self.viewDidAppear(true)
        })
        // Create Cancel button with action handlder
        let no = UIAlertAction(title: "No", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        //Add OK and Cancel button to an Alert object
        message.addAction(yes)
        message.addAction(no)
        
        // Present alert to user
        self.present(message, animated: true, completion: nil)
        print("Game Over")
    }

}
