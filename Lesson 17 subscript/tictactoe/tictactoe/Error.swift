//
//  Error.swift
//  tictactoe
//
//  Created by Евгений Борисов on 25.08.2023.
//

import Foundation

enum Error: String {
    case outOfBound = "ERROR: CELL OUT THE GRID"
    case emptyCell = "ERROR: CANT SET EMPTY CELL"
    case alredyTaken = "ERROR: THIS CELL IS ALREDY TAKEN"
}
