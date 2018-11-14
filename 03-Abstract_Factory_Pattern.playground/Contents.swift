//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-X-Design-Patterns

import UIKit

struct User {}

// 协议
protocol UserProtocol {
    func insert(_ user: User)
    func get(_ id: Int) -> User
}

struct SQLServerUser: UserProtocol {
    func insert(_ user: User) {
        print("\(#function) user")
    }
    
    func get(_ id: Int) -> User {
        print("\(#function) user")
        return User()
    }
}

struct AccessUser: UserProtocol {
    func insert(_ user: User) {
        print("\(#function) user")
    }
    
    func get(_ id: Int) -> User {
        print("\(#function) user")
        return User()
    }
}

struct Department {}

// 协议
protocol DepartmentProtocol {
    func insert(_ department: Department)
    func get(_ id: Int) -> Department
}

struct SQLServerDepartment: DepartmentProtocol {
    func insert(_ department: Department) {
        print("\(#function) department")
    }
    
    func get(_ id: Int) -> Department {
        print("\(#function) department")
        return Department()
    }
}

struct AccessDepartment: DepartmentProtocol {
    func insert(_ department: Department) {
        print("\(#function) department")
    }
    
    func get(_ id: Int) -> Department {
        print("\(#function) department")
        return Department()
    }
}

// 工厂协议
protocol FactoryProtocol {
    func createUser() -> UserProtocol
    func createDepartment() -> DepartmentProtocol
}

struct SqlServerFactory: FactoryProtocol {
    func createUser() -> UserProtocol {
        return SQLServerUser()
    }
    
    func createDepartment() -> DepartmentProtocol {
        return SQLServerDepartment()
    }
}

struct AccessFactory: FactoryProtocol {
    func createUser() -> UserProtocol {
        return AccessUser()
    }
    
    func createDepartment() -> DepartmentProtocol {
        return AccessDepartment()
    }
}

let userA = User()
let departmentA = Department()

let factory: FactoryProtocol
factory = AccessFactory()

let iuA = factory.createUser()
iuA.insert(userA)
iuA.get(1)

let idA = factory.createDepartment()
idA.insert(departmentA)
idA.get(1)

// 简单工厂 + 抽象工厂
enum Database {
    case sqlServer, access
}

struct DataAccess {
    static var database: Database = .access
    
    static func createUser() -> UserProtocol {
        switch database {
        case .sqlServer:
            return SQLServerUser()
        case .access:
            return AccessUser()
        }
    }
    
    static func createDepartment() -> DepartmentProtocol {
        switch database {
        case .sqlServer:
            return SQLServerDepartment()
        case .access:
            return AccessDepartment()
        }
    }
}

let userB = User()
let departmentB = Department()

DataAccess.database = .sqlServer
let iuB = DataAccess.createUser()
iuB.insert(userB)
iuB.get(1)

let idB = DataAccess.createDepartment()
idB.insert(departmentB)
idB.get(1)
