//
//  TaskBoardView.swift
//  FlowApp
//
//  Created by Bizplay on 2023/07/21.
//

import SwiftUI
import Algorithms


struct TaskBoardView: View {
    
    //MARK: - Properties
    // Define the source tasks for each category
    @State private var requestTasks : [TodoList] = [MockData.taskOne,MockData.taskTwo,MockData.taskThree]
    @State private var processTasks : [TodoList] = []
    @State private var doneTasks    : [TodoList] = []
    
    // State variables to track whether a category is being targeted for drop
    @State private var isRequestTargeted    : Bool = false
    @State private var isProcessTargeted    : Bool = false
    @State private var isDoneTargeted       : Bool = false
    
    var body: some View {
        HStack {
            // Task list view for "요청" category
            TaskListView(title: "요청", isTargeted: isRequestTargeted, tasks: requestTasks, titleColor: .blue, changeColor: .blue)
                .dropDestination(for: TodoList.self) { droppedTask, location in
                    // Remove dropped tasks from other categories
                    for task in droppedTask {
                        processTasks.removeAll { $0.id == task.id }
                        doneTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = requestTasks + droppedTask
                    requestTasks = Array(totalTasks.uniqued())
                    return true
                }isTargeted: { isTargeted in
                    isRequestTargeted = isTargeted
                }
            // Task list view for "진행" category
            TaskListView(title: "진행", isTargeted: isProcessTargeted, tasks: processTasks, titleColor: .green, changeColor: .green)
            
                .dropDestination(for: TodoList.self) { droppedTask, location in
                    // Remove dropped tasks from other categories
                    for task in droppedTask {
                        requestTasks.removeAll { $0.id == task.id }
                        doneTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = processTasks + droppedTask
                    processTasks = Array(totalTasks.uniqued())
                    return true
                }isTargeted: { isTargeted in
                    isProcessTargeted = isTargeted
                }
            // Task list view for "완료" category
            TaskListView(title: "완료", isTargeted: isDoneTargeted, tasks: doneTasks, titleColor: .black, changeColor: .black)
            
                .dropDestination(for: TodoList.self) { droppedTask, location in
                    // Remove dropped tasks from other categories
                    for task in droppedTask {
                        requestTasks.removeAll { $0.id == task.id }
                        processTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = doneTasks + droppedTask
                    doneTasks = Array(totalTasks.uniqued())
                    return true
                }isTargeted: { isTargeted in
                    isDoneTargeted = isTargeted
                }
        }
        .padding()
    }
}

struct TaskBoardView_Previews: PreviewProvider {
    static var previews: some View {
        TaskBoardView()
    }
}
