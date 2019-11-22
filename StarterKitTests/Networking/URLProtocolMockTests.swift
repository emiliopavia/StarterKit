//
//  URLProtocolMockTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 22/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import XCTest
@testable import StarterKit

class URLProtocolMockTests: XCTestCase {
    
    let url = URL(string: "https://www.apple.com")!
    
    var session: URLSession!
    
    override func setUp() {
        super.setUp()
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        
        session = URLSession(configuration: configuration)
    }
    
    override func tearDown() {
        session = nil
        super.tearDown()
    }

    func testSuccessResponse() {
        let responseExpectation = expectation(description: "response")
        
        // given
        let ok = "OK"
        let statusCode = 300
        let response = URLResponseStub(data: ok.data(using: .utf8), url: url, statusCode: statusCode)
        
        URLProtocolMock.set(response, for: URLRequest(url: url))
        
        // when
        session.dataTask(with: url) { data, response, error in
            // then
            XCTAssertNil(error)
            XCTAssertEqual(String(data: data!, encoding: .utf8), ok)
            XCTAssertEqual((response as! HTTPURLResponse).statusCode, statusCode)
            responseExpectation.fulfill()
        }.resume()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testErrorResponse() {
        let responseExpectation = expectation(description: "response")
        
        // given
        let domain = "URLProtocolMock.tests"
        let code = 47
        let response = URLResponseStub(error: NSError(domain: domain, code: code, userInfo: nil))
        
        URLProtocolMock.set(response, for: URLRequest(url: url))
        
        // when
        session.dataTask(with: url) { data, response, error in
            // then
            XCTAssertNil(data)
            XCTAssertNil(response)
            XCTAssertEqual((error as NSError?)?.domain, domain)
            XCTAssertEqual((error as NSError?)?.code, code)
            responseExpectation.fulfill()
        }.resume()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

}
