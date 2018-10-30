//
//  CircularReference.swift
//  A4Paper
//
//  Created by AlphaZ on 2018/10/29.
//  Copyright © 2018年 Zhang,Dong(AI). All rights reserved.
//


import UIKit

class CircularReference: NSObject {

    func doTest() {
        var xiaoMing: Person? = Person(personName: "XiaoMing")
        let tom = Dog()
        xiaoMing?.dog = tom
        tom.person = xiaoMing
        xiaoMing?.printName()

        print("\(String(describing: xiaoMing))")
        xiaoMing = nil
        print("\(String(describing: xiaoMing))")
    }


    // MARK: - other class
    class Dog {
        var person:Person?
        lazy var printName: ()->() = { [unowned self] in
            print("my name is ")
        }

    }
    class Person {
        let name: String
        var dog:Dog?


        func printName() {
            print("The name is \(self.name)")
        }

        init(personName: String) {
            name = personName
        }

        deinit {
            print("Person deinit \(self.name)")
        }
    }
}



