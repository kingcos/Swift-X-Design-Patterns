//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 人
class Person: Hashable {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var hashValue: Int {
        return name.hashValue
    }
    
    static func ==(l: Person, r: Person) -> Bool {
        return l.hashValue == r.hashValue
    }
    
    func accept(_ visitor: Action) {}
}

// 男
class Man: Person {
    override func accept(_ visitor: Action) {
        visitor.getManConclusion(self)
    }
}

// 女
class Woman: Person {
    override func accept(_ visitor: Action) {
        visitor.getWomanConclusion(self)
    }
}

// 行为 协议
protocol Action {
    func getManConclusion(_ elemA: Man)
    func getWomanConclusion(_ elemB: Woman)
}

// 成功
struct Success: Action {
    func getManConclusion(_ elemA: Man) {
        print("\(type(of: elemA)) \(type(of: self))")
    }
    
    func getWomanConclusion(_ elemB: Woman) {
        print("\(type(of: elemB)) \(type(of: self))")
    }
}

// 失败
struct Failing: Action {
    func getManConclusion(_ elemA: Man) {
        print("\(type(of: elemA)) \(type(of: self))")
    }
    
    func getWomanConclusion(_ elemB: Woman) {
        print("\(type(of: elemB)) \(type(of: self))")
    }
}

// 恋爱
struct Amativeness: Action {
    func getManConclusion(_ elemA: Man) {
        print("\(type(of: elemA)) \(type(of: self))")
    }
    
    func getWomanConclusion(_ elemB: Woman) {
        print("\(type(of: elemB)) \(type(of: self))")
    }
}

// 结婚
struct Marriage: Action {
    func getManConclusion(_ elemA: Man) {
        print("\(type(of: elemA)) \(type(of: self))")
    }
    
    func getWomanConclusion(_ elemB: Woman) {
        print("\(type(of: elemB)) \(type(of: self))")
    }
}

// 对象结构
struct ObjectStructure {
    var elements = Set<Person>()
    
    mutating func attach(_ element: Person) {
        elements.insert(element)
    }
    
    mutating func detach(_ element: Person) {
        elements.remove(element)
    }
    
    func display(_ visitor: Action) {
        for e in elements {
            e.accept(visitor)
        }
    }
}

var os = ObjectStructure()
os.attach(Man("Kingcos"))
os.attach(Woman("Jane"))

let success = Success()
os.display(success)

let failing = Success()
os.display(failing)

let loving = Amativeness()
os.display(loving)

let marriage = Marriage()
os.display(marriage)
