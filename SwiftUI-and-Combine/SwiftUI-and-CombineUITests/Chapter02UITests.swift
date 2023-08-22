//
//  Chapter02Test.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/07/31.
//

import XCTest

final class Chapter02UITests: XCTestCase {
    
    let sampleBooks = Book.sampleBook
    
    func testBookTitleExists() throws {
        let app = XCUIApplication()
        app.launch()
        
        for book in sampleBooks {
           
            let chapter02View = app.otherElements["Chapter02View_\(book.title)"]
                   print(chapter02View.debugDescription)
            
            let bookTitleLabel = chapter02View.staticTexts[book.title]
            XCTAssertTrue(bookTitleLabel.exists, "'\(book.title)'")
                       
        }
        
    }
}
