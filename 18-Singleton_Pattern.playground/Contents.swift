//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 单例
class SingletonClass {
    var prop = 0
    
    // 静态常量
    static let sharedInstance = SingletonClass()
    
    private init() {}
}

var i = SingletonClass.sharedInstance
i.prop = 100

var j = SingletonClass.sharedInstance
print(j.prop)
