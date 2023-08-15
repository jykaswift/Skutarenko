import UIKit

let tuple: (Int, String) = (1, "Hello")
let namedTuple: (name: String, surname: String) = (name: "1", surname: "2")
let (name, surname) = namedTuple
let (getName, _) = namedTuple
getName
namedTuple.name

let semiNamedTuple = (x:1, 2)

semiNamedTuple.x
semiNamedTuple.0
semiNamedTuple.1

// Homework
// №1

var sportPerfomance = (pushUp: 20, pullUp: 10, sitUp: 20)
print(sportPerfomance)
print(
    "№1\nСпортивные характеристики:\n" +
    "Отжимания: \(sportPerfomance.pushUp) раз\n" +
    "Подтягивания: \(sportPerfomance.1) раз\n" +
    "Приседания: \(sportPerfomance.sitUp) раз\n"
)

// №2

var girlfriendSportPerfomance = (pushUp: 50, pullUp: 51, sitUp: 105)
print("№2\nGirlfriend: \(girlfriendSportPerfomance)\nMe: \(sportPerfomance)")
let temp = girlfriendSportPerfomance
girlfriendSportPerfomance = sportPerfomance
sportPerfomance = temp
print("Girlfriend: \(girlfriendSportPerfomance) \nMe: \(sportPerfomance)")

// №3

let differencePerfomance = (girlfriendSportPerfomance.pushUp - sportPerfomance.pushUp,
                            girlfriendSportPerfomance.pullUp - sportPerfomance.pullUp,
                            girlfriendSportPerfomance.sitUp - sportPerfomance.sitUp)
print("\n№3\nDifference \(differencePerfomance)")
