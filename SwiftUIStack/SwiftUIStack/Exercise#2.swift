//
//  Exercise#2.swift
//  SwiftUIStack
//
//  Created by NEMSOTHEA on 3/25/25.
//

import SwiftUI

//Exercise #2
struct Exercise_2: View {
    
    var body: some View {
        ScrollView {
            HStack {
                ZStack {
                    Header1View(title:  "network", subtitle: "Team", price: "$299", description: "per month", textColor: .white,backgroundColor: Color.black)
                        .padding(.top, 100)
                        .zIndex(1)
                    Header1View(title:  "network", subtitle: "Team", price: "$299", description: "per month", textColor: .white,backgroundColor: Color.yellow)
                        .zIndex(0)
                        .offset(x:0, y:230)
                    
                    Header1View(title:  "network", subtitle: "Team", price: "$299", description: "per month", textColor: .white,backgroundColor: Color.purple)
                        .zIndex(-1)
                        .offset(x:0, y:410)
                }
              
               
            }
            .padding(.horizontal)
         
            
        }
      
    }
}

#Preview {
    Exercise_2()
}

struct Header1View: View {
    
    let title : String
    let subtitle : String
    let price : String
    let description : String
    let textColor : Color
    let backgroundColor : Color
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(systemName:title)
                    .font(.title)
                    .foregroundStyle(textColor)
                Text(subtitle)
                    .font(.system(.largeTitle,design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(textColor)
                Text(price)
                    .font(.system(.largeTitle,design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(textColor)
                Text(description)
                    .font(.system(.caption))
                    .fontWeight(.medium)
                    .foregroundStyle(textColor)
                
            }
            .padding()
            .frame(minWidth: 0,maxWidth: geometry.size.width * 0.8)
            .background(backgroundColor)
            .cornerRadius(10)
        }
        
     
    }
}
