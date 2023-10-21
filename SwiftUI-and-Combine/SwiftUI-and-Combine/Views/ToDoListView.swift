//
//  ToDolistView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    //MARK: - create StateObject from Published
    @StateObject var toDoListViewModel : ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoListItem]
    
    ///how data in firebase look like
    ///users/<id>/todos/<entries>
    ///users/NP043ib1g1WFJtWRRdxprv4vrSW2/todos
    init(userID : String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/todos")
        ///Initialize using external data
        ///An initial value for the state object.
        self._toDoListViewModel = StateObject(wrappedValue: ToDoListViewViewModel(userID: userID))
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
//                Text("Welcome to your account!")
                List(items) { item in
                   ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                //Action
                                toDoListViewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //Action
                    toDoListViewModel.showingNewItem = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $toDoListViewModel.showingNewItem, content: {
                NewItemView(newItemIsPresented: $toDoListViewModel.showingNewItem)
            })
        }
    }
}

//#Preview {
//    ToDoListView(userID: "NP043ib1g1WFJtWRRdxprv4vrSW2")
//}
