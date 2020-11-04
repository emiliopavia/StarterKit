//
//  UITableViewTests.swift
//  StarterKitTests
//
//  Created by Emilio Pavia on 07/02/2020.
//  Copyright © 2020 Emilio Pavia. All rights reserved.
//

import XCTest

class UITableViewTests: XCTestCase {

    func testLatestIndexPathIsNilWithNoSections() {
        // given
        class EmptyDataSource: NSObject, UITableViewDataSource {
            func numberOfSections(in tableView: UITableView) -> Int { 0 }
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 0 }
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { UITableViewCell() }
        }
        
        let tableView = UITableView()
        
        // when
        let dataSource = EmptyDataSource()
        tableView.dataSource = dataSource
        
        // then
        XCTAssertNil(tableView.latestIndexPath)
    }
    
    func testLatestIndexPathIsNilWithEmptySections() {
        // given
        class EmptyDataSource: NSObject, UITableViewDataSource {
            func numberOfSections(in tableView: UITableView) -> Int { 5 }
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 0 }
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { UITableViewCell() }
        }
        
        let tableView = UITableView()
        
        // when
        let dataSource = EmptyDataSource()
        tableView.dataSource = dataSource
        
        // then
        XCTAssertNil(tableView.latestIndexPath)
    }
    
    func testLatestIndexPathWhenLatestSectionIsNotEmpty() {
        // given
        class DataSource: NSObject, UITableViewDataSource {
            func numberOfSections(in tableView: UITableView) -> Int { 3 }
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 3 }
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { UITableViewCell() }
        }
        
        let tableView = UITableView()
        
        // when
        let dataSource = DataSource()
        tableView.dataSource = dataSource
        
        // then
        XCTAssertEqual(tableView.latestIndexPath, IndexPath(row: 2, section: 2))
    }
    
    func testLatestIndexPathWhenLatestSectionsAreEmpty() {
        // given
        class DataSource: NSObject, UITableViewDataSource {
            func numberOfSections(in tableView: UITableView) -> Int { 3 }
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { section < 1 ? 3 : 0 }
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { UITableViewCell() }
        }
        
        let tableView = UITableView()
        
        // when
        let dataSource = DataSource()
        tableView.dataSource = dataSource
        
        // then
        XCTAssertEqual(tableView.latestIndexPath, IndexPath(row: 2, section: 0))
    }

}
