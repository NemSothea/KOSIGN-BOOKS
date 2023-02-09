//
//  MainCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/09.
//

import UIKit
class MainCoordinator : NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators: [Coordinator]
    
    var navigationViewController: UINavigationController
    
    func start() {
        let vc = ViewController.instatiate()
        
    }
    
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        <#code#>
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        <#code#>
    }
    
    
   
    
    
}
