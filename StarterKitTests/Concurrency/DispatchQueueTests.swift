//
//  DispatchQueueTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 22/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import XCTest

class DispatchQueueTests: XCTestCase {

    func testBlockIsExecutedSynchronouslyWhenInMainThread() {
        let expect = expectation(description: "execution")
        
        var passed = false
        DispatchQueue.main {
            XCTAssertTrue(Thread.isMainThread)
            XCTAssertFalse(passed)
            
            expect.fulfill()
        }
        passed = true
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testBlockIsExecutedAsynchronouslyWhenInBackgroundThread() {
        let expect = expectation(description: "execution")
        
        DispatchQueue.global(qos: .background).async {
            var passed = false
            DispatchQueue.main {
                XCTAssertTrue(Thread.isMainThread)
                XCTAssertTrue(passed)
                
                expect.fulfill()
            }
            passed = true
        }
       
        waitForExpectations(timeout: 1.0, handler: nil)
    }

}
