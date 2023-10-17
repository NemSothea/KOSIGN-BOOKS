//
//  LoginViewViewModel.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel : ObservableObject {
    
    //MARK: - Publish Object
    @Published var email        : String = ""
    @Published var password     : String = ""
    @Published var messageError : String = ""
    
    init() {}
    
    func login() {
        print("Called")
        
        guard validate() else {
            //Do nothing
            return
        }
      // try to login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    /*
     - TODO: - Check the invalid of email & Password
        - True  : correct email Password
        - False : Wrong email and Password return message error
     */
    private func validate() -> Bool {
        
        messageError = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            messageError = "Please file all the fields."
            return false
        }
        
        //check email valid
        //Example : nemsothea13@gmail.com
        guard email.contains("@") && email.contains(".") else {
            messageError = "Please enter the valid email."
            return false
        }
        
        return true
    }
    
}
