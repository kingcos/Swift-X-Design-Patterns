//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 协议
protocol CashSuper {
    func acceptCash(_ money: Double) -> Double
}

// 普通
struct CashNormal: CashSuper {
    func acceptCash(_ money: Double) -> Double {
        return money
    }
}

// 打折
struct CashRebate: CashSuper {
    let monenyRebate: Double
    
    init(_ moneyRebate: Double) {
        self.monenyRebate = moneyRebate
    }
    
    func acceptCash(_ money: Double) -> Double {
        return money * monenyRebate
    }
}

// 满减
struct CashReturn: CashSuper {
    let moneyCondition: Double
    let moneyReturn: Double
    
    init(_ moneyCondition: Double, _ moneyReturn: Double) {
        self.moneyCondition = moneyCondition
        self.moneyReturn = moneyReturn
    }
    
    func acceptCash(_ money: Double) -> Double {
        var result = money
        
        if result >= moneyCondition {
            result = money - Double(Int(money / moneyCondition)) * moneyReturn
        }
        return result
    }
}

// 优惠方式
enum DiscountWays {
    case byDefault, twentyPersentOff, every300Get100Return
}

struct CashContext {
    private let cs: CashSuper
    
    init(_ cs: CashSuper) {
        self.cs = cs
    }
    
    func getResult(_ money: Double) -> Double {
        return cs.acceptCash(money)
    }
}

struct CashContextWithSimpleFactoryPattern {
    private let cs: CashSuper
    
    init(_ type: DiscountWays) {
        switch type {
        case .twentyPersentOff:
            cs = CashRebate(0.8)
        case .every300Get100Return:
            cs = CashReturn(300, 100)
        default:
            cs = CashNormal()
        }
    }
    
    func getResult(_ money: Double) -> Double {
        return cs.acceptCash(money)
    }
}

// 策略模式
var type = DiscountWays.twentyPersentOff
var cc: CashContext
switch type {
case .twentyPersentOff:
    cc = CashContext(CashRebate(0.8))
case .every300Get100Return:
    cc = CashContext(CashReturn(300, 100))
default:
    cc = CashContext(CashNormal())
}
cc.getResult(200)

// 策略模式与简单工厂模式结合
var cs = CashContextWithSimpleFactoryPattern(.byDefault)
cs.getResult(100)

cs = CashContextWithSimpleFactoryPattern(.twentyPersentOff)
cs.getResult(200.5)

cs = CashContextWithSimpleFactoryPattern(.every300Get100Return)
cs.getResult(650)
