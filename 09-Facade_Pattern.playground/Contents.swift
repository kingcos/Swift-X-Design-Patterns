//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 股票协议
protocol Stock {
    func sell()
    func buy()
}

// 股票 A
struct StockA: Stock {
    func sell() {
        print("StockA 卖出")
    }
    
    func buy() {
        print("StockA 买入")
    }
}

// 股票 B
struct StockB: Stock {
    func sell() {
        print("StockB 卖出")
    }
    
    func buy() {
        print("StockB 买入")
    }
}

// 股票 C
struct StockC: Stock {
    func sell() {
        print("StockC 卖出")
    }
    
    func buy() {
        print("StockC 买入")
    }
}

// 基金
struct Fund {
    var stockA: StockA
    var stockB: StockB
    var stockC: StockC
    
    init() {
        stockA = StockA()
        stockB = StockB()
        stockC = StockC()
    }
    
    func sellAB() {
        stockA.sell()
        stockB.sell()
    }
    
    func buyBC() {
        stockB.buy()
        stockC.buy()
    }
    
    func sellABC() {
        stockA.sell()
        stockB.sell()
        stockC.sell()
    }
    
    func buyABC() {
        stockA.buy()
        stockB.buy()
        stockC.buy()
    }
}

let fundManager = Fund()
fundManager.buyBC()
fundManager.buyABC()
fundManager.sellAB()
