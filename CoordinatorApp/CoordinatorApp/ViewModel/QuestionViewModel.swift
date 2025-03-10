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
    
    @Published var data                 : ReadingQuestionModel?
    
    @Published var TOPIKQuestionArray : [QuestionType] = []
    
    
    init () {
        self.initReadingData()
    }
    
    // For setting previews
    static func sample() -> QuestionViewModel {
        let sampleVM = QuestionViewModel()
        sampleVM.TOPIKQuestionArray = [
            QuestionType.question64,
            QuestionType.question83
        ]
        return sampleVM
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
