//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 手机软件协议
protocol HandsetSoft {
    func run()
}

// 手机游戏
struct HandsetGame: HandsetSoft {
    func run() {
        print("Run GAME")
    }
}

// 手机通讯录
struct HandsetAddressList: HandsetSoft {
    func run() {
        print("Run ADDRESS LIST")
    }
}

// 手机品牌协议
protocol HandsetBrand {
    var soft: HandsetSoft { get }
    
    func run()
}

// 品牌 A
struct HandsetBrandA: HandsetBrand {
    var soft: HandsetSoft
    
    func run() {
        soft.run()
    }
}

// 品牌 B
struct HandsetBrandB: HandsetBrand {
    var soft: HandsetSoft
    
    func run() {
        soft.run()
    }
}

var hs = HandsetBrandA(soft: HandsetGame())
hs.run()

hs.soft = HandsetAddressList()
hs.run()
