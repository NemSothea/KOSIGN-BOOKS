//
//  Chapter02.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/07/20.
//

import SwiftUI

struct Chapter02: View {
    
    //MARK: - Properties
    // An array of Book objects
    var books : [Book]
    
    var body: some View {
        // Create a List that iterates over the books array
        List(books) { book in
            // For each book, display a Chapter02View passing the book as a parameter
           Chapter02View(book: book)
        }
        // Apply a plain list style to the List
        .listStyle(.plain)
        
    }
}
///`For View the app`
//struct Chapter02_Previews: PreviewProvider {
//    static var previews: some View {
//        Chapter02(books: Book.sampleBook)
//    }
//}
/**
 Exercises
 1. Add another Textview to display the ISBNo fe ach book on the same line that displays the number of pages.
 2. Align the page number text to the left, and the ISBN to the right of the view.
 */

struct Chapter02View : View {
    
    //MARK: - Properties
    // The Book object to display in this row
    var book : Book
    
    var body: some View {
        HStack(alignment: .top) {
            // Horizontal stack to arrange the content horizontally
            // Display the book's cover image
            Image(book.mediumCoverImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 90)
            
            // Vertical stack to arrange the book details
            // Display the book's title
            VStack(alignment:.leading) {
                Text(book.title)
                    .font(.headline)
                
                // Display the book's author
                Text("by \(book.uthour)")
                    .font(.subheadline)
                
                // Display the book's page count and ISBN number
                HStack {
                    Text("\(book.pages) pages")
                        .font(.subheadline)
                    Text("ISBN \(book.isbn)")
                }
            }
            // Add a spacer to push the book details to the left and fill the available space
            Spacer()
        }
    }
    
}
