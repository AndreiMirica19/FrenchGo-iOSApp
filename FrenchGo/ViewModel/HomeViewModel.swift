//
//  HomeViewModel.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var quizResponse: (InitialQuizDTO?, NetworkError?)
    @Published var userDetailsResponse: (UserDTO?, NetworkError?)
    @Published var courseResponse: (CourseDTO?, NetworkError?)
    
    func quiz() {
        Task {
            let response = try await UserRepository.shared.initialQuiz()
            
            DispatchQueue.main.async {
                self.quizResponse = response
            }
        }
    }
    
    func userDetails() {
        Task {
            let response = try await UserRepository.shared.userDetails()
            
            DispatchQueue.main.async {
                self.userDetailsResponse = response
            }
        }
    }
    
    func getCourse(level: String) {
        Task {
            let response = try await UserRepository.shared.getCourse(level: level)
            
            DispatchQueue.main.async {
                self.courseResponse = response
            }
        }
    }
}
