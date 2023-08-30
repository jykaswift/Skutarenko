import UIKit

var greeting = "Hello, playground"

class Pet {
    
}

class Animal: Pet {
    func make() {
        print("kek")
    }
}

let a: Pet = Animal()

(a as! Animal).make()
