//
//  ToDoListItem.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import Foundation

struct ToDoListItem : Codable, Identifiable {
    
    let id          : String
    let title       : String
    let dueDate     : TimeInterval
    let createdDate : TimeInterval
    var isDone      : Bool
    
    /// In order to modify the properties of a value type
    /// struct is value type
    mutating func setDone(_ state : Bool) {
        isDone = state
    }
    
    
    
}
