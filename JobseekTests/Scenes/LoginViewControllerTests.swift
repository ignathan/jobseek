//
//  LoginViewControllerTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import XCTest
@testable import Jobseek

final class LoginViewControllerTests: XCTestCase {
    
    let mockVM = MockLoginViewModel()
    let mockCoordinator = MockMasterCoordinator()
    
    func testEditUsername() {
        // Given
        let sut = LoginViewController(viewModel: mockVM,
                                      coordinator: mockCoordinator)
        let username = "admin"
        
        // When
        sut.rootView.usernameField.text = username
        sut.didEditUsername()
        
        // Then
        XCTAssertTrue(mockVM.usernameSubject.value == username)
    }
    
    func testEditPassword() {
        // Given
        let sut = LoginViewController(viewModel: mockVM,
                                      coordinator: mockCoordinator)
        let password = "password"
        
        // When
        sut.rootView.passwordField.text = password
        sut.didEditPassword()
        
        // Then
        XCTAssertTrue(mockVM.passwordSubject.value == password)
    }
    
    func testLoginEnabled() {
        // Given
        let sut = LoginViewController(viewModel: mockVM,
                                      coordinator: mockCoordinator)
        // When
        sut.viewDidLoad()
        mockVM.loginEnabledSubject.send(true)
        
        // Then
        XCTAssertTrue(sut.rootView.loginButton.isEnabled)
    }
}
