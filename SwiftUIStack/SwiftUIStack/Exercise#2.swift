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
        VStack(alignment: .center){
            Spacer()
            ScrollViewReader { _ in
               
                    ZStack {
                        Header1View(title:  "network", subtitle: "Team", icon:  "network", price: "$299", description: "per month", textColor: .white,backgroundColor: Color.gray.opacity(0.5))
    //                        .padding(.top, 100)
    //                        .zIndex(1)
                            .padding()
                            .offset(x:0, y:180)
                        Header1View(title:  "network", subtitle: "Team", icon:  "network", price: "$299", description: "per month", textColor: .white,backgroundColor: Color.yellow)
                            .padding()
                            .scaleEffect(0.95)
    //                        .zIndex(0)
    //                        .offset(x:0, y:230)
                        
                        Header1View(title:  "network", subtitle: "Team", icon:  "network", price: "$299", description: "per month", textColor: .white,backgroundColor: Color.purple)
                            .padding()
                            .scaleEffect(0.9)
    //                        .zIndex(-1)
                            .offset(x:0, y:-180)
                    }
                    .frame(maxWidth: .infinity)
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.container)
   
      
    }
}

#Preview {
    Exercise_2()
}

struct Header1View: View {
    
    let title : String
    let subtitle : String
    let icon        : String
    let price : String
    let description : String
    let textColor : Color
    let backgroundColor : Color
    
    var body: some View {
     
            VStack {
                Image(systemName:icon)
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
            .padding(40)
            .frame(minWidth: 0,maxWidth: .infinity,minHeight: 100)
            .background(backgroundColor)
            .cornerRadius(10)
        
        
     
    }
}
