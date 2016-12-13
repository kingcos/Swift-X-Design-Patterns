//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 演奏内容
struct PlayContext {
    var text: String
}

// 表达式
class Expression {
    func interpret(_ context: inout PlayContext) {
        if context.text.characters.count != 0 {
            let rangeA = Range(uncheckedBounds: (context.text.index(after: context.text.startIndex), context.text.index(context.text.startIndex, offsetBy: 2)))
            
            let playKey = context.text.substring(with: rangeA)
            let index = context.text.index(context.text.startIndex, offsetBy: 3)
            context.text = context.text.substring(from: index)
            
            let rangeB = Range(uncheckedBounds: (context.text.characters.startIndex, context.text.characters.index(of: " ")!))
            let playValue = context.text.substring(with: rangeB)
            
            context.text = context.text.substring(from: context.text.characters.index(of: " ")!)
            execute(playKey, value: Double(playValue)!)
        }
    }
    
    func execute(_ key: String, value: Double) {}
}

// 音符
class Note: Expression {
    override func execute(_ key: String, value: Double) {
        var note: String
        
        switch key {
        case "C":
            note = "1"
        case "D":
            note = "2"
        case "E":
            note = "3"
        case "F":
            note = "4"
        case "G":
            note = "5"
        case "A":
            note = "6"
        default:
            note = ""
        }
        
        print("\(note)", separator: "", terminator: " ")
    }
}

// 音域
class Scale: Expression {
    override func execute(_ key: String, value: Double) {
        var scale: String
        
        switch value {
        case 1:
            scale = "低音"
        case 2:
            scale = "中音"
        case 3:
            scale = "高音"
        default:
            scale = ""
        }
        
        print("\(scale)", separator: "", terminator: " ")
    }
}

// 音速
class Speed: Expression {
    override func execute(_ key: String, value: Double) {
        var speed: String
        
        if value >= 1000 {
            speed = "高速"
        } else if value < 500 {
            speed = "低速"
        } else {
            speed = "中速"
        }
        
        print("\(speed)", separator: "", terminator: " ")
    }
}

var context = PlayContext(text:
    " T 400 O 2 E 0.5 A 3 E 0.5 G 0.5 D 3 E 0.5 G 0.5 A 0.5 O 3 C 1 O 2 A 0.5 G 1 C 0.5 E 0.5 D 3 "
)

while context.text.characters.count > 1 {
    let range = Range(uncheckedBounds: (context.text.index(after: context.text.startIndex), context.text.index(context.text.startIndex, offsetBy: 2)))
    let str = context.text.substring(with: range)
    
    var expression = Expression()
    
    switch str {
    case "T":
        expression = Speed()
    case "O":
        expression = Scale()
    case "C", "D", "E", "F", "G", "A", "B", "P":
        expression = Note()
    default: break
    }
    expression.interpret(&context)
}
