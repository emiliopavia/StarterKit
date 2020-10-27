//
//  URLProtocolStubTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 12/12/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import XCTest
@testable import StarterKit

class URLProtocolStubTests: XCTestCase {

    let url = URL(string: "https://www.hopefullythisserverdoesntexist.com")!
    
    var session: URLSession!
    
    override func setUp() {
        super.setUp()
        
        URLProtocolStub.clear()
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolStub.self]
        
        session = URLSession(configuration: configuration)
    }
    
    override func tearDown() {
        session = nil
        URLProtocolStub.clear()
        super.tearDown()
    }

    func testSuccessResponse() {
        let responseExpectation = expectation(description: "response")
        
        // when
        session.dataTask(with: url) { data, response, error in
            // then
            XCTAssertNil(error)
            XCTAssertTrue(data!.isEmpty)
            XCTAssertEqual((response as! HTTPURLResponse).statusCode, 200)
            
            XCTAssertEqual(URLProtocolStub.loadedRequests.first!.url, self.url)
            
            responseExpectation.fulfill()
        }.resume()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

}
