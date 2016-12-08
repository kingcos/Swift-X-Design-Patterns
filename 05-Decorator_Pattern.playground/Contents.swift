//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

protocol Person {
    func show()
}

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

// 饰物
class Finery: Person {
    var component: Person
    
    init(_ component: Person) {
        self.component = component
    }
    
    func show() {
        component.show()
    }
}

class TShirt: Finery {
    override func show() {
        print("T 恤", separator: "", terminator: " + ")
        super.show()
    }
}

class ChineseTunicSuit: Finery {
    override func show() {
        print("中山装", separator: "", terminator: " + ")
        super.show()
    }
}

var p = Boy("Kingcos")

// 按顺序装饰
let tShirtA = TShirt(p)
let chineseTunicSuitA = ChineseTunicSuit(tShirtA)

chineseTunicSuitA.show()

let chineseTunicSuitB = ChineseTunicSuit(p)
let tShirtB = TShirt(chineseTunicSuitB)

tShirtB.show()
