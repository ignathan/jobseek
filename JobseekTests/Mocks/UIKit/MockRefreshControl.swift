//
//  MockRefreshControl.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import UIKit

class MockRefreshControl: UIRefreshControl {
    
    var endRefreshingCalled = false
    
    override func endRefreshing() {
        endRefreshingCalled = true
    }
}
