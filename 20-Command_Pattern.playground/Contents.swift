//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 烧烤
struct Barbecuer {
    enum BBQ: String {
        case mutton = "烤羊肉串"
        case chickenWing = "烤鸡翅"
    }
    
    var state: BBQ = .mutton
    
    mutating func bakeMutton() {
        state = .mutton
        print("\(state.rawValue)")
    }
    
    mutating func backChickenWing() {
        state = .chickenWing
        print("\(state.rawValue)")
    }
}

// 命令
class Command: Hashable {
    var bbq: Barbecuer
    
    init(_ bbq: Barbecuer) {
        self.bbq = bbq
    }
    
    var hashValue: Int {
        return bbq.state.hashValue
    }
    
    static func ==(l: Command, r: Command) -> Bool {
        return l.hashValue == r.hashValue
    }
    
    func executeCommand() {}
}

// 烤羊肉串命令
class BakeMuttonCommand: Command {
    override init(_ bbq: Barbecuer) {
        super.init(bbq)
        self.bbq.state = .mutton
    }
    
    override func executeCommand() {
        bbq.bakeMutton()
    }
}

// 烤鸡翅命令
class BakeChickenWingCommand: Command {
    override init(_ bbq: Barbecuer) {
        super.init(bbq)
        self.bbq.state = .chickenWing
    }
    
    override func executeCommand() {
        bbq.backChickenWing()
    }
}

// 服务员
struct Waiter {
    var cmdSet = Set<Command>()
    
    mutating func setOrder(_ command: Command) {
        if command.bbq.state == .chickenWing {
            print("没有鸡翅了，请点别的烧烤")
        } else {
            cmdSet.insert(command)
            print("增加订单：\(command.bbq.state.rawValue)")
        }
    }
    
    mutating func removeOrder(_ command: Command) {
        cmdSet.remove(command)
        print("取消订单：\(command.bbq.state.rawValue)")
    }
    
    func notify() {
        for command in cmdSet {
            command.executeCommand()
        }
    }
}

let bbq = Barbecuer()
let muttonA = BakeMuttonCommand(bbq)
let muttonB = BakeMuttonCommand(bbq)
let chickenWingA = BakeChickenWingCommand(bbq)

var waiter = Waiter()

waiter.setOrder(muttonA)
waiter.setOrder(muttonB)
waiter.setOrder(chickenWingA)
