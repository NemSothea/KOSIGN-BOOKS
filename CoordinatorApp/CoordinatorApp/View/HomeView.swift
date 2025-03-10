//
//  Home.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/10/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "a.book.closed.he")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .padding()
                    .foregroundStyle(Color(UIColor.random()))
                Text("퀴즈 앱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Learn • Take Quiz • Repeat")
                    .font(.subheadline)
                    .foregroundStyle(Color(UIColor.random()))
                
                NavigationLink {
                        TabMenuView()
                    
                } label: {
                    Image(systemName: "circle.hexagonpath")
                        .padding()
                        .foregroundStyle(Color.pink) .frame(width: UIScreen.main.bounds.width / 2 - 60, height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color(UIColor.random()))
                .cornerRadius(25)
                
              
            }
        }
        .navigationBarBackButtonHidden(true) // Hide back button
        .navigationTitle("") // Explicitly remove title
        
    }
}

#Preview {
    HomeView()
}
