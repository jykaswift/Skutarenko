import UIKit

var greeting = "Hello, playground"

//class Adress {
//
//    var street = "Morskaya naberejnaya"
//    var number = "9"
//    var city = "saint-petersburg"
//    var country = "Russia"
//}
//
//struct Garage {
//    var size = 2
//}
//
//class House {
//    var rooms = 2
//    var adress = Adress()
//    var garage: Garage? = Garage()
//}
//
//class Car {
//
//    var model = "mercedec"
//
//    func start () {}
//
//}
//
//class Person {
//    var cars: [Car]? = [Car()]
//    var house: House? = House()
//
//}
//
//let p = Person()
//
//
//
//type(of: p.house?.garage?.size)
//print(type(of: p.house?.garage?.size = 3))
//
//p.cars?[0]

class Weak<T: AnyObject> {
  weak var value : T?
  init (value: T) {
    self.value = value
  }
}

// №1
class Human {
    
    static var countOfPeople = 0
    
    weak var father: Human?
    weak var mother: Human?
    var pets: [Pet]?
    var brothers: [Weak<Human>]? = []
    var sisters: [Weak<Human>]? = []
    
    init() {
        Human.countOfPeople += 1
    }
    
    deinit {
        print("deinit \(Human.countOfPeople)", terminator: " ")
        Human.countOfPeople -= 1
    }
}

// №2
class Woman: Human {
    func sayMoveSofa() -> String {
        "Move this sofa please"
    }
}
class Man: Human {
    func moveSofa() -> String {
        "Moving sofa"
    }
}

// №3, 4
class Pet {
    func makeASound() {
        print("Some sound")
    }
}
class Cat: Pet {
    override func makeASound() {
        print("Meuw")
    }
}
class Dog: Pet {
    override func makeASound() {
        print("Gav")
    }
}
class Parrot: Pet {
    override func makeASound() {
        print("Chirik")
    }
}


// Test clear references
if true {
    
    // FirstTask
    var humans = [Human]()
    
    for _ in 1...20 {
        humans.append(Human())
    }
    
    for _ in 1...100 {
        let human = humans.randomElement()!
        let setHuman = humans.randomElement()!
        let random = Int.random(in: 1...4)
        
        switch random {
        case 4:
            human.father = setHuman
        case 3:
            human.mother = setHuman
        case 2:
            human.brothers?.append(Weak(value: setHuman))
        case 1:
            human.sisters?.append(Weak(value: setHuman))
        default:
            continue
        }
    }
    
    let randomHuman = humans.randomElement()!
    var uncleCount = 0
    var auntCount = 0
    
    uncleCount += randomHuman.father?.brothers?.count ?? 0
    uncleCount += randomHuman.mother?.brothers?.count ?? 0
    auntCount += randomHuman.mother?.sisters?.count ?? 0
    auntCount += randomHuman.father?.sisters?.count ?? 0
    
    print("№1: Random human has \(uncleCount) uncles and \(auntCount) aunts")
    
    // Task 2
    
    var family = [Human]()
    for _ in 1...20 {
        let genderId = Int.random(in: 1...2)
        if genderId == 1 {
            family.append(Man())
        } else {
            family.append(Woman())
        }
    }
    
    var countOfMan = 0
    var countOfWoman = 0
    
    family.map {
        switch $0 {
        case let man as Man:
            man.moveSofa()
            countOfMan += 1
        case let woman as Woman:
            woman.sayMoveSofa()
            countOfWoman += 1
        default:
            break
        }
    }
    
    print("№2\nCount of woman \(countOfWoman)\nCount of man: \(countOfMan)")
    
    // №3
    var allPets = [Pet]()
    
    // Set random pets to random people
    
    for _ in 1...50 {
        let randomHuman = family.randomElement()!
        let randomPet = Int.random(in: 1...3)
        var pet: Pet
        
        switch randomPet {
        case 1:
            pet = Cat()
        case 2:
            pet = Dog()
        case 3:
            pet = Parrot()
        default:
            continue
        }
        
        if randomHuman.pets != nil {
            randomHuman.pets!.append(pet)
        } else {
            randomHuman.pets = [pet]
        }
        allPets.append(pet)
    }
    
    var (catCount, dogCount, parrotCount) = (0, 0, 0)
    
    allPets.map {
        switch $0 {
        case is Cat:
            catCount += 1
        case is Dog:
            dogCount += 1
        default:
            parrotCount += 1
        }
    }
    
    print("№3\nIn pets array:\n\(allPets.count) pets")
    print("\(catCount) cats")
    print("\(dogCount) dogs")
    print("\(parrotCount) parrots")
    
    // №4
    print("№4\n")
    allPets.map {
        $0.makeASound()
    }
    
}
