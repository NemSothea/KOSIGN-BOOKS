//
//  Question24ViewModel.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/15.
//

import UIKit

class QuestionViewModel {
    
    var data    : ReadingQuestionModel.QuestionModel?
    /* TODO : Start from index = 0
        - index 1 = Question24
     
     */
    func getData(index : Int) {
        
        var i = "24"
        switch index {
        case 0 :
            i = "24"
        default :
            break
        }
        
        self.data =  Bundle.main.decode(ReadingQuestionModel.QuestionModel.self, from:"Question\(i).json")
        
    }
    
}
