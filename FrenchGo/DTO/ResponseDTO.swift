//
//  ResponseDTO.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

struct ResponseDTO: Decodable, Equatable {
    let message: String
    let statusCode: Int
    
    func toNetworkError() -> NetworkError {
        switch statusCode {
        case 404:
            return NetworkError.invalidAccount
            
        case 500:
            return NetworkError.encodeError
            
        default:
            return.unexpectedError
        }
    }
}
