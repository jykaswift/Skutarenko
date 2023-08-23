//
//  Unit.swift
//  sokoban
//
//  Created by Евгений Борисов on 23.08.2023.
//

import Foundation

class Box {
    var coords: Coordinates

    init(coords: Coordinates) {
        self.coords = coords
    }
    
    func moveTo(newCoords: Coordinates) {
        coords = newCoords
    }
}
