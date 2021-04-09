import Foundation

// 使用继承的适配器

protocol Printable { // Target，对象
    func printWeak()
    func printStrong()
}

class Banner { // Adaptee，被适配者
    var string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    func showWithParen() { // Weak
        print("(" + string + ")")
    }
    
    func showWithAster() { // Strong
        print("*" + string + "*")
    }
}

class InheratancePrintBanner: Banner, Printable { // Adapter，适配器
    func printWeak() {
        showWithParen()
    }
    
    func printStrong() {
        showWithAster()
    }
}

// ---

public func testInheritanceAdapter() {
    let p = InheratancePrintBanner("Hello")
    p.printWeak()
    p.printStrong()
}
