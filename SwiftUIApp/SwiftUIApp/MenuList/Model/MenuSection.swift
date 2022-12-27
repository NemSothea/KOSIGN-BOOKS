//
//  MenuSection.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/26.
//

import Foundation

struct MenuSection : Codable, Identifiable {
    
    var id          : UUID
    var name        : String
    var items       : [MenuItem]

}
