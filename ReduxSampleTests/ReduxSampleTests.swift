//
//  ReduxSampleTests.swift
//  ReduxSampleTests
//
//  Created by Abdorahman Youssef on 6/7/19.
//  Copyright © 2019 abdelrahman. All rights reserved.
//

import XCTest
@testable import ReduxSample

class ReduxSampleTests: XCTestCase {
    
    let store = Store(reducer: counterReducer, state: nil)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCounterIncreasing(){
        
        let initialValue = (store.state as? AppState)?.counter ?? 0
        
        store.dispath(action: IncreaseAction.init(increaseBy: 1))
        
        XCTAssertEqual(initialValue + 1, (store.state as? AppState)?.counter)
    }
    
    func testCounterDecrease(){
        
        let initialValue = (store.state as? AppState)?.counter ?? 0
        
        store.dispath(action: DecreaseAction.init(decreaseBy: 1))
        
        XCTAssertEqual(initialValue - 1, (store.state as? AppState)?.counter)
    }

}
