//
//  NSAttributedStringHTMLTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 25/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import XCTest
@testable import StarterKit

class NSAttributedStringHTMLTests: XCTestCase {

    func testAlignmentConversion() {
        XCTAssertEqual(NSTextAlignment.left.htmlTextAlignment, "left")
        XCTAssertEqual(NSTextAlignment.right.htmlTextAlignment, "right")
        XCTAssertEqual(NSTextAlignment.center.htmlTextAlignment, "center")
        XCTAssertEqual(NSTextAlignment.justified.htmlTextAlignment, "justify")
        XCTAssertEqual(NSTextAlignment.natural.htmlTextAlignment, "left")
    }
    
    func testAttributedStringWithSystemFont() {
        // given
        let systemFont = UIFont.systemFont(ofSize: 15)
        
        // when
        let attributedString = NSAttributedString(htmlBody: "test", font: systemFont, color: .black)!
        XCTAssertNotNil(attributedString)
        
        // then
        let attributes = attributedString.attributes(at: 0, effectiveRange: nil)
        let font = attributes[NSAttributedString.Key.font] as! UIFont
        XCTAssertNotNil(font)
        
        XCTAssertEqual(font.fontName, systemFont.fontName)
    }
    
    func testAttributedStringWithCustomFont() {
        // given
        let customFont = UIFont(name: "Avenir", size: 15)!
        XCTAssertNotNil(customFont)
        
        // when
        let attributedString = NSAttributedString(htmlBody: "test", font: customFont, color: .black)!
        XCTAssertNotNil(attributedString)
        
        // then
        let attributes = attributedString.attributes(at: 0, effectiveRange: nil)
        let font = attributes[NSAttributedString.Key.font] as! UIFont
        XCTAssertNotNil(font)
        
        XCTAssertEqual(font.fontName, customFont.fontName)
    }

}
