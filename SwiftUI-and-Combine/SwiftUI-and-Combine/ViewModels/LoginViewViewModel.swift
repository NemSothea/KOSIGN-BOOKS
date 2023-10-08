//
//  LoginViewViewModel.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import Foundation

class LoginViewViewModel : ObservableObject {
    
    //MARK: - Publish Object
    @Published var email    : String = ""
    @Published var password : String = ""
    
    init() {}
    
    
    
}
