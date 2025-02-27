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
class QuestionViewModel : ObservableObject {
    
    @Published var data: ReadingQuestionModel?
    
    var TOPIKQuestionArray : [QuestionType] = []
    
    init () {
        self.initReadingData()
    }
    
    func initReadingData() {
        TOPIKQuestionArray = QuestionType.allCases
    }
        
    func getData(for questionNumber: Int) {

        guard let question = QuestionType(rawValue: questionNumber) else {
            print("Invalid question number")
            return
        }
        
        let fileName = "Question\(question.rawValue)"
        self.data = Bundle.main.decode(ReadingQuestionModel.self, from: "\(fileName).json")
    }
    
}
