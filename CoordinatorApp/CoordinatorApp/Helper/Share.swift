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
        return isiPad ? 31.0 : 19.0
    }
    
}
