//
//  ProfileViewViewModel.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel : ObservableObject {
    //MARK: - Published
    @Published var user : User? = nil
    
    init() {
        
    }

    func fetchUser() {
        
        //check userID
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        //get User from Firebase
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .getDocument { [weak self]snapshot, error in
                guard let data = snapshot?.data(), error == nil else{
                    return
                }
                DispatchQueue.main.async {
                    self?.user = User(
                        id      : data["id"] as? String ?? "",
                        name    : data["name"] as? String ?? "",
                        email   : data["email"] as? String ?? "",
                        joined  : data["joined"] as? TimeInterval ?? 0)
                }
            }
    }
    //sign Out
    func signOut() {
        do {
            try Auth.auth().signOut()
        }catch {
            print(error)
        }
    }
    
}
