//
//  QuestionModel.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/13.
//

import Foundation

struct ReadingQuestionModel : Codable {
   
    struct Question: Codable, Identifiable, Hashable {
       
            var id              : String?
            var correctAnswer   : String?
            var option_1        : String
            var option_2        : String
            var option_3        : String
            var option_4        : String
            var question        : String
            var detail          : String?
            var sections        : String
            var score           : String?
            var isImg           : String?
    
        
        
       
    }
    var questions : [Question]?
}

