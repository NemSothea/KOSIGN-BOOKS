//
//  NewItemView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct NewItemView: View {
    
    //MARK: - StateObject from Published
    @StateObject var newItemViewModel = NewItemViewViewModel()
    
    var body: some View {
        VStack {
            Text("New Item")
                .bold()
                .font(.system(size: 32))
            Form {
                //title
                TextField("title", text: $newItemViewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //date
                DatePicker("Due date", selection: $newItemViewModel.date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //button
                TLButton(title: "Save", color: .pink) {
                    //Action
                    newItemViewModel.save()
                }
                .padding()
            }
        }
        
    }
}

#Preview {
    NewItemView()
}
