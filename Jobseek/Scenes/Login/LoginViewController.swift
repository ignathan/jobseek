//
//  LoginViewController.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    let rootView = LoginView()
    
    var viewModel: LoginViewModel
    
    var coordinator: MasterCoordinator
    
    var cancellables = Set<AnyCancellable>()
    
    init(viewModel: LoginViewModel,
         coordinator: MasterCoordinator) {
        
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "login_title".localized()
        
        rootView.usernameField.delegate = self
        
        rootView.usernameField.addTarget(self, action: #selector(didEditUsername), for: .editingChanged)
        
        rootView.passwordField.delegate = self
        
        rootView.passwordField.addTarget(self, action: #selector(didEditPassword), for: .editingChanged)
        
        rootView.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        viewModel.loginEnabledSubject
            .sink { [weak self] isEnabled in
                
                self?.rootView.loginButton.isEnabled = isEnabled
                
            }.store(in: &cancellables)
        
        viewModel.loginSubject
            .sink { [weak self] completion in
                
                guard self != nil, case let .failure(error) = completion else { return }
                
#if DEBUG
                print("😭 Login Error")
                dump(error)
#endif
                
            } receiveValue: { [weak self] in
                
                self?.coordinator.pushMaster()
                
            }.store(in: &cancellables)
    }
    
    @objc func didEditUsername() {
        
        viewModel.usernameSubject.send(rootView.usernameField.text)
    }
    
    @objc func didEditPassword() {
        
        viewModel.passwordSubject.send(rootView.passwordField.text)
    }
    
    @objc func didTapLogin() {
        
        viewModel.login()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
