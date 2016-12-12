//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 球员协议
protocol Player {
    var name: String { get }
    
    func attack()
    func defense()
}

// 前锋
struct Forwards: Player {
    var name: String
    
    func attack() {
        print("前锋 \(name) 进攻")
    }
    
    func defense() {
        print("前锋 \(name) 防守")
    }
}

// 中锋
struct Center: Player {
    var name: String
    
    func attack() {
        print("中锋 \(name) 进攻")
    }
    
    func defense() {
        print("中锋 \(name) 防守")
    }
}

// 后卫
struct Guards: Player {
    var name: String
    
    func attack() {
        print("后卫 \(name) 进攻")
    }
    
    func defense() {
        print("后卫 \(name) 防守")
    }
}

// 外籍中锋
struct ForeignCenter {
    var name: String
    
    func jinGong() {
        print("外籍中锋 \(name) 进攻")
    }
    
    func fangShou() {
        print("外籍中锋 \(name) 防守")
    }
}

// 翻译
struct Translator: Player {
    var name: String
    var foreignCenter: ForeignCenter
    
    init(name: String) {
        self.name = name
        self.foreignCenter = ForeignCenter(name: name)
    }
    
    func attack() {
        foreignCenter.jinGong()
    }
    
    func defense() {
        foreignCenter.fangShou()
    }
}

let playerA = Forwards(name: "Shane Battier")
playerA.attack()

let playerB = Guards(name: "Tracy McGrady")
playerB.defense()

let playerC = Translator(name: "Ming Yao")
playerC.attack()
playerC.defense()
