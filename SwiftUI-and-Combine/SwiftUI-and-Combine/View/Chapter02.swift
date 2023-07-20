//
//  Chapter02.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/07/20.
//

import SwiftUI

struct Chapter02: View {
    
    var books : [Book]
    
    var body: some View {
        
        List(books) { book in
            HStack(alignment: .top) {
                Image(book.mediumCoverImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 90)
                VStack(alignment:.leading) {
                    Text(book.title)
                        .font(.headline)
                    Text("by \(book.uthour)")
                        .font(.subheadline)
                    Text("\(book.pages) pages")
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
        Chapter02(books: Book.sampleBook)
    }
}
