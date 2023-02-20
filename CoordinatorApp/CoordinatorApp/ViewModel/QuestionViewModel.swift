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
     var TOPIKQuestionArray  =
    [
        "TOPIK II READING 24th",
        "TOPIK II READING 25th",
        "TOPIK II READING 26th",
        "TOPIK II READING 27th",
        "TOPIK II READING 28th",
        "TOPIK II READING 29th",
        "TOPIK II READING 30th",
        "TOPIK II READING 31th",
        "TOPIK II READING 32th",
        "TOPIK II READING 33th",
        "TOPIK II READING 34th",
        "TOPIK II READING 35th",
    ]
    
    func getData(index : Int) {
        
        var i = "24"
        switch index {
        case 1 :
            i = "25"
        case 2 :
            i = "26"
        case 3 :
            i = "27"
        case 4 :
            i = "28"
        case 5 :
            i = "29"
        case 6 :
            i = "30"
        case 7 :
            i = "31"
        case 8 :
            i = "32"
        case 9 :
            i = "33"
        case 10 :
            i = "34"
        case 11 :
            i = "35"
        default :
            break
        }
        
        self.data =  Bundle.main.decode(ReadingQuestionModel.QuestionModel.self, from:"Question\(i).json")
        
    }
    
}
