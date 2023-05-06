//
//  CourseProtocol.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 30.04.2023.
//

import Foundation

protocol CourseProtocol {
    static func course(level: String) async throws -> (Data?, NetworkError?)
}
