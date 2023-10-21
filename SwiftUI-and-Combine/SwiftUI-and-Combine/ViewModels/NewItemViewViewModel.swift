//
//  NewItemViewViewModel.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import Foundation
class NewItemViewViewModel : ObservableObject {
    @Published var title : String = ""
    @Published var date  = Date()
    
    init() {
        
    }
    
    func save() {
        
    }
    
}
