//
//  MasterCoordinator.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit

protocol MasterCoordinator {
    
    func start()
    
    func masterControllers() -> [UIViewController]
    
    func pushMaster()
    
    func restart()
}

class MasterCoordinatorImpl: MasterCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        
        let loginVM = LoginViewModelImpl()
        let loginController = LoginViewController(viewModel: loginVM,
                                                  coordinator: self)
        
        navigationController.setViewControllers([loginController], animated: animated)
    }
    
    func start() {
        start(animated: false)
    }
    
    func masterControllers() -> [UIViewController] {
        
        let jobListVM = JobListViewModelImpl()
        let jobListController = JobListViewController(viewModel: jobListVM, coordinator: self)
        let jobListItem = UITabBarItem(title: "master_tab_jobs".localized(),
                                       image: UIImage(systemName: "house.circle"),
                                       selectedImage: UIImage(systemName: "house.circle.fill"))
        jobListController.tabBarItem = jobListItem
        
        let profileVM = ProfileViewModelImpl()
        let profileController = ProfileViewController(viewModel: profileVM, coordinator: self)
        let profileItem = UITabBarItem(title: "master_tab_profile".localized(),
                                       image: UIImage(systemName: "person.crop.circle"),
                                       selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        profileController.tabBarItem = profileItem
        
        return [jobListController, profileController]
    }
    
    func pushMaster() {
        
        let masterController = MasterViewController(coordinator: self)
        
        navigationController.setViewControllers([masterController], animated: true)
    }
    
    func restart() {
        start(animated: true)
    }
}
