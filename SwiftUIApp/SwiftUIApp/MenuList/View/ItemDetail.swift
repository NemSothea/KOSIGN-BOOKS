//
//  ItemDetail.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2023/01/27.
//

import SwiftUI

struct ItemDetail: View {
    
    let item : MenuItem
    
    var paramStyle : NSParagraphStyle {
        let style = NSMutableParagraphStyle()
        ()
        style.alignment = .justified
        return style
    }
    
    var body: some View {
        VStack {
            ZStack(alignment:.bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo : \(item.photoCredit)")
                    .font(.custom("AmericanTypewriter", size: 12))
                    .padding(4)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .font(.custom("AmericanTypewriter", size: 14))
            
                .padding()
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
        }
    }
}
