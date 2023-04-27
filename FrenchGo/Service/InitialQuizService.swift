//
//  InitialQuizService.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

struct InitialQuizService: InitialQuizProtocol {
    
    static func intialQuiz() async throws -> (Data?, NetworkError?) {
        guard let url = URL(string: ApiEndpoint.url + ApiEndpoint.initialQuiz.rawValue) else {
            return (nil, .invalidURL )
        }
        
        var networkError: NetworkError?
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                networkError = httpResponse.toNetworkError()
              }

            return (data, networkError)
        } catch {
            let errorCode = (error as NSError).code
            switch errorCode {
            case -1004:
                return (nil, .serverDown)
                
            default:
                return (nil, .unexpectedError)
            }
        }
    }
}
