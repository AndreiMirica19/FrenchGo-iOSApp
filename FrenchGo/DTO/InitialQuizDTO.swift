//
//  InitialQuizDTO.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 06.05.2023.
//

import Foundation

struct InitialQuizDTO: Decodable {
    var questions: [InitialQuizQuestion]
}

struct InitialQuizQuestion: Decodable {
    var questionText: String
    var questionAswers: [String]
    var rightAnswerIndex: Int
    var difficulty: String
}
