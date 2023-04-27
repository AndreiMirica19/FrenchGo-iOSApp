//
//  RegisterViewModel.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

class RegisterViewModel: ObservableObject, Equatable {
    let userRepository = UserRepository()
    
    @Published var response: (ResponseDTO?, NetworkError?) = (nil, nil)

    static func == (lhs: RegisterViewModel, rhs: RegisterViewModel) -> Bool {
        return lhs.response == rhs.response
        }

    func register(registerData: UserData) {
        Task {
           let response = try await userRepository.register(registerData: registerData)

            DispatchQueue.main.async {
                self.response = response
            }
        }
    }
    
}
