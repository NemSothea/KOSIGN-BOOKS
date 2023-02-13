//
//  FavoriteVC.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/10.
//

import UIKit

class FavoriteVC : UIViewController, StoryBoarded {
    
    weak var coordinator : FavoriteCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
    
}
