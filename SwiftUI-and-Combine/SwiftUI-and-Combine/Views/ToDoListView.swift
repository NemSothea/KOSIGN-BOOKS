//
//  ToDolistView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct ToDoListView: View {
    
    //MARK: - StateObject from Published
    @StateObject var toDoListViewModel = ToDoListViewViewModel()
    
    private let userID : String
    
    init(userID : String) {
        
        self.userID = userID
        
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Welcome to your account!")
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //Action
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

//#Preview {
//    ToDoListView()
//}
