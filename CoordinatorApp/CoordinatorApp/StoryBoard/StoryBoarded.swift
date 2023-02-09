//
//  StoryBoarded.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/09.
//

import Foundation
import UIKit

protocol StoryBoarded {
    
    static func instatiate() -> Self
}
extension StoryBoarded where Self : UIViewController {
    
    static func instatiate() -> Self {
        
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
        
    }
    
}
