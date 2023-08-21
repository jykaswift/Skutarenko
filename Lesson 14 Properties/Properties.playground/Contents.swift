import UIKit

var greeting = "Hello, playground"

// Skutarenko

//struct Student {
//    var firstName: String {
//        didSet(oldValue) {
//            firstName = firstName.capitalized
//        }
//    }
//
//}
//
//var student = Student(firstName: "kek fsaf")
//
//student.firstName


// Homework
struct Student {
    
    struct DateOfBirth {
        let day: Int
        let month: Int
        let year: Int
    }
    
    var name: String {
        didSet {
            name = name.capitalized
        }
    }
    
    var surname: String {
        didSet {
            surname = surname.capitalized
        }
    }
    
    var fullname: String {
        get {
            name + " " + surname
        }
        
        set {
            let splitedString = newValue.split(separator: " ")

            if splitedString.count > 0 {
                name = String(splitedString[0])
            }
            
            if splitedString.count > 1 {
                surname = String(splitedString[1])
            }
        }
    }
    
    let dateOfBirth: DateOfBirth
    
    var age: Int {
        let calendar = Calendar.current
        let DOBComponents = DateComponents(
            year: dateOfBirth.year,
            month: dateOfBirth.month,
            day: dateOfBirth.day
        )
        let age = calendar.dateComponents([.year], from: calendar.date(from: DOBComponents)!, to: Date()).year
        return age ?? 0
    }
    
    var learningYears: Int {
        let age = self.age
        return age > 6 ? age - 6 : 0
    }
}

var student = Student(name: "Eugene", surname: "Borisov", dateOfBirth: .init(day: 30, month: 11, year: 2001))
student.name = "bob"
student.name
student.fullname
student.fullname = "sam bedoev"
student.fullname
student.age
student.learningYears

// №2

struct Point {
    var x: Double
    var y: Double
}

struct Segment {
    
    var a: Point
    var b: Point
    
    var midpoint: Point {
        get {
            let midX = (a.x + b.x) / 2
            let midY = (a.y + b.y) / 2
            return Point(x: midX, y: midY)
        }
        
        set {
            let differenceX = newValue.x - midpoint.x
            let differenceY = newValue.y - midpoint.y
            a.x += differenceX
            a.y += differenceY
            b.x += differenceX
            b.y += differenceY
        }
    }
    
    var lenght: Double {
        get {
            return sqrt(pow((a.x - b.x), 2) + pow((a.y - b.y), 2))
        }
        
        set {
            let coefficent = newValue / lenght
            b.x = a.x + (b.x - a.x) * coefficent
            b.y = a.y + (b.y - a.y) * coefficent
        }
    }
    
}

var segment = Segment(a: .init(x: 1, y: 1), b: .init(x: 2, y: 2))
segment.lenght
segment.midpoint
segment.midpoint = .init(x: 2.0, y: 3.0)
segment.midpoint.x
segment.midpoint.y
