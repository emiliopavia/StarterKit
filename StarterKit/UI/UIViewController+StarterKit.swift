//
//  UIViewController+StarterKit.swift
//  StarterKit
//
//  Created by Emilio Pavia on 18/03/2020.
//  Copyright © 2020 Emilio Pavia. All rights reserved.
//

import UIKit

public extension UIViewController {
    class func fromNib<T: UIViewController>(in bundle: Bundle = Bundle.main) -> T {
        return T(nibName: String(describing: T.self), bundle: bundle)
    }
}
