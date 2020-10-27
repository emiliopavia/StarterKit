//
//  UIView+StarterKit.swift
//  StarterKit
//
//  Created by Emilio Pavia on 27/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import UIKit

public extension UIView {
    class func fromNib<T: UIView>(in bundle: Bundle = Bundle.main) -> T {
        return bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

public extension UIView {
    @IBInspectable dynamic var borderColor: UIColor? {
        get {
            if let cgColor = layer.borderColor {
                return UIColor(cgColor: cgColor)
            }
            return nil
        }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable dynamic var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set {
            if newValue < 1 {
                // let's make it pixel perfect in this case
                layer.borderWidth = 1 / UIScreen.main.scale
            } else {
                layer.borderWidth = newValue
            }
        }
    }
}

public extension UIView {
    @IBInspectable dynamic var layerShadowColor: UIColor? {
        get {
            if let cgColor = layer.shadowColor {
                return UIColor(cgColor: cgColor)
            }
            return nil
        }
        set { layer.shadowColor = newValue?.cgColor }
    }
    
    @IBInspectable dynamic var layerShadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    @IBInspectable dynamic var layerShadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    
    @IBInspectable dynamic var layerShadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
}

public extension UIView {
    @discardableResult
    func pinToSuperview() -> (top: NSLayoutConstraint, leading: NSLayoutConstraint, bottom: NSLayoutConstraint, trailing: NSLayoutConstraint)? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = (
            top: topAnchor.constraint(equalTo: superview.topAnchor),
            leading: leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            bottom: bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            trailing: trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        )
        
        NSLayoutConstraint.activate([constraints].flatMap({ [$0, $1, $2, $3] }))
        
        return constraints
    }
}
