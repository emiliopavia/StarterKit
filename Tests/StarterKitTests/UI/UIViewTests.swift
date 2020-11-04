//
//  UIViewTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 27/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import XCTest
@testable import StarterKit

class UIViewTests: XCTestCase {
    
    func testLoadFromNib() {
        // given
        let view: TestView
            
        // when
        view = TestView.fromNib(in: Bundle.module)
        
        // then
        XCTAssertNotNil(view.label)
    }
    
    func testBorderInspectables() {
        // given
        let view = UIView()
        view.layer.borderColor = nil
        view.layer.borderWidth = 0
        XCTAssertNil(view.borderColor)
        XCTAssertEqual(view.borderWidth, 0)
        
        // when
        view.borderColor = UIColor.white
        view.borderWidth = 1
        
        // then
        XCTAssertEqual(view.borderColor, UIColor.white)
        XCTAssertEqual(view.borderWidth, 1)
        XCTAssertEqual(view.layer.borderColor, UIColor.white.cgColor)
        XCTAssertEqual(view.layer.borderWidth, 1)
    }
    
    func testPixelPerfectBorder() {
        // given
        let view = UIView()
        
        // when
        view.borderWidth = 0.9
        
        // then
        XCTAssertEqual(view.layer.borderWidth, 1 / UIScreen.main.scale)
    }
    
    func testShadowInspectables() {
        // given
        let view = UIView()
        view.layer.shadowColor = nil
        XCTAssertNil(view.layerShadowColor)
        
        // when
        view.layerShadowColor = UIColor.green
        view.layerShadowRadius = 5
        view.layerShadowOpacity = 0.5
        view.layerShadowOffset = CGSize(width: 10, height: 10)
        
        // then
        XCTAssertEqual(view.layerShadowColor, UIColor.green)
        XCTAssertEqual(view.layerShadowRadius, 5)
        XCTAssertEqual(view.layerShadowOpacity, 0.5)
        XCTAssertEqual(view.layerShadowOffset, CGSize(width: 10, height: 10))
        XCTAssertEqual(view.layer.shadowColor, UIColor.green.cgColor)
        XCTAssertEqual(view.layer.shadowRadius, 5)
        XCTAssertEqual(view.layer.shadowOpacity, 0.5)
        XCTAssertEqual(view.layer.shadowOffset, CGSize(width: 10, height: 10))
    }

}
