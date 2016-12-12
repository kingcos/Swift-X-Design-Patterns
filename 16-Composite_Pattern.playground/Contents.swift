//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 协议
class Company: Hashable {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var hashValue: Int {
        return "\(name)".hashValue
    }
    
    static func ==(l: Company, r: Company) -> Bool {
        return l.hashValue == r.hashValue
    }
    
    func add(_ c: Company) {}
    func remove(_ c: Company) {}
    func display(_ depth: Int) {}
    func lineOfDuty() {}
}

// 具体公司
class ConcreteCompany: Company {
    var children = Set<Company>()
    
    override func add(_ c: Company) {
        children.insert(c)
    }
    
    override func remove(_ c: Company) {
        children.remove(c)
    }
    
    override func display(_ depth: Int) {
        for _ in 0..<depth {
            print("-", separator: "", terminator: "")
        }
        print("name: \(name)")
        for child in children {
            child.display(depth + 2)
        }
    }
    
    override func lineOfDuty() {
        for child in children {
            child.lineOfDuty()
        }
    }
}

// 人力资源部
class HRDepartment: Company {
    override func display(_ depth: Int) {
        for _ in 0..<depth {
            print("-", separator: "", terminator: "")
        }
        print("name: \(name)")
    }
    
    override func lineOfDuty() {
        print("\(name) 培训")
    }
}

// 财务部
class FinanceDepartment: Company {
    override func display(_ depth: Int) {
        for _ in 0..<depth {
            print("-", separator: "", terminator: "")
        }
        print("name: \(name)")
    }
    
    override func lineOfDuty() {
        print("\(name) 财务")
    }
}

let root = ConcreteCompany("总公司")
root.add(HRDepartment("总公司人力资源部"))
root.add(FinanceDepartment("总公司财务部"))

let com = ConcreteCompany("分公司")
com.add(HRDepartment("分公司人力资源部"))
com.add(FinanceDepartment("分公司财务部"))
root.add(com)

let comA = ConcreteCompany("分公司 A")
comA.add(HRDepartment("分公司 A 人力资源部"))
comA.add(FinanceDepartment("分公司 A 财务部"))
root.add(com)

let comB = ConcreteCompany("办事处 B")
comB.add(HRDepartment("办事处 B 人力资源部"))
comB.add(FinanceDepartment("办事处 B 财务部"))
root.add(comA)

root.display(1)

root.lineOfDuty()
