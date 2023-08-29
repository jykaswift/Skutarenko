import UIKit

var greeting = "Hello, playground"


class Student {
    deinit {
        print("goodbye student")
    }
}

class Teacher {
    deinit {
        print("goodbye teacher")
    }
}

var a = 1
var b = 2

var closure = {
    print("\(a) \(b)")
}

closure()

a = 3
b = 4

closure()


class House {
    var title: String
    var owner: Human?
    init(title: String, owner: Human? = nil) {
        print("Дом \(title) создан")
            self.title = title
            self.owner = owner
        return
}
deinit{
        print("Дом \(title) уничтожен")
    }
}
//class Human {
//    var name: String
//    init(name: String) {
//        print("Владелец \(name) создан")
//        self.name = name
//        return
//}
//deinit {
//        print("Владелец \(name) уничтожен")
//    }
//}

//class Human {
//    var name: String
//    var houses: [House] = []
//    init(name: String) {
//        print("Владелец \(name) создан")
//        self.name = name
//        return
//}
//    func add(house: House) {
//        self.houses.append(house)
//    }
//deinit {
//        print("Владелец \(name) уничтожен")
//    }
//}
//
//if true { // шаг 1
//    let houseOwner = Human(name:"Василий")
//    if true { // шаг 2
//        let house = House(title:"Частный дом", owner: houseOwner)
//        houseOwner.add(house: house)
//} // шаг 3
//    // шаг 4
//    let secondHouse = House(title: "Квартира", owner: houseOwner)
//    houseOwner.add(house: secondHouse)
//} // шаг 5
//

class Human {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        print("\(firstName) \(lastName) init")
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Father: Human {
    var mother: Mother?
    var childrens: [Children]?
    
    lazy var printAllFamily: () -> () = {
        [unowned self] in
        print("Print all family:")
        print()
        print("Mother: \(self.mother!.firstName)")
        print("Childerns: ")
        self.childrens!.map {
            print($0.firstName)
        }
        
    }
    
    lazy var printMother: () -> () = {
        [unowned self] in
        print("Print mother")
        print()
        print("Mother: \(self.mother!.firstName)")
    }
    
    lazy var printChildrens: () -> () = {
        [unowned self] in
        print("Print children:")
        print()
        print("Childerns: ")
        self.childrens!.map {
            print($0.firstName)
        }
    }
    
    init(firstName: String, lastName: String, mother: Mother) {
        self.mother = mother
        super.init(firstName: firstName, lastName: lastName)
    }
    
    override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    deinit {
        print("Father die")
    }
    
}

class Mother: Human {
    var childrens: [Children]?
    weak var father: Father?
    
    deinit {
        print("Mother die")
    }
}

class Children: Human {
    unowned var father: Father
    unowned var mother: Mother
    
    init(firstName: String, lastName: String, mother: Mother, father: Father) {
        self.father = father
        self.mother = mother
        super.init(firstName: firstName, lastName: lastName)
    }
    
    func talkWithOtherChilden(children: Children) {
        print("Give me a toy \(children.firstName) \(children.lastName)")
    }
    
    func talkWithFather() {
        print("Give me a sweet \(father.firstName) \(father.lastName)")
    }
    
    func talkWithMother() {
        print("Give me a toy \(mother.firstName) \(mother.lastName)")
    }
    
    deinit {
        print("Children die")
    }
}


class Family {
    
    var father: Father!
    var mother: Mother!
    
    var childrens: [Children]?
    
    init(father: Father, mother: Mother, childrens: Children...) {
        self.childrens = childrens
        self.father = father
        self.mother = mother
        
        father.mother = mother
        mother.father = father
        mother.childrens = self.childrens
        father.childrens = self.childrens
        
    }
    
}

if true {
    let father = Father(firstName: "Mister", lastName: "Smith")
    let mother = Mother(firstName: "Missis", lastName: "Smith")
    let children1 = Children(firstName: "Child", lastName: "One", mother: mother, father: father)
    let children2 = Children(firstName: "Child", lastName: "Two", mother: mother, father: father)
    let family = Family(father: father, mother: mother, childrens: children1, children2)
    father.printMother()
    father.printChildrens()
    father.printAllFamily()
    print()
    print("Child talk:")
    children1.talkWithOtherChilden(children: children2)
    children1.talkWithFather()
    children1.talkWithMother()
    
}
