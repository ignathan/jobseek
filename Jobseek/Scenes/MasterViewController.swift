//
//  MasterViewController.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit

class MasterViewController: UITabBarController {
    
    var coordinator: MasterCoordinator
    
    init(coordinator: MasterCoordinator) {
        
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = coordinator.masterControllers()
        
        delegate = self
        
        if let firstController = viewControllers?.first {
            tabBarController(self, didSelect: firstController)
        }
    }
}

extension MasterViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        title = viewController.navigationItem.title
    }
}
