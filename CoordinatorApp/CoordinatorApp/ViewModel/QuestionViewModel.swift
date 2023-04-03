//
//  Question24ViewModel.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/15.
//

import UIKit
enum QuestionType: String {
    case Reading
    case Listening
    case Writing
}
struct QuestionModel  {
    var questions        : [String]?
    var questionType    : QuestionType
}

class QuestionViewModel {
    
    var data    : ReadingQuestionModel.QuestionModel?
    /* TODO : Start from index = 0
        - index 1 = Question24
     
     */
     var TOPIKQuestionArray  = [String]()
 
    func initReadingData() {
        TOPIKQuestionArray = [
            "읽기 24th",
            "읽기 25th",
            "읽기 26th",
            "읽기 27th",
            "읽기 28th",
            "읽기 29th",
            "읽기 30th",
            "읽기 31th",
            "읽기 32th",
            "읽기 33th",
            "읽기 34th",
            "읽기 35th",
            "읽기 36th",
            "읽기 37th",
            "읽기 41th",
            "읽기 47th",
            "읽기 52th",
            "읽기 60th",
            "읽기 64th",
        ]
    }
    
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
        case 12 :
            i = "36"
        case 13 :
            i = "37"
        case 14 :
            i = "41"
        case 15 :
            i = "47"
        case 16 :
            i = "52"
        case 17 :
            i = "60"
        case 18 :
            i = "64"
        default :
            break
        }
        
        self.data =  Bundle.main.decode(ReadingQuestionModel.QuestionModel.self, from:"Question\(i).json")
        
    }
    
}
