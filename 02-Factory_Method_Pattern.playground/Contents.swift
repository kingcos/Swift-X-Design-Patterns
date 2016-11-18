//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 协议
protocol Operator {
    var num: (Double, Double) { get set }
    
    func getResult() -> Double?
    // 工厂
    static func createOperation() -> Operator
}

// 遵守协议
struct Addition: Operator {
    internal static func createOperation() -> Operator {
        return Addition()
    }
    
    internal var num = (0.0, 0.0)
    
    internal func getResult() -> Double? {
        return num.0 + num.1
    }
}

struct Subtraction: Operator {
    internal static func createOperation() -> Operator {
        return Subtraction()
    }
    
    internal var num = (0.0, 0.0)
    
    internal func getResult() -> Double? {
        return num.0 - num.1
    }
}

struct Multiplication: Operator {
    internal static func createOperation() -> Operator {
        return Multiplication()
    }
    
    internal var num = (0.0, 0.0)
    
    internal func getResult() -> Double? {
        return num.0 * num.1
    }
}

struct Division: Operator {
    internal static func createOperation() -> Operator {
        return Division()
    }
    
    internal var num = (0.0, 0.0)
    
    internal func getResult() -> Double? {
        var result: Double?
        if num.1 != 0 {
            result = num.0 / num.1
        }
        return result
    }
}

var testAddition = Addition.createOperation()
testAddition.num = (2, 3)
print(testAddition.getResult() ?? "Error")
