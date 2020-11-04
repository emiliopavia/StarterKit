//
//  UIImage+StarterKit.swift
//  StarterKit
//
//  Created by Emilio Pavia on 03/12/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import UIKit

public extension UIImage {
    class func image(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
