//
//  SayMathAppTests.swift
//  SayMathAppTests
//
//  Created by Eric Newman on 8/11/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

import XCTest
@testable import SayMathApp

class SayMathAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(1234, "1234".toInt())
        XCTAssertEqual(1, "One".toInt())
        XCTAssertEqual(2, "two".toInt())
        XCTAssertEqual(3, "Three".toInt())
        XCTAssertEqual(4, "four".toInt())
        XCTAssertEqual(5, "FIVE".toInt())
        XCTAssertEqual(6, "six".toInt())
        XCTAssertEqual(7, "SEVEN".toInt())
        XCTAssertEqual(8, "Eight".toInt())
        XCTAssertEqual(9, "nine".toInt())
        XCTAssertNil("iamnotanumber".toInt())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
