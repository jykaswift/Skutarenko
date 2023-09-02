import UIKit

extension Int {
    
    var isEven: Bool {
        self.isMultiple(of: 2)
    }
    
    enum EvenOrOdd {
        case even
        case odd
    }
    
    var evenOrOdd: EvenOrOdd {
        isEven ? .even : .odd
    }
}
let integer = 2
integer.isEven
integer.evenOrOdd

// homework
// №1
extension Int {
     
    func isNegative() -> Bool { self < 0 }
    
    func isPositive() -> Bool { self > 0 }
    
    var bool: Bool { self != 0 }
    
    var length: Int { String(self).count }
    
    subscript(_ number: Int) -> Int? {
        
        get {
            
            if number >= self.length { return nil }
            var temp = self
            var result = 0
            
            for _ in 0...number {
                result = temp % 10
                temp /= 10
            }
            
            return result
        }
        
    }
}


let int = 345
int.isNegative()
int.isPositive()
int.bool
int.length
int[1]
int[2]
int[3]

// №2$
extension String {
    
    func isValidRange(intRange: ClosedRange<Int>) -> Bool {
        intRange.upperBound < self.count && intRange.lowerBound >= 0
    }
    
    subscript(_ range: ClosedRange<Int>) -> String? {
        
        get {
            if !isValidRange(intRange: range) { return nil }
            let fisrtIndex = self.startIndex
            let startIndex = self.index(fisrtIndex, offsetBy: range.lowerBound)
            let lastIndex = self.index(fisrtIndex, offsetBy: range.upperBound)
            return String(self[startIndex...lastIndex])
        }
        
        set {
            
            if !isValidRange(intRange: range) { return }
            var array = Array(self)
            if let newValue = newValue {
                array.replaceSubrange(range, with: Array(newValue))
            } else {
                array.replaceSubrange(range, with: [])
            }
            
            self = String(array)
        }
    }
    
    func truncated(count: Int) -> String {
        
        if count >= self.count {
            return self + "..."
        }
        
        return self[0...count - 1]! + "..."
        
    }
}

var string = "Hello"
string[2...4]
string[0...5]
string[0...1] = "Ke"
string
string[0...2] = nil
string
var stringToTruncate = "1234567"
stringToTruncate.truncated(count: 6)
