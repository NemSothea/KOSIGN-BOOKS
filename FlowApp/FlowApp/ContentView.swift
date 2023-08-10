//
//  ContentView.swift
//  FlowApp
//
//  Created by Bizplay on 2023/07/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @StateObject private var taskBoardViewModel = TaskBoardViewModel()
    
    var body: some View {

        TabView {
            
            Projects()
                .tabItem {
                Image(systemName: "fireworks")
                Text("Projects")
            }
            
        TaskBoardView(viewModel: taskBoardViewModel)
                .tabItem {
                Image(systemName: "list.clipboard")
                Text("Tasks")
            }
        ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
