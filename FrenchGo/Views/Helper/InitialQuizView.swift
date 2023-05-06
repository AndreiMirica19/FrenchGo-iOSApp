//
//  InitialQuizView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 06.05.2023.
//

import SwiftUI

struct InitialQuizView: View {
    let quiz: InitialQuizDTO
    
    @State var currentQuestion = 0
    @State var selectedAnswerIndex: Int? = nil
    @State var rightAnswers: [Difficulty] = []
    @State var alertIsShown = false
    @State var errorIsShown = false
    @State var errorMessage = ""
    @StateObject var quizViewModel = QuizViewModel()
    
    var body: some View {
        VStack {
            QuestionHeaderView(currentQuestion: currentQuestion, questionText: quiz.questions[currentQuestion].questionText)
            
            Spacer()
            
            AnswersView(qustionAnswers: quiz.questions[currentQuestion].questionAswers, rightAnswerIndex: quiz.questions[currentQuestion].rightAnswerIndex, selectedAnswerIndex: selectedAnswerIndex) { answerIndex in
                
                selectedAnswerIndex = answerIndex
                if selectedAnswerIndex == quiz.questions[currentQuestion].rightAnswerIndex {
                    if let difficulty = Difficulty(rawValue: quiz.questions[currentQuestion].difficulty) {
                        rightAnswers.append(difficulty)
                    }
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
        
                .alert(errorMessage, isPresented: $errorIsShown) {
                    Button("OK", role: .cancel){}
                }
            
                .alert("Congratulation", isPresented: $alertIsShown) {
                            Button("OK", role: .cancel) {
                               quizViewModel.updateLevel(level: quizViewModel.calculateLevel(rightAnswers: rightAnswers, totalQuestions: quiz.questions.count).rawValue)

                    }
                } message: {
                    Text("You are a \(quizViewModel.calculateLevel(rightAnswers: rightAnswers, totalQuestions: quiz.questions.count).rawValue)")
                }
            
            Spacer()
        }
    }
}

struct InitialQuizView_Previews: PreviewProvider {
    static var previews: some View {
        InitialQuizView(quiz: InitialQuizDTO(questions: [
            InitialQuizQuestion(
                questionText: "What is the capital of France?",
                questionAswers: ["Berlin", "Paris", "London"],
                rightAnswerIndex: 1,
                difficulty: "Easy"
            ),
            InitialQuizQuestion(
                questionText: "What is the largest planet in our solar system?",
                questionAswers: ["Jupiter", "Mars", "Venus"],
                rightAnswerIndex: 0,
                difficulty: "Easy"
                
            ),
            InitialQuizQuestion(
                questionText: "What is the currency of Japan?",
                questionAswers: ["Yen", "Dollar", "Euro"],
                rightAnswerIndex: 0,
                difficulty: "Easy"
            ),
            InitialQuizQuestion(
                questionText: "Who painted the Mona Lisa?",
                questionAswers: ["Vincent Van Gogh", "Leonardo Da Vinci", "Pablo Picasso"],
                rightAnswerIndex: 1,
                difficulty: "Easy"
            )
        ]))
    }
}
