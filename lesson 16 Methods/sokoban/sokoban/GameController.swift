//
//  GameController.swift
//  sokoban
//
//  Created by Евгений Борисов on 23.08.2023.
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
        print("Type a width of room: ")
        let width = getNumberFromUser()
        print("Type a height of room: ")
        let height = getNumberFromUser()
        let room = Room(width: width, height: height)
        
        repeat {
            room.printRoom()
            print("Enter the number responsible for the direction of movement")
            print("1 - up, 2 - bottom, 3 - right, 4 - left: ")
            let directionNumber = getNumberFromUser()
            if !(1...4).contains(directionNumber) {
                print("Number out of boundaries")
            }
            room.moveUnits(direction: Direction(rawValue: directionNumber)!)
        } while !room.checkEnd()
        
        print("Congrats u win!")
        }
}
