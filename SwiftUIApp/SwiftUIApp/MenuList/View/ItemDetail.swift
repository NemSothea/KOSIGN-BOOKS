//
//  ItemDetail.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2023/01/27.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order : Order
    
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
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            /* TODO-:
             @EnvironmentObject is another property wrapper in Swift, just like @Published and @StateObject. This one means we get that automatic attachment ability I just mentioned, but also tells SwiftUI to watch the object for any changes and refresh its UI when a change announcement comes through.
             */
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
