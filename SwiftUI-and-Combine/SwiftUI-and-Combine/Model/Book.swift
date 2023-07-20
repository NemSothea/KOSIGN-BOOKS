//
//  Book.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/07/14.
//

import Foundation

struct Book {
    var title   : String
    var uthour  : String
    var isbn    : String
    var pages   : Int
}
extension Book {
    //Computed properties
    var smallCoverImageName : String {
        return "\(isbn) -S"
    }
    var mediumCoverImageName : String {
        return "\(isbn) -M"
    }
    var largeCoverImageName : String {
        return "\(isbn) -L"
    }
}
