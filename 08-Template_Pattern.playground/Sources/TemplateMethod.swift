import Foundation

class AbstractDisplay { // Abstract Class
    func open() { fatalError() }
    func print() { fatalError() }
    func close() { fatalError() }
    
    func display() {
        open()
        
        for _ in 0..<5 {
            print()
        }
        
        close()
    }
}

class CharDisplay: AbstractDisplay { // ConcreteClass
    var char: Character
    
    init(_ char: Character) {
        self.char = char
    }
    
    override func open() {
        Swift.print("<<", separator: "", terminator: "")
    }
    
    override func print() {
        Swift.print(char, separator: "", terminator: "")
    }
    
    override func close() {
        Swift.print(">>")
    }
}

class StringDisplay: AbstractDisplay { // ConcreteClass
    var string: String
    var width: Int
    
    init(_ string: String) {
        self.string = string
        self.width = string.count
    }
    
    override func open() {
        printLine()
    }
    
    override func print() {
        Swift.print("|" + string + "|")
    }
    
    override func close() {
        printLine()
    }
    
    func printLine() {
        Swift.print("+", separator: "", terminator: "")
        for _ in 0..<width {
            Swift.print("-", separator: "", terminator: "")
        }
        Swift.print("+")
    }
}

public func testTemplateMethod() {
    let dp1 = CharDisplay("V")
    let dp2 = StringDisplay("kingcos.me")
    let dp3 = StringDisplay("萌面大道")
    
    dp1.display()
    dp2.display()
    dp3.display()
}
