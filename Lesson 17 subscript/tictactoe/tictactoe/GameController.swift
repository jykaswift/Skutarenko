//
//  GameController.swift
//  tictactoe
//
//  Created by Евгений Борисов on 25.08.2023.
//

import Foundation

class GameController {
    
    func getNumberFromUser() -> Int {
        repeat {
            guard let input = readLine(), let number = Int(input) else {
                print("Incorrect number try again:")
                continue
            }
            return number
        } while true
    }
    
    func start() {
        
        
        print("Hello this is game tic-tac-toe")
        print("Crosses starts first")
        print("Enter a size of game grid: ")
        let size = getNumberFromUser()
        let grid = GameGrid(size: size)
        print("Enter the row and the column to mark to put a mark on the grid")
        grid.printGrid()
        repeat {
            print("TURN: \(grid.turn.rawValue)")
            print("Enter row: ")
            let row = getNumberFromUser() - 1
            print("Enter column: ")
            let column = getNumberFromUser() - 1
            grid[row, column] = grid.turn
            grid.printGrid()
        } while !grid.checkWinner()
        
    }
    
}
