//
//  ContentView.swift
//  SwiftUIStack
//
//  Created by NEMSOTHEA on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView {
            //Exercise #1
            VStack {
                HeaderView()
                
                VStack {
                    
                    HStack {
                        PriceView(title: "Basic", price: "$9",description: "per month", textColor: .white, bgColor: .purple, icon: nil)
                        
                        ZStack {
                            PriceView(title: "Pro", price: "$19",description: "per month", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255), icon: nil)
                            
                            
                            DiscountView(title:"Free Trial")
                                .offset(x: 0, y: 87)
                            
                        }
                        
                    }
                    
                    .padding(.horizontal)
                    
                    ZStack {
                        
                        PriceView(title: "Team", price: "$299", description: "per month", textColor: .white, bgColor: .black.opacity(0.8),icon: "personalhotspot")
                            .padding(.horizontal)
                        
                        DiscountView(title: "Perfect for team with 20+ members")
                            .offset(x: 0, y: 135)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
            Spacer()
           
        }
       
    }
}

#Preview {
    ContentView()
}

struct HeaderView: View {
    
    var body: some View {
    
        HStack {
            VStack(alignment: .leading,spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle,design: .rounded))
                    .fontWeight(.black)
                Text("Your plan")
                    .font(.system(.largeTitle,design: .rounded))
                    .fontWeight(.black)
                
            }
            Spacer()
        }
        .padding()
    }
}

struct PriceView: View {
    let title       : String
    let price       : String
    let description : String
    let textColor   : Color
    let bgColor     : Color
    let icon        : String?
    
    var body: some View {
        VStack {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(.largeTitle,design: .rounded))
                    .padding(5)
                    .foregroundStyle(textColor)
            }
          
            Text(title)
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(textColor)
            Text(price)
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(textColor)
            Text(description)
                .font(.headline)
                .foregroundStyle(textColor)
            
        }
        .frame(minWidth: 0, maxWidth: .infinity,minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}

struct DiscountView: View {
    
    let title : String
    
    var body: some View {
        Text(title)
        
            .font(.system(.caption,design: .rounded))
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(7)
            .background(Color(red: 231/255, green: 76/255, blue: 60/255))
    }
}
