//
//  UserDefaults.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 2/7/25.
//

import Foundation

extension UserDefaults {
    
    static let appGroupIdentifier = UserDefaults(suiteName: appGroupName)
    
    static var appGroupName: String {
        return "group.kh.com.kosign.widgets"
    }
}
