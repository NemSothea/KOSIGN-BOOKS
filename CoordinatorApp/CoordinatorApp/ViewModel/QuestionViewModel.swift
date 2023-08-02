//
//  Question24ViewModel.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/15.
//

import UIKit
struct QuestionModel  {
    var questions        : [String]?
}
class QuestionViewModel {
    
    var data    : ReadingQuestionModel.QuestionModel?
    
    var TOPIKQuestionArray : [QuestionType] = []
    
    func initReadingData() {
        TOPIKQuestionArray = QuestionType.allCases
    }
        
    func getData(for questionNumber: Int) {

        guard let question = QuestionType(rawValue: questionNumber) else {
            print("Invalid question number")
            return
        }
        
        let fileName = "Question\(question.rawValue)"
        self.data = Bundle.main.decode(ReadingQuestionModel.QuestionModel.self, from: "\(fileName).json")
    }
    
}
