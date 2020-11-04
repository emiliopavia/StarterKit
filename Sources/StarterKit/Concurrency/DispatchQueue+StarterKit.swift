//
//  DispatchQueue+StarterKit.swift
//  StarterKit
//
//  Created by Emilio Pavia on 22/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    class func main(execute work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            main.async(execute: work)
        }
    }
}
