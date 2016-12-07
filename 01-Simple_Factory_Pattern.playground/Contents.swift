//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 协议
protocol Operator {
    var num: (Double, Double) { get set }
    
    func getResult() -> Double?
}

// 遵守协议
struct Addition: Operator {
    var num = (0.0, 0.0)
    
    func getResult() -> Double? {
        return num.0 + num.1
    }
}

class Subtraction: Operator {
    var num = (0.0, 0.0)
    
    func getResult() -> Double? {
        return num.0 - num.1
    }
}

struct Multiplication: Operator {
    var num = (0.0, 0.0)
    
    func getResult() -> Double? {
        return num.0 * num.1
    }
}

struct Division: Operator {
    var num = (0.0, 0.0)
    
    func getResult() -> Double? {
        var result: Double?
        if num.1 != 0 {
            result = num.0 / num.1
        }
        return result
    }
}

// 操作符枚举
enum Operators {
    case Addition, Subtraction, Multiplication, Division
}

// 工厂
struct OperatorFactory {
    static func calculateForOperator(_ opt: Operators) -> Operator {
        switch opt {
        case .Addition:
            return Addition()
        case .Subtraction:
            return Subtraction()
        case .Multiplication:
            return Multiplication()
        case .Division:
            return Division()
        }
    }
}

var testDivision = OperatorFactory.calculateForOperator(.Division)
testDivision.num = (1, 0)
print(testDivision.getResult() ?? "Error")

var testAddition = OperatorFactory.calculateForOperator(.Addition)
testAddition.num = (1, 1)
print(testAddition.getResult() ?? "Error")
