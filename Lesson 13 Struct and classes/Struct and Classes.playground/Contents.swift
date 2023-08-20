import UIKit

var greeting = "Hello, playground"


// Ysov Sctruct

struct ChessPlayer {
    var name: String
    var victories: UInt8 = 0
    
    
    init(name: String) {
        self.name = name + "123"
    }
    
    func printName() {
        print(self.name)
    }
    
    mutating func changeName() {
        self.name = "1"
    }
}

//let playerOne = ChessPlayer(name: "Eugene", victories: 2)
var playerTwo = ChessPlayer(name: "Mark")
playerTwo.name
playerTwo.changeName()
playerTwo.name

// Ysov classes



//class Chessman {
//
//    enum ChessmanType {
//        case king, castle, bishop, pawn, knight, queen
//    }
//
//    enum ChessmanColor {
//        case black, white
//    }
//
//
//    let type: ChessmanType
//
//    let color: ChessmanColor
//
//    var coordinates: (String, Int)? = nil
//
//    let figureSymbol: Character
//
//    init(type: ChessmanType, color: ChessmanColor, figureSymbol: Character) {
//        self.type = type
//        self.color = color
//        self.figureSymbol = figureSymbol
//    }
//
//
//    func setCoordinates(char c:String, num n: Int) {
//        coordinates = (c, n)
//    }
//
//    func kill() {
//        coordinates = nil
//    }
//}

//var kingWhite = Chessman(type: .king, color: .white, figureSymbol: "\u{2654}")


// Homework №1

struct Student {
    var name: String
    var surname: String
    var yearOfBirth: Int
    var averageMark: Double
}

let eugene = Student(name: "Eugene", surname: "Borisov", yearOfBirth: 2001, averageMark: 4.21)
let sergei = Student(name: "Sergei", surname: "Borisov", yearOfBirth: 2001, averageMark: 4.8)
let dmtrii = Student(name: "Dmitrii", surname: "Ermishkin", yearOfBirth: 1999, averageMark: 3.5)

var journal = [sergei, eugene, dmtrii]


print("№1.2")
func printStudentsIn(journal: [Student]) {
    journal.enumerated().map {
        print("\($0 + 1) Name: \($1.name) Surname: \($1.surname) Year of birth: \($1.yearOfBirth) GPA: \($1.averageMark)")
    }
}
printStudentsIn(journal: journal)
print("№1.3")
printStudentsIn(journal: journal.sorted {
    $0.averageMark > $1.averageMark
})
print("№1.4")
printStudentsIn(journal: journal.sorted {
    if $0.surname == $1.surname {
        return $0.name < $1.name
    }
    return $0.surname < $1.surname
})

// №1.5 - не изменятся
// №3
struct Coordinates {
    var letter: Character
    var number: Int
}


class Chessman {
    
    enum ChessmanType: Int {
        case king
        case queen
        case bishop
        case rook
        case knight
        case pawn
    }

    enum ChessmanColor {
        case black, white
        
        var enemyColor: ChessmanColor {
            self == .white ? .black : .white
        }
    }

    
    let type: ChessmanType
    
    let color: ChessmanColor
    
    var coordinates: Coordinates?
    
    var unicode: Character {
        
        if self.color == .white {
            return Character(UnicodeScalar(0x2654 + type.rawValue)!)
        }
        return Character(UnicodeScalar(0x265A + type.rawValue)!)
    }
    
    
    init(type: ChessmanType, color: ChessmanColor) {
        self.type = type
        self.color = color
    }
    
    
    init(type: ChessmanType, color: ChessmanColor, coords: Coordinates) {
        self.type = type
        self.color = color
        self.coordinates = coords
    }
    
    func setCoords(coordinates: Coordinates) {
        self.coordinates = coordinates
    }
 
}

class ChessBoard {
    
    var desk = [Character : [Int : Chessman]]()
    var letters = [Character("A") : 1, "B" : 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]
    
    init() {
        for i in letters.keys {
            desk[i] = [:]
        }
    }
    
    func setFigure(chessman: Chessman) {
        if let coordinates = chessman.coordinates, checkCoords(coordinates) {
            desk[coordinates.letter]![coordinates.number] = chessman
        }
    }
    
    func checkCoords(_ coordinates: Coordinates) -> Bool {
        letters.keys.contains(coordinates.letter) && (1...8).contains(coordinates.number)
    }
    
    func printDesk() {
        for row in stride(from: 8, to: 0, by: -1) {
            print(row, terminator: " ")
            for (i, column) in letters.keys.sorted().enumerated() {
                if let figure = self.desk[column]?[row] {
                    print(figure.unicode, terminator: " ")
                } else {
                    let color = (row + i + 1) % 2 == 0 ? "\u{25A0}" : "\u{25A1}"
                    print(color, terminator: " ")
                }
            }
            print()
        }
        
        print("  4A B C D E F G H")
      
    }
    
    func deleteFigure(figure: Chessman) {
        desk[figure.coordinates!.letter]![figure.coordinates!.number] = nil
    }
    
    
    func moveFigure(figure: Chessman, to newCoords: Coordinates) {
        
        switch figure.type {
        case .pawn:
            if !isPossibleMovePawn(figure: figure, to: newCoords) {
                print("Такой ход невозможен")
                return
            }
            deleteFigure(figure: figure)
            figure.setCoords(coordinates: newCoords)
            desk[newCoords.letter]![newCoords.number] = figure
            
        default:
            return
        }
        
        
        
    }
    
    func isPossibleMovePawn(figure: Chessman, to newCoords: Coordinates) -> Bool {
        if !checkCoords(newCoords) {
            return false
        }
        
        let newColumn = letters[newCoords.letter]!
        let newRow = newCoords.number
        
        let currentColumn = letters[figure.coordinates!.letter]!
        let currentRow = figure.coordinates!.number
        
        switch (newColumn, newRow) {
        case (currentColumn, currentRow + 1) where figure.color == .white:
            return true
        case (currentColumn, currentRow - 1) where figure.color == .black:
            return true
        case (currentColumn + 1, currentRow + 1), (currentColumn - 1, currentRow + 1):
            if let currentFigure = desk[newCoords.letter]?[newRow],
                figure.color == .white,
                currentFigure.color == figure.color.enemyColor {
                return true
            }
        case (currentColumn + 1, currentRow - 1), (currentColumn - 1, currentRow - 1):
            if let currentFigure = desk[newCoords.letter]?[newRow],
                figure.color == .black,
                currentFigure.color == figure.color.enemyColor {
                return true
            }
            return true
        default:
            break
        }
        
        return false
    }
    
}


let chessboard = ChessBoard()
let blackKing = Chessman(type: .king, color: .black, coords: .init(letter: "B", number: 4))
let whitePawn = Chessman(type: .pawn, color: .white, coords: Coordinates(letter: "A", number: 2))
chessboard.setFigure(chessman: whitePawn)
chessboard.setFigure(chessman: blackKing)
chessboard.printDesk()
print()
chessboard.moveFigure(figure: whitePawn, to: Coordinates(letter: "A", number: 3))
chessboard.printDesk()
chessboard.moveFigure(figure: whitePawn, to: Coordinates(letter: "A", number: 5))
chessboard.printDesk()
chessboard.moveFigure(figure: whitePawn, to: Coordinates(letter: "B", number: 4))
chessboard.printDesk()
