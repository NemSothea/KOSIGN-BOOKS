//
//  MainView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/7/25.
//
import SwiftUI

struct TabMenuView : View {
    
    var body: some View {
        TabView {
            
            NavigationStack {
                ReadingListView()
                 

            }
            .tabItem {
                Label("읽기", systemImage: "books.vertical")
            }
            
            NavigationStack {
                LisentingListView()
                   
            }
            .tabItem {
                Label("듣기", systemImage: "ear.badge.waveform")
            }
            NavigationStack {
                SetingView()
                  
            }
            .tabItem {
                Label("설정", systemImage: "bonjour")
            }
        }
        .navigationTitle("Home")
    }
}
#Preview {
    TabMenuView()
}
