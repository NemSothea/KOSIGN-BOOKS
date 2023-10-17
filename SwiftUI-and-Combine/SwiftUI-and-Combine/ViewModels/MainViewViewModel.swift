//
//  MainViewViewModel.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import Foundation
import FirebaseAuth
class MainViewViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var currentUserID : String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _,user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    // check user is SignedIn
    public func isSignedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
}
