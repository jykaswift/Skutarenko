//
//  Direction.swift
//  sokoban
//
//  Created by Евгений Борисов on 23.08.2023.
//

import Foundation

enum Direction: Int {
    case left = 4
    case right = 3
    case down = 2
    case up = 1
    
    var coords: Coordinates {
        
        switch self {
        case .left:
            return Coordinates(x: -1, y: 0)
        case .right:
            return Coordinates(x: 1, y: 0)
        case .down:
            return Coordinates(x: 0, y: 1)
        case .up:
            return Coordinates(x: 0, y: -1)
        }
        
    }
    
}
