//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-X-Design-Patterns

import UIKit

// 协议
protocol Operator {
    var nums: (Double, Double) { get set }
    
    func getResult() -> Double?
}

// 遵守协议
struct Addition: Operator {
    var nums = (0.0, 0.0)
    
    func getResult() -> Double? {
        return nums.0 + nums.1
    }
}

class Subtraction: Operator {
    var nums = (0.0, 0.0)
    
    func getResult() -> Double? {
        return nums.0 - nums.1
    }
}

struct Multiplication: Operator {
    var nums = (0.0, 0.0)
    
    func getResult() -> Double? {
        return nums.0 * nums.1
    }
}

struct Division: Operator {
    var nums = (0.0, 0.0)
    
    func getResult() -> Double? {
        guard nums.1 != 0 else {
            return nil
        }
        
        return nums.0 / nums.1
    }
}

// 操作符枚举
enum Operators {
    case addition, subtraction, multiplication, division
}

// 工厂
struct OperatorFactory {
    static func calculateForOperator(_ opt: Operators) -> Operator {
        switch opt {
        case .addition:
            return Addition()
        case .subtraction:
            return Subtraction()
        case .multiplication:
            return Multiplication()
        case .division:
            return Division()
        }
    }
}

var testDivision = OperatorFactory.calculateForOperator(.division)
testDivision.nums = (1, 0)
print(testDivision.getResult() ?? "Error")

var testAddition = OperatorFactory.calculateForOperator(.addition)
testAddition.nums = (1, 1)
print(testAddition.getResult() ?? "Error")
