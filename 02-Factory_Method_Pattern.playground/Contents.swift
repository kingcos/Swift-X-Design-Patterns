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
    static func createOperation() -> Operator {
        return Addition()
    }
    
    var num = (0.0, 0.0)
    
    func getResult() -> Double? {
        return num.0 + num.1
    }
}

struct Subtraction: Operator {
    static func createOperation() -> Operator {
        return Subtraction()
    }
    
    var num = (0.0, 0.0)
    
    func getResult() -> Double? {
        return num.0 - num.1
    }
}

struct Multiplication: Operator {
    static func createOperation() -> Operator {
        return Multiplication()
    }
    
    var num = (0.0, 0.0)
    
    func getResult() -> Double? {
        return num.0 * num.1
    }
}

struct Division: Operator {
    static func createOperation() -> Operator {
        return Division()
    }
    
    var num = (0.0, 0.0)
    
    func getResult() -> Double? {
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

var testDivision = Division.createOperation()
testDivision.num = (2, 0)
print(testDivision.getResult() ?? "Error")
