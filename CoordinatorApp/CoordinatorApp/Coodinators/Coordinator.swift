//
//  Coordinators.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/08.
//

import UIKit
/*
 MARK :-
    - The most basic type of `Coordinator` : one that manages other coordinators.
 */

public protocol Coordinator : AnyObject {
    
    /* TODO :
        - Any child coordinators to keep track of, to prevent them from getting dealocated in memory.
     */
    var childCoordinators : [Coordinator] { get set}
    
    /* TODO :
        - Any navigationController to keep navigate of transition.
     */
    var navigationViewController : UINavigationController { get set}
    
    /* TODO :
        - Used for handling startup tasks - think of it as the `viewDidLoad()` of coordinators.
     */
    func start()
    

}
public extension Coordinator {
    
    func addChildCoordinator(_ childCoordinator : Coordinator) {
        childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator : Coordinator) {
        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator}
    }
    
}
