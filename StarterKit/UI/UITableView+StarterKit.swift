//
//  UITableView+StarterKit.swift
//  StarterKit
//
//  Created by Emilio Pavia on 06/02/2020.
//  Copyright © 2020 Emilio Pavia. All rights reserved.
//

import UIKit

public extension UITableView {
    var latestIndexPath: IndexPath? {
        guard numberOfSections > 0 else {
            return nil
        }
        
        var section = numberOfSections - 1
        while section >= 0 {
            let rowsInSection = numberOfRows(inSection: section)
            if rowsInSection > 0 {
                return IndexPath(row: rowsInSection - 1, section: section)
            }
            section -= 1
        }
        
        return nil
    }
}
