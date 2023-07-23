//
//  Book.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/07/14.
//

import Foundation

struct Book : Identifiable {
    var id      = UUID().uuidString
    var title   : String
    var uthour  : String
    var isbn    : String
    var pages   : Int
    
}

extension Book {
    //Computed properties
    var smallCoverImageName : String {
        return "\(isbn)-S"
    }
    var mediumCoverImageName : String {
        return "\(isbn)-M"
    }
    var largeCoverImageName : String {
        return "\(isbn)-L"
    }
    
}
extension Book {
    static let sampleBook = [
        Book(title: "Hello, World!", uthour: "Sothea", isbn:"9781916265202", pages: 200),
        Book(title: "Hello, Boy!", uthour: "Borey", isbn:"9781484286944", pages: 200),
        Book(title: "Hello, Mama!", uthour: "Borey", isbn:"9781916265202", pages: 500)
    ]
    
}
