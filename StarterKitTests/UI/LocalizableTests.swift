//
//  LocalizableTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 25/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import XCTest
@testable import StarterKit

class LocalizableTests: XCTestCase {
    
    let key = "TEST"
    let value = "PASSED"
    
    func testLocalizedString() {
        XCTAssertEqual(key.localized(), value)
    }
    
    func testLocalizedLabel() {
        // IMPORTANT:
        // we cannot load localized string from tests without specifying
        // the bundle, so here we're just testing that assigning the key
        // updates the text
        
        // given
        let label = UILabel()

        // when
        label.localizableKey = key
        
        // then
        XCTAssertEqual(label.text, key)
        XCTAssertNil(label.localizableKey)
    }
    
    func testLocalizedAttributedLabel() {
        // IMPORTANT:
        // we cannot load localized string from tests without specifying
        // the bundle, so here we're just testing that assigning the key
        // updates the text
        
        // given
        let label = UILabel()

        // when
        label.attributedLocalizableKey = key
        
        // then
        XCTAssertTrue(label.attributedText!.string.contains(key))
        XCTAssertNil(label.attributedLocalizableKey)
    }
    
    func testLocalizedButton() {
        // IMPORTANT:
        // we cannot load localized string from tests without specifying
        // the bundle, so here we're just testing that assigning the key
        // updates the text
        
        // given
        let button = UIButton()

        // when
        button.localizableKey = key
        
        // then
        XCTAssertEqual(button.title(for: .normal), key)
        XCTAssertNil(button.localizableKey)
    }
    
    func testLocalizedNavigationTitle() {
        // IMPORTANT:
        // we cannot load localized string from tests without specifying
        // the bundle, so here we're just testing that assigning the key
        // updates the text
        
        // given
        let viewController = UIViewController()

        // when
        viewController.navigationItem.localizableTitle = key
        
        // then
        XCTAssertEqual(viewController.navigationItem.title, key)
        XCTAssertNil(viewController.navigationItem.localizableTitle)
    }
    
    func testLocalizedTextFieldPlaceholder() {
        // IMPORTANT:
        // we cannot load localized string from tests without specifying
        // the bundle, so here we're just testing that assigning the key
        // updates the text
        
        // given
        let textField = UITextField()

        // when
        textField.localizablePlaceholderKey = key
        
        // then
        XCTAssertEqual(textField.placeholder, key)
        XCTAssertNil(textField.localizablePlaceholderKey)
    }
    
    func testLocalizedTabBarItem() {
        // IMPORTANT:
        // we cannot load localized string from tests without specifying
        // the bundle, so here we're just testing that assigning the key
        // updates the text
        
        // given
        let viewController = UIViewController()

        // when
        viewController.tabBarItem.localizableTitle = key
        
        // then
        XCTAssertEqual(viewController.tabBarItem.title, key)
        XCTAssertNil(viewController.tabBarItem.localizableTitle)
    }
}

extension String {
    func localized() -> String {
        return localized(in: Bundle(for: LocalizableTests.self))
    }
}
