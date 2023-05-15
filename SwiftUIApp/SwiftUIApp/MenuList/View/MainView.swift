//
//  MainView.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2023/05/12.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            
           MenuList()
                .tabItem {
                  Label("Menu",systemImage: "list.dash")
                }
            
            OrderView()
                .tabItem {
                    Label("Order",systemImage: "square.and.pencil")
             }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
