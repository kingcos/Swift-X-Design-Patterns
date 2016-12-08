//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 协议
protocol Operator {
    // 工厂
    static func calculate() -> Calculator
}

// 协议
protocol Calculator {
    var num: (Double, Double) { get set }
    
    func getResult() -> Double?
}

struct Addition: Operator {
    // 工厂
    static func calculate() -> Calculator {
        return Add()
    }
}

struct Subtraction: Operator {
    // 工厂
    static func calculate() -> Calculator {
        return Subtract()
    }
}

// 遵守协议
struct Add: Calculator {
    var num = (0.0, 0.0)
    
    func getResult() -> Double? {
        return num.0 + num.1
    }
}

// 遵守协议
struct Subtract: Calculator {
    var num = (0.0, 0.0)
    
    func getResult() -> Double? {
        return num.0 - num.1
    }
}

var factory = Addition.calculate()
factory.num = (1, 1)
print(factory.getResult() ?? "Error")

factory = Subtraction.calculate()
factory.num = (1, 1)
print(factory.getResult() ?? "Error")
