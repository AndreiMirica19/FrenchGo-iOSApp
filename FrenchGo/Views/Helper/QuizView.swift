
import SwiftUI

struct QuizView: View {
    
    let quiz: QuizDTO
    
    @State var currentQuestion = 0
    @State var selectedAnswerIndex: Int? = nil
    @State var rightAnswers = 0
    @State var alertIsShown = false
    var isFirstQuiz: Bool
    
    var body: some View {
        VStack {
            Text("Question \(currentQuestion + 1)")
                .fontWeight(.black)
                .font(.largeTitle)
            
            Text(quiz.questions[currentQuestion].questionText)
                .fontWeight(.bold)
                .font(.title)
                .padding(.top)
            
            Spacer()
            
            ForEach(quiz.questions[currentQuestion].questionAswers.indices, id: \.self) { answerIndex in
                
                let answer = quiz.questions[currentQuestion].questionAswers[answerIndex]
                
                Button {
                    selectedAnswerIndex = answerIndex
                    if selectedAnswerIndex == quiz.questions[currentQuestion].rightAnswerIndex {
                        rightAnswers += 1
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if currentQuestion < quiz.questions.count - 1 {
                            currentQuestion += 1
                            selectedAnswerIndex = nil
                        } else {
                            alertIsShown = true
                        }
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text(answer)
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding()
                    .background(backgroundColor(for: answerIndex))
                    .cornerRadius(8)
                    
                }
            }.padding()
                .alert(scoreAlertTitle(), isPresented: $alertIsShown) {
                    if isFirstQuiz {
                        Button("OK", role: .cancel) {}
                    } else {
                        if correctAnswersPercentage() < 80 {
                            Button("Retake", role: .cancel) {
                                currentQuestion = 0
                                selectedAnswerIndex = nil
                                rightAnswers = 0
                            }
                        } else {
                            Button("OK", role: .cancel) {}
                        }
                    }
                } message: {
                    Text("\(scoreAlertMessage())")
                }
            
            Spacer()
        }
    }
    
    func backgroundColor(for answerIndex: Int) -> Color {
        if let selectedAnswerIndex = selectedAnswerIndex {
            if answerIndex == selectedAnswerIndex {
                return answerIndex == quiz.questions[currentQuestion].rightAnswerIndex ? .green : .red
            } else {
                return .blue
            }
        } else {
            return .blue
        }
    }
    
    func correctAnswersPercentage() -> Int {
        Int(Double(rightAnswers) / Double(quiz.questions.count) * 100)
    }
    
    func scoreAlertTitle() -> String {
        let score = correctAnswersPercentage()
        
        if isFirstQuiz || score > 79 {
            return "Congratulations"
        } else {
            return "You need to retake the quiz"
        }
    }
    
    func scoreAlertMessage() -> String {
        
        var action = ""
        let score = correctAnswersPercentage()
        
        if isFirstQuiz {
            return "You got \(score)% so you are a \(calculateLanguageLevel()) french speaker"
        } else {
            if score < 80 {
                action = "The minimum pass grade is 80"
            } else {
                action = "You can start the next lesson."
            }
        }
        
        return "You got \(score)% right. \(action)"
    }
    
    func calculateLanguageLevel() -> String {
        switch correctAnswersPercentage() {
        case 0...50 :
            return "Beginner"
        case 50...75 :
            return "Intermediate"
        case 75...100 :
            return "Advanced"
        
        default:
            return ""
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quiz: QuizDTO(questions: [
            Question(
                questionText: "What is the capital of France?",
                questionAswers: ["Berlin", "Paris", "London"],
                rightAnswerIndex: 1
            ),
            Question(
                questionText: "What is the largest planet in our solar system?",
                questionAswers: ["Jupiter", "Mars", "Venus"],
                rightAnswerIndex: 0
            ),
            Question(
                questionText: "What is the currency of Japan?",
                questionAswers: ["Yen", "Dollar", "Euro"],
                rightAnswerIndex: 0
            ),
            Question(
                questionText: "Who painted the Mona Lisa?",
                questionAswers: ["Vincent Van Gogh", "Leonardo Da Vinci", "Pablo Picasso"],
                rightAnswerIndex: 1
            )
        ]), isFirstQuiz: false)
    }
}
