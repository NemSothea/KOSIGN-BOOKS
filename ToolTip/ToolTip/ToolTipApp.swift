//
//  ToolTipApp.swift
//  ToolTip
//
//  Created by NEMSOTHEA on 3/5/25.
//

import SwiftUI
import TipKit
@main
struct ToolTipApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    // Configure once at app launch
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
