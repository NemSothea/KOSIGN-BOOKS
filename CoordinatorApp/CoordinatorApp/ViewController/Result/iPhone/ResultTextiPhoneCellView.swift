//
//  ResultTextiPhoneCellView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 3/7/25.
//
import SwiftUI

// MARK: - ResultTextiPhoneCellView
struct ResultTextiPhoneCellView: View {
    
    let question        : ReadingQuestionModel.Question
    let fontSize        = Share.shared.setFontSize()
    let setLineSpacing  = Share.shared.setLineSpacing()
    
    @State var isExpanded  : Bool = false
    
    var body: some View {
        // Customize this based on your ResultCollectionViewCell's UI
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text("\(question.sections)")
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                    .font(.headline)
                    .padding(.bottom)
                
                Button {
                    isExpanded.toggle()
                } label : {
                    Image(systemName: "info.bubble.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.purple)
                        .padding()
                    
                       
                }
                .popover(isPresented: $isExpanded) {
                    QuestionHint(question: question)
                }
            }
           
            
            Text("\( question.question)") // Replace with actual question text
                .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                .font(.headline)
                .lineLimit(nil)
                .lineSpacing(setLineSpacing)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.bottom)
            
            VStack(alignment: .leading,spacing: setLineSpacing) {
                Text("\(question.option_1)") // Display user's answer (handle optional)
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                Text("\(question.option_2)") // Display user's answer (handle optional)
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                Text("\(question.option_3)") // Display user's answer (handle optional)
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                Text("\(question.option_4)") // Display user's answer (handle optional)
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                    .padding(.bottom)
                Text("Correct Answer : \(question.correctAnswer ?? "")")
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                    .font(.headline)
                    .foregroundStyle(.red)
            }
            .lineSpacing(10)
            
            
        }
        .padding()
        .background(Color.gray.opacity(0.1)) // Light background
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
