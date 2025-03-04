//
//  ContentView.swift
//  Chapter 1
//
//  Created by NEMSOTHEA on 3/4/25.
//

/*
 Chapter 1 Introduction to SwiftUI
 */

/*
 Chapter 2
 Getting Started with SwiftUI and
 Working with Tex
 
 - Displaying Simple Text
 - Working with Multiline Text
 - Setting the Padding and Line Spacing
 - Rotating the Text
 - Using Custom Fonts
 - Displaying Markdown Text
 
 */

import SwiftUI

struct ContentView: View {
    var text = """
            
            Your time is limited, so don’t waste it living someone else’s life. Don’t be
            trapped by dogma—which is living with the results of other people’s thinking. Don
            ’t let the noise of others’ opinions drown out your own inner voice. And most impo
            rtant, have the courage to follow your heart and intuition.
            """
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("**This is a preview link. [click here](https://www.apple.com/) to view the full article.**")
                .font(.custom("Nunito", size: 25))
                .font(.title)
             
            Text(text)
           
                .fontWeight(.bold)
                .font(.title)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .lineLimit(50)
                .truncationMode(.middle)
//                .rotationEffect(.degrees(45),anchor: UnitPoint(x: 2, y: 0))
                .rotation3DEffect(.degrees(40), axis: (x: 1, y: 0, z: 0))
                .shadow(color: .accentColor, radius: 2,x: 2, y: 15)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
