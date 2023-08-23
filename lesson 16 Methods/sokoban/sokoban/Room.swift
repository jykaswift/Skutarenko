//
//  Room.swift
//  sokoban
//
//  Created by Евгений Борисов on 23.08.2023.
//

import Foundation

class Room {
    
    let width: Int
    let height: Int
    
    var player = Player()
    var boxes = [Box]()
    var checkpoints = [Coordinates]()
    
    init(width: Int, height: Int) {
        self.height = height - 1
        self.width = width - 1
        setBoxesAndCheckpoints()
    }
    
    func setBoxesAndCheckpoints() {
        let countOfBoxes = ((width + 1) * (height + 1)) / 5
        var coordinates = [Coordinates]()
        while coordinates.count != countOfBoxes {
            let coordOfNewBox = Coordinates(
                x: Int.random(in: 1...width - 1),
                y: Int.random(in: 1...height - 1)
            )
            
            if coordOfNewBox.entersIn(array: coordinates) { continue }
            coordinates.append(coordOfNewBox)
        }
        
        for coord in coordinates { boxes.append(Box(coords: coord)) }
        
        while checkpoints.count != countOfBoxes {
            let coordOfNewCheckpoint = Coordinates(
                x: Int.random(in: 0...width),
                y: Int.random(in: 0...height)
            )
            
            if coordOfNewCheckpoint.entersIn(array: coordinates) ||
               Coordinates(x: 0, y: 0).isEqual(coordinate: coordOfNewCheckpoint) { continue }
            
            checkpoints.append(coordOfNewCheckpoint)
        }
    }
    
    func getAllBoxesCoords() -> [Coordinates] {
        var allCoords = [Coordinates]()
        for box in boxes {
            allCoords.append(box.coords)
        }
        return allCoords
    }
    
    func сheckBoundaries(coordinates: Coordinates) -> Bool {
        (0...width).contains(coordinates.x) && (0...height).contains(coordinates.y)
    }
    
    func findBoxBy(coordinate: Coordinates) -> Box? {
        for box in boxes {
            if box.coords.isEqual(coordinate: coordinate) {
                return box
            }
        }
        return nil
    }
    
    func moveUnits(direction: Direction) {
        let coordinateVector = direction.coords
        let newCoordsPlayer = player.coords.plus(coordinate: coordinateVector)
        let newCoordsBox = newCoordsPlayer.plus(coordinate: coordinateVector)
        
        if !сheckBoundaries(coordinates: newCoordsPlayer) {
            print("Cant move there - OUT OF BOUNDARIES")
            return
        }
        
        if let box = findBoxBy(coordinate: newCoordsPlayer) {
            if !сheckBoundaries(coordinates: newCoordsBox) {
                print("Cant move there - OUT OF BOUNDARIES")
                return
            }
            if findBoxBy(coordinate: newCoordsBox) != nil {
                print("Cant move there - CANT MOVE 2 BOXES")
                return
            }
            box.moveTo(newCoords: newCoordsBox)
        }
        player.moveTo(newCoords: newCoordsPlayer)
    }
    
    
    func printRoom() {
        let allBoxesCoords = getAllBoxesCoords()
        print(String(repeating: UnitType.bound.rawValue, count: width + 3))
        for i in 0...height {
            print(UnitType.bound.rawValue, terminator: "")
            for j in 0...width {
                let currentCoord = Coordinates(x: j, y: i)
                if player.coords.isEqual(coordinate: currentCoord) {
                    print(UnitType.player.rawValue, terminator: "")
                } else if currentCoord.entersIn(array: allBoxesCoords) {
                    print(UnitType.box.rawValue, terminator: "")
                } else if currentCoord.entersIn(array: checkpoints) {
                    print(UnitType.checkpoint.rawValue, terminator: "")
                } else {
                    print(UnitType.empty.rawValue, terminator: "")
                }
            }
            print(UnitType.bound.rawValue)
        }
        print(String(repeating: UnitType.bound.rawValue, count: width + 3))
    }
  
    
    func checkEnd() -> Bool {
        let allBoxesCoords = getAllBoxesCoords()
        var countOfCoincidences = 0
        
        for box in allBoxesCoords {
            for checkpoint in checkpoints {
                if box.isEqual(coordinate: checkpoint) {countOfCoincidences += 1}
            }
        }
        
        return countOfCoincidences == checkpoints.count
    }
    
 
}
