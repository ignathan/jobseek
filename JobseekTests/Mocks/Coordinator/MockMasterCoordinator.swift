//
//  MockMasterCoordinator.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit
@testable import Jobseek

class MockMasterCoordinator: MasterCoordinator {
    
    var startCalled = false
    var pushMasterCalled = false
    var restartCalled = false
    
    func start() {
        startCalled = true
    }
    
    func masterControllers() -> [UIViewController] {
        return []
    }
    
    func pushMaster() {
        pushMasterCalled = true
    }
    
    func restart() {
        restartCalled = true
    }
}
