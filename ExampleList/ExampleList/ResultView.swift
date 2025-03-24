//
//  ResultView.swift
//  ExampleList
//
//  Created by NEMSOTHEA on 3/21/25.
//

import SwiftUI

// MARK: - Result View
struct ResultView: View {
    @EnvironmentObject private var navCoordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            Text("Results Screen")
            
            Button("Back to Reading List") {
                // Return to root view
                navCoordinator.path.removeLast(navCoordinator.path.count)
            }
            .padding()
        }
    }
}

#Preview {
    ResultView()
}
