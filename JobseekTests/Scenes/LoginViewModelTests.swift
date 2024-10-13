//
//  LoginViewModelTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import XCTest
@testable import Jobseek

final class LoginViewModelTests: XCTestCase {
    
    func testLoginSuccess() {
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
}
