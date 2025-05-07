//
//  ResultView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 2/20/25.
//

import SwiftUI
import Charts

struct BookView: View {
    
    // MARK: - Properties
    var questions: [ReadingQuestionModel.Question]
    
    // MARK: - Body
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .center){
                // Header Section
                HeaderBookView(title: "TOPIC")
                
                ScrollView {
                    VStack(alignment: .center) {
                        
                        // Collection View (using List in SwiftUI)
                        if !questions.isEmpty {
                            PriviewListView(questions: questions)
                            
                                .frame(height: .infinity)
                        }
                        else{
                            EmptyView()
                            
                        }
                        
                        
                    }
                    .padding()
                }
                // Home Button
                HomeButton()
            }
            
            
            .navigationBarHidden(true)  // Hide the default navigation bar if you had one
        }
        
    }
}

struct PriviewListView: View {
    var questions: [ReadingQuestionModel.Question]
    let isiPad  = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        ScrollView(.vertical) { // Use ScrollView for horizontal scrolling
            LazyVStack(spacing: 0) {  // Use LazyHStack for performance with large lists.  Spacings is 0.
                ForEach(questions.indices, id: \.self) { index in
                    if questions[index].isImg == "y" {
                        if isiPad {
                            ResultImageBookiPadCellView(question: questions[index])
                                .frame(width: UIScreen.main.bounds.width) // Set width to screen width.
                            
                        }else {
                            ResultImageBookiPhoneCellView(question: questions[index])
                                .frame(width: UIScreen.main.bounds.width) // Set width to screen width.
                        }
                        
                    }else {
                        if isiPad {
                            ResultTextBookiPadCellView(question: questions[index])
                                .frame(width: UIScreen.main.bounds.width) // Set width to screen width.
                        }else {
                            ResultTextBookiPhoneCellView(question: questions[index])
                                .frame(width: UIScreen.main.bounds.width) // Set width to screen width.
                        }
                        
                    }
                    
                }
            }
        }
    }
}

struct HeaderBookView: View {
    
    var title: String
    let fontSize = Share.shared.setFontSize()
    
    @State private var strength = 0.0
    
    var body: some View {
        // Fallback for iOS <17
        VStack(alignment: .center, spacing: 10) {
            
            Text("Extend understanding of \(title) ")
                .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                .frame(height: 50)
        }
    }
}

// MARK: - ResultImageiPadCellView
struct ResultImageBookiPadCellView: View {
    
    let question: ReadingQuestionModel.Question
    let fontSize        = Share.shared.setFontSize()
    let setLineSpacing  = Share.shared.setLineSpacing()
    
    var body: some View {
        // Customize this based on your ResultCollectionViewCell's UI
        VStack(alignment: .leading, spacing: 10) {
            
            Text("\( question.sections)")
                .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                .font(.headline)
                .padding()
            Image(question.question)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2 - 30)
            
            
        }
        .padding(.leading)
        .background(Color.gray.opacity(0.1)) // Light background
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

//MARK: - ResultImageiPhoneCellView
struct ResultImageBookiPhoneCellView: View {
    
    let question        : ReadingQuestionModel.Question
    let fontSize        = Share.shared.setFontSize()
    let setLineSpacing  = Share.shared.setLineSpacing()
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: setLineSpacing) { // Use a single VStack
            Text("\(question.sections)")
                .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                .font(.headline)
            
            Image(question.question) // Assuming question.question is the image name
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity) // Use maxWidth: .infinity
                .padding(.bottom, setLineSpacing)  //Add Some Space
            
        }
        .padding() // Apply padding to the entire VStack
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

// MARK: - ResultTextiPhoneCellView

struct ResultTextBookiPhoneCellView: View {
    
    let question        : ReadingQuestionModel.Question
    let fontSize        = Share.shared.setFontSize()
    let setLineSpacing  = Share.shared.setLineSpacing()
    
    var body: some View {
        // Customize this based on your ResultCollectionViewCell's UI
        VStack(alignment: .leading, spacing: 10) {
            Text("\( question.sections)")
                .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                .font(.headline)
                .padding(.bottom)
            
            Text("\( question.question)") // Replace with actual question text
                .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                .font(.headline)
                .lineLimit(nil)
                .lineSpacing(setLineSpacing)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.bottom)
            
            
        }
        .padding()
        .background(Color.gray.opacity(0.1)) // Light background
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

//MARK: - ResultTextiPadCellView
struct ResultTextBookiPadCellView: View {
    
    let question        : ReadingQuestionModel.Question
    let fontSize        = Share.shared.setFontSize()
    let setLineSpacing  = Share.shared.setLineSpacing()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("\( question.sections)")
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                    .font(.headline)
                    .padding(.bottom,20)
            }
            .padding()
            .background(Color.black.opacity(0.2)) // Light background
            .cornerRadius(10)
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
                
                
                Text("\( question.question)") // Replace with actual question text
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                    .font(.headline)
                    .lineLimit(nil)
                    .lineSpacing(setLineSpacing)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.bottom,20)
                
                
            }
            .padding()
            .background(Color.blue.opacity(0.2)) // Light background
            .cornerRadius(10)
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("\( question.detail ?? "")") // Replace with actual question text
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                    .font(.headline)
                    .lineLimit(nil)
                    .lineSpacing(setLineSpacing)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.bottom,20)
            }
            
            .padding()
            .background(Color.black.opacity(0.2)) // Light background
            .cornerRadius(10)
            .padding(.horizontal)
        }
        
    }
}

//// MARK: - Preview
struct BookView_Previews: PreviewProvider {
    
    static var previews: some View {
        // Create some sample data for the preview
        
        let sampleWrongAnswers: [ReadingQuestionModel.Question] = [
            ReadingQuestionModel.Question(correctAnswer: "①  그래요? 한번 가 봐야겠어요. ✅(정답)", option_1: "1 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_2: "2 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_3: "3 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_4: "4 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", question: "할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다. 하지만 무거웠던 마음은 며칠 가지 않았다. 할머니는 날마다 전화를 하더니 급기야 서울로 올라오시고 말았다. 할머니의 손자 사랑은 어쩔 수 없나 보다. 할머니는 청소며 빨래며 나에게는 안 보이던 온갖 집안일들을 찾아서 하기 시작했다. 그냥 쉬다가 내려가시라고 (아무리 말해도 들은 척도 하지 않았다). 서른이 넘은 나는 할머니가 보기엔 여전히 아이에 불과했다. 서울 살이 몇 주 만에 낯선 동네에서 친구까지 사귄 할머니는 친구를 따라 시장에 갔다가 넘어지시고 말았다. 병원에서 온 연락을 받고 걱정이 되어 정신없이 달려갔더니 할머니는 같은 병실 사람들을 모아 놓고 환하게 웃으며 이야기하고 있었다. 다리에 붕대를 감고서 말이다. 그 광경을 보고 난 할 말을 잃었다.",detail:"할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다. 하지만 무거웠던 마음은 며칠 가지 않았다. 할머니는 날마다 전화를 하더니 급기야 서울로 올라오시고 말았다. 할머니의 손자 사랑은 어쩔 수 없나 보다. 할머니는 청소며 빨래며 나에게는 안 보이던 온갖 집안일들을 찾아서 하기 시작했다. 그냥 쉬다가 내려가시라고 (아무리 말해도 들은 척도 하지 않았다). 서른이 넘은 나는 할머니가 보기엔 여전히 아이에 불과했다. 서울 살이 몇 주 만에 낯선 동네에서 친구까지 사귄 할머니는 친구를 따라 시장에 갔다가 넘어지시고 말았다. 병원에서 온 연락을 받고 걱정이 되어 정신없이 달려갔더니 할머니는 같은 병실 사람들을 모아 놓고 환하게 웃으며 이야기하고 있었다. 다리에 붕대를 감고서 말이다. 그 광경을 보고 난 할 말을 잃었다.", sections: "[5~8] (   ) 다음은 무엇에 대한 글인지 고르십시오.(각 2점).", score: "", isImg: "n")
        ]
        
        
        BookView( questions: sampleWrongAnswers)
        
    }
}
