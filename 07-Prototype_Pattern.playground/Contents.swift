//: Playground - noun: a place where people can play
// Powered by https://maimieng.com from https://github.com/kingcos/Swift-3-Design-Patterns

import UIKit

// 工作经历
class WorkExperience {
    var workDate = ""
    var company = ""
    
    init() {}
    
    init(_ workDate: String, _ company: String) {
        self.workDate = workDate
        self.company = company
    }
    
    // 克隆
    func clone() -> WorkExperience {
        return WorkExperience(workDate, company)
    }
}

// 简历
class Resume {
    private var name = ""
    private var sex = ""
    private var age = ""
    
    var work: WorkExperience
    
    init(_ name: String) {
        self.name = name
        self.work = WorkExperience()
    }
    
    init(_ work: WorkExperience) {
        self.work = work.clone()
    }
    
    func setPersonalInfo(_ sex: String, _ age: String) {
        self.sex = sex
        self.age = age
    }
    
    func setWorkExperience(_ workDate: String, _ company: String) {
        work.workDate = workDate
        work.company = company
    }
    
    func display() {
        print("个人信息：\(name) \(sex) \(age)")
        print("工作经历：\(work.workDate) \(work.company)")
    }
    
    // 克隆
    func clone() -> Resume {
        let resume = Resume(work)
        resume.name = name
        resume.sex = sex
        resume.age = age
        return resume
    }
}

let resumeA = Resume("Kingcos")
resumeA.setPersonalInfo("Boy", "21")
resumeA.setWorkExperience("2016.8", "School")

let resumeB = resumeA.clone()
resumeB.setWorkExperience("2016.9-2016.12", "School")

let resumeC = resumeA.clone()
resumeC.setWorkExperience("2014-2018", "University")

//深拷贝
resumeA.display()
resumeB.display()
resumeC.display()
