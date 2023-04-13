//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /**
         1. Without @State we wouldn’t be able to change properties in our structs, because structs are fixed values.
         2. Without StateObject we wouldn’t be able to create classes that stay alive for the duration of our app.
         3. Without @EnvironmentObject we wouldn’t be able to receive shared data from elsewhere in our app.
         4. Without ObservableObject we wouldn’t be notified when an external value changes.
         5. Without $property two-way bindings we would need to update values by hand.
         */
        MenuList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
