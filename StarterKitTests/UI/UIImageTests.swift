//
//  UIImageTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 03/12/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import XCTest
@testable import StarterKit

class UIImageTests: XCTestCase {

    func testImageWithColor() {
        // given
        let color = UIColor.black
        let size = CGSize(width: 100, height: 100)
        
        // when
        let image = UIImage.image(color: color, size: size)
        
        // then
        XCTAssertNotNil(image)
        XCTAssertEqual(image!.size, size)
        // we should also test the color
    }

}
