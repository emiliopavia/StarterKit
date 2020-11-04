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
    
    func deselectItems(transitionCoordinator: UIViewControllerTransitionCoordinator?) {
        let selectedIndexPaths = indexPathsForSelectedRows ?? []
        
        if let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: { context in
                selectedIndexPaths.forEach {
                    self.deselectRow(at: $0, animated: context.isAnimated)
                }
            }, completion: { context in
                if context.isCancelled {
                    selectedIndexPaths.forEach {
                        self.selectRow(at: $0, animated: false, scrollPosition: .none)
                    }
                }
            })
        } else {
            selectedIndexPaths.forEach {
                deselectRow(at: $0, animated: false)
            }
        }
    }
}
