//
//  TableDataSourceTests.swift
//  FountainKit
//
//  Created by Cesar Tardaguila on 3/9/16.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//
@testable import FountainKit
import XCTest

struct MockData {
  let mockField1: String
  let mockField2: String
}

class MockCell: UITableViewCell, DataSettable {
  var outlet1: String?
  var outlet2: String?
  
  var data: MockData? {
    didSet {
      outlet1 = data?.mockField1
      outlet2 = data?.mockField2
    }
  }
}

class TableDataSourceTests: XCTestCase {
  private var dataSource: UITableViewDataSource?
  private var data: FlatArrayDataManager<MockData>?
  
  private let mockData = [MockData(mockField1: "1_1", mockField2: "1_2"), MockData(mockField1: "2_1", mockField2: "2_2")]
  private let tableView = UITableView()
    
    override func setUp() {
        super.setUp()
      data = FlatArrayDataManager(data: mockData)
      dataSource = TableViewDataSource(dataManager: data!, cellType: MockCell.self)
      tableView.registerClass(MockCell.self, forCellReuseIdentifier: MockCell.cellReuseIdentifier())
      
    }
    
    override func tearDown() {
      dataSource = nil
      data = nil
        super.tearDown()
    }
    
    func testDataSourcePopulatesCell() {
      let cell = dataSource?.tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forItem: 0, inSection: 0)) as? MockCell
      
      XCTAssertEqual(cell!.outlet1, mockData.first?.mockField1)
    }
  
  func testDataSourceReturnsCorrectDataCount() {
    let count = dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    
      XCTAssertEqual(count, mockData.count)
  }
}
