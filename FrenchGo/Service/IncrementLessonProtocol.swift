//
//  IncrementLessonProtocol.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 30.04.2023.
//

import Foundation

protocol IncrementLessonProtocol {
    static func incrementLesson(userId: String) async throws -> (Data?, NetworkError?)
}
