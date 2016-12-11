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

let user = User()
let department = Department()

let factory: IFactory
factory = AccessFactory()

let iu = factory.createUser()
iu.insert(user)
iu.get(1)

let id = factory.createDepartment()
id.insert(department)
id.get(1)
