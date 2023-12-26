//
//  QuestionModel.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/13.
//

import Foundation

struct ReadingQuestionModel : Codable {
    var data : QuestionModel?
    
    struct QuestionModel : Codable {
        var questions : [Question]?
    }
    struct Question : Codable {
        var correctAnswer   : String?
        var option_1        : String?
        var option_2        : String?
        var option_3        : String?
        var option_4        : String?
        var question        : String?
        var detail          : String?
        var sections        : String?
        var score           : String?
        var isImg           : String?

    }
}
extension ReadingQuestionModel.Question: Equatable {
    static func ==(lhs: ReadingQuestionModel.Question, rhs: ReadingQuestionModel.Question) -> Bool {
        return lhs.correctAnswer == rhs.correctAnswer &&
            lhs.option_1 == rhs.option_1 &&
            lhs.option_2 == rhs.option_2 &&
            lhs.option_3 == rhs.option_3 &&
            lhs.option_4 == rhs.option_4 &&
            lhs.question == rhs.question &&
            lhs.detail == rhs.detail &&
            lhs.sections == rhs.sections &&
            lhs.score == rhs.score &&
            lhs.isImg == rhs.isImg
    }
}
