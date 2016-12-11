//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 协议
protocol Subject {
    func attach(_ observer: Observer)
    func detach(_ observer: Observer)
    func notify()
}

// 观察者
class Observer: Hashable {
    var name: String
    var sub: Subject
    
    var hashValue: Int {
        return "\(name)".hashValue
    }
    
    static func ==(l: Observer, r: Observer) -> Bool {
        return l.hashValue == r.hashValue
    }
    
    init(_ name: String, _ sub: Subject) {
        self.name = name
        self.sub = sub
    }
    
    func update() {}
}

class Boss: Subject {
    var observers = Set<Observer>()
    
    func attach(_ observer: Observer) {
        observers.insert(observer)
    }
    
    func detach(_ observer: Observer) {
        observers.remove(observer)
    }
    
    func notify() {
        for o in observers {
            o.update()
        }
    }
}

// 看股票
class StockObserver: Observer {
    override func update() {
        print("\(name) 关闭股票，继续工作")
    }
}

// 看 NBA
class NBAObserver: Observer {
    override func update() {
        print("\(name) 关闭 NBA，继续工作")
    }
}

let boss = Boss()
let colleagueA = StockObserver("A", boss)
let colleagueB = NBAObserver("B", boss)

// 添加通知者
boss.attach(colleagueA)
boss.attach(colleagueB)

// 移除通知者
boss.detach(colleagueA)

// 发出通知
boss.notify()
