import UIKit


var dictionary = [Int:Int]()

dictionary[1] = 2

dictionary

dictionary.keys

// Homework №1

var students = [
    "Eugene Borisov" : 5,
    "Alex Borisov" : 4,
    "Ilya Afanasyeva" : 5,
    "Geor Badov" : 3,
    "Ruslan Bedoev": 5
]

students["Alex Borisov"] = 5
students.updateValue(5, forKey: "Geor Badov")
students["Bob Bil"] = 3
students["Simba Burkov"] = 5
students["Eugene Borisov"] = nil
students.removeValue(forKey: "Ruslan Bedoev")

var sumOfMarks = 0
for mark in students.values {
    sumOfMarks += mark
}

print("№1\nTotal score of students is \(sumOfMarks) average score is \(sumOfMarks / students.count)\n№2")

// №2
let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let month = ["January", "February",  "March",  "April",  "May", "June", "July", "August", "September", "October", "November", "December"]
// Creating dict
let monthsDict = Dictionary(uniqueKeysWithValues: zip(month, daysInMonth))

for (month, day) in monthsDict {
    print("In \(month) \(day) days")
}
print("------")
for month in monthsDict.keys {
    print("In \(month) \(monthsDict[month]!) days")
}

// №3

var chessBoard = [String:Bool]()

let letters = ["A", "B", "C", "D", "E", "F", "G", "H"]

for (index, letter) in letters.enumerated() {
    for number in 1...8 {
        let cell = letter + String(number)
        chessBoard[cell] = (index + 1 + number) % 2 != 0
    }
}

print("№3\nA1 is \(chessBoard["A1"]!)")
print("A2 is \(chessBoard["A2"]!)")
print("H8 is \(chessBoard["H8"]!)")

