//
//  QuizDTO.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

struct QuizDTO: Decodable {
    var questions: [Question]
}

struct Question: Decodable {
    var questionText: String
    var questionAswers: [String]
    var rightAnswerIndex: Int
}
