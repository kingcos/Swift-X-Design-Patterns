//: Playground - noun: a place where people can play
// Powered by https://kingcos.me from https://github.com/kingcos/Swift-X-Design-Patterns

import UIKit
import XCTest

// 单例
class SingletonClass {
    var foo = 0
    
    // 静态常量·`let` 是线程安全的
    static let shared = SingletonClass()
    
    private init() {}
}

let i = SingletonClass.shared
i.foo = 100

let j = SingletonClass.shared
print(j.foo)

let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
let exp = XCTestExpectation(description: "Thread-safe Singleton")
let iterations = 100
for i in 1...iterations {
    concurrentQueue.async {
        SingletonClass.shared.foo = i
    }
}

while SingletonClass.shared.foo != 0 {}

exp.fulfill()

XCTWaiter.wait(for: [exp], timeout: 5)
