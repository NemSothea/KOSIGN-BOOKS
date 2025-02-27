import SwiftUI

struct ListeningQuestionView: View {
    
    @StateObject var viewModelVM = ListeningViewModel()
    
    @State private var answerSelected = false
    @State private var isCorrectAnswer = false
    @State private var correctAnswer = 0
    @State private var index = 0
    @State private var indexTopic = 0
    @State private var wrongAnswerArray: [ReadingQuestionModel.Question] = []
    @State private var showLeaveDialog = false
    @State private var showNoAnswerConfirmation = false
    @State private var showResult = false
    
    
    @State private var isPressed = false
    
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
            
            Button {
                // Animation and action
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    isPressed = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        isPressed = false
                    }
                }
                
                
                // Play/pause logic
                self.viewModelVM.playOrPause()
                
            } label: {
                Image(systemName: viewModelVM.isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: Share.shared.setFontSize()))
                    .padding()
                    .frame(width: (UIScreen.main.bounds.width) - 40 ,height: 50)
                    .foregroundColor(.white)
                    .background(
                        Color.blue.opacity(0.8),
                        in: RoundedRectangle(cornerRadius: 16)
                    )
                    .scaleEffect(isPressed ? 0.9 : 1.0)
                   
            }
            .disabled(indexTopic == 27)
           
            
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
            if !wrongAnswerArray.contains(where: { $0.id == question.id }) {
                wrongAnswerArray.append(question)
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



struct ListeningQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a sample indexTopic value
        ListeningQuestionView(indexTopic: 24)
    }
}
