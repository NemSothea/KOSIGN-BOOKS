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
           
            //call create account view properties
            accountView
            
        }else {
            LoginView()
        }
        
    }
    
    // create account view properties
    @ViewBuilder
    var accountView : some View {
        TabView {
            ToDoListView(userID: mainViewModel.currentUserID)
                .tabItem {
                    Label("Home",systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        MainView()
//    }
//    
//}
