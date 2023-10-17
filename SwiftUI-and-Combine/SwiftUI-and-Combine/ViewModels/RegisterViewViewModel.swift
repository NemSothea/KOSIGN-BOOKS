//
//  RegisterViewViewModel.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

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
        
        // try to create user
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userID)
            
        }
        
    }
    //insert new user
    private func insertUserRecord(id : String) {
        //create object for new user
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        //create database
        let db = Firestore.firestore()
        
        //convert each object to dictionary and insert to firebase
        db.collection("users")
            .document()
            .setData(newUser.asDictionary())
        
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
