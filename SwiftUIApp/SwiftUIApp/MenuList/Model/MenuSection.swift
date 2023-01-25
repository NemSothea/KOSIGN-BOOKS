//
//  MenuSection.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/26.
//

import SwiftUI

struct MenuSection : Codable, Identifiable {
    
    var id          : UUID
    var name        : String
    var items       : [MenuItem]
    

}
