//
//  ToDoListItemView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct ToDoListItemView: View {
    
    //MARK: - StateObject from Published
    @StateObject var toDoListItemViewModel = ProfileViewViewModel()
    
    let item : ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date:.abbreviated,time:.shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button {
                //Action
                toDoListItemViewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

//#Preview {
//    ToDoListItemView(item: ToDoListItem(
//        id: "123",
//        title: "mama",
//        dueDate: Date().timeIntervalSince1970,
//        createdDate: Date().timeIntervalSince1970,
//        isDone: true)
//    )
//}
