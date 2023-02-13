//
//  MainCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/09.
//

import UIKit

class MainCoordinator : NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    
    var navigationViewController: UINavigationController
    
    init(navigationViewController: UINavigationController) {
        self.navigationViewController = navigationViewController
    }
    
    func start() {
        let vc = ViewController.instatiate()
        vc.gotoMain = { (isLoginSuccess) in
            self.mainTabBar(isLoginSuccess: isLoginSuccess)
        }
        self.navigationViewController.delegate = self
        self.navigationViewController.pushViewController(vc, animated: true)
    }
    /* TODO :
        - Main function for application
     */
    func mainTabBar(isLoginSuccess : Bool) {
        let childVC = TabBarCoordinator(navigationViewController: navigationViewController)
        addChildCoordinator(childVC)
        childVC.start()
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from)
            else {
                return
            }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let tabBarController = fromViewController as? MainTabBarController {
            removeChildCoordinator(tabBarController.coordinator)
        }
        
    }
    
}
