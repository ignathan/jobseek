//
//  ProfileViewControllerTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import XCTest
@testable import Jobseek

final class ProfileViewControllerTests: XCTestCase {
    
    let mockVM = MockProfileViewModel()
    let mockCoordinator = MockMasterCoordinator()
    
    func testLoadView() {
        // Given
        let sut = ProfileViewController(viewModel: mockVM,
                                        coordinator: mockCoordinator)
        // When
        sut.loadView()
        
        // Then
        XCTAssert(sut.view == sut.rootView)
    }
    
    func testDidTapLogout() {
        // Given
        let sut = ProfileViewController(viewModel: mockVM,
                                        coordinator: mockCoordinator)
        // When
        sut.didTapLogout()
        
        // Then
        XCTAssertTrue(mockVM.logoutCalled)
    }
    
    func testLogout() {
        // Given
        let sut = ProfileViewController(viewModel: mockVM,
                                        coordinator: mockCoordinator)
        // When
        sut.viewDidLoad()
        mockVM.logoutSubject.send()
        
        // Then
        XCTAssertTrue(mockCoordinator.restartCalled)
    }
}
