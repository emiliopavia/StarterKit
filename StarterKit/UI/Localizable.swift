//
//  Localizable.swift
//  StarterKit
//
//  Created by Emilio Pavia on 24/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import UIKit

public protocol Localizable {
    func localized(from tableName: String?, in bundle: Bundle) -> String
}

extension Localizable where Self: CustomStringConvertible {
    public func localized(from tableName: String? = nil,
                          in bundle: Bundle = Bundle.main) -> String {
        
        return NSLocalizedString(String(describing: self),
                                 tableName: tableName,
                                 bundle: bundle,
                                 comment: "")
    }
}

extension String: Localizable {}

extension UILabel {
    @IBInspectable public var localizableKey: String? {
        get { return nil }  // not needed
        set(key) {
            text = key?.localized()
        }
    }
    
    @IBInspectable public var attributedLocalizableKey: String? {
        get { return nil }  // not needed
        set(key) {
            attributedText = NSAttributedString(htmlBody: key?.localized(),
                                                font: font,
                                                color: textColor,
                                                alignment: textAlignment)
        }
    }
}

extension UIButton {
    @IBInspectable public var localizableKey: String? {
        get { return nil }  // not needed
        set(key) {
            setTitle(key?.localized(), for: .normal)
        }
    }
}

extension UINavigationItem {
    @IBInspectable public var localizableTitle: String? {
        get { return nil }  // not needed
        set(key) {
            title = key?.localized()
        }
    }
}

extension UITextField {
    @IBInspectable public var localizablePlaceholderKey: String? {
        get { return nil }  // not needed
        set(key) {
            placeholder = key?.localized()
        }
    }
}
