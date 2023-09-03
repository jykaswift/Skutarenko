import UIKit

//var greeting = "Hello, playground"
//
//protocol SomeProtocol {
//
//    var mustBeSettable: Int { get set }
//    var doesNotNeedToBeSettable: Int { get }
//
//}
//
//struct SomeClass: SomeProtocol {
//    var mustBeSettable: Int
//
//    var doesNotNeedToBeSettable: Int
//
//
//}
//
//protocol RandomNumberGenerator {
//    var randomCollection: [Int] { get set }
//    func getRandomNumber() -> Int
//    mutating func setNewRandomCollection(newValue: [Int])
//}
//
//
//struct RandomGenerator: RandomNumberGenerator {
//    var randomCollection = [1, 2, 3]
//
//    func getRandomNumber() -> Int {
//            return randomCollection.randomElement()!
//    }
//
//    mutating func setNewRandomCollection(newValue: [Int]) {
//        randomCollection = newValue
//    }
//
//}
//
//
//protocol Named {
//    init(name: String)
//}
//class Person: Named {
//    var name: String
//    required init(name: String) {
//        self.name = name
//    }
//}
//
//func getHash<T: Hashable>(of value: T) -> Int {
//    return value.hashValue
//}


// homework


protocol Food {
    var name: String { get }
    func taste()
}

protocol Storable {
    var isExpired: Bool { get set }
    var daysToExpired: Int { get set }
}

class Orange: Food {
    let name = "Orange"
    
    func taste() {
        print("Very ripe and delicious orange")
    }
}

struct Fish: Food, Storable {
    var isExpired: Bool
    var daysToExpired: Int
    var name: String

    func taste() { print("Very tasty \(name) fish") }
}

struct Coockies: Food {
    var name: String
    
    func taste() { print("Very tasty coockies") }
}

class Meat: Food, Storable {
    var isExpired: Bool
    var daysToExpired: Int
    var name: String
    
    init(name: String, daysToExpired: Int, isExpired: Bool) {
        self.name = name
        self.daysToExpired = daysToExpired
        self.isExpired = isExpired
    }
    
    func taste() { print("Tasty \(name) meat") }
}

// №1
let food: [Food] = [
    Orange(),
    Meat(name: "Chiken", daysToExpired: 20,isExpired: false),
    Meat(name: "Pig", daysToExpired: 0, isExpired: true),
    Coockies(name: "Nesquid"),
    Fish(isExpired: false, daysToExpired: 14, name: "Salmon"),
    Fish(isExpired: false, daysToExpired: 10, name: "Perch"),
    Orange(),
    Coockies(name: "Pops"),
    Meat(name: "Cow", daysToExpired: 5, isExpired: false)
]

func printFoodIn(array: [Food]) {
    array.map {
        print("\nName: \($0.name)")
        print("The taste of it: ", terminator: "")
        $0.taste()
    }
}
printFoodIn(array: food)

// №2, 3

var refrigirator = food.filter { item in
    if let food = item as? Storable {
        return !food.isExpired
    } else {
        return false
    }
} as! [Storable & Food]

  
refrigirator.sort { a, b in
    if a.daysToExpired == b.daysToExpired {
        return a.name.lowercased() < b.name.lowercased()
    } else {
        return a.daysToExpired > b.daysToExpired
    }
}
print("\n----№2, 3----")

printFoodIn(array: refrigirator)
