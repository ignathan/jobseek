//
//  MockLoginViewModel.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 13/10/2024.
//

@testable import Jobseek
import Combine

class MockLoginViewModel: LoginViewModel {
    
    let usernameSubject = CurrentValueSubject<String?, Never>(nil)
    
    let passwordSubject = CurrentValueSubject<String?, Never>(nil)
    
    let loginEnabledSubject = CurrentValueSubject<Bool, Never>(false)
}
