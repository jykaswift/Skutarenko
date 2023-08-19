import UIKit

//var greeting = "Hello, playground"
//
//enum CurrencyUnit {
//    case rouble, euro
//}
//
//
//let rubleCurrency: CurrencyUnit = .rouble
//let euroCurrency = CurrencyUnit.euro
//
//enum AdvancedCurrencyUnit {
//    case rouble(countries: [String], shortName: String)
//    case euro([String], String)
//    case dollar(nation: DollarCountries, shortName: String)
//
//    enum DollarCountries {
//        case usa
//        case canada
//        case australia
//    }
//}
//
//let advancedEuroCurrency: AdvancedCurrencyUnit = .euro(["Germany"], "EUR")
//
//let australia = AdvancedCurrencyUnit.DollarCountries.australia
//
//var dollarCurrency = AdvancedCurrencyUnit.dollar(nation: .canada, shortName: "USD")
//
//let advancedCurrencyRuble = AdvancedCurrencyUnit.rouble(countries: [""], shortName: "")
//
//// 19.4. Оператор switch для перечислений
//
//switch advancedCurrencyRuble {
//case .rouble:
//    print("Рубль")
//case let .dollar(nation, shortName):
//    print("Доллар \(nation) \(shortName)")
//case .euro(let contries, let shortName):
//    print("Euro \(shortName) \(contries)")
//}
//
//// 19.5. Связанные значения членов перечисления
//
//enum Smile: String {
//    case joy = ":)"
//    case laugh = ":D"
//    case sorrow = ":("
//    case surprise = "o_O"
//
//    var description: String {
//        return self.rawValue
//    }
//}
//
//let laugh = Smile.laugh
//laugh.rawValue
//
//
//// 19.6. Инициализатор
//
//let smile = Smile.init(rawValue: ":)")
//let smile3 = Smile(rawValue: ":)")
//smile
//type(of: smile) // Smile?
//
//
//// 19.7. Свойства в перечислениях
//
//smile?.description
//
//// 19.8. Методы в перечислениях
//
//enum Smile2: String {
//    case joy = ":)"
//    case laugh = ":D"
//    case sorrow = ":("
//    case surprise = "o_O"
//
//    var description: String {
//        return self.rawValue
//    }
//
//    func descriptionValue() -> Smile2 {
//        return self
//    }
//    func descriptionRaw() -> String {
//        return rawValue
//    }
//}
//
//let smile2: Smile2 = .joy
//smile2.descriptionValue()
//smile2.descriptionRaw()
//
//
//// 19.10. Рекурсивные перечисления
//
//enum ArithmeticExpression {
//    // операция сложения
//    case addition(Int, Int)
//    // операция вычитания
//    case substraction(Int, Int)
//
//    func evaluate() -> Int {
//        switch self {
//        case .addition(let a, let b):
//            return a + b
//        case .substraction(let a, let b):
//            return a - b
//        }
//    }
//}
//let expr = ArithmeticExpression.addition(10, 14)
//expr.evaluate()
//
//enum ArithmeticExpressionRecursive {
//    // указатель на конкретное значение
//    case number( Int )
//    // указатель на операцию сложения
//    indirect case addition( ArithmeticExpressionRecursive, ArithmeticExpressionRecursive )
//    // указатель на операцию вычитания
//    indirect case subtraction( ArithmeticExpressionRecursive, ArithmeticExpressionRecursive )
//    // метод, проводящий операцию
//    func evaluate( _ expression: ArithmeticExpressionRecursive? = nil ) -> Int {
//        // определение типа операнда (значение или операция)
//        switch expression ?? self {
//            case let .number( value ):
//                return value
//            case let .addition( valueLeft, valueRight ):
//                return evaluate( valueLeft ) + evaluate( valueRight )
//            case .subtraction( let valueLeft, let valueRight ):
//                return evaluate( valueLeft ) - evaluate( valueRight )
//} }
//}
//let hardExpr = ArithmeticExpressionRecursive .addition( .number(20),
//              .subtraction( .number(10), .number(34) ) )
//hardExpr.evaluate() // -4
//
//switch "." {
//case "a"..."z":
//    print("hello")
//default:
//    break
//}

// Homework №1

//enum ChessFigure {
//
//    enum Color {
//        case white
//        case black
//    }
//
//    case king(color: Color, column: String, row: Int)
//    case queen(color: Color, column: String, row: Int)
//    case rook(color: Color, column: String, row: Int)
//    case knight(color: Color, column: String, row: Int)
//    case bishop(color: Color, column: String, row: Int)
//    case pawn(color: Color, column: String, row: Int)
//}

//let pawn: ChessFigure = .pawn(color: .white, column: "A", row: 7)
//let king: ChessFigure = .king(color: .black, column: "B", row: 8)

// №2, 3, 4


enum ChessFigure {
    
    enum Color: String {
        case white = "white"
        case black = "black"
    }
    
    case king(color: Color, column: String, row: Int)
    case queen(color: Color, column: String, row: Int)
    case rook(color: Color, column: String, row: Int)
    case knight(color: Color, column: String, row: Int)
    case bishop(color: Color, column: String, row: Int)
    case pawn(color: Color, column: String, row: Int)
    
    var unicode: String {
        switch self {
        case .king(let color, _, _) where color == .white:
            return "\u{2654}"
        case .king(let color, _, _) where color == .black:
            return "\u{265A}"
        case .queen(let color, _, _) where color == .white:
            return "\u{2655}"
        case .queen(let color, _, _) where color == .black:
            return "\u{265B}"
        case .rook(let color, _, _) where color == .white:
            return "\u{2656}"
        case .rook(let color, _, _) where color == .black:
            return "\u{265C}"
        case .knight(let color, _, _) where color == .white:
            return "\u{2658}"
        case .knight(let color, _, _) where color == .black:
            return "\u{265E}"
        case .bishop(let color, _, _) where color == .white:
            return "\u{2657}"
        case .bishop(let color, _, _) where color == .black:
            return "\u{265D}"
        case .pawn(let color, _, _) where color == .white:
            return "\u{2659}"
        case .pawn(let color, _, _) where color == .black:
            return "\u{265F}"
        default:
            return ""
        }
    }
    
}

var chessBoard: [String : [Int : ChessFigure]] = [:]

let columnArray = ["A", "B", "C", "D", "E", "F", "G", "H"]

func setFigure(figure: ChessFigure) {
    switch figure {
    case let .king(_,column,row),
        let .queen(_,column,row),
        let .rook(_,column,row),
        let .knight(_,column,row),
        let .bishop(_,column,row),
        let .pawn(_,column,row):
        if let _ = chessBoard[column] {
            chessBoard[column]![row] = figure
        } else {
            chessBoard[column] = [row:figure]
        }
        
    }
}

func printDesk() {
    for row in stride(from: 8, to: 0, by: -1) {
        for (i, column) in columnArray.enumerated() {
            if let column = chessBoard[column], let row = column[row] {
                print(row.unicode, terminator: " ")
            } else {
                let color = (row + i + 1) % 2 == 0 ? "\u{25A0}" : "\u{25A1}"
                print(color, terminator: " ")
            }
        }
        print()
    }
}

func moveFigure(figure: ChessFigure, coords: (column:String, row:Int)) {
    let oldCoords: (column:String, row:Int)
    switch figure {
    case let .king(_,column,row),
        let .queen(_,column,row),
        let .rook(_,column,row),
        let .knight(_,column,row),
        let .bishop(_,column,row),
        let .pawn(_,column,row):
        oldCoords = (column, row)
    }
    
    chessBoard[oldCoords.column]![oldCoords.row] = nil
    chessBoard[coords.column]![coords.row] = figure
}

let whiteBishop: ChessFigure = .bishop(color: .white, column: "A", row: 1)
let whitePawn: ChessFigure = .pawn(color: .white, column: "B", row: 2)
let blackKing: ChessFigure = .king(color: .black, column: "D", row: 8)

setFigure(figure: whiteBishop)
setFigure(figure: whitePawn)

printDesk()
print()
moveFigure(figure: whiteBishop, coords: ("A", 2))
printDesk()







