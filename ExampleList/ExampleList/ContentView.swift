//
//  ContentView.swift
//  ExampleList
//
//  Created by NEMSOTHEA on 3/21/25.
//

import SwiftUI

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
}

enum Route: Hashable {
    case readingList
    case quiz(index: Int)
    case result
    
    // Explicit hashable implementation for safety
      func hash(into hasher: inout Hasher) {
          switch self {
          case .readingList: hasher.combine("readingList")
          case .quiz(let index):
              hasher.combine("quiz")
              hasher.combine(index)
          case .result: hasher.combine("result")
          }
      }
    
}

struct ContentView: View {
    @StateObject private var navCoordinator = NavigationCoordinator()
    
    var body: some View {
        NavigationStack(path: $navCoordinator.path) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Button("Tap me") {
                    // Navigate using the new path API
                    navCoordinator.path.append(Route.readingList)
                }
                .padding()
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .readingList:
                    ReadingListView()
                case .quiz(let index):
                    QuizView(itemIndex: index)
                case .result:
                    ResultView()
                }
            }
            
        }
        .environmentObject(navCoordinator)
    }
}

#Preview {
    ContentView()
}
