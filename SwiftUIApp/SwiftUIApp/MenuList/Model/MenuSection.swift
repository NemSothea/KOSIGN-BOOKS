//
//  MenuSection.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/26.
//

import Foundation

struct MenuSection : Codable, Identifiable {
    
    let id          : UUID
    let name        : String
    let menuItem    : [MenuItem]

}
