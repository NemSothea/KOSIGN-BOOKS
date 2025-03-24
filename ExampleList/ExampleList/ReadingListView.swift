//
//  ReadingListView.swift
//  ExampleList
//
//  Created by NEMSOTHEA on 3/21/25.
//

import SwiftUI

// MARK: - Reading List View
struct ReadingListView: View {
    @EnvironmentObject private var navCoordinator: NavigationCoordinator
    
    var body: some View {
        List(0..<10, id: \.self) { index in
            Button("Item \(index)") {
                // Navigate to quiz with index
                navCoordinator.path.append(Route.quiz(index: index))
            }
        }
        .navigationTitle("Reading List")
    }
}


