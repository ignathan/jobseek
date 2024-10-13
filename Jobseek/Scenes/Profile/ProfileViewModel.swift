//
//  ProfileViewModel.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import Combine

protocol ProfileViewModel {
    
    var logoutSubject: PassthroughSubject<Void, Never> { get }
    
    func logout()
}

class ProfileViewModelImpl: ProfileViewModel {
    
    let logoutSubject = PassthroughSubject<Void, Never>()
    
    func logout() {
        
        //TODO: call API
        logoutSubject.send()
    }
}
