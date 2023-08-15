import UIKit

var number = 255
var hex = 0xff
var secondHex = 0x0a
let binary = 0b101


// Homework
// №1
print("""
    №1
    Int Maximum: \(Int.max)
    Int Minimum: \(Int.min)
    UInt Maximum: \(UInt.max)
    UInt Minimum: \(UInt.min)
    Int8 Maximum: \(Int8.max)
    Int8 Minimum: \(Int8.min)
    ...
    """)
// №2
let int = 1
let float: Float = 1.1
let double = 3.0

let sumOfThreeInt = int + Int(float) + Int(double)
let sumOfThreeFloat = Float(int) + float + Float(double)
let sumOfThreeDouble = Double(int) + Double(float) + double

print("№2")
print("Сумма в Int: \(sumOfThreeInt) Тип: \(type(of: sumOfThreeInt))")
print("Сумма в Float: \(sumOfThreeFloat) Тип: \(type(of: sumOfThreeFloat))")
print("Сумма в Double: \(sumOfThreeDouble) Тип: \(type(of: sumOfThreeDouble))")

// №3

print("№3")

if sumOfThreeDouble > Double(sumOfThreeInt) {
    print("Double")
} else {
    print("Int")
}
