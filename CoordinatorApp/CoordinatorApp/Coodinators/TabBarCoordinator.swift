//
//  TabBarCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/09.
//

import UIKit

class TabBarCoordinator : Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationViewController : UINavigationController
    
    init(navigationViewController: UINavigationController) {
        self.navigationViewController = navigationViewController
    }
    
    func start() {
        
        let vc = MainTabBarController.instantiate()
        vc.coordinator = self
        vc.viewControllers = [getBookMark(),getFavorite(),getBook()]
        self.navigationViewController.pushViewController(vc, animated: true)
        
    }
    func getBookMark() -> UINavigationController {
        
        let bookMarkVC = BookmarkCoordinator(navigationViewController: UINavigationController())
        bookMarkVC.parentCoordinators = self
        
        addChildCoordinator(bookMarkVC)
        bookMarkVC.start()
        return bookMarkVC.navigationViewController
        
    }
    func getFavorite() -> UINavigationController {
        
        let favoriteVC = FavoriteCoordinator(navigationViewController: UINavigationController())
        favoriteVC.parentCoordinators = self
        addChildCoordinator(favoriteVC)
        favoriteVC.start()
        return favoriteVC.navigationViewController
        
    }
    func getBook() -> UINavigationController {
        
        let bookVC = BookCoordinator(navigationViewController: UINavigationController())
        bookVC.parentCoordinators = self
        addChildCoordinator(bookVC)
        bookVC.start()
        return bookVC.navigationViewController
        
    }
    
    
}
