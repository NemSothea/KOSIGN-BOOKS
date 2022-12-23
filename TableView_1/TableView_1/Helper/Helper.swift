//
//  Helper.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func storyBoard(withStoryBoardName storyBoard : String, identifier : String) -> UIViewController {
        
        let vc = UIStoryboard(name : storyBoard, bundle : nil).instantiateViewController(identifier: identifier)
        
        vc.modalPresentationStyle                       = .overFullScreen
        vc.modalTransitionStyle                         = .crossDissolve
        vc.providesPresentationContextTransitionStyle   = true
        vc.definesPresentationContext                   = true
        
        return vc
    }
}
