import UIKit

// Homework
// №1

let secondsFromStartYearToBirthday = (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30) * 24 * 3600
print("№1 \(secondsFromStartYearToBirthday) seconds from my birthday to start of year")
// №2

let birthday = (day: 30, month: 11)
let quarted: Int
if birthday.month <= 3 {
    quarted = 1
} else if birthday.month <= 6 {
    quarted = 2
} else if birthday.month <= 9 {
    quarted = 3
} else {
    quarted = 4
}

print("№2 I was born in \(quarted) quarted")

// №4

let point = (x: 6, y: 7)

let color = (point.x + point.y) % 2 == 0 ? "Black" : "White"
print("№3 x = \(point.x) y = \(point.y) color = \(color)")


