//
//  MasterCoordinator.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit

protocol MasterCoordinator {
    
    func start()
}

class MasterCoordinatorImpl: MasterCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let loginVM = LoginViewModelImpl()
        let loginController = LoginViewController(viewModel: loginVM,
                                                  coordinator: self)
        
        navigationController.setViewControllers([loginController], animated: false)
    }
}
