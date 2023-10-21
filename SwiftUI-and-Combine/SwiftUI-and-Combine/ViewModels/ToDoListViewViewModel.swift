//
//  ToDoListViewViewModel.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//
import FirebaseFirestore
import Foundation
/// List Item for primary tab
/// 
class ToDoListViewViewModel : ObservableObject {
    
    @Published var showingNewItem : Bool = false
    private let userID : String
    
    init(userID : String) {
        self.userID = userID
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id : String) {
        let db = Firestore.firestore()
            db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}

