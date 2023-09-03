import UIKit

// №1

struct Point {
    var x: Int
    var y: Int
    
    static func - (first: Point, second: Point) -> Point {
        Point(x: first.x - second.x, y: first.y - second.y)
    }
    
    static func -= (first: inout Point, second: Point) {
        first = first - second
    }

}


var first = Point(x: 2, y: 2)
let second = Point(x: 5, y: 8)
first - second
first -= second
first

// №3
infix operator ^^
extension String {

    
    static func += (lhs: inout String, rhs: Int) {
        lhs = lhs + String(rhs)
    }
    
    static func ^^ (lhs: String, rhs: String) -> String {
        var resultString = ""
        for (first, second) in zip(lhs, rhs) {
            if first == second {
                resultString += first.uppercased()
            } else {
                resultString += String(first)
            }
        }
        return resultString
    }
}

var string = "2 + "
string += 2
string = "abcde"
string ^^ "aegvegfsv"
