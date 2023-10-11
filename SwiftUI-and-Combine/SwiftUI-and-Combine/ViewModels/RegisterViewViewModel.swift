//
//  RegisterViewViewModel.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import Foundation
class RegisterViewViewModel : ObservableObject {
    
    //MARK: - Published for Observable Object
    
    @Published var name         : String = ""
    @Published var email        : String = ""
    @Published var password     : String = ""
    @Published var messageError : String = ""
    
    init() {}
    
    //MARK: - functions
    func register() {
        guard validate() else {
            //Do nothing
            return
        }
        //correct validate
    }
    //Validate email & Password
    private func validate() -> Bool {
        messageError = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty &&
            !email.trimmingCharacters(in: .whitespaces).isEmpty &&
            !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            messageError = "Please fill all the fields."
            return false
        }
        
        //check email valid
        //Example : nemsothea13@gmail.com
        guard email.contains("@") && email.contains(".") else {
            messageError = "Please enter the valid email"
            return false
        }
        guard password.count >= 6 else {
            
            return false
        }
        return true
    }
    
}
