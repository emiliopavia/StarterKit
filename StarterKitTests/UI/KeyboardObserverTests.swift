//
//  KeyboardObserverTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 27/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import XCTest
@testable import StarterKit

class KeyboardObserverTests: XCTestCase {

    var notificationCenter: NotificationCenter!
    var keyboardObserver: KeyboardObserver!
    
    override func setUp() {
        super.setUp()
        notificationCenter = NotificationCenter()
    }

    override func tearDown() {
        notificationCenter = nil
        keyboardObserver = nil
        super.tearDown()
    }

    func testKeyboardWillShow() {
        let expect = expectation(description: "keyboard show")
        
        keyboardObserver = KeyboardObserver(notificationCenter: notificationCenter) { frame in
            XCTAssertEqual(frame, CGRect(x: 0, y: 0, width: 100, height: 100))
            expect.fulfill()
        }
        
        showKeyboard(using: notificationCenter)
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testKeyboardWillHide() {
        let expect = expectation(description: "keyboard show")
        
        keyboardObserver = KeyboardObserver(notificationCenter: notificationCenter) { frame in
            XCTAssertNil(frame)
            expect.fulfill()
        }
        
        hideKeyboard(using: notificationCenter)
        waitForExpectations(timeout: 5.0, handler: nil)
    }

}

extension KeyboardObserverTests {
    private func showKeyboard(using notificationCenter: NotificationCenter) {
        let userInfo: [AnyHashable: Any] = [
            UIResponder.keyboardFrameEndUserInfoKey: NSValue(cgRect: CGRect(x: 0, y: 0, width: 100, height: 100)),
            UIResponder.keyboardAnimationDurationUserInfoKey: NSNumber(value: 0.5),
            UIResponder.keyboardAnimationCurveUserInfoKey: NSNumber(value: 0)
        ]
        let notification = Notification(name: UIResponder.keyboardWillShowNotification, object: nil, userInfo: userInfo)
        notificationCenter.post(notification)
    }
    
    private func hideKeyboard(using notificationCenter: NotificationCenter) {
        let userInfo: [AnyHashable: Any] = [
            UIResponder.keyboardAnimationDurationUserInfoKey: NSNumber(value: 0.5),
            UIResponder.keyboardAnimationCurveUserInfoKey: NSNumber(value: 0)
        ]
        let notification = Notification(name: UIResponder.keyboardWillHideNotification, object: nil, userInfo: userInfo)
        notificationCenter.post(notification)
    }
}
