//
//  Player.swift
//  sokoban
//
//  Created by Евгений Борисов on 23.08.2023.
//

import Foundation

class Player {
    var coords = Coordinates(x: 0, y: 0)

    
    func moveTo(newCoords: Coordinates) {
        coords = newCoords
    }
}
