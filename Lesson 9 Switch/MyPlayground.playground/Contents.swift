import UIKit

var greeting = "Hello, playground"

// Homework №1

let string = "The winner of the third and final round of LPGA qualifying was Jeong Eun Lee, of South Korea, who fired rounds of 67-70 at Sky 72 to finish at 13-under after two rounds of qualifying. Associated"

var countOfSymbols = ["consonants" : 0, "vowels" : 0, "numbers" : 0, "other": 0]
let consonants: [Character] = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]

for letter in string.lowercased() {
    switch letter {
    case "a", "e", "i", "o", "u", "y":
        countOfSymbols["vowels"]! += 1
    case _ where consonants.contains(letter):
        countOfSymbols["consonants"]! += 1
    case _ where letter.wholeNumberValue != nil:
        countOfSymbols["numbers"]! += 1
    default:
        if letter != " " {
            countOfSymbols["other"]! += 1
        }
    }

}
print("№1")
print(countOfSymbols)

// №2
print("№2")
let age = 5

switch age {
case 0...3:
    print("agooo")
case 3...6:
    print("kindergarten")
case 6...17:
    print("hell")
default:
    print("Norm jizn'")
}

// №3
print("№3")
let name = (name: "Евгений", surname: "Борисов", patronymic: "Бонстантинович")

switch name {
case let (name, _, _) where name.hasPrefix("А") || name.hasPrefix("О"):
    print("Hello \(name)")
case let (name, _, patronymic) where patronymic.hasPrefix("Б") || patronymic.hasPrefix("Д"):
    print("Hello \(name) \(patronymic)")
case let (_, surname, _) where surname.hasPrefix("Е") || surname.hasPrefix("З"):
    print("Hello \(surname)")
default:
    print("Hello \(name.name) \(name.surname) \(name.patronymic)")
}

// №4 ----›
