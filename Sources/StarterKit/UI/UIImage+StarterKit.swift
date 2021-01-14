//
//  UIImage+StarterKit.swift
//  StarterKit
//
//  Created by Emilio Pavia on 03/12/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import UIKit

public extension UIImage {
    class func image(color: UIColor,
                     size: CGSize = CGSize(width: 1, height: 1),
                     cornerRadius: CGFloat = 0,
                     borderColor: UIColor? = nil,
                     borderWidth: CGFloat = 0) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        color.setFill()
        let rect = CGRect(origin: CGPoint.zero, size: size)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        path.fill()
        
        if let borderColor = borderColor, borderWidth > 0 {
            borderColor.setStroke()
            let borderRect = rect.insetBy(dx: borderWidth / 2.0, dy: borderWidth / 2.0)
            let borderPath = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius)
            borderPath.stroke()
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
