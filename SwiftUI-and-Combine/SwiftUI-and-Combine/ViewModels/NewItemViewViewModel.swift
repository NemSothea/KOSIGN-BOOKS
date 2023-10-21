//
//  NewItemViewViewModel.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//
import FirebaseAuth
import FirebaseFirestore

import Foundation

class NewItemViewViewModel : ObservableObject {
    
    @Published var title : String   = ""
    @Published var date             = Date()
    @Published var showAlert : Bool = false
   
    
    
    init() {
        
    }
    
    func save() {
        // check can save
        guard canSave else {
            return
        }
        
        //get current user ID
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        //create model
        let newID = UUID().uuidString
        let newItem = ToDoListItem(
            id          : newID,
            title       : title,
            dueDate     : Date().timeIntervalSince1970,
            createdDate : Date().timeIntervalSince1970,
            isDone      : false)
        
        //save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
            
    }
    // computed property ->  a property that runs code to figure out its value.
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard date >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    
}
