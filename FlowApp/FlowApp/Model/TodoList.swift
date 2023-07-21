//
//  TodoList.swift
//  FlowApp
//
//  Created by Bizplay on 2023/07/21.
//

import SwiftUI

///1. Create Object
///2. Conform to Transferable
///3. Create customer Uniform Type Identifier
struct TodoList : Codable, Hashable, Transferable {
    
    let id      : UUID
    let title   : String
    let owner   : String
    let note    : String
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .TodoList)
    }
}

struct MockData {
    static let taskOne = TodoList(id: UUID(), title: "우미건설 예외처리 추가 방안", owner: "NEM SOTHEA", note: "법인카드 앱")
    
    static let taskTwo = TodoList(id: UUID(), title: "플라시스템 부가영수증 추가", owner: "NEM SOTHEA", note: "비즈플레이4.0, 법인카드, 개인카드 앱")
    
    static let taskThree = TodoList(id: UUID(), title: "법인카드 리포트 기능 추가", owner: "NEM SOTHEA", note: "비즈플레이4.0 앱")
    
}
