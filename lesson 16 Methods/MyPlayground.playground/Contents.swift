import UIKit

var greeting = "Hello, playground"

struct Coordinates {
    let x: Int
    let y: Int
}


let cordinates = [Coordinates(x: 1, y: 1)]

let coord = Coordinates(x: 1, y: 2)
cordinates.contains(where: {
    $0.x == coord.x && $0.y == coord.y
})
