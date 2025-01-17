//
//  LoginViewModel.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import Combine

protocol LoginViewModel {
    
    var usernameSubject: CurrentValueSubject<String?, Never> { get }
    var passwordSubject: CurrentValueSubject<String?, Never> { get }
    
    var loginEnabledSubject: CurrentValueSubject<Bool, Never> { get }
    
    var loginSubject: PassthroughSubject<Void, Error> { get }
    
    func login()
}

class LoginViewModelImpl: LoginViewModel {
    
    let usernameSubject = CurrentValueSubject<String?, Never>("")
    
    let passwordSubject = CurrentValueSubject<String?, Never>("")
    
    let loginEnabledSubject = CurrentValueSubject<Bool, Never>(false)
    
    let loginSubject = PassthroughSubject<Void, any Error>()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        
        Publishers
            .CombineLatest(usernameSubject, passwordSubject)
            .map { [weak self] username, password in
                
                guard let self else { return false }
                
                return isLoginEnabled(username: username, password: password)
                
            }.sink { [weak self] isLoginEnabled in
                
                self?.loginEnabledSubject.send(isLoginEnabled)
                
            }.store(in: &cancellables)
    }
    
    func isLoginEnabled(username: String?, password: String?) -> Bool {
        
        return !username.isEmptyOrNil && !password.isEmptyOrNil
    }
    
    func login() {
        
        // TODO: call login API & stores JWT token in Keychain
        
        loginSubject.send()
    }
}
