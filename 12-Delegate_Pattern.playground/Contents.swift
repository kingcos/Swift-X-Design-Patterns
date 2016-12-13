//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 协议
protocol Subject {
    var updates: [() -> ()] { get }
    func notify()
}

class Boss: Subject {
    var updates: [() -> ()] = []

    func notify() {
        for i in 0..<updates.count {
            updates[i]()
        }
    }
}

// 看股票
class StockObserver {
    var name: String
    var sub: Subject
    
    init(_ name: String, _ sub: Subject) {
        self.name = name
        self.sub = sub
    }
    
    func turnOffStockMarket() {
        print("\(name) 关闭股票，继续工作")
    }
}

// 看 NBA
class NBAObserver {
    var name: String
    var sub: Subject
    
    init(_ name: String, _ sub: Subject) {
        self.name = name
        self.sub = sub
    }
    
    func turnOffNBA() {
        print("\(name) 关闭 NBA，继续工作")
    }
}

let boss = Boss()
let colleagueA = StockObserver("A", boss)
let colleagueB = NBAObserver("B", boss)

boss.updates.append(colleagueA.turnOffStockMarket)
boss.updates.append(colleagueB.turnOffNBA)

// 发出通知
boss.notify()
