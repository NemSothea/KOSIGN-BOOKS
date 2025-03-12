//
//  ResultView.swift
//  CoordinatorApp
//
//  Created by NEMSOTHEA on 2/20/25.
//

import SwiftUI

struct QuestionHint: View {
    
    let question : ReadingQuestionModel.Question
    let fontSize = Share.shared.setFontSize()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text("Hint : ")
                    .font(.headline)
                Spacer()
                Button {
                    dismiss()
                }label: {
                    Text("확인")
                        .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                }
                
            }
            .padding()
            
            GeometryReader { geometry in
                ScrollView {
                    Text(question.detail ?? "")
                    
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                }
                
                .background(Color.blue.opacity(0.1))
                .cornerRadius(20)
            }
        }
        Spacer()
    }
}

struct ResultView: View {
    
    // MARK: - Properties
    var result: [String]
    var wrongAnswerArray: [ReadingQuestionModel.Question]
    
    // MARK: - Body
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .center){
                // Header Section
                HeaderView(result: result, questions: wrongAnswerArray)
                
                ScrollView {
                    VStack(alignment: .center) {
                        
                        // Collection View (using List in SwiftUI)
                        if !wrongAnswerArray.isEmpty {
                            WrongAnswersListView(wrongAnswerArray: wrongAnswerArray)
                            //                            .frame(height: 400) // Adjust height as needed
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
// MARK: - Helper Views

struct HeaderView: View {
    var result: [String]
    
    var questions: [ReadingQuestionModel.Question]
    let fontSize = Share.shared.setFontSize()
    
    @State private var strength = 0.0
    
    var body: some View {
        // Fallback for iOS <17
        VStack(alignment: .center, spacing: 10) {
            if #available(iOS 18.0, *) {
                HStack {
                    Text("Congratulations ")
                        .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                    Text("🥰🥳🎊🎉")
                        .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                    
                        .textRenderer(QuakeRenderer(moveAmount: strength))
                    
                   
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                strength = 10
                            }
                        }
                }
                .frame(height: 50)
                
                Text("You have reached \(result[0]) of \(result[1]) question(s), \(result[2])")
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                HStack {
                    Button("Copy Results ") {
                        copyQuestionsToClipboard(questions: questions)
                    }
                   
                }
               
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    func copyQuestionsToClipboard(questions: [ReadingQuestionModel.Question]) {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted // Optional: for readability
            let jsonData = try encoder.encode(questions)
            let jsonString = String(data: jsonData, encoding: .utf8)
            
            UIPasteboard.general.string = jsonString
            print("Copied array to clipboard as JSON!")
        } catch {
            print("Failed to encode array: \(error)")
        }
    }
}
@available(iOS 17.0, *)
struct QuakeRenderer: TextRenderer {
    var moveAmount: Double
    
    var animatableData: Double {
        get { moveAmount }
        set { moveAmount = newValue }
    }
    
    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            for run in line {
                for glyph in run {
                    var copy = context
                    let yOffset = Double.random(in: -moveAmount...moveAmount)
                    
                    copy.translateBy(x: 0, y: yOffset)
                    copy.draw(glyph, options: .disablesSubpixelQuantization)
                }
            }
        }
    }
}

struct WrongAnswersListView: View {
    var wrongAnswerArray: [ReadingQuestionModel.Question]
    let isiPad  = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        ScrollView(.vertical) { // Use ScrollView for horizontal scrolling
            LazyVStack(spacing: 0) {  // Use LazyHStack for performance with large lists.  Spacings is 0.
                ForEach(wrongAnswerArray.indices, id: \.self) { index in
                    if wrongAnswerArray[index].isImg == "y" {
                        if isiPad {
                            ResultImageiPadCellView(question: wrongAnswerArray[index])
                                .frame(width: UIScreen.main.bounds.width) // Set width to screen width.
                            
                        }else {
                            ResultImageiPhoneCellView(question: wrongAnswerArray[index])
                                .frame(width: UIScreen.main.bounds.width) // Set width to screen width.
                        }
                        
                    }else {
                        if isiPad {
                            ResultTextiPadCellView(question: wrongAnswerArray[index])
                                .frame(width: UIScreen.main.bounds.width) // Set width to screen width.
                        }else {
                            ResultTextiPhoneCellView(question: wrongAnswerArray[index])
                                .frame(width: UIScreen.main.bounds.width) // Set width to screen width.
                        }
                        
                    }
                    
                }
            }
        }
    }
}

//MARK: - ResultImageiPhoneCellView
struct ResultImageiPhoneCellView: View {
    
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
            
            VStack(alignment: .leading, spacing: setLineSpacing) {
                Text("\(question.option_1)")
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                Text("\(question.option_2)")
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                Text("\(question.option_3)")
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                Text("\(question.option_4)")
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                
                Text("Correct Answer : \(question.correctAnswer ?? "")")
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                    .font(.headline)
                    .foregroundStyle(.red)
            }
        }
        .padding() // Apply padding to the entire VStack
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct HomeButton: View {
    @Environment(\.presentationMode) var presentationMode
    let fontSize = Share.shared.setFontSize()
    
    var body: some View {
        VStack {
            Button(action: {
                // Dismiss to the root view controller.  This is *much* cleaner in SwiftUI
                //                 presentationMode.wrappedValue.dismiss()
                //If you have another VC before firstVC you can use this:
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let rootVC = windowScene.windows.first?.rootViewController {
                    rootVC.dismiss(animated: true, completion: nil)
                }
                
            }) {
                Text("재테스트")  // Replaced "재테스트" with an English equivalent.
                    .font(.custom("1HoonDdukbokki Regular", size: fontSize))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue) // Set button color
                    .cornerRadius(10)
                
            }
            
        }
        
        .padding()
    }
}

//// MARK: - Preview
struct ResultView_Previews: PreviewProvider {
    
    static var previews: some View {
        // Create some sample data for the preview
        let sampleResult = ["3", "5", "60%"]
        
        let sampleWrongAnswers: [ReadingQuestionModel.Question] = [
            ReadingQuestionModel.Question(correctAnswer: "①  그래요? 한번 가 봐야겠어요. ✅(정답)", option_1: "1 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_2: "2 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_3: "3 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_4: "4 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", question: "할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다. 하지만 무거웠던 마음은 며칠 가지 않았다. 할머니는 날마다 전화를 하더니 급기야 서울로 올라오시고 말았다. 할머니의 손자 사랑은 어쩔 수 없나 보다. 할머니는 청소며 빨래며 나에게는 안 보이던 온갖 집안일들을 찾아서 하기 시작했다. 그냥 쉬다가 내려가시라고 (아무리 말해도 들은 척도 하지 않았다). 서른이 넘은 나는 할머니가 보기엔 여전히 아이에 불과했다. 서울 살이 몇 주 만에 낯선 동네에서 친구까지 사귄 할머니는 친구를 따라 시장에 갔다가 넘어지시고 말았다. 병원에서 온 연락을 받고 걱정이 되어 정신없이 달려갔더니 할머니는 같은 병실 사람들을 모아 놓고 환하게 웃으며 이야기하고 있었다. 다리에 붕대를 감고서 말이다. 그 광경을 보고 난 할 말을 잃었다.", detail : "text question", sections: "[5~8] (   ) 다음은 무엇에 대한 글인지 고르십시오.(각 2점).", score: "", isImg: "n"),
            ReadingQuestionModel.Question(correctAnswer: "①  그래요? 한번 가 봐야겠어요. ✅(정답)", option_1: "1 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_2: "2 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_3: "3 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", option_4: "4 ) 할머니를 시골에 두고 혼자 서울로 올라오는 발걸음은 가볍지 않았다.", question: "36_9_img", detail :"Image section", sections: "[5~8] (   ) 다음은 무엇에 대한 글인지 고르십시오.(각 2점).", score: "", isImg: "y")
        ]
        
        
        ResultView(result: sampleResult, wrongAnswerArray: sampleWrongAnswers)
          
        
    }
}
