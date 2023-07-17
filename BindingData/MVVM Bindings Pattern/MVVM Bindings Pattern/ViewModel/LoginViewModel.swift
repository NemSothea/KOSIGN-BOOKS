//
//  LoginViewModel.swift
//  MVVM Bindings Pattern
//
//  Created by Bizplay on 2023/06/12.
//

import Foundation

class LoginViewModel {
    
    lazy var loginSuccess   = ObservableObjects<Bool>(false)
    
    func requestLogin(email : String, password : String) {
        DataAccess.shared.login(email: email, password: password) { [weak self] success in
            self?.loginSuccess.value    = success
        }
    }
    
}
