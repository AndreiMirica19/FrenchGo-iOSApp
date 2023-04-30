//
//  HomeViewModel.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var quizResponse: (QuizDTO?, NetworkError?)
    @Published var userDetailsResponse: (UserDTO?, NetworkError?)
    
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
}
