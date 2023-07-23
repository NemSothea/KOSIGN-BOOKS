//
//  Todo.swift
//  FlowApp
//
//  Created by Bizplay on 2023/07/21.
//

import SwiftUI

// A custom SwiftUI view representing a task list
struct TaskListView: View {
    
    //MARK: - Properties
    // Title of the task list
    var title       : String
    // Targeted of the task list
    var isTargeted  : Bool
    // Array of tasks to display
    var tasks       : [TodoList]
    // color of each tasks
    var titleColor : Color
    
    // Change background color of each tasks
    var changeColor : Color
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display the title of the task list
            Text(title)
                .font(.footnote.bold())
                .foregroundColor(titleColor)
            
            // Create a rounded rectangle with a list of tasks
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(isTargeted ? .teal.opacity(0.15) : Color(.secondarySystemFill))
                
                VStack(alignment: .leading,spacing: 12 ) {
                    
                    // Display each task in the list
                    ForEach(tasks,id: \.id) { task in
                        
                        TaskRowView(task: task.title, changeColor: changeColor)
                            .draggable(task)
                    }
                    Spacer()
                }
                .padding(.vertical)
            }
        }
        
    }
}
