//
//  ReadingQuestionView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 2/12/25.
//

import SwiftUI

struct ReadingQuestioniPhoneView: View {
    
    @Binding var selectedOption: ((_ selectedAnswer: Bool) -> Void)?
    
    var setValues: ReadingQuestionModel.Question
    @State private var correctionAnswer: String?

    var body: some View {
        GeometryReader { _ in
            
            VStack {
                // Section Label
                Text(setValues.sections ?? "")
                    .font(.custom("1HoonDdukbokki Regular", size: 19))
                    .lineSpacing(1)
                    .padding()
                
                if setValues.isImg == "y" {
                    // Image View
                    Image(setValues.question ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2 - 20)
                } else {
                    // Question Label
                    Text("  \(setValues.question ?? "")")
                        .font(.custom("1HoonDdukbokki Regular", size: 18))
                        .lineSpacing(7)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding()
                }

                // Options Stack
                VStack {
                    OptionView(option: setValues.option_1 ?? "", selectedOption: $selectedOption, isCorrect: setValues.correctAnswer == setValues.option_1)
                    OptionView(option: setValues.option_2 ?? "", selectedOption: $selectedOption, isCorrect: setValues.correctAnswer == setValues.option_2)
                    OptionView(option: setValues.option_3 ?? "", selectedOption: $selectedOption, isCorrect: setValues.correctAnswer == setValues.option_3)
                    OptionView(option: setValues.option_4 ?? "", selectedOption: $selectedOption, isCorrect: setValues.correctAnswer == setValues.option_4)
                }
            }
        }

        .onAppear {
            self.correctionAnswer = setValues.correctAnswer
        }
    }
}

struct OptionView: View {
    var option: String
    @Binding var selectedOption: ((_ selectedAnswer: Bool) -> Void)?
    var isCorrect: Bool
    @State private var borderColor: Color = .white

    var body: some View {
        Text(option)
            .font(.custom("1HoonDdukbokki Regular", size: 18))
            .lineLimit(nil)
            .lineSpacing(5)
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 1))
            .padding(.bottom, 10)
            .onTapGesture {
                let isCorrect = self.isCorrect
                self.selectedOption?(isCorrect)
                self.borderColor = isCorrect ? .green : .red
            }
    }
}

struct ReadingQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Test with text iPhone 16 Pro
            ReadingQuestioniPhoneView(selectedOption: .constant(nil), setValues: ReadingQuestionModel.Question(correctAnswer: "A programming language", option_1: "1 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_2: "2 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_3: "3 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_4: "4 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", question: "할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다. 하지만 무거웠던 마음은 며칠 가지 않았다. 할머니는 날마다 전화를 하더니 급기야 서울로 올라오시고 말았다. 할머니의 손자 사랑은 어쩔 수 없나 보다. 할머니는 청소며 빨래며 나에게는 안 보이던 온갖 집안일들을 찾아서 하기 시작했다. 그냥 쉬다가 내려가시라고 (아무리 말해도 들은 척도 하지 않았다). 서른이 넘은 나는 할머니가 보기엔 여전히 아이에 불과했다. 서울 살이 몇 주 만에 낯선 동네에서 친구까지 사귄 할머니는 친구를 따라 시장에 갔다가 넘어지시고 말았다. 병원에서 온 연락을 받고 걱정이 되어 정신없이 달려갔더니 할머니는 같은 병실 사람들을 모아 놓고 환하게 웃으며 이야기하고 있었다. 다리에 붕대를 감고서 말이다. 그 광경을 보고 난 할 말을 잃었다.", sections: "[5~8] (   ) 다음은 무엇에 대한 글인지 고르십시오.(각 2점).", isImg: "n"))
                .previewDevice(PreviewDevice(rawValue: "iPhone 16 Pro"))
            
          
            
            // Test with image iPhone 16 Pro
            
            ReadingQuestioniPhoneView(selectedOption: .constant(nil), setValues: ReadingQuestionModel.Question(correctAnswer: "A programming language", option_1: "할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_2: "할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_3: "할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_4: "할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", question: "36_2_img.png", sections: "[5~8] (   ) 다음은 무엇에 대한 글인지 고르십시오.(각 2점).", isImg: "y"))
                .previewDevice(PreviewDevice(rawValue: "iPhone 16 Pro"))
            
            
        }
        
    }
}
