//
//  MenuView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/1/25.
//

import SwiftUI

struct MenuView: View {
    
    @State private var favoriteColor = 0
    
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            // Profile view
            HeaderMenuView()
            
            VStack(alignment:.leading,spacing: 10) {
                Text("Please selecte the chart type :")
                    .font(.headline)
                
                Picker("Account Chart", selection: $favoriteColor) {
                    Text("Reading").tag(0)
                    Text("Listening").tag(1)
                }
                .pickerStyle(.segmented)
            }
            .padding()
            // Segment
            VStack(alignment:.leading,spacing: 10) {
                
                switch favoriteColor {
                case 0:
                    BookView(questions: [ReadingQuestionModel.Question]())
            
                default:
                    BookView( questions: [ReadingQuestionModel.Question]())
                }
                
            }
        }
    }
}

struct HeaderMenuView: View {
    
    var body: some View {
     
        HStack(alignment:.center) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 79,height: 79)
                VStack(alignment:.leading,spacing: -5) {
                    Text("My Asset Status")
                        .font(.title)
                    HStack {
                        Text(" 128.40")
                            .font(.title2)
                            .bold()
                        Text("usd")
                    }
                 
                }
             
        }
        .padding()
    }
}
