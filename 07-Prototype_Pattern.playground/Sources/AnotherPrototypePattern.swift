import Foundation

protocol Cloneable {
    func clone() -> Any?
}

protocol Product: Cloneable { // Prototype 原型
    func use(_ s: String)
    func createClone() -> Product
}

extension Product {
    func createClone() -> Product {
        if let p = clone() as? Product {
            return p
        }
        
        fatalError("Cloned error.")
    }
}

struct Manager { // Client 使用者
    var showcase: [String : Product] = [:]
    
    mutating func register(_ name: String, _ proto: Product) {
        showcase[name] = proto
    }
    
    func create(_ protoname: String) -> Product? {
        showcase[protoname]?.createClone()
    }
}

struct MessageBox: Product { // Concrete Prototype 具体原型
    var decochar: Character
    
    func use(_ s: String) {
        for _ in 0..<(s.count + 4) {
            print(decochar, separator: "", terminator: "")
        }
        print("")
        
        print("\(decochar) \(s) \(decochar)")
        
        for _ in 0..<(s.count + 4) {
            print(decochar, separator: "", terminator: "")
        }
        print("")
    }
    
    func clone() -> Any? {
        MessageBox(decochar: decochar)
    }
}

struct UnderlinePen: Product { // Concrete Prototype 具体原型
    var ulchar: Character
    
    func use(_ s: String) {
        print("\"\(s)\"")
        print(" ", separator: "", terminator: "")
        
        for _ in 0..<s.count {
            print(ulchar, separator: "", terminator: "")
        }
        
        print("")
    }
    
    func clone() -> Any? {
        UnderlinePen(ulchar: ulchar)
    }
}


public func testAnotherPrototypePattern() {
    var manager = Manager()
    let upen = UnderlinePen(ulchar: "~")
    let mb1 = MessageBox(decochar: "*")
    let mb2 = MessageBox(decochar: "/")
    
    manager.register("strong message", upen)
    manager.register("warning box", mb1)
    manager.register("slash box", mb2)
    
    let p1 = manager.create("strong message")
    p1?.use("Hello, world!")
    let p2 = manager.create("warning box")
    p2?.use("Hello, world!")
    let p3 = manager.create("slash box")
    p3?.use("Hello, world!")
}
