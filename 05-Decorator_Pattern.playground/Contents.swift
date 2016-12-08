//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

class Person {
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
    var component = Person()
    
    func decorate(_ component: Person) {
        self.component = component
    }
    
    override func show() {
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

var p = Person("Kingcos")
let tShirtA = TShirt()
let chineseTunicSuitA = ChineseTunicSuit()

// 按顺序装饰
tShirtA.decorate(p)
chineseTunicSuitA.decorate(tShirtA)

chineseTunicSuitA.show()

let tShirtB = TShirt()
let chineseTunicSuitB = ChineseTunicSuit()

chineseTunicSuitB.decorate(p)
tShirtB.decorate(chineseTunicSuitB)

tShirtB.show()
