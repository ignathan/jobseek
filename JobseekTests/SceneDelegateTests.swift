//
//  SceneDelegateTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import XCTest
@testable import Jobseek

final class SceneDelegateTests: XCTestCase {
    
    let coordinator = MockMasterCoordinator()
    
    func testSetup() {
        // Given
        let sut = SceneDelegate()
        sut.coordinator = coordinator
        
        // When
        sut.setup()
        
        // Then
        XCTAssertTrue(coordinator.startCalled)
    }
}
