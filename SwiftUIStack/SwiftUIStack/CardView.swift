//
//  CardView.swift
//  SwiftUIStack
//
//  Created by NEMSOTHEA on 4/2/25.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Propertie
    var title : String
    var date : String
    var image : String
    var category : String
    var heading : String
    var author : String
    
    // MARK: - View
    var body: some View {
        
    /// Intro ScrollView
      
        
//        ScrollView {
//            CardPreview
//            CardPreview
//            CardPreview
//        }
        
///        Exercise #1
//        ScrollView(.horizontal,showsIndicators: false) {
//            HStack {
//                Group {
//                    CardPreview
//                   
//                    CardPreview
//                   
//                    CardPreview
//                    
//                }
//                .minimumScaleFactor(0.5)
//                .frame(width: 300)
//            }
            
            
///            Exercise #2
        ///            
        
        VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment:.leading) {
                    Text(date)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(title)
                        .font(.title)
                        .fontWeight(.black)
                }
                Spacer()
             
            }
            .padding([.top,.horizontal])
          
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    Group {
                        CardPreview
                        
                        CardPreview
                        
                        CardPreview
                        
                    }
                    .minimumScaleFactor(0.5)
                    .frame(width: 300)
                }
                
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    var CardPreview: some View {
    
        
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(.primary)
                        .lineLimit(3)
                    Text("Written by\(author)".uppercased())
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        
        .overlay {
            RoundedRectangle(cornerRadius: 10)
            
                .stroke(Color(.sRGB,red: 150/255,green: 150/255,blue: 150/255,opacity: 0.1), lineWidth: 1)
        }
        .padding([.top,.horizontal])
    }
}

#Preview {
    CardView(title: "Swift Update news", date: "Monday,Apr,2025", image: "swiftui-button", category: "SwiftUI", heading: "Draw border with round corners", author: "NEMSOTHEA")
    
}
