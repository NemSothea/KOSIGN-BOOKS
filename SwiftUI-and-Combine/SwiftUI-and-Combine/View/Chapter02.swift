//
//  Chapter02.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/07/20.
//

import SwiftUI

struct Chapter02: View {
    var body: some View {
        List(0..<5) { item in
            HStack(alignment: .top) {
                Image("9781916265202-M")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 90)
                VStack(alignment:.leading) {
                    Text("Hello, World!")
                        .font(.headline)
                    Text("by Hello, World!")
                        .font(.subheadline)
                    Text("450 pages")
                        .font(.subheadline)
                    
                }
                Spacer()
            }
        }
        .listStyle(.plain)
        
    }
}

struct Chapter02_Previews: PreviewProvider {
    static var previews: some View {
        Chapter02()
    }
}
