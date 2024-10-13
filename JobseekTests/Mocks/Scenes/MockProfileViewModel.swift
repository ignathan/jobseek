//
//  MockProfileViewModel.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

@testable import Jobseek
import Combine

class MockProfileViewModel: ProfileViewModel {
    
    var logoutCalled = false
    
    let logoutSubject = PassthroughSubject<Void, Never>()
    
    func logout() {
        logoutCalled = true
    }
}
