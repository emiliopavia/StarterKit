//
//  JWTTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 06/12/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import XCTest
@testable import StarterKit

class JWTTests: XCTestCase {

    let valid = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImp0aSI6IjkzZmYyYmMzLTk4YzYtNDU3YS1hNGZmLTEwNjRiZGNmYTk0ZCIsImlhdCI6MTU3NTYzMTA0MCwiZXhwIjoxNTc1NjM0NjQwfQ.S6ZcujjnWYYJEYs08JzNNv2I3cgmQq66EGXPhp1GStA"
    
    let typ = "JWT"
    let alg = "HS256"
    
    let sub = "1234567890"
    let _name = "John Doe"
    let admin = true
    let jti = "93ff2bc3-98c6-457a-a4ff-1064bdcfa94d"
    let iat = 1575631040
    let exp = 1575634640

    func testHeaderDecoding() {
        // when
        let jwt = JWT(token: valid)
        
        // then
        XCTAssertNotNil(jwt)
        XCTAssertEqual(jwt!.header["typ"] as? String, typ)
        XCTAssertEqual(jwt!.header["alg"] as? String, alg)
    }
    
    func testPayloadDecoding() {
        // when
        let jwt = JWT(token: valid)
        
        // then
        XCTAssertNotNil(jwt)
        XCTAssertEqual(jwt!.payload["sub"] as? String, sub)
        XCTAssertEqual(jwt!.payload["name"] as? String, _name)
        XCTAssertEqual(jwt!.payload["admin"] as? Bool, admin)
        XCTAssertEqual(jwt!.payload["jti"] as? String, jti)
        XCTAssertEqual(jwt!.payload["iat"] as? Int, iat)
        XCTAssertEqual(jwt!.payload["exp"] as? Int, exp)
    }
    
    func testDecodingFailsWithRandomString() {
        // given
        let random = [NSUUID().uuidString.data(using: .utf8)!.base64EncodedString(),
                      NSUUID().uuidString.data(using: .utf8)!.base64EncodedString(),
                      NSUUID().uuidString.data(using: .utf8)!.base64EncodedString()].joined(separator: ".")
        
        // when
        let jwt = JWT(token: random)
        
        // then
        XCTAssertNil(jwt)
    }
    
    func testStringRepresentation() {
        // when
        let jwt = JWT(token: valid)
        
        // then
        XCTAssertNotNil(jwt)
        XCTAssertEqual(String(describing: jwt!), valid)
    }
}
