//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 请求
struct Request {
    enum RequestType: String {
        case leave = "请假"
        case salary = "加薪"
    }
    
    var requestType: RequestType
    var requestContent: String
    var number: Int
}

// 经理协议
protocol Manager {
    var name: String { get }
    var superior: Manager? { get }
    
    func requestApplications(_ request: Request)
}

// 普通经理
struct CommonManager: Manager {
    var name: String
    var superior: Manager?
    
    func requestApplications(_ request: Request) {
        if request.requestType == .leave && request.number <= 2 {
            print("CommonManager 批准：\(request.requestType.rawValue) \(request.number) 天")
        } else {
            superior!.requestApplications(request)
        }
    }
}

// 总监
struct Majordomo: Manager {
    var name: String
    var superior: Manager?
    
    func requestApplications(_ request: Request) {
        if request.requestType == .leave && request.number <= 5 {
            print("Majordomo 批准：\(request.requestType.rawValue) \(request.number) 天")
        } else {
            superior!.requestApplications(request)
        }
    }
}

// 总经理
struct GeneralManager: Manager {
    var name: String
    var superior: Manager?
    
    init(_ name: String) {
        self.name = name
    }
    
    func requestApplications(_ request: Request) {
        if request.requestType == .leave {
            print("GeneralManager 批准：\(request.requestType.rawValue) \(request.number) 天")
        } else if request.requestType == .salary
               && request.number <= 500 {
            print("GeneralManager 批准：\(request.requestType.rawValue) \(request.number) 元")
        } else if request.requestType == .salary
            && request.number > 500 {
            print("GeneralManager 考虑考虑")
        }
    }
}

let generalMng = GeneralManager("总经理")
let majordomo = Majordomo(name: "总监", superior: generalMng)
let commonMng = CommonManager(name: "普通经理", superior: majordomo)

let rqA = Request(requestType: .leave, requestContent: "小菜请假", number: 1)
commonMng.requestApplications(rqA)

let rqB = Request(requestType: .leave, requestContent: "小菜请假", number: 4)
commonMng.requestApplications(rqB)

let rqC = Request(requestType: .salary, requestContent: "小菜加薪", number: 200)
commonMng.requestApplications(rqC)

let rqD = Request(requestType: .salary, requestContent: "小菜加薪", number: 1000)
commonMng.requestApplications(rqD)
