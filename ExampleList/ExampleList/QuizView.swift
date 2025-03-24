//
//  QuizView.swift
//  ExampleList
//
//  Created by NEMSOTHEA on 3/21/25.
//

import SwiftUI

// MARK: - Quiz View
struct QuizView: View {
    @EnvironmentObject private var navCoordinator: NavigationCoordinator
    let itemIndex: Int
    
    var body: some View {
        VStack {
            Text("Quiz for item \(itemIndex)")
            
            Button("Show Results") {
                // Navigate to result view
                navCoordinator.path.append(Route.result)
            }
        }
    }
}




