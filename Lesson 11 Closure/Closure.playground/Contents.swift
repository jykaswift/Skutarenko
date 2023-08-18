import UIKit

var greeting = "Hello, playground"

// Ysov

func testClosure(closure: () -> Int) -> Int {
    return closure()
}

let number = testClosure(closure: {() -> Int in return 1})
let number2 = testClosure(closure: { return 1} )
let number3 = testClosure(closure: {1} )


// Homework №1

func firstTask(closure: () -> Void) {
    print("№1")
    for i in 1...10 {
        print(i, terminator: " ")
    }
    print("\nBefore closure")
    closure()
    print("After closure")
}

firstTask {
    print("Hello im closure")
}

// №2

let array = [1, 3, 2]
print("№2")
print("ASC sorted array: \(array.sorted { $1 > $0 })")
print("DESC sorted array: \(array.sorted { $1 < $0 })")

// №3

func filterArray(array: [Int], closure: (Int?, Int) -> Bool ) -> Int {
    var minMax: Int?
    
    for number in array {
        if closure(minMax, number) {
            minMax = number
        }
    }

    return minMax!
}

let max = filterArray(array: [1, 44, 56, 23, -1]) {
    $0 == nil ? true : $0! < $1
}
let min = filterArray(array: [1, 44, 56, 23, -1]) {
    $0 == nil ? true : $0! > $1
}

print("№3\nmin: \(min) max: \(max)")

// №4

let string = "1fads.-32doyerfds"
let stringArray = string.map { String($0) }


func getWeight(symbol: String) -> Int {
    switch symbol {
    case "a", "e", "i", "o", "u", "y":
        return 4
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z":
        return 3
    case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
        return 2
    default:
        return 1
    }
    
}

let sortedArray = stringArray.sorted { a, b in
    if getWeight(symbol: a) == getWeight(symbol: b) {
        return a < b
    }
    return getWeight(symbol: a) > getWeight(symbol: b)
}

print("№4\n unsorted array: \(stringArray) sortedArray: \(sortedArray)")



