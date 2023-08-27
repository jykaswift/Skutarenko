import UIKit

// Ysov

//class Pet {
//    var name = ""
//
//    func showName() {
//        print(name)
//    }
//
//}
//
//class Dog: Pet {
//
//    func bark() {
//        print("Wow")
//    }
//
//}
//
//class NoiseDog: Dog {
//
//    override func bark() {
//        print("WOOOOOOW")
//    }
//
//    func kek() {
//        super.bark()
//    }
//}
//
//class Test: NoiseDog {
//    override var name: String {
//        get {
//            return super.name
//        }
//
//        set {
//            super.name = "11"
//        }
//    }
//
//    func kekl() {
//        super.bark()
//    }
//}
//
//let dog = Dog()
//dog.showName()
//let nDog = NoiseDog()
//nDog.name = "Kek"
//nDog.showName()
//nDog.bark()
//nDog.kek()
//
//for i in [nDog] {
//    if let dog = i as? Dog {
//        dog.bark()
//        dog.name = "123"
//    }
//}
//
//nDog.showName()
//let a = Test()
//a.kekl()
//a.name
//
//
//class Name {
//    var name = "123"
//}
//
//class SubName: Name {
//    override var name: String {
//        get {
//            return super.name
//        }
//
//        set {
//            super.name = newValue
//        }
//    }
//}
//
//
//let name = Name()
//let subName = SubName()
//subName.name = "54321"
//subName.name
//let name2 = Name()
//name2.name

// homework №1

class Artist {
    var name: String
    var surname: String
    
    var fullname: String {
        name + " " + surname
    }
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    func perfomance() -> String {
        " performing \(fullname)"
    }
}

class Painter: Artist {
    
    override var name: String {
        didSet {
            super.name = "Salvador"
        }
    }
    
    override var surname: String {
        didSet {
            super.surname = "Dali"
        }
    }
    
 
    
    override init(name: String, surname: String) {
        super.init(name: name, surname: surname)
        self.name = "Saldavor"
        self.surname = "Dali"
    }
    
    
    override func perfomance() -> String {
        "Painter" + super.perfomance() + ": *PAINTS A PICTURE*"
    }
    
}

class Singer: Artist {
    override func perfomance() -> String {
        "Singer" + super.perfomance() + ": *SINGS A SONG*"
    }
}

class Musician: Artist {
    override func perfomance() -> String {
        "Musician" + super.perfomance() + ": *WRITES A COMPOSITION*"
    }
}

let singer = Singer(name: "Alex", surname: "Skutarenko")
let musician = Musician(name: "Eugene", surname: "Borisov")
let painter = Painter(name: "Alex", surname: "Bedoev")
painter.fullname
painter.name = "123"
painter.fullname
print("№1")
[singer, musician, painter].map { print($0.perfomance()) }

// №2
class Vehicle {
    
    var speedKmPerHour: Double {
        0
    }
    
    var capacity: Int {
        0
    }
    
    var priceOfOneTrip: Int {
        0
    }
    
    func tripWith(distanceInKm: Int, andCountOfPassangers passangers: Int) -> String {
        
        let totalTrips = Int((Double(passangers) / Double(capacity)).rounded(.up))
        let totalPrice = totalTrips * priceOfOneTrip
        let distanceInMeters = distanceInKm * 1000
        let speedMetertsPerMinute = 1000 * speedKmPerHour / 60
        let minutesToOneTrip = Int(Double(distanceInMeters) / speedMetertsPerMinute)
        
        var totalTime: Int
        if totalTrips == 1 {
            totalTime = minutesToOneTrip
        } else {
            totalTime = minutesToOneTrip * 2 * totalTrips
        }
        
        let totalHour = totalTime / 60
        let totalMinutes = totalTime % 60
        
        return "Trip to \(distanceInKm) km with \(passangers) passangers will take" +
                " \(totalHour) hour and \(totalMinutes) minutes and will cost \(totalPrice) rub"
    }
}


class Plane: Vehicle {
    override var speedKmPerHour: Double {
        340
    }
    
    override var capacity: Int {
        100
    }
    
    override var priceOfOneTrip: Int {
        10000
    }
}

class Car: Vehicle {
    override var speedKmPerHour: Double {
        120
    }
    
    override var capacity: Int {
        4
    }
    
    override var priceOfOneTrip: Int {
        2000
    }
}

class Ship: Vehicle {
    override var speedKmPerHour: Double {
        43
    }
    
    override var capacity: Int {
        200
    }
    
    override var priceOfOneTrip: Int {
        6000
    }
}

let plane = Plane()
let car = Car()
let ship = Ship()
print("№2")
for i in [plane, car, ship] {
    
    switch i {
    case is Plane:
        print("Plane: ")
    case is Car:
        print("Car")
    case is Ship:
        print("Ship")
    default:
        break
    }
    
    print(i.tripWith(distanceInKm: 100, andCountOfPassangers: 10))
    print(i.tripWith(distanceInKm: 100, andCountOfPassangers: 50))
    print(i.tripWith(distanceInKm: 100, andCountOfPassangers: 100))
    print(i.tripWith(distanceInKm: 100, andCountOfPassangers: 1000))
    print(i.tripWith(distanceInKm: 100, andCountOfPassangers: 10000))
}

// №3
// Родительские классы
class Creature { }
class Animals : Creature { }
class Creapy: Animals { }
class Quadrupedal: Animals { }

// Дочерние классы
class Human: Creature { }
class Dog: Quadrupedal { }
class Monkey: Animals { }
class Girrafe: Quadrupedal { }
class Crocodile: Creapy { }

let human1 = Human()
let human2 = Human()
let dog = Dog()
let monkey1 = Monkey()
let monkey2 = Monkey()
let girrafe = Girrafe()
let crocodile = Crocodile()

let creatures = [human1, human2, dog, monkey1, monkey2, girrafe, crocodile]

var typesOfCreatures = [
    "Creature": 0,
    "Quadrupedal": 0,
    "Creapy": 0,
    "Animals": 0
]


for creature in creatures {
    if creature is Quadrupedal { typesOfCreatures["Quadrupedal"]! += 1 }
    if creature is Creapy { typesOfCreatures["Creapy"]! += 1 }
    if creature is Animals { typesOfCreatures["Animals"]! += 1 }
    
    typesOfCreatures["Creature"]! += 1
}

print("№3 In creature array: ")
for (key, value) in typesOfCreatures {
    print("\(key): \(value)")
}
