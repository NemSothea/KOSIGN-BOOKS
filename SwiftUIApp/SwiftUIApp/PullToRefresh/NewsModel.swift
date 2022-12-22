//
//  NewsModel.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/22.
//

import Foundation
struct NewsModel : Decodable, Identifiable {
    
    let id          : Int
    let title       : String
    let strap       : String
    let main_image  : String
    
}
