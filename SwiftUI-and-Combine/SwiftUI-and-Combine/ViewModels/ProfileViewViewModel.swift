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
    
    init() {
        
    }
    func toggleIsDone(item : ToDoListItem) {
        var itemCopy = item// because it is Struct so we have to make a copy objects
        itemCopy.setDone(!item.isDone)
        
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
}
