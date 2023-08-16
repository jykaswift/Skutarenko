import UIKit

var greeting = "Hello, playground"

// print(type(of: greeting[1])) - warning

let lastIndex = greeting.startIndex
greeting[greeting.index(lastIndex, offsetBy: 5)]

let i: Character = "\u{1f44d}\u{1f3fd}"

greeting.insert("1", at: greeting.startIndex)

let array = [1, 2]

// Homework 1

let (a, b, c, d, e) = ("11", "22", "3e", "5e", "5")

let intA = Int(a) ?? 0
let intB = Int(b) ?? 0
let intC = Int(c) ?? 0
let intD = Int(d) ?? 0
let intE = Int(e) ?? 0

let sum = intA + intB + intC + intD + intE

let strA = Int(a) == nil ? "nil" : a
let strB = Int(b) == nil ? "nil" : b
let strC = Int(c) == nil ? "nil" : c
let strD = Int(d) == nil ? "nil" : d
let strE = Int(e) == nil ? "nil" : e

print("№1\n\(strA) + \(strB) + \(strC) + \(strD) + \(strE) = \(sum)")
print(strA + " + " + strB + " + " + strC + " + " + strD + " + " + strE + " = " + String(sum))

// №2

let emodji = "\u{2764}\u{1F639}\u{1F431}\u{1F605}\u{1F606}"
print("№2\n\(emodji)")

// №3

let alphavite = "abcdefghijklmnopqrstuvwxyz"
let letter: Character = "c"

var index = 0
for i in alphavite {
    if i == letter {
        break
    }
    index += 1
}

print("№3\nIndex = \(index)")
