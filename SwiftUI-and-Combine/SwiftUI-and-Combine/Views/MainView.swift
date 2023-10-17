//
//  ContentView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/07/19.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewViewModel()
    
    var body: some View {
        if mainViewModel.isSignedIn(), !mainViewModel.currentUserID.isEmpty {
            ToDoListView()
        }else {
            LoginView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
    
}
