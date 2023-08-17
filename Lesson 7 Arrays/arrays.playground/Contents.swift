import UIKit

var greeting = "Hello, playground"

// Homework №1

let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
print("№1\nDays in month in order: ")
for days in daysInMonth {
    print(days, terminator: " ")
}

let month = ["January", "February",  "March",  "April",  "May", "June", "July", "August", "September", "October", "November", "December"]
print("\nDays in month: ")
for (i, month) in month.enumerated() {
    print("\(month) \(daysInMonth[i]) days")
}


var dayInMonthTuple = [(month: String, days: Int)]()
// Filling array of tuples
for (i, month) in month.enumerated() {
    dayInMonthTuple.append((month, daysInMonth[i]))
}

print("\nDays in month from tuple: ")
for (month, day) in dayInMonthTuple {
    print("\(month) \(day) days")
}

print("\nDays in month in reverse order: ")
for (month, day) in dayInMonthTuple.reversed() {
    print("\(month) \(day) days")
}
 
let randomDate = (month: "December", day: 29)
var daysToDate = 0

for (month, day) in dayInMonthTuple {
    if month == randomDate.month {
        daysToDate += randomDate.day
        print("From \(randomDate.month) \(randomDate.day) to 1 January \(daysToDate) days")
        break
    }
    daysToDate += day
}

// №2

let array = [1, 2, nil, 4, nil]

var sum = 0
for number in array where number != nil {
    sum += number!
}
print("№2\nSum force unwrapping: \(sum)")
sum = 0
for number in array {
    if let number = number {
        sum += number
    }
}
print("Sum optional binding: \(sum)")
sum = 0
for number in array {
    sum += number ?? 0
}
print("Sum ?? operator: \(sum)")

// №3
let alphavite = "abcdefghijklmnopqrstuvwxyz"
var reversedAlphavite = [String]()

for letter in alphavite.reversed() {
    reversedAlphavite.append(String(letter))
}

print("№3\n reversed alphavite array \(reversedAlphavite)")
