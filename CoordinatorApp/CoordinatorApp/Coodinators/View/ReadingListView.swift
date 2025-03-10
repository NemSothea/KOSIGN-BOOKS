//
//  ReadingListView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/7/25.
//

import SwiftUI

struct ReadingListView: View {
    
    //MARK: - Properties
    private var questionsViewModel = QuestionViewModel()
    
    
    var body: some View {
        let numberOfQuestion = questionsViewModel.TOPIKQuestionArray
        
        ForEach(questionsViewModel.TOPIKQuestionArray,id: \.self) { index in
            
            let value = questionsViewModel.TOPIKQuestionArray[index.rawValue]
            
            HStack{
                Text("value",value.titleReading)
            }
            
        }
    }
}
