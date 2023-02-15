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
        
        let vc = FavoriteTabVC.instatiate()
   
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        self.navigationViewController.pushViewController(vc, animated: true)
        
    }
    
    
}
