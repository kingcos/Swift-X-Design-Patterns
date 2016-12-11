//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

struct User {}

// 协议
protocol IUser {
    func insert(_ user: User)
    func get(_ id: Int) -> User
}

struct SqlServerUser: IUser {
    func insert(_ user: User) {
        print("\(#function) user")
    }
    
    func get(_ id: Int) -> User {
        print("\(#function) user")
        return User()
    }
}

struct AccessUser: IUser {
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
protocol IDepartment {
    func insert(_ department: Department)
    func get(_ id: Int) -> Department
}

struct SqlServerDepartment: IDepartment {
    func insert(_ department: Department) {
        print("\(#function) department")
    }
    
    func get(_ id: Int) -> Department {
        print("\(#function) department")
        return Department()
    }
}

struct AccessDepartment: IDepartment {
    func insert(_ department: Department) {
        print("\(#function) department")
    }
    
    func get(_ id: Int) -> Department {
        print("\(#function) department")
        return Department()
    }
}

// 工厂协议
protocol IFactory {
    func createUser() -> IUser
    func createDepartment() -> IDepartment
}

struct SqlServerFactory: IFactory {
    func createUser() -> IUser {
        return SqlServerUser()
    }
    
    func createDepartment() -> IDepartment {
        return SqlServerDepartment()
    }
}

struct AccessFactory: IFactory {
    func createUser() -> IUser {
        return AccessUser()
    }
    
    func createDepartment() -> IDepartment {
        return AccessDepartment()
    }
}

let userA = User()
let departmentA = Department()

let factory: IFactory
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
    
    static func createUser() -> IUser {
        switch database {
        case .sqlServer:
            return SqlServerUser()
        case .access:
            return AccessUser()
        }
    }
    
    static func createDepartment() -> IDepartment {
        switch database {
        case .sqlServer:
            return SqlServerDepartment()
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
