//
//  InitialQuizProtocol.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

protocol InitialQuizProtocol {
    static func intialQuiz() async throws -> (Data?, NetworkError?)
}
