//
//  ItemRow.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2023/01/26.
//

import SwiftUI

struct ItemRow: View {
    let item : MenuItem
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .border(.indigo, width: 1)
                .cornerRadius(5)
            
            VStack( alignment :.leading ) {
                
                Text(item.name)
                    .font(.custom("AmericanTypewriter", size: 18))
                Text("👉 $ \(item.price).00")
                    .font(.custom("AmericanTypewriter", size: 15))
                    .foregroundColor(.red)
                
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
