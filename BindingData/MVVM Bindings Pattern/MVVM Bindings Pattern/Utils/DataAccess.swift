//
//  DataAccess.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/06/08.
//

import Foundation
class DataAccess {
    
    static let shared = DataAccess()
    
    private var user : Users?
    
    private init(){}
    
    func login(email: String, password : String, completion : @escaping(Bool) -> Void) {
        // Perform the login asynchronously on the main queue to simulate network request
        
        DispatchQueue.main.async { [weak self] in
            // Check if the provided email and password match the expected values for successful login
            if email == "test@test.com" && password == "123" {
                
                // Create a user object with the provided name and email
                self?.user = Users(name: "test", email: "test@test.com")
                
                // Invoke the completion handler with a value of true to indicate successful login
                completion(true)
            }else {
                // Clear the user object as login failed
                self?.user = nil
                // Invoke the completion handler with a value of false to indicate failed login
                completion(false)
            }
        }
    }
    
    
    
    
}
