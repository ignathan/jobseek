//
//  SceneDelegate.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    var coordinator: MasterCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
#if DEBUG
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
            // Disable UI during unit tests
            return
        }
#endif
        let customAppearance = customNavBarAppearance()
        
        let appearance = UINavigationBar.appearance()
        appearance.scrollEdgeAppearance = customAppearance
        appearance.compactAppearance = customAppearance
        appearance.standardAppearance = customAppearance
        appearance.compactScrollEdgeAppearance = customAppearance
        
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        
        let coordinator = MasterCoordinatorImpl(navigationController: navigationController)
        
        window.rootViewController = coordinator.navigationController
        
        self.window = window
        self.coordinator = coordinator
        
        window.makeKeyAndVisible()
        
        setup()
    }
}

extension SceneDelegate {
    
    func customNavBarAppearance() -> UINavigationBarAppearance {
        let customNavBarAppearance = UINavigationBarAppearance()
        
        let titleAttrs = [NSAttributedString.Key.foregroundColor: UIColor.textReversed,
                          NSAttributedString.Key.font: UIFont.headline6]
        
        // Apply background.
        customNavBarAppearance.configureWithOpaqueBackground()
        customNavBarAppearance.backgroundColor = .backgroundBrand
        
        // Apply white colored normal and large titles.
        customNavBarAppearance.titleTextAttributes = titleAttrs
        customNavBarAppearance.largeTitleTextAttributes = titleAttrs
        
        
        // Apply white color to all the nav bar buttons.
        let barButtonItemAppearance = UIBarButtonItemAppearance(style: .plain)
        barButtonItemAppearance.normal.titleTextAttributes = titleAttrs
        barButtonItemAppearance.disabled.titleTextAttributes = titleAttrs
        barButtonItemAppearance.highlighted.titleTextAttributes = titleAttrs
        barButtonItemAppearance.focused.titleTextAttributes = titleAttrs
        customNavBarAppearance.buttonAppearance = barButtonItemAppearance
        customNavBarAppearance.backButtonAppearance = barButtonItemAppearance
        customNavBarAppearance.doneButtonAppearance = barButtonItemAppearance
        
        return customNavBarAppearance
    }
    
    func setup() {
        coordinator?.start()
    }
}
