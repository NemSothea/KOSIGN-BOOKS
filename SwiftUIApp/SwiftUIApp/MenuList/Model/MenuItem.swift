//
//  MenuItem.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/26.
//

import Foundation

struct MenuItem : Codable, Equatable, Identifiable {
    
    var id           : UUID
    var name         : String
    var photoCredit  : String
    var price        : String
    var restrictions : [String]
    var description  : String
    
    
}
