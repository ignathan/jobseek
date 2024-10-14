//
//  MockTableView.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import UIKit

class MockTableView: UITableView {
    
    var reloadDataCalled = false
    
    override func reloadData() {
        reloadDataCalled = true
    }
}
