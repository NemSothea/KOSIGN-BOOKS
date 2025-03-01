//
//  Share.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 12/23/23.
//
import UIKit

class Share {
    
    static let shared = Share()
    
    
    init() {}
    
    func setFontSize() -> CGFloat {
        let isiPad  = UIDevice.current.userInterfaceIdiom == .pad
        return isiPad ? 34.0 : 17.0
    }
    func setLineSpacing() -> CGFloat {
        let isiPad  = UIDevice.current.userInterfaceIdiom == .pad
        return isiPad ? 12.0 : 8.0
    }
    
}
