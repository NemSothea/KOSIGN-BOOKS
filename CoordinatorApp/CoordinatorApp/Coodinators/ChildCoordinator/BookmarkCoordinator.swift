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
    
        let vc = BookMarkTabVC.instantiate()
        
        let fontSize = Share.shared.setFontSize()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "1HoonDdukbokki Regular", size: fontSize)!], for: .normal)
        
        vc.tabBarItem = UITabBarItem(title: "읽기", image: UIImage(systemName: "books.vertical"), tag: 0)
        
        self.navigationViewController.pushViewController(vc, animated: true)
        
    }
   
}

