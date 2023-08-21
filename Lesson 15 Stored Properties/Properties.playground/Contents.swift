import UIKit

class Test {
    
    lazy var stirng = "123"
}

let a = Test()
a

struct FileDescription {
    static var maxSize = 200
    
    let filePath: String
    
    var name: String {
        String(filePath.split(separator: "/").last ?? "")
    }
    
    var folderPath: String {
        let index = filePath.lastIndex(of: "/") ?? filePath.startIndex
        return String(filePath[filePath.startIndex...index])
    }
    
    var isHidden: Bool
    
    var content: String
    
    
    
}

let file = FileDescription(filePath: "/Users/evgenijborisov/Desktop/git/skutarenko/README.md", isHidden: false, content: "fsdf")

file.name
file.folderPath
FileDescription.maxSize
file.isHidden
file.content

// 2

enum Color: Int {
    static let startValue = 0x000000
    static let endValue = 0xFFFFFF
    static let totalColors = endValue - startValue
    
    case blue = 0x0000FF
    case req = 0xFF0000
    case yellow = 0xFFFF00
}

Color.startValue
Color.endValue
Color.totalColors

// 3

class Human {
    static let minAge = 0
    static let maxAge = 100
    static let minNameLenght = 0
    static let maxNameLenght = 100
    static let minSurnameLenght = 0
    static let maxSurnameLenght = 100
    static let minWeight = 5
    static let minHeight = 20
    static var countOfEntity = 0
    
    var name: String {
        didSet {
            if !(Human.minNameLenght...Human.maxNameLenght).contains(name.count) {
                name = oldValue
            }
        }
    }
    var surname: String
    var age: Int {
        didSet {
            if !(Human.minAge...Human.maxAge).contains(age) {
                age = oldValue
            }
        }
    }
    var weight: Int {
        didSet {
            if Human.minWeight <= weight {
                weight = oldValue
            }
        }
    }
    var height: Int {
        didSet {
            if Human.minHeight <= height {
                height = oldValue
            }
        }
    }
    
    init(name: String, surname: String, age: Int, weight: Int, height: Int) {
        self.name = name
        self.surname = surname
        self.age = age
        self.weight = weight
        self.height = height
        Human.countOfEntity += 1
    }
}

let test = Human(name: "", surname: "", age: 1, weight: 2, height: 3)
let test1 = Human(name: "", surname: "", age: 1, weight: 2, height: 3)
Human.countOfEntity
