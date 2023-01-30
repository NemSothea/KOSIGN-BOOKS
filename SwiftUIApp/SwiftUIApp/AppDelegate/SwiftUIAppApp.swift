//
//  SwiftUIAppApp.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/22.
//

import SwiftUI

@main
struct SwiftUIAppApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
