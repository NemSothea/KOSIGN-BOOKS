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
        TaskBoardView(viewModel: taskBoardViewModel)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
