//
//  UIFont+StarterKit.swift
//  StarterKit
//
//  Created by Emilio Pavia on 20/01/2020.
//  Copyright © 2020 Emilio Pavia. All rights reserved.
//

import UIKit

public extension UIFont {
    func withTraits(_ traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0) //size 0 means keep the size as it is
    }

    func bold() -> UIFont {
        return withTraits(.traitBold)
    }

    func italic() -> UIFont {
        return withTraits(.traitItalic)
    }
    
    @available(iOS 13.0, *)
    func withDesign(_ design: UIFontDescriptor.SystemDesign) -> UIFont {
        let descriptor = fontDescriptor.withDesign(design)
        return UIFont(descriptor: descriptor!, size: 0) //size 0 means keep the size as it is
    }
    
    @available(iOS 13.0, *)
    func rounded() -> UIFont {
        return withDesign(.rounded)
    }
}
