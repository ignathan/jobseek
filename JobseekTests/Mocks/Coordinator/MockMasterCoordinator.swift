//
//  MockMasterCoordinator.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 13/10/2024.
//

@testable import Jobseek

class MockMasterCoordinator: MasterCoordinator {
    
    var startCalled = false
    
    func start() {
        startCalled = true
    }
}
