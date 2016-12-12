//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 工作类
class Work {
    var hour = 0
    var state: State = ForenoonState()
    var isFinish = false
    
    func writeProgram() {
        state.writeProgram(self)
    }
}

// 协议
protocol State {
    func writeProgram(_ work: Work)
}

// 上午状态
struct ForenoonState: State {
    func writeProgram(_ work: Work) {
        if work.hour < 12 {
            print("\(work.hour) 上午")
        } else {
            work.state = NoonState()
            work.writeProgram()
        }
    }
}

// 中午状态
struct NoonState: State {
    func writeProgram(_ work: Work) {
        if work.hour < 13 {
            print("\(work.hour) 中午")
        } else {
            work.state = AfternoonState()
            work.writeProgram()
        }
    }
}

// 下午状态
struct AfternoonState: State {
    func writeProgram(_ work: Work) {
        if work.hour < 17 {
            print("\(work.hour) 下午")
        } else {
            work.state = EveningState()
            work.writeProgram()
        }
    }
}

// 晚上状态
struct EveningState: State {
    func writeProgram(_ work: Work) {
        if work.isFinish {
            work.state = RestState()
            work.writeProgram()
        } else {
            if work.hour < 21 {
                print("\(work.hour) 晚上")
            } else {
                work.state = SleepingState()
                work.writeProgram()
            }
        }
    }
}

// 睡觉状态
struct SleepingState: State {
    func writeProgram(_ work: Work) {
        print("\(work.hour) 睡觉")
    }
}

// 休息状态
struct RestState: State {
    func writeProgram(_ work: Work) {
        print("\(work.hour) 休息")
    }
}

let work = Work()

for i in stride(from: 9, through: 22, by: 1) {
    if i == 17 {
        work.isFinish = true
    }
    work.hour = i
    work.writeProgram()
}

