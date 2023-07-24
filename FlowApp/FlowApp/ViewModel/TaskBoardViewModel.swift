//
//  TaskBoardViewModel.swift
//  FlowApp
//
//  Created by Bizplay on 2023/07/24.
//

import SwiftUI

class TaskBoardViewModel: ObservableObject {
    
    /// The property marked with   `@Published` will trigger updates to the UI when changed
    // Define the source tasks for each category
    @Published var requestTasks : [TaskListModel] = [MockData.taskOne, MockData.taskTwo, MockData.taskThree]
    @Published var processTasks : [TaskListModel] = []
    @Published var doneTasks    : [TaskListModel] = []
    // Add any other necessary properties and methods for managing the tasks
}
