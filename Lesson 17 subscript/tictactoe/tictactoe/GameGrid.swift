//
//  GameBoard.swift
//  tictactoe
//
//  Created by Евгений Борисов on 25.08.2023.
//

import Foundation

class GameGrid {
    
    var grid = [[Mark]]()
    let size: Int
    var turn: Mark = .x
    var lastTurnRow = 0
    var lastTurnColumn = 0
    
    init(size: Int) {
        self.size = size - 1
        clearGrid()
    }
    
    subscript(row: Int, column: Int) -> Mark? {
   
        get {
            if checkBoundaries(row: row, column: column) {
                return grid[row][column]
            } else {
                return nil
            }
        }
        
        set {
            
            if !checkBoundaries(row: row, column: column) {
                print(Error.outOfBound.rawValue)
                return
            }
            
            if self[row, column] != .empty {
                print(Error.alredyTaken.rawValue)
                return
            }
            
            if let newValue = newValue {
                if newValue == .empty {
                    print(Error.emptyCell.rawValue)
                    return
                }
                grid[row][column] = newValue
                turn.changeTurn()
                lastTurnRow = row
                lastTurnColumn = column
            }
        }
        
    }
    
    func checkWinner() -> Bool {
        
        let isDraw = grid.flatMap{$0}.allSatisfy{$0 != .empty}
        
        if isDraw {
            print("DRAW!")
            return true
        }
        
        let previusTurn = turn.other
        var (column, row, diag, rdiag) = (0, 0, 0, 0)
        for i in 0...size {
            if grid[lastTurnRow][i] == previusTurn { row += 1 }
            if grid[i][lastTurnColumn] == previusTurn { column += 1 }
            if grid[i][i] == previusTurn { diag += 1 }
            if grid[i][size + 1 - (i+1)] == previusTurn { rdiag += 1 }
        }
        
        if [column, row, diag, rdiag].contains(size + 1) {
            print("Congrats \(previusTurn.rawValue) WIN")
            return true
        }
        
        return false
        
    }

    
    func checkBoundaries(row: Int, column: Int) -> Bool {
        (0...size).contains(row) && (0...size).contains(column)
    }
    
    func clearGrid() {
        for _ in 0...size {
            grid.append(Array(repeating: .empty, count: size + 1))
        }
    }
    
    
    func printGrid() {
        for i in 0...size {
            for j in 0...size {
                print(grid[i][j].rawValue, terminator: " ")
            }
            print()
        }
    }
}
