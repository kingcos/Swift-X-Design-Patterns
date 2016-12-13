//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 网站协议
protocol Website {
    func use()
}

// 具体网站
struct ConcreteWebsite: Website {
    var name: String
    
    func use() {
        print("name: \(name)")
    }
}

// 网站工厂
struct WebsiteFactory {
    var flyweights = Dictionary<String, Website>()
    
    mutating func getWebsiteCategory(_ key: String) -> Website {
        if !flyweights.keys.contains(key) {
            flyweights[key] = ConcreteWebsite(name: key)
        }
        return flyweights[key]!
    }
    
    func getWebsiteCount() -> Int {
        return flyweights.count
    }
}

var f = WebsiteFactory()

let wsA = f.getWebsiteCategory("产品展示")
wsA.use()

let wsB = f.getWebsiteCategory("产品展示")
wsB.use()

let wsC = f.getWebsiteCategory("博客")
wsC.use()

let wsD = f.getWebsiteCategory("博客")
wsD.use()

let wsE = f.getWebsiteCategory("博客")
wsE.use()

print("分类数：\(f.getWebsiteCount())")
