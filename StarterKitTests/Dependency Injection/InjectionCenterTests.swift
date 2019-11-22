//
//  InjectionCenterTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 22/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import XCTest
@testable import StarterKit

private protocol Injectable {
    var identifier: String { get }
}

private class InjectableObject: Injectable {
    let identifier: String = UUID().uuidString
}

private class InjectableSubclass: InjectableObject {
    let success = true
}

class InjectorCenterTests: XCTestCase {
    
    var injectionCenter: InjectionCenter!

    override func setUp() {
        super.setUp()
        
        injectionCenter = InjectionCenter()
    }

    override func tearDown() {
        injectionCenter = nil
        
        super.tearDown()
    }

    func testInjection() {
        // given
        let object = InjectableObject()
        
        // when
        injectionCenter.put(object)
        
        // then
        XCTAssertTrue(object === injectionCenter.get(InjectableObject.self))
    }
    
    func testObjectCannotBeInsertedTwice() {
        // given
        let object1 = InjectableObject()
        let object2 = InjectableObject()
        
        // when
        injectionCenter.put(object1)
        injectionCenter.put(object2)
        
        // then
        XCTAssertTrue(object1 === injectionCenter.get(InjectableObject.self))
    }
    
    func testStaticInjection() {
        // given
        let object = InjectableObject()
        
        // when
        InjectionCenter.provide(object)
        
        // then
        XCTAssertTrue(object === InjectionCenter.inject(InjectableObject.self))
    }
    
    func testSubclassInjection() {
        // given
        let object = InjectableSubclass()
        
        // when
        injectionCenter.put(object, as: InjectableObject.self)
        
        guard let injectedObject = injectionCenter.get(InjectableObject.self) as? InjectableSubclass else {
            XCTFail()
            return
        }
        
        // then
        XCTAssertTrue(object === injectedObject)
        XCTAssertTrue(injectedObject.success)
    }
    
    func testProtocolInjection() {
        // given
        let object = InjectableObject()
        
        // when
        injectionCenter.put(object, as: Injectable.self)
        
        // then
        let injectedObject: Injectable = injectionCenter.get(Injectable.self)
        XCTAssertTrue(object.identifier == injectedObject.identifier)
    }

}
