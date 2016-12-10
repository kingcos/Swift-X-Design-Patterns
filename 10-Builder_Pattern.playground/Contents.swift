//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 协议
protocol PersonBuilder {
    func buildHead()
    func buildBody()
    func buildLeftArm()
    func buildRightArm()
    func buildLeftLeg()
    func buildRightLeg()
    
    func createPerson()
}

// ThinPerson 遵守协议
struct ThinPerson: PersonBuilder {
    func createPerson() {
        buildHead()
        buildBody()
        buildLeftArm()
        buildRightArm()
        buildLeftLeg()
        buildRightLeg()
    }
    
    func buildHead() {
        print(#function)
    }
    
    func buildBody() {
        print(#function)
    }
    
    func buildLeftArm() {
        print(#function)
    }
    
    func buildRightArm() {
        print(#function)
    }
    
    func buildLeftLeg() {
        print(#function)
    }
    
    func buildRightLeg() {
        print(#function)
    }
}

// FatPerson 遵守协议
struct FatPerson: PersonBuilder {
    func createPerson() {
        buildHead()
        buildBody()
        buildLeftArm()
        buildRightArm()
        buildLeftLeg()
        buildRightLeg()
    }
    
    func buildHead() {
        print(#function)
    }
    
    func buildBody() {
        print(#function)
    }
    
    func buildLeftArm() {
        print(#function)
    }
    
    func buildRightArm() {
        print(#function)
    }
    
    func buildLeftLeg() {
        print(#function)
    }
    
    func buildRightLeg() {
        print(#function)
    }
}

let pA = ThinPerson()
pA.createPerson()

let pB = FatPerson()
pB.createPerson()
