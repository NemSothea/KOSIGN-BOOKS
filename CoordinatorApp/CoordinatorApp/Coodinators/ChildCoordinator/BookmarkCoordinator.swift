//
//  BookmarksCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/09.
//

import UIKit
class BookmarkCoordinator : Coordinator {
    
    weak var parentCoordinators : TabBarCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationViewController: UINavigationController
    
    init(navigationViewController: UINavigationController) {
        self.navigationViewController = navigationViewController
    }
    func start() {
    
        let vc = BookMarkTabVC.instatiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        self.navigationViewController.pushViewController(vc, animated: true)
        
    }
   
}

