//
//  FactorialTaskTests.swift
//  FactorialTaskTests
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

import XCTest
@testable import FactorialTask

class FactorialTaskTests: XCTestCase, FactorialCalculatorOutputInterface {
    
    var factorialCalculator : FactorialCalculator!
    var expectation : XCTestExpectation!
    var initialCount : NSInteger = 0
    var count : NSInteger = 0
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        factorialCalculator = FactorialCalculator()
        factorialCalculator.output = self
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        count = 0
        initialCount = count
        
//        factorialCalculator = nil
        
        super.tearDown()
    }
    
    func testWhenLimitIsEqualTo0() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        count = 0;
    }
    
    func testWhenLimitIsEqualTo1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        count = 1;
        
        self.tryToTestWhenLimitIsEqualTo(1 as NSNumber)
    }
    
    func testWhenLimitIsEqualTo2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        count = 2;
        
        self.tryToTestWhenLimitIsEqualTo(2 as NSNumber)
    }
    
    func testWhenLimitIsEqualTo3() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        count = 2;
        
        self.tryToTestWhenLimitIsEqualTo(3 as NSNumber)
    }
    
    func testWhenLimitIsEqualTo5() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        count = 2;
        
        self.tryToTestWhenLimitIsEqualTo(5 as NSNumber)
    }
    
    func testWhenLimitIsEqualTo7() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        count = 3;
        
        self.tryToTestWhenLimitIsEqualTo(7 as NSNumber)
    }
    
    func testWhenLimitIsEqualTo23() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        count = 3;
        
        self.tryToTestWhenLimitIsEqualTo(23 as NSNumber)
    }
    
    func testWhenLimitIsEqualTo24() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        count = 4;
        
        self.tryToTestWhenLimitIsEqualTo(24 as NSNumber)
    }
    
    func testWhenLimitIsEqualTo1000() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        count = 6;
        
        self.tryToTestWhenLimitIsEqualTo(1000 as NSNumber)
    }
    
    func testWhenLimitIsEqualTo3456() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        count = 6;
        
        self.tryToTestWhenLimitIsEqualTo(3456 as NSNumber)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - FactorialCalculatorOutputInterface
    
    func onDidCalculateFactorialRecord(record: String) {
        
        if count > 0 {
            
            XCTAssertEqual(self.recordStrings()[initialCount - count] as? String, record)
            
            count--
            
            if count == 0 {
                expectation.fulfill()
            }
            
        } else {
            
            XCTAssertFalse(true, "There is redundant callback")
            
        }
        
    }
    
    // MARK: - Helper
    
    func tryToTestWhenLimitIsEqualTo(limit: NSNumber) {
    
        initialCount = count;
        expectation = self.expectationWithDescription("calculate numbers in background")
        
        factorialCalculator.calculateFactorialRecordsWithLimit(limit)
        
        self.waitForExpectationsWithTimeout(0.001, handler: nil)
    }
    
    func recordStrings() -> NSArray {
        return NSArray(objects:
            "1 (1! = 1)",
            "2 (2! = 2)",
            "3 (3! = 6)",
            "4 (4! = 24)",
            "5 (5! = 120)",
            "6 (6! = 720)"
        )
    }
}
