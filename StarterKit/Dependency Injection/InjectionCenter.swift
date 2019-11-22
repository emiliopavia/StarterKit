//
//  InjectionCenter.swift
//  StarterKit
//
//  Created by Emilio Pavia on 22/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import Foundation

public class InjectionCenter {
    public static let `default` = InjectionCenter()
    
    private let queue = DispatchQueue(label: "InjectionCenter.queue", attributes: .concurrent)
    private var container = [ObjectIdentifier: Any]()
    
    public func put(_ object: Any, as objectType: Any.Type? = nil) {
        queue.async(flags: .barrier) {
            let key: ObjectIdentifier
            if let objectType = objectType {
                key = ObjectIdentifier(objectType)
            } else {
                key = ObjectIdentifier(type(of: object))
            }
            
            guard !self.container.keys.contains(key) else {
                return
            }
            
            self.container[key] = object
        }
    }
    
    public func get<Element>(_ type: Element.Type) -> Element {
        var result: Element!
        queue.sync {
            result = container[ObjectIdentifier(type)] as? Element
        }
        return result
    }
    
    public static func provide(_ object: Any, as objectType: Any.Type? = nil) {
        return `default`.put(object, as: objectType)
    }
    
    public static func inject<Element>(_ type: Element.Type) -> Element {
        return `default`.get(type)
    }
}
