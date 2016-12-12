//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// Crowd 序列
struct Crowd: Sequence {
    let end: Int
    
    func makeIterator() -> CrowdIterator {
        return CrowdIterator(self)
    }
}

// Crowd 迭代器
struct CrowdIterator: IteratorProtocol {
    var crowd: Crowd
    var times: Int
    
    init(_ crowd: Crowd) {
        self.crowd = crowd
        times = crowd.end - 1
    }
    
    mutating func next() -> Int? {
        let nextNumber = crowd.end - times
        guard nextNumber <= crowd.end else { return nil }
        
        times -= 1
        return nextNumber
    }
}

// 迭代
for i in Crowd(end: 10) {
    print(i)
}
