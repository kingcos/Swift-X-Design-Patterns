//: Playground - noun: a place where people can play
// Powered by https://kingcos.me from https://github.com/kingcos/Swift-X-Design-Patterns

import UIKit

// 单例
class SingletonClass {
    var foo = 0
    
    // 静态常量
    static let shared = SingletonClass()
    
    private init() {}
}

let i = SingletonClass.shared
i.foo = 100

let j = SingletonClass.shared
print(j.foo)
