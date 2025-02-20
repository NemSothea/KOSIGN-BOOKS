//
//  Color.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 2/12/25.
//

import UIKit
import SwiftUI

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
