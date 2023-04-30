//
//  UserRepository.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import Foundation

class UserRepository: ObservableObject {
    
    var userId = ""
    static let shared = UserRepository()
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.setValue(isLoggedIn, forKey: "logedIn")
        }
    }
    
    init() {
        isLoggedIn = UserDefaults.standard.bool(forKey: "logedIn")
        
        guard let id = UserDefaults.standard.string(forKey: "userId") else {
            return
        }
        
        userId = id
    }
    
    func login() {
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
        UserDefaults.standard.removeObject(forKey: "userId")
    }
    
    func register(registerData: UserData) async throws -> (ResponseDTO?, NetworkError?) {
        do {
            let (data, error) = try await RegisterService.register(userData: registerData)
            guard let data = data else {
                guard let error = error else {
                    return (nil, .unexpectedError)
                }
                
                return (nil, error)
            }
            do {
                let response = try JSONDecoder().decode(ResponseDTO.self, from: data)
                return (response, nil)
            } catch {
                return (nil, .jsonDecoder)
            }
        } catch {
            return (nil, .unexpectedError)
        }
    }
    
    
    func login(loginData: LoginData) async throws -> (UserDTO?, NetworkError?) {
        do {
            let(data, error) = try await LoginService.login(loginData: loginData)
            
            guard let data = data else {
                guard let error = error else {
                    return (nil, .unexpectedError)
                }
                
                return (nil, error)
            }
            
            do {
                let response = try JSONDecoder().decode(UserDTO.self, from: data)
                return (response, nil)
            } catch {
                do {
                    let errorResponse = try JSONDecoder().decode(ResponseDTO.self, from: data)
                    return (nil, errorResponse.toNetworkError())
                } catch {
                    return (nil, .jsonDecoder)
                }
            }
        }
    }
    
    func userDetails() async throws -> (UserDTO?, NetworkError?) {
        let (data, error) = try await UserDetailsService.userDetails(userId: userId)
        
        guard let data = data else {
            guard let error = error else {
                return (nil, .unexpectedError)
            }
            
            return (nil, error)
        }
        
        do {
            let response = try JSONDecoder().decode(UserDTO.self, from: data)
            return (response, nil)
        } catch {
            do {
                let errorResponse = try JSONDecoder().decode(ResponseDTO.self, from: data)
                return (nil, errorResponse.toNetworkError())
            } catch {
                return (nil, .jsonDecoder)
            }
        }
    }
    
    func updateUserLevel(level: String) async throws -> (UserDTO?, NetworkError?) {
        let (data, error) = try await UpdateUserLevelService.updateUserLevel(userId: userId, level: level)
        
        guard let data = data else {
            guard let error = error else {
                return (nil, .unexpectedError)
            }
            
            return (nil, error)
        }
        
        do {
            let response = try JSONDecoder().decode(UserDTO.self, from: data)
            return (response, nil)
        } catch {
            return (nil, .jsonDecoder)
        }
    }
        
    
    func initialQuiz() async throws -> (QuizDTO?, NetworkError?) {
        do {
            let (data, error) = try await InitialQuizService.intialQuiz()
            
            guard let data = data else {
                guard let error = error else {
                    return (nil, .unexpectedError)
                }
                
                return (nil, error)
            }
            
            do {
                let quiz = try JSONDecoder().decode(QuizDTO.self, from: data)
                return (quiz, nil)
            } catch {
                
                return (nil, .jsonDecoder)
            }
        }
    }
}
