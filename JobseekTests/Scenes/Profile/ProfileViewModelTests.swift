//
//  ProfileViewModelTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import XCTest
import Combine
@testable import Jobseek

final class ProfileViewModelTests: XCTestCase {
    
    func testLogout() {
        // Given
        let sut = ProfileViewModelImpl()
        
        var logoutCalled = false
        
        var cancellables = Set<AnyCancellable>()
        
        sut.logoutSubject.sink { _ in
            logoutCalled = true
        }.store(in: &cancellables)
        
        // When
        sut.logout()
        
        // Then
        XCTAssertTrue(logoutCalled)
    }
}
