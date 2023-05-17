//
//  CourseDTO.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 30.04.2023.
//

import Foundation

struct CourseDTO: Decodable {
    var courseName: String
    var languageLevel: String
    var lessons: [LessonDTO]
}

struct LessonDTO: Decodable {
    var title: String
    var text: String
    var quiz: QuizDTO
}
