

//
//  Singleton.swift
//  A4Paper
//
//  Created by AlphaZ on 2018/10/29.
//  Copyright © 2018年 Zhang,Dong(AI). All rights reserved.
//

import UIKit

class Singleton: NSObject {
    public static let `default` = Singleton()
    private override init() {
        super.init()
    }
    typealias CallBack =  ()->()
    var block: CallBack?

    func callBlockAsync() -> () {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(5)) {
            self.block?()
        }

    }

}
