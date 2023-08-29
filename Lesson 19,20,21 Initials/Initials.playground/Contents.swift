import UIKit

////class Student1 {
////
////    var firstname: String
////    var lastname: String
////
////    var fullname: String {
////        firstname + " " + lastname
////    }
////
////    init() {
////        self.firstname = ""
////        self.lastname = ""
////    }
////
////}
////
////class Student2 {
////
////    var firstname = ""
////    var lastname = ""
////}
////
////class Student3 {
////    var firstname: String
////    var lastname: String
////
////    init(_ firstname: String, lastname: String = "hello") {
////        self.firstname = firstname
////        self.lastname = lastname
////    }
////}
////
////class Student4 {
////    var middleName: String?
////}
////
////class Student5 {
////    let maxAge: Int
////
////    init() {
////        maxAge = 100
////    }
////}
////
//////class Student6: Student5 {
//////    override init() {
//////        super.maxAge = 1
//////    }
//////}
////
////
////
////let s1 = Student1()
////let s2 = Student1()
////let s3 = Student3("abc", lastname: "kek")
////s3.lastname
////
////// ---------------
////class Human {
////    var age: Int
////    var weight: Int
////
////    init(weight: Int, age: Int) {
////        self.weight = weight
////        self.age = age
////    }
////
////    convenience init(age: Int) {
////        self.init(weight: 0, age: age)
////    }
////
////    convenience init(weight: Int) {
////        self.init(weight: weight, age: 0)
////
////    }
////
////    convenience init() {
////        self.init(weight: 0)
////    }
////
////    func test() { }
////}
////
////let h1 = Human(weight: 70, age: 25)
////let h2 = Human(weight: 1)
////let h3 = Human()
////
////
////class Student: Human {
////
////    var fistName: String
////    var lastName: String
////
////    init(fistName: String, lastName: String) {
////        self.fistName = fistName
////        self.lastName = lastName
////        super.init(weight: 0, age: 0)
////    }
////
////    convenience init(firstName: String) {
////        self.init(fistName: firstName, lastName: "")
////    }
////
////
////}
//
//
//// override initials
//
//
////class Human {
////    var age: Int
////    var weight: Int
////
////    init(weight: Int, age: Int) {
////        self.weight = weight
////        self.age = age
////    }
////
////    convenience init(age: Int) {
////        self.init(weight: 0, age: age)
////    }
////
////    convenience init(weight: Int) {
////        self.init(weight: weight, age: 0)
////
////    }
////
////    convenience init() {
////        self.init(weight: 0)
////    }
////
////    func test() { }
////}
//
//class Student: Human {
//
//    var fistName: String
//    var lastName: String
//
//    init(fistName: String, lastName: String) {
//        self.fistName = fistName
//        self.lastName = lastName
//        super.init(weight: 0, age: 0)
//    }
//
//    convenience init(firstName: String) {
//        self.init(fistName: firstName, lastName: "")
//    }
//}
//
//
//class Doctor: Student {
//
//    var fieldOfStudy: String
//
//    init(fieldOfStudy: String) {
//        self.fieldOfStudy = fieldOfStudy
//        super.init(fistName: "", lastName: "")
//    }
//
//    override init(fistName: String, lastName: String) {
//        self.fieldOfStudy = "health"
//        super.init(fistName: fistName, lastName: lastName)
//    }
//
////    convenience init(fieldOfStudy: String) {
////        self.init(fistName: "1", lastName: "2")
////        self.fieldOfStudy = fieldOfStudy
////    }
////
//}
//
//let doctor = Doctor(firstName: "0")


// Initials 3

class Human {
    var age: Int
    var weight: Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
        
    }
    
    convenience init() {
        self.init(weight: 0)
    }
    
    func test() { }
}

enum Color: Int {
    case black
    case white
    
    init?(value: Int) {
        switch value {
        case 0:
            self = .black
        case 1:
            self = .white
        default:
            return nil
        }
    }
}

let color = Color(value: 1)
color?.rawValue
let colors = Color(rawValue: 1)
colors?.rawValue

struct Size {
    var width: Int
    var height: Int
    
    init?(width: Int, height: Int) {
        return nil

    }
}


class Man {
    var name: String
    var random: Int = {
        print("KEK")
        return Int.random(in: 1...2)
    }()
    
    init?(name: String) {
        print("LUL")
        self.name = name
    }
}

let man = Man(name: "1")!

class Rectangle {
    var height: Int
    var weight: Int
    init?(height h: Int, weight w: Int) {
        if !(h > 0 && w > 0) { return nil }
        self.height = h
        self.weight = w
       
} }
var rectangle = Rectangle(height: 56, weight: 4) // возвращает nil
