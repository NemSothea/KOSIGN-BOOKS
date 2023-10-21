//
//  ToDoListItemView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct ToDoListItemView: View {
    
    //MARK: - StateObject from Published
    @StateObject var toDoListItemViewModel = ToDoListItemViewViewModel()
    
    var body: some View {
        Text("Hello, World!")
    }
}

//#Preview {
//    ToDoListItemView()
//}
