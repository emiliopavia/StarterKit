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
        return pinTo(top: superview.topAnchor,
                     leading: superview.leadingAnchor,
                     bottom: superview.bottomAnchor,
                     trailing: superview.trailingAnchor)
    }
    
    @discardableResult
    func pin(to layoutGuide: UILayoutGuide) -> (top: NSLayoutConstraint, leading: NSLayoutConstraint, bottom: NSLayoutConstraint, trailing: NSLayoutConstraint)? {
        return pinTo(top: layoutGuide.topAnchor,
                     leading: layoutGuide.leadingAnchor,
                     bottom: layoutGuide.bottomAnchor,
                     trailing: layoutGuide.trailingAnchor)
    }
    
    @discardableResult
    func pinTo(top: NSLayoutYAxisAnchor,
               leading: NSLayoutXAxisAnchor,
               bottom: NSLayoutYAxisAnchor,
               trailing: NSLayoutXAxisAnchor) -> (top: NSLayoutConstraint, leading: NSLayoutConstraint, bottom: NSLayoutConstraint, trailing: NSLayoutConstraint)? {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = (
            top: topAnchor.constraint(equalTo: top),
            leading: leadingAnchor.constraint(equalTo: leading),
            bottom: bottomAnchor.constraint(equalTo: bottom),
            trailing: trailingAnchor.constraint(equalTo: trailing)
        )
        
        NSLayoutConstraint.activate([constraints].flatMap({ [$0, $1, $2, $3] }))
        
        return constraints
    }

    func pinToCenter() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
