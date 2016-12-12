//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 游戏角色
struct GameRole {
    var vit: Int
    var atk: Int
    var def: Int
    
    init() {
        vit = 100
        atk = 100
        def = 100
    }
    
    func stateDisplay() {
        print("生命值：\(vit)")
        print("攻击力：\(atk)")
        print("防御力：\(def)")
    }
    
    func saveState() -> RoleStateMemento {
        return RoleStateMemento(vit: vit, atk: atk, def: def)
    }
    
    mutating func recoverState(_ memento: RoleStateMemento) {
        vit = memento.vit
        atk = memento.atk
        def = memento.def
    }
    
    mutating func fight() {
        vit = 0
        atk = 0
        def = 0
    }
}

// 游戏状态备忘
struct RoleStateMemento {
    var vit: Int
    var atk: Int
    var def: Int
}

// 游戏状态管理
struct RoleStateCaretaker {
    var memento: RoleStateMemento
}

var p = GameRole()
p.stateDisplay()

let stateAdmin = RoleStateCaretaker(memento: p.saveState())

p.fight()
p.stateDisplay()

p.recoverState(stateAdmin.memento)
p.stateDisplay()
