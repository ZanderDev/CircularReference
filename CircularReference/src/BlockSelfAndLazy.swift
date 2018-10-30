//
//  BlockAndSelf2.swift
//  A4Paper
//
//  Created by AlphaZ on 2018/10/29.
//  Copyright © 2018年 Zhang,Dong(AI). All rights reserved.
//

import UIKit

class BlockSelfAndLazy: NSObject {
    func doTest() {
        var xiaoMing: Person? = Person(personName: "XiaoMing")
        xiaoMing?.printName()
        print("\(String(describing: xiaoMing))")
        xiaoMing = nil
        print("\(String(describing: xiaoMing))")
    }
}






class Person {
    let name: String

lazy var printName: ()->() = {
    print("The name is \(self.name)")
    //        The name is XiaoMing
    //        Optional(A4Paper.Person)
    //        nil
}

//    lazy var printName: ()->() = { [unowned self] in
//        print("The name is \(self.name)")
//        //        The name is XiaoMing
//        //        Optional(A4Paper.Person)
//        //        Person deinit XiaoMing
//        //        nil
//    }

//    lazy var printName: ()->() = { [weak self] in
//        guard let strongSelf = self else {
//            return
//        }
//        print("The name is \(strongSelf.name)")
////        The name is XiaoMing
////        Optional(A4Paper.Person)
////        Person deinit XiaoMing
////        nil
//    }

    init(personName: String) {
        name = personName
    }

    deinit {
        print("Person deinit \(self.name)")
    }
}
