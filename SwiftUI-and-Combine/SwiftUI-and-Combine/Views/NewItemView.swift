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
    
    @Binding var newItemIsPresented : Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top,100)
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
                    if newItemViewModel.canSave {
                        newItemViewModel.save()
                        newItemIsPresented = false
                    } else {
                        newItemViewModel.showAlert = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $newItemViewModel.showAlert, content: {
                Alert(title:
                        Text("Error"),
                      message: Text("Please fill in all field or select due date is today or newer.")
                )
            })
        }
        
    }
}

//#Preview {
//    NewItemView()
//}
