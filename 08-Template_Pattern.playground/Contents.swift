//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 考试协议
protocol Exam {
    func questionA()
    func questionB()
    func questionC()
    
    func answerA() -> String
    func answerB() -> String
    func answerC() -> String
}

// 试卷
class TestPaper: Exam {
    // 模版方法
    func questionA() {
        print("Q&A 1 \(answerA())")
    }
    
    func questionB() {
        print("Q&A 2 \(answerB())")
    }
    
    func questionC() {
        print("Q&A 3 \(answerC())")
    }
    
    func answerA() -> String {
        return ""
    }
    
    func answerB() -> String {
        return ""
    }
    
    func answerC() -> String {
        return ""
    }
}

// A 的试卷
class TestPaperA: TestPaper {
    override func answerA() -> String {
        return "A"
    }
    
    override func answerB() -> String {
        return "B"
    }
    
    override func answerC() -> String {
        return "C"
    }
}

// B 的试卷
class TestPaperB: TestPaper {
    override func answerA() -> String {
        return "C"
    }
    
    override func answerB() -> String {
        return "B"
    }
    
    override func answerC() -> String {
        return "A"
    }
}

let pA = TestPaperA()

pA.questionA()
pA.questionB()
pA.questionC()

let pB = TestPaperB()

pB.questionA()
pB.questionB()
pB.questionC()
