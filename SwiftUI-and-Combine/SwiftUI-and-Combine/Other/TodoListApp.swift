//
//  SwiftUI_and_CombineApp.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/07/19.
//

import SwiftUI
import Firebase

@main
struct TodoListApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
