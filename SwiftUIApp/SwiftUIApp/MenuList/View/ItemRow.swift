//
//  ItemRow.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2023/01/26.
//

import SwiftUI

struct ItemRow: View {
    
    let colors : [ String : Color ] = [ "D": .purple, "G" :.black, "N" : .red, "S" : .blue, "V" : .green ]
    let item : MenuItem
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.indigo,lineWidth: 2))
            
            VStack( alignment :.leading ) {

                Text(item.name)
                    .font(.custom("AmericanTypewriter", size: 18))
                
                Text("👉 $ \(item.price).00")
                    .font(.custom("AmericanTypewriter", size: 15))
                    .foregroundColor(.red)
                
                }
            
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
