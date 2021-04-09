import Foundation

// 使用代理的适配器

class Print { // Target，对象
    func printWeak() {
        fatalError()
    }
    
    func printStrong() {
        fatalError()
    }
}

class AnotherBanner { // Adaptee，被适配者
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

class DelegatePrintBanner: Print {
    var banner: AnotherBanner
    
    init(_ string: String) {
        banner = AnotherBanner(string)
    }
    
    override func printWeak() {
        banner.showWithParen()
    }
    
    override func printStrong() {
        banner.showWithAster()
    }
}

// ---

public func testDelegateAdapter() {
    let p = DelegatePrintBanner("Hello")
    p.printWeak()
    p.printStrong()
}
