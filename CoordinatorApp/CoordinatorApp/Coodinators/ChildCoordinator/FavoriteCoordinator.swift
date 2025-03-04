//
//  FavoritCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/10.
//

import UIKit

class FavoriteCoordinator : Coordinator {
    
    weak var parentCoordinators : TabBarCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationViewController: UINavigationController
    
    init(navigationViewController : UINavigationController) {
        self.navigationViewController = navigationViewController
    }
    
    func start() {
        
        let vc = FavoriteTabVC.instantiate()
        
        vc.tabBarItem = UITabBarItem(title: "듣기", image: UIImage(systemName: "hearingdevice.ear"), tag: 1)
        self.navigationViewController.pushViewController(vc, animated: true)
        
    }
    
    
}

class BookCoordinator : Coordinator {
    
    weak var parentCoordinators : TabBarCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationViewController: UINavigationController
    
    init(navigationViewController : UINavigationController) {
        self.navigationViewController = navigationViewController
    }
    
    func start() {
        
        let vc = BookTabVC.instantiate()
        
        vc.tabBarItem = UITabBarItem(title: "보기", image: UIImage(systemName: "book.and.wrench"), tag: 1)
        self.navigationViewController.pushViewController(vc, animated: true)
        
    }
    
    
}
