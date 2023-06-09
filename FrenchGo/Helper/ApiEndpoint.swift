//
//  ApiEndpoint.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

enum ApiEndpoint: String {
    static let url = "http://localhost:8080"
    
    case login = "/login"
    case register = "/register"
    case initialQuiz = "/initialQuiz"
    case userDetails = "/userDetails"
    case updateUserLevel = "/userLevel"
    case course = "/course"
    case incrementLesson = "/incrementLesson"
}
