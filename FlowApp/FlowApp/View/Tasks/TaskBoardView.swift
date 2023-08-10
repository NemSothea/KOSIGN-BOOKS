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
    // State variables to track whether a category is being targeted for drop
    // Use the ViewModel
    ///`@ObservedObject` to bind the View with its corresponding ViewModel.
    @ObservedObject var viewModel: TaskBoardViewModel
    
    @State private var isRequestTargeted    : Bool = false
    @State private var isProcessTargeted    : Bool = false
    @State private var isDoneTargeted       : Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
              
                // Task list view for "요청" category
               TaskListView(viewModel: TaskListViewModel(title: "요청", tasks: viewModel.requestTasks), isTargeted: isRequestTargeted, tasks: viewModel.requestTasks, titleColor: .blue, changeColor: .blue)
                   .dropDestination(for: TaskListModel.self) { droppedTask, location in
                       
                       // Remove dropped tasks from other categories
                       for task in droppedTask {
                           viewModel.processTasks.removeAll { $0.id == task.id }
                           viewModel.doneTasks.removeAll { $0.id == task.id }
                       }
                       let totalTasks = viewModel.requestTasks + droppedTask
                       viewModel.requestTasks = Array(totalTasks.uniqued())
                       return true
                   }isTargeted: { isTargeted in
                       isRequestTargeted = isTargeted
                   }
                
                // Task list view for "진행" category
                TaskListView(viewModel: TaskListViewModel(title: "진행", tasks: viewModel.processTasks), isTargeted: isProcessTargeted, tasks: viewModel.processTasks, titleColor: .green, changeColor: .green)
                
                    .dropDestination(for: TaskListModel.self) { droppedTask, location in
                        // Remove dropped tasks from other categories
                        for task in droppedTask {
                            viewModel.requestTasks.removeAll { $0.id == task.id }
                            viewModel.doneTasks.removeAll { $0.id == task.id }
                        }
                        let totalTasks = viewModel.processTasks + droppedTask
                        viewModel.processTasks = Array(totalTasks.uniqued())
                        return true
                    }isTargeted: { isTargeted in
                        isProcessTargeted = isTargeted
                    }
                
                // Task list view for "완료" category
                TaskListView(viewModel: TaskListViewModel(title: "완료",tasks: viewModel.doneTasks), isTargeted: isDoneTargeted, tasks: viewModel.doneTasks, titleColor: .black, changeColor: .black)
                
                    .dropDestination(for: TaskListModel.self) { droppedTask, location in
                        // Remove dropped tasks from other categories
                        for task in droppedTask {
                            viewModel.requestTasks.removeAll { $0.id == task.id }
                            viewModel.processTasks.removeAll { $0.id == task.id }
                        }
                        let totalTasks = viewModel.doneTasks + droppedTask
                        viewModel.doneTasks = Array(totalTasks.uniqued())
                        return true
                    }isTargeted: { isTargeted in
                        isDoneTargeted = isTargeted
                    }
                
            }
            .padding()
            .navigationTitle("SOTHEA(쏘티아)님 좋은 아침입니다!🌻")
            .font(.custom("1HoonDdukbokki Regular", size: 10))
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

