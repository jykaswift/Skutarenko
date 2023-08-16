import UIKit

var greeting = "Hello, playground"

var number: Int? = 3

if var optional = number {
    optional += 2

}

let string = "123"

let a = Int("123")


//homework
// №1

let first = "12"
let second = "ad123"
let third = "13"

var sum = 0

if let first = Int(first) {
    sum += first
}

if Int(second) != nil {
    sum += Int(second)!
}

sum += Int(third) ?? 0

print("№1: Sum of three constants is: \(sum)")

// №2

print("№2")

let serverResponse: (statusCode: Int, message: String?, errorMsg: String?) = (299, "Good response", nil)

if (200..<300).contains(serverResponse.statusCode) {
    print(serverResponse.message ?? "No message")
} else {
    if let errMsg = serverResponse.errorMsg {
        print(errMsg)
    }
}

let serverMessage: (message: String?, errMessage: String?) = ("Hello user", nil)

if serverMessage.message != nil {
    print(serverMessage.message!)
} else {
    print(serverMessage.errMessage ?? "")
}

// №3
print("№3")
typealias Student = (name: String, machine: Int?, lastMark: Int?)

let student: Student = ("Eugene", 5, 5)
let student2: Student = ("Mark", nil, nil)
let student3: Student = ("Alex", 4, nil)

if let machine = student.machine, let mark = student.lastMark {
    print("Student \(student.name) had machine number \(machine) with mark \(mark)")
} else if let machine = student.machine {
    print("Student \(student.name)  had machine number \(machine) but he did not write the test")
} else if let mark = student.lastMark {
    print("Student \(student.name)  had not machine but he got mark \(mark)")
} else {
    print("Student \(student.name) doent write the test and doesnt have a machine")
}

if let machine = student2.machine, let mark = student.lastMark {
    print("Student \(student2.name) had machine number \(machine) with mark \(mark)")
} else if let machine = student2.machine {
    print("Student \(student2.name)  had machine number \(machine) but he did not write the test")
} else if let mark = student2.lastMark {
    print("Student \(student2.name)  had not machine but he got mark \(mark)")
} else {
    print("Student \(student2.name) doent write the test and doesnt have a machine")
}

if let machine = student3.machine, let mark = student3.lastMark {
    print("Student \(student3.name) had machine number \(machine) with mark \(mark)")
} else if let machine = student3.machine {
    print("Student \(student3.name)  had machine number \(machine) but he did not write the test")
} else if let mark = student3.lastMark {
    print("Student \(student3.name)  had not machine but he got mark \(mark)")
} else {
    print("Student \(student3.name) doent write the test and doesnt have a machine")
}
