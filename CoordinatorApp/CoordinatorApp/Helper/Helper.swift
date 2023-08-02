//
//  Helper.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/08/02.
//

import Foundation
enum QuestionType: Int, CaseIterable {
        case question24 = 24
        case question25 = 25
        case question26 = 26
        case question27 = 27
        case question28 = 28
        case question29 = 29
        case question30 = 30
        case question31 = 31
        case question32 = 32
        case question33 = 33
        case question34 = 34
        case question35 = 35
        case question36 = 36
        case question37 = 37
        case question41 = 41
        case question47 = 47
        case question52 = 52
        case question60 = 60
        case question64 = 64
        
    var titleReading: String {
        return "읽기 \(rawValue)th"
    }
    var titleListening: String {
        return "듣기 \(rawValue)th"
    }
}
