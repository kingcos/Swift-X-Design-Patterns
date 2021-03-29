//: Playground - noun: a place where people can play
// Powered by https://kingcos.me from https://github.com/kingcos/Swift-X-Design-Patterns

import UIKit

// 协议
protocol Operator {
    var nums: (Double, Double) { get set }
    
    func getResult() -> Double?
    // 工厂
    static func createOperation() -> Operator
}

// 遵守协议
struct Addition: Operator {
    static func createOperation() -> Operator {
        return Addition()
    }
    
    var nums = (0.0, 0.0)
    
    func getResult() -> Double? {
        return nums.0 + nums.1
    }
}

struct Subtraction: Operator {
    static func createOperation() -> Operator {
        return Subtraction()
    }
    
    var nums = (0.0, 0.0)
    
    func getResult() -> Double? {
        return nums.0 - nums.1
    }
}

struct Multiplication: Operator {
    static func createOperation() -> Operator {
        return Multiplication()
    }
    
    var nums = (0.0, 0.0)
    
    func getResult() -> Double? {
        return nums.0 * nums.1
    }
}

struct Division: Operator {
    static func createOperation() -> Operator {
        return Division()
    }
    
    var nums = (0.0, 0.0)
    
    func getResult() -> Double? {
        guard nums.1 != 0 else {
            return nil
        }
        return nums.0 / nums.1
    }
}

var testAddition = Addition.createOperation()
testAddition.nums = (2, 3)
print(testAddition.getResult() ?? "Error")

var testDivision = Division.createOperation()
testDivision.nums = (2, 0)
print(testDivision.getResult() ?? "Error")
