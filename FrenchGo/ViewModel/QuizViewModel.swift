//
//  QuizViewModel.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 30.04.2023.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var updatedLevelResponse: (UserDTO?, NetworkError?) = (nil, nil)
    @Published var lessonUpdatedResponse: (UserDTO?, NetworkError?) = (nil, nil)
    
    func updateLevel(level: String) {
        Task {
            let response = try await UserRepository.shared.updateUserLevel(level: level)
            
            DispatchQueue.main.async {
                self.updatedLevelResponse = response
            }
        }
    }
    
    func incrementLesson() {
        Task {
            let response = try await UserRepository.shared.incrementLesson()
            
            DispatchQueue.main.async {
                self.lessonUpdatedResponse = response
            }
        }
    }
    
    func correctAnswersPercentage(rightAnswers: Int, questionsCount: Int) -> Int {
        guard questionsCount > 0 else {
                return 0
            }
        
        return Int(Double(rightAnswers) / Double(questionsCount) * 100)
    }
    
    func scoreAlertTitle(rightAnswers: Int, questionsCount: Int) -> String {
        let score = correctAnswersPercentage(rightAnswers: rightAnswers, questionsCount: questionsCount)
        
        if  score > 79 {
            return "Congratulations"
        } else {
            return "You need to retake the quiz"
        }
    }
    
    func scoreAlertMessage(rightAnswers: Int, questionsCount: Int) -> String {
        
        var action = ""
        let score = correctAnswersPercentage(rightAnswers: rightAnswers, questionsCount: questionsCount)
        

            if score < 80 {
                action = "The minimum pass grade is 80"
            } else {
                action = "You can start the next lesson."
            }
        
        
        return "You got \(score)% right. \(action)"
    }
    
    func calculateLevel(rightAnswers: [Difficulty], totalQuestions: Int) -> CourseDifficulty {
        var score = 0
          let easyWeight = 1
          let intermediateWeight = 3
          let hardWeight = 5

          rightAnswers.forEach { difficulty in
              switch difficulty {
              case .easy:
                  score += easyWeight
              case .intermediate:
                  score += intermediateWeight
              case .hard:
                  score += hardWeight
              }
          }

          let averageScore = Double(score) / Double(totalQuestions)

          if averageScore >= 4.0 {
              return .advance
          } else if averageScore >= 2.0 {
              return .intermediate
          } else {
              return .beginner
          }
    }
    
}
