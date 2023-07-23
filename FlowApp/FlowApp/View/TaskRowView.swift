//
//  TaskRowView.swift
//  FlowApp
//
//  Created by Bizplay on 2023/07/21.
//

import SwiftUI

// A custom SwiftUI view representing a single task in the list
struct TaskRowView: View {
    // Task to display
    var task        : String
    // Task color to display
    var changeColor : Color
    
    var body: some View {
        Text(task)
        .padding(12)
        .background(changeColor)
        .foregroundColor(Color.white)
        .cornerRadius(8)
        .shadow(radius: 1,x: 1,y: 1)
    }
}
