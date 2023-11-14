//
//  UserViewModel.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/9/23.
//

import Foundation

class UserViewModel : ObservableObject {
    
    @Published private(set) var users: [User] = []
    
    
//    init() {}
    
    @discardableResult
    func generateUser() -> User {
        let newUser = User()
        users.append(newUser)
        return newUser
    }
}
