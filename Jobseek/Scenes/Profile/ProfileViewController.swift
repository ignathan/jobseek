//
//  ProfileViewController.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit
import Combine

class ProfileViewController: UIViewController {
    
    let rootView = ProfileView()
    
    var viewModel: ProfileViewModel
    
    var coordinator: MasterCoordinator
    
    var cancellables = Set<AnyCancellable>()
    
    init(viewModel: ProfileViewModel,
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
        
        navigationItem.title = "profile_title".localized()
        
        rootView.logoutButton.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
        
        viewModel.logoutSubject.sink { [weak self] in
            
            self?.coordinator.restart()
            
        }.store(in: &cancellables)
    }
    
    @objc func didTapLogout() {
        
        viewModel.logout()
    }
}
