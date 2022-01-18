//
//  WinningPatterns.swift
//  TicTacToe
//
//  Created by Daniel Rodriguez on 1/15/22.
//

import Foundation

class WinningPatterns {
    
    static func checkForWinningPattern() -> String {
        let gb = GameBoard.gameBoard
        if(gb[0] == "X" && gb[1] == "X" && gb[2] == "X"){
            return "X"
        } else if(gb[3] == "X" && gb[4] == "X" && gb[5] == "X"){
            return "X"
        } else if (gb[6] == "X" && gb[7] == "X" && gb[8] == "X"){
            return "X"
        } else if (gb[0] == "X" && gb[3] == "X" && gb[6] == "X"){
            return "X"
        } else if (gb[1] == "X" && gb[4] == "X" && gb[7] == "X"){
            return "X"
        } else if (gb[2] == "X" && gb[5] == "X" && gb[8] == "X"){
            return "X"
        } else if (gb[0] == "X" && gb[4] == "X" && gb[8] == "X"){
            return "X"
        } else if (gb[2] == "X" && gb[4] == "X" && gb[6] == "X"){
            return "X"
        } else if(gb[0] == "O" && gb[1] == "O" && gb[2] == "O"){
            return "O"
        } else if(gb[3] == "O" && gb[4] == "O" && gb[5] == "O"){
            return "O"
        } else if (gb[6] == "O" && gb[7] == "O" && gb[8] == "O"){
            return "O"
        } else if (gb[0] == "O" && gb[3] == "O" && gb[6] == "O"){
            return "O"
        } else if (gb[1] == "O" && gb[4] == "O" && gb[7] == "O"){
            return "O"
        } else if (gb[2] == "O" && gb[5] == "O" && gb[8] == "O"){
            return "O"
        } else if (gb[0] == "O" && gb[4] == "O" && gb[8] == "O"){
            return "O"
        } else if (gb[2] == "O" && gb[4] == "O" && gb[6] == "O"){
            return "O"
        }
        return ""
    }
}
