//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 协议
protocol Person {
    func show()
}

// 遵守协议
struct Boy: Person {
    var name = ""

    init() {}
    init(_ name: String) {
        self.name = name
    }
    
    func show() {
        print("\(name)")
    }
}

// 饰物遵守协议
class Finery: Person {
    var component: Person
    
    init(_ component: Person) {
        self.component = component
    }
    
    func show() {
        component.show()
    }
}

// 继承
class TShirt: Finery {
    override func show() {
        print("T 恤", separator: "", terminator: " + ")
        super.show()
    }
}

// 继承
class ChineseTunicSuit: Finery {
    override func show() {
        print("中山装", separator: "", terminator: " + ")
        super.show()
    }
}

var b = Boy("Kingcos")

// 按顺序装饰
let tShirtA = TShirt(b)
let chineseTunicSuitA = ChineseTunicSuit(tShirtA)

chineseTunicSuitA.show()

let chineseTunicSuitB = ChineseTunicSuit(b)
let tShirtB = TShirt(chineseTunicSuitB)

tShirtB.show()
