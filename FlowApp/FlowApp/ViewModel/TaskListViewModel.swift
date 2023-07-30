//
//  TaskListViewModel.swift
//  FlowApp
//
//  Created by Bizplay on 2023/07/24.
//

import SwiftUI

class TaskListViewModel: ObservableObject {
    
    /// The property marked with   `@Published` will trigger updates to the UI when changed
    @Published var title    : String
    @Published var tasks    : [TaskListModel]
    // Add any other necessary properties and methods for managing the tasks
    
    init(title: String, tasks: [TaskListModel]) {
        self.title = title
        self.tasks = tasks
    }
}
