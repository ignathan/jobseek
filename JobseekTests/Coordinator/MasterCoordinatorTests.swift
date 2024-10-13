//
//  MasterCoordinatorTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import XCTest
@testable import Jobseek

final class MasterCoordinatorTests: XCTestCase {
    
    func testStart() {
        // Given
        let navigationController = UINavigationController()
        
        let sut = MasterCoordinatorImpl(navigationController: navigationController)
        
        // When
        sut.start()
        
        // Then
        XCTAssertTrue(sut.navigationController.viewControllers.count == 1)
        
        
        XCTAssertTrue(sut.navigationController.viewControllers.contains(where: { $0 is LoginViewController }))
    }
}