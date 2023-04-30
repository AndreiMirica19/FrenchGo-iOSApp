//
//  UpdateUserLevelProtocol.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 30.04.2023.
//

import Foundation

protocol UpdateUserLevelProtocol {
    static func updateUserLevel(userId: String, level: String) async throws -> (Data?, NetworkError?)
}
