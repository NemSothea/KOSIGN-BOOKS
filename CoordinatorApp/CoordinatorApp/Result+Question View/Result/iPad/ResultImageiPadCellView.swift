//
//  ResultImageiPadCellView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/7/25.
//
import SwiftUI

// MARK: - ResultImageiPadCellView
struct ResultImageiPadCellView: View {
    
    let question        : ReadingQuestionModel.Question
    let fontSize        = Share.shared.setFontSize()
    let setLineSpacing  = Share.shared.setLineSpacing()
    
    var body: some View {
        // Customize this based on your ResultCollectionViewCell's UI
        VStack(alignment: .leading, spacing: 10) {
            
            Text("\(question.sections)")
              
                .font(.headline)
                .padding()
            
            Image(question.question)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2 - 30)
            
            VStack(alignment: .leading,spacing: setLineSpacing) {
                Text("\(question.option_1)") // Display user's answer (handle optional)
                   
                Text("\(question.option_2)") // Display user's answer (handle optional)
                   
                Text("\(question.option_3)") // Display user's answer (handle optional)
                    
                Text("\(question.option_4)") // Display user's answer (handle optional)
                    
                
                Text("Correct Answer : \(question.correctAnswer ?? "")")
                   
                    .font(.headline)
                    .foregroundStyle(.red)
            }
            .padding()
            
        }
        .padding(.leading)
        .background(Color.gray.opacity(0.1)) // Light background
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
