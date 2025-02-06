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
        
        if let font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize) {
            UITabBarItem.appearance().setTitleTextAttributes([.font: font], for: .normal)
        } else {
            // Fallback to system font if custom font isn't found
            let fallbackFont = UIFont.systemFont(ofSize: fontSize)
            UITabBarItem.appearance().setTitleTextAttributes([.font: fallbackFont], for: .normal)
            print("Custom font not found. Using system font.")
        }
        
        vc.tabBarItem = UITabBarItem(title: "읽기", image: UIImage(systemName: "books.vertical"), tag: 0)
        
        self.navigationViewController.pushViewController(vc, animated: true)
        
    }
   
}

