//
//  BlockAndSelf.swift
//  A4Paper
//
//  Created by AlphaZ on 2018/10/29.
//  Copyright © 2018年 Zhang,Dong(AI). All rights reserved.
//

import UIKit

class BlockSelf: NSObject {

    func doTest() {
        var xiaoMing: Person? = Person(personName: "XiaoMing")
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
//            Singleton.default.block = { print("The name is \(self.name)")}
            Singleton.default.block = { [unowned self] in print("The name is \(self.name)") }
//            Singleton.default.block = { [weak self] in print("The name is \(String(describing: self?.name))") }
            Singleton.default.callBlockAsync()


            // 1 nothing to do
            /*
            Optional(A4Paper.BlockSelf.Person)
            nil
            */

            // 2 unowned self
            /*
            Optional(A4Paper.BlockSelf.Person)
            Person deinit XiaoMing
            Person deinit A4Paper.BlockSelf.Person
            nil
            Fatal error: Attempted to read an unowned reference but object 0x600002b36610 was already deallocated2018-10-30 09:43:09.887756+0800 A4Paper[3951:76031] Fatal error: Attempted to read an unowned reference but object 0x600002b36610 was already deallocated
             */
            
            // 3 weak self
            /*
            Optional(A4Paper.BlockSelf.Person)
            Person deinit XiaoMing
            Person deinit A4Paper.BlockSelf.Person
            nil
            */
        }

        init(personName: String) {
            name = personName
        }

        deinit {
            print("Person deinit \(self.name)")
            print("Person deinit \(self)")

        }
    }
}




