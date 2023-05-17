
import SwiftUI

struct QuizView: View {
    
    let quiz: QuizDTO
    var isPreviousQuestion: Bool
    
    @State var currentQuestion = 0
    @State var selectedAnswerIndex: Int? = nil
    @State var rightAnswers = 0
    @State var alertIsShown = false
    @State var errorIsShown = false
    @State var errorMessage = ""
    @StateObject var quizViewModel = QuizViewModel()
    
    
    var body: some View {
        VStack {
            QuestionHeaderView(currentQuestion: currentQuestion, questionText: quiz.questions[currentQuestion].questionText)
                .padding()
            
            Spacer()
            
            AnswersView(qustionAnswers: quiz.questions[currentQuestion].questionAswers.shuffled(), rightAnswerIndex: quiz.questions[currentQuestion].rightAnswerIndex, selectedAnswerIndex: selectedAnswerIndex) { answerIndex in
                
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
            }.padding()
                .onReceive(quizViewModel.$updatedLevelResponse) { response in
                    guard let _ = response.0 else {
                        guard let error = response.1 else {
                            return
                        }
                        errorIsShown = true
                        errorMessage = error.getErrorMessage()
                        return
                    }
                }
                .onReceive(quizViewModel.$lessonUpdatedResponse) { response in
                    guard let _ = response.0 else {
                        guard let error = response.1 else {
                            return
                        }
                        errorIsShown = true
                        errorMessage = error.getErrorMessage()
                        return
                    }
                }
                .alert(errorMessage, isPresented: $errorIsShown) {
                    Button("OK", role: .cancel){}
                }
            
                .alert(quizViewModel.scoreAlertTitle(rightAnswers: rightAnswers, questionsCount: quiz.questions.count), isPresented: $alertIsShown) {
                    
                    if quizViewModel.correctAnswersPercentage(rightAnswers: rightAnswers, questionsCount: quiz.questions.count) < 80 {
                            Button("Retake", role: .cancel) {
                                currentQuestion = 0
                                selectedAnswerIndex = nil
                                rightAnswers = 0
                            }
                        } else {
                            Button("OK", role: .cancel) {
                                if !isPreviousQuestion {
                                    quizViewModel.incrementLesson()
                                }
                            }
                    }
                } message: {
                    Text("\(quizViewModel.scoreAlertMessage(rightAnswers: rightAnswers, questionsCount: quiz.questions.count))")
                }
            
            Spacer()
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
        ]), isPreviousQuestion: true)
    }
}
