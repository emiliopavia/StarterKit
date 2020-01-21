//
//  UIFontTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 21/01/2020.
//  Copyright © 2020 Emilio Pavia. All rights reserved.
//

import XCTest
@testable import StarterKit

class UIFontTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFontWithBoldTrait() {
        // given
        let font = UIFont.systemFont(ofSize: 10)
        
        // when
        let boldFont = font.bold()
        
        // then
        XCTAssertEqual(boldFont.familyName, font.familyName)
        XCTAssertEqual(boldFont.pointSize, font.pointSize)
        
        XCTAssertFalse(font.fontDescriptor.symbolicTraits.contains(.traitBold))
        XCTAssertTrue(boldFont.fontDescriptor.symbolicTraits.contains(.traitBold))
    }
    
    func testFontWithItalicTrait() {
        // given
        let font = UIFont.systemFont(ofSize: 10)
        
        // when
        let boldFont = font.italic()
        
        // then
        XCTAssertEqual(boldFont.familyName, font.familyName)
        XCTAssertEqual(boldFont.pointSize, font.pointSize)
        
        XCTAssertFalse(font.fontDescriptor.symbolicTraits.contains(.traitItalic))
        XCTAssertTrue(boldFont.fontDescriptor.symbolicTraits.contains(.traitItalic))
    }

}
