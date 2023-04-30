//
//  QuizViewModel.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 30.04.2023.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var updatedLevelResponse: (UserDTO?, NetworkError?) = (nil, nil)
    
    func updateLevel(level: String) {
        Task {
            let response = try await UserRepository.shared.updateUserLevel(level: level)
            
            DispatchQueue.main.async {
                self.updatedLevelResponse = response
            }
        }
    }
}
