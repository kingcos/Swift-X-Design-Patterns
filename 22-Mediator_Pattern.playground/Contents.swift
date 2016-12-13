//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 国家协议
protocol Country {
    var mediator: UnitedNations { get }
}

// 联合国协议
protocol UnitedNations {
    func declare(_ message: String, _ colleague: Country)
}

// A 国
class CountryA: Country {
    var mediator: UnitedNations
    
    init(_ mediator: UnitedNations) {
        self.mediator = mediator
    }
    
    func declare(_ message: String) {
        mediator.declare(message, self)
    }
    
    func getMessage(_ message: String) {
        print("A 国获得消息：\(message)")
    }
}

// B 国
class CountryB: Country {
    var mediator: UnitedNations
    
    init(_ mediator: UnitedNations) {
        self.mediator = mediator
    }
    
    func declare(_ message: String) {
        mediator.declare(message, self)
    }
    
    func getMessage(_ message: String) {
        print("B 国获得消息：\(message)")
    }
}

// 联合国安理会
class UnitedNationsSecurityCouncil: UnitedNations {
    var cA: CountryA?
    var cB: CountryB?
    
    func declare(_ message: String, _ colleague: Country) {
        if type(of: colleague) == type(of: cA!) {
            cB!.getMessage(message)
        } else {
            cA!.getMessage(message)
        }
    }
}

var unsc = UnitedNationsSecurityCouncil()
let cA = CountryA(unsc)
let cB = CountryB(unsc)

unsc.cA = cA
unsc.cB = cB

cA.declare("Message A")
cB.declare("Message B")
