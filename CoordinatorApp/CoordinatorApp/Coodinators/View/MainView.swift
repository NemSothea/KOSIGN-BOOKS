//
//  MainView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/7/25.
//
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ReadingListView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            LisentingListView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}
