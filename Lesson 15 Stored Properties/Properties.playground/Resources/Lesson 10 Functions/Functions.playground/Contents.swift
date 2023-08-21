import UIKit
//
//// Ysov
//
//func sum(a: Int, b: Int) -> Int {
//    a + b
//}
//
//print(sum(a: 1, b: 1))
//
//func sum(_ a: Int, number2 c: Int, number3 b: Int) -> Int {
//    a + b + c
//}
//
//print(sum(1, number2: 2, number3: 3))
//
//// Сквозные параметры
//
//func sum(a: inout Int, b: inout Int) -> Int {
//    a += 1
//    return a+b
//}
//var a = 1
//var b = 1
//
//sum(a: &a, b: &b)
//
//// Входной параметр с переменным числом значений
//
//
//func sum(numbers: Int...) -> Int {
//    print(type(of: numbers))
//    var sum = 0
//    for i in numbers {
//        sum += i
//    }
//    return sum
//}
//
//let sumary = sum(numbers: 1, 2, 3)
//
//// Значение по умолчанию для входного параметра
//
//func concatenation(a: String = "123", b: String, c: String = "456") -> Int {
//    print(a + b + c)
//    return 1
//}
//
//concatenation(a: "Hello", b: "Body")
//
//// Функциональный тип



//let copy: (String, String, String) -> Int = concatenation
//
//copy("1", "2", "3")

// homework №1
func heart() -> String {
    "\u{1F499}"
}

func smile() -> String {
    "\u{1F600}"
}

func angry() -> String {
    "\u{1F621}"
}

print("№1 " + heart() + smile() + angry())

// №2

func getColorOfCell(letter: String, number: Character) -> String {
    let indexLetter: Int?
    switch letter.lowercased() {
    case "a":
        indexLetter = 1
    case "b":
        indexLetter = 2
    case "c":
        indexLetter = 3
    case "d":
        indexLetter = 4
    case "e":
        indexLetter = 5
    case "f":
        indexLetter = 6
    case "g":
        indexLetter = 7
    case "h":
        indexLetter = 8
    default:
        indexLetter = nil
    }
    
    if let indexLetter = indexLetter,
        let number = number.wholeNumberValue,
        (1...8).contains(number)
    {
        return (indexLetter + number) % 2 == 0 ? "black" : "white"
    }
    return "Wrong cell"
}

let color = getColorOfCell(letter: "A", number: "1")
print("№2 " + color)

// №3

var array = [1, 2, 3]

func reversed(array: [Int]) -> [Int] {
    array.reversed()
}

func reversed(sequence: Int...) -> [Int] {
    reversed(array: sequence)
}

print("№3\nReversed array: \(reversed(array: array))\nReversed sequence: \(reversed(sequence: 1, 2, 3, 4))")

// №4

func reverse(array: inout [Int]) {
    array.reverse()
}

reverse(array: &array)
print("№4\nArray: \(array)")

// №5

func editString(string: String) -> String {
    
    let numberWordDict: [Character : String] = [
        "0": "null",
        "1": "one",
        "2": "two",
        "3": "three",
        "4": "four",
        "5": "five",
        "6": "six",
        "7": "seven",
        "8": "eight",
        "9": "nine"
    ]
    
    let consonants: [Character] = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
    
    var editedString = ""
    
    for letter in string.lowercased() {
        switch letter {
        case "a", "e", "i", "o", "u", "y":
            editedString += letter.uppercased()
        case let consonant where consonants.contains(consonant):
            editedString += String(consonant)
        case let number where numberWordDict.keys.contains(number):
            editedString += numberWordDict[number]!
        default:
            editedString += " "
        }
    }
    return editedString
}

let string = "The winner of the third and final round of LPGA qualifying was Jeong Eun Lee, of South Korea, who fired rounds of 67-70 at Sky 72 to finish at 13-under after two rounds of qualifying. Associated"

print("№5\n" + editString(string: string))
