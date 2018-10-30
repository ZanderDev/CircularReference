//
//  CircularReferenceTests.swift
//  CircularReferenceTests
//
//  Created by AlphaZ on 2018/10/30.
//  Copyright © 2018年 Zhang,Dong(AI). All rights reserved.
//

import XCTest
@testable import CircularReference

class CircularReferenceTests: XCTestCase {
    func testExample() {
        let obj:BlockSelf? = BlockSelf()
        obj?.doTest()
        RunLoop.current.run(until: Date.distantFuture)
        print("End")
    }
    override func setUp() { }
    override func tearDown() { }
    func testPerformanceExample() { self.measure { }}
}
