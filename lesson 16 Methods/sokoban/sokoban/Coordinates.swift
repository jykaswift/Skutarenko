//
//  Coordinates.swift
//  sokoban
//
//  Created by Евгений Борисов on 23.08.2023.
//

import Foundation

struct Coordinates {
    let x: Int
    let y: Int
    
    func entersIn(array: [Coordinates]) -> Bool {
        for coord in array {
            if coord.x == self.x && coord.y == self.y {
                return true
            }
        }
        return false
    }
    
    func isEqual(coordinate: Coordinates) -> Bool {
        coordinate.x == self.x && coordinate.y == self.y
    }
    
    func plus(coordinate: Coordinates) -> Coordinates {
        Coordinates(x: coordinate.x + self.x, y: coordinate.y + self.y)
    }
    
}
