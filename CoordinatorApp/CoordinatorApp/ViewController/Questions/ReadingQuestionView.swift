import SwiftUI

enum SelectionOption {
    case optionA
    case optionB
    case optionC
    case optionD
}

struct ReadingQuestionView: View {
    
    @StateObject var viewModelVM = QuestionViewModel()
    
    @State private var answerSelected = false
    @State private var isCorrectAnswer = false
    @State private var correctAnswer = 0
    @State private var index = 0
    @State private var indexTopic = 0
    @State private var wrongAnswerArray: [ReadingQuestionModel.Question] = []
    @State private var showLeaveDialog = false
    @State private var showNoAnswerConfirmation = false
    @State private var showResult = false
    
    @Environment(\.presentationMode) var presentationMode
    
    init(indexTopic: Int) {
        self._indexTopic = State(initialValue: indexTopic)
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    showLeaveDialog = true
                } label: {
                    Text("나가기")
                        .font(Font.custom("1HoonDdukbokki Regular", size: Share.shared.setFontSize()))
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            Color.blue.opacity(0.8),
                            in: RoundedRectangle(cornerRadius: 16)
                        )
                }
                .alert("진행 확인", isPresented: $showLeaveDialog) {
                    Button("넵", role: .destructive) {  presentationMode.wrappedValue.dismiss() }
                    Button("취소", role: .cancel) {
                        
                    }
                } message: {
                    Text("퀼팅 작업을 진행하시겠습니까?")
                }
                .padding(.leading)
                
                Spacer()
                
                Text(QuestionType(rawValue: indexTopic)?.titleReading ?? "")
                    .font(Font.custom("1HoonDdukbokki Regular", size: Share.shared.setFontSize()))
                
                Spacer()
                
                Button(action: handleNextButton) {
                    Text("다음")
                        .font(Font.custom("1HoonDdukbokki Regular", size: Share.shared.setFontSize()))
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            Color.blue.opacity(0.8),
                            in: RoundedRectangle(cornerRadius: 16)
                        )
                }
                .padding(.trailing)
            }
            .padding(.top)
            
            TabView(selection: $index) {
                if let questions = viewModelVM.data?.questions {
                    ForEach(0..<questions.count, id: \.self) { questionIndex in
                        
                        if questions[index].isImg == "y" {
                            ReadingImageQuestionCell(question: questions[questionIndex]) { isCorrect in
                                answerSelected = true
                                isCorrectAnswer = isCorrect
                                

                            }
                            .tag(questionIndex)
                        }else {
                            ReadingTextQuestionCell(question: questions[questionIndex]) { isCorrect in
                                answerSelected = true
                                isCorrectAnswer = isCorrect
                                

                            }
                            .tag(questionIndex)
                        }
                       
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .alert("진행 확인", isPresented: $showNoAnswerConfirmation) {
            Button("계속하기", role: .destructive) { advanceToNextQuestion() }
            Button("취소하기", role: .cancel) {}
        } message: {
            Text("답변을 선택하지 않았습니다. 계속하시겠습니까?")
        }
        .fullScreenCover(isPresented: $showResult) {
            ResultView(result: resultTopik(), wrongAnswerArray: wrongAnswerArray.removingDuplicates())
        }
        
        .onChange(of: index) { _ in
            answerSelected = false
            isCorrectAnswer = false
        }
        
        .onAppear {
            viewModelVM.getData(for: indexTopic)
            wrongAnswerArray.removeAll()
        }
    }
    
    private func handleNextButton() {
        guard answerSelected else {
            showNoAnswerConfirmation = true
            return
        }
        
        if !isCorrectAnswer, let question = viewModelVM.data?.questions?[index] {
            if !wrongAnswerArray.contains(where: { $0.correctAnswer == question.correctAnswer }) {
                wrongAnswerArray.append(question)
              /*  print("wrongAnswerArray : \(wrongAnswerArray)")*/
            }
        }
        
        advanceToNextQuestion()
    }
    
    private func advanceToNextQuestion() {
        if index < (viewModelVM.data?.questions?.count ?? 0) - 1 {
            index += 1
        } else {
            showResult = true
        }
    }
    
    private func resultTopik() -> [String] {
        let totalQuestions = viewModelVM.data?.questions?.count ?? 0
        let wrongAnswers = wrongAnswerArray.removingDuplicates().count
        let correctAnswers = totalQuestions - wrongAnswers
        let percentage = 100 * (Float(correctAnswers) / Float(totalQuestions))
        return [
            String(correctAnswers),
            String(totalQuestions),
            String(format: "%.0f%%", percentage)
        ]
    }
}
struct ReadingImageQuestionCell: View {
    
    let question: ReadingQuestionModel.Question
    let selectedOption: (Bool) -> Void
    @State private var selectedOptionType: SelectionOption?
    let setLineSpacing  = Share.shared.setLineSpacing()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(question.sections)
                    .font(Font.custom("1HoonDdukbokki Regular", size: Share.shared.setFontSize()))
                    .padding()
                
                if let isImg = question.isImg?.lowercased(), isImg == "y" {
                    if UIImage(named: question.question) != nil {
                        Image(question.question)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: UIScreen.main.bounds.height / 2)
                    } else {
                        Text("Missing image: \(question.question)")
                            .foregroundColor(.red)
                    }
                } else {
                    Text(question.question)
                }
                VStack(alignment: .leading,spacing: 10) {
                    OptionButton(
                        text: question.option_1,
                        optionType: .optionA,
                        correctAnswer: question.correctAnswer,
                        selectedOptionType: $selectedOptionType,
                        selectedOption: selectedOption
                    )
                    
                    OptionButton(text: question.option_2, optionType: .optionB, correctAnswer: question.correctAnswer, selectedOptionType: $selectedOptionType, selectedOption: selectedOption)
                    
                    OptionButton(text: question.option_3, optionType: .optionC, correctAnswer: question.correctAnswer, selectedOptionType: $selectedOptionType, selectedOption: selectedOption)
                    OptionButton(text: question.option_4, optionType: .optionD, correctAnswer: question.correctAnswer, selectedOptionType: $selectedOptionType, selectedOption: selectedOption)
                }
                
                .frame(maxWidth: .infinity) // Add this to ensure button takes full width
                .padding()
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ReadingTextQuestionCell: View {
    let question: ReadingQuestionModel.Question
    let selectedOption: (Bool) -> Void
    @State private var selectedOptionType: SelectionOption?
    let setLineSpacing  = Share.shared.setLineSpacing()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(question.sections)
                    .font(Font.custom("1HoonDdukbokki Regular", size: Share.shared.setFontSize()))
                    .padding()
                
             
                    Text(question.question)
                        .font(Font.custom("1HoonDdukbokki Regular", size: Share.shared.setFontSize()))
                        .padding()
                        .lineLimit(nil)
                        .lineSpacing(setLineSpacing)
            
                
                VStack(alignment: .leading,spacing: 10) {
                    OptionButton(
                        text: question.option_1,
                        optionType: .optionA,
                        correctAnswer: question.correctAnswer,
                        selectedOptionType: $selectedOptionType,
                        selectedOption: selectedOption
                    )
                    
                    OptionButton(text: question.option_2, optionType: .optionB, correctAnswer: question.correctAnswer, selectedOptionType: $selectedOptionType, selectedOption: selectedOption)
                    
                    OptionButton(text: question.option_3, optionType: .optionC, correctAnswer: question.correctAnswer, selectedOptionType: $selectedOptionType, selectedOption: selectedOption)
                    OptionButton(text: question.option_4, optionType: .optionD, correctAnswer: question.correctAnswer, selectedOptionType: $selectedOptionType, selectedOption: selectedOption)
                }
                
                .frame(maxWidth: .infinity) // Add this to ensure button takes full width
                .padding()
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct OptionButton: View {
    let text                        : String
    let optionType                  : SelectionOption
    let correctAnswer               : String?
    @Binding var selectedOptionType : SelectionOption?
    let selectedOption: (_ isCorrect: Bool) -> Void
    
    let setLineSpacing  = Share.shared.setLineSpacing()
    
    var body: some View {
        
        Button(action: {
            selectedOptionType = optionType
            let isCorrect = correctAnswer == text
            selectedOption(isCorrect)
        }) {
            Text(text)
                .font(Font.custom("1HoonDdukbokki Regular", size: Share.shared.setFontSize()))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .lineLimit(nil)
                .lineSpacing(setLineSpacing)
                .background(selectedOptionType  == optionType ? Color.blue.opacity(0.2) : Color.clear)
                .border(selectedOptionType      == optionType ? Color.blue : Color.white, width: selectedOptionType == optionType ? 1 : 0)
                .cornerRadius(5)
        }
        .frame(maxWidth: .infinity) // Add this to ensure button takes full width

    }
}



struct ReadingQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a sample indexTopic value
        ReadingQuestionView(indexTopic: 41)
    }
}
