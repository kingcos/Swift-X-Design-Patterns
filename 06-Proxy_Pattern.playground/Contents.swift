//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 协议
protocol GiveGift {
    func giveDolls()
    func giveFlowers()
    func giveChocolate()
}

// 被追求者
struct SchoolGirl {
    var name = ""
}

// 追求者
struct Pursuit: GiveGift {
    var mm = SchoolGirl()
    
    func giveDolls() {
        print("追求者送 \(mm.name) 洋娃娃")
    }
    
    func giveFlowers() {
        print("追求者送 \(mm.name) 鲜花")
    }
    
    func giveChocolate() {
        print("追求者送 \(mm.name) 巧克力")
    }
}

// 代理
struct Proxy: GiveGift {
    var gg: Pursuit
    
    init(_ mm: SchoolGirl) {
        self.gg = Pursuit(mm: mm)
    }
    
    func giveDolls() {
        gg.giveDolls()
    }
    
    func giveFlowers() {
        gg.giveFlowers()
    }
    
    func giveChocolate() {
        gg.giveChocolate()
    }
}

var girl = SchoolGirl()
girl.name = "Jane"

let p = Proxy(girl)

// 代理替追求者执行
p.giveDolls()
p.giveFlowers()
p.giveChocolate()
