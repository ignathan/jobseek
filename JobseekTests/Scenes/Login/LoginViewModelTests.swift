//
//  LoginViewModelTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import XCTest
import Combine
@testable import Jobseek

final class LoginViewModelTests: XCTestCase {
    
    func testLoginEnabled() {
        // Given
        let sut = LoginViewModelImpl()
        
        // When
        sut.usernameSubject.send("admin")
        sut.passwordSubject.send("password")
        
        // Then
        XCTAssertTrue(sut.loginEnabledSubject.value)
    }
    
    func testLoginUsernameFailed() {
        // Given
        let sut = LoginViewModelImpl()
        
        // When
        sut.usernameSubject.send("")
        sut.passwordSubject.send("password")
        
        // Then
        XCTAssertFalse(sut.loginEnabledSubject.value)
    }
    
    func testLoginPasswordFailed() {
        // Given
        let sut = LoginViewModelImpl()
        
        // When
        sut.usernameSubject.send("admin")
        sut.passwordSubject.send("")
        
        // Then
        XCTAssertFalse(sut.loginEnabledSubject.value)
    }
    
    func testLoginSuccess() {
        // Given
        let sut = LoginViewModelImpl()
        
        var cancellables = Set<AnyCancellable>()
        
        var loginCalled = false
        
        sut.loginSubject.sink { _ in
        } receiveValue: { _ in
            loginCalled = true
        }.store(in: &cancellables)
        
        // When
        sut.login()
        
        // Then
        XCTAssertTrue(loginCalled)
    }
}
