//
//  Symbol.swift
//  tictactoe
//
//  Created by Евгений Борисов on 25.08.2023.
//

import Foundation

enum Mark: Character {
    case x = "\u{1F147}"
    case o = "\u{1F13E}"
    case empty = "\u{1F78E}"
    
    mutating func changeTurn() {
        self = self == .x ? .o : .x
    }
    
    var other: Mark {
        self == .x ? .o : .x
    }
}
