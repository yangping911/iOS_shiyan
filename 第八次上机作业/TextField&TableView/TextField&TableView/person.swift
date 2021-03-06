//
//  person.swift
//  eightProject
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 dw. All rights reserved.
//

import Foundation

//枚举类Gender的定义
enum Gender:Int {
    case female,male,unknown
    // static func < (gender1: Gender, gender2: Gender) ->Bool{
    //     return gender1.rawValue < gender2.rawValue
    // }
}
//枚举类Department的定义
enum Department:Int {
    case departA, departB, departC, departD
}
//新建一个协议SchoolProtocol
protocol SchoolProtocol{
    var department: Department {get set}
    func lendBook()
}
//Person类的定义
class Person {
    //Person类属性定义
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String { return firstName + " " + lastName }
    //构造函数
    init (firstName:String, lastName:String, age:Int, gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    //便利构造函数
    convenience init (firstName:String, lastName:String) {
        self.init (firstName: firstName, lastName: lastName,age: 19, gender: Gender.male)
    }
    //信息显示
    var printInfo: String {
        return "Name: \(fullName) Age: \(age) Gender: \(gender)"
    }
    //==和!=重载，用于比较两个Person类实例是否相同
    static func == (person1:Person, person2:Person) -> Bool {
        return (person1.fullName == person2.fullName && person1.age == person2.age && person1.gender == person2.gender)
    }
    static func != (person1:Person, person2:Person) -> Bool {
        return (person1.fullName != person2.fullName || person1.age != person2.age || person1.gender != person2.gender)
    }
    //run
    func run () {
        print("Person \(self.fullName) is running")
    }
}

//Person类的派生类Teacher类
class Teacher: Person,SchoolProtocol {
    //Teacher类新增属性title的定义
    var title: String
    //department属性的实现
    var department: Department
    //构造函数
    init (firstName:String, lastName:String, age:Int, gender:Gender, title: String, department:Department){
        self.title = title
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    //显示信息
    override var printInfo:String {
        return super.printInfo + " Title: \(title) Department: \(department)"
    }
    override func run () {
        print("Teacher \(self.fullName) is running")
    }
    //lendBook的实现
    func lendBook(){
        print("随便写了点内容")
    }
}

//Person类的派生类Student类
class Student: Person ,SchoolProtocol{
    //Student类新增属性stuNo的定义
    var stuNo: String
    //department属性的实现
    var department:Department
    //构造函数
    init (firstName:String, lastName:String, age:Int, gender:Gender, stuNo: String, department: Department){
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    convenience init(stuNo: String, firstName: String, lastName: String, age: Int, gender: Gender) {
        self.init(firstName: firstName, lastName: lastName, age: age, gender: gender, stuNo: stuNo, department: .departB)
    }
    init(stuNo: String, department: Department) {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: "", lastName: "", age: 0, gender: Gender.unknown)
    }
    
    required convenience init() {
        self.init(stuNo: "2018110100", department: .departB)
    }

    //显示信息
    override var printInfo:String {
        return super.printInfo + " StudentNo: \(stuNo) Department: \(department)"
    }
    override func run () {
        print("Student \(self.fullName) is running")
    }
    //lendBook的实现
    func lendBook(){
        print("又随便写了点内容")
    }
}
