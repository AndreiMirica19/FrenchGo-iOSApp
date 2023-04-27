//
//  RegisterProtocol.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

protocol RegisterProtocol {
    static func register(userData: UserData) async throws -> (Data?, NetworkError?)
}
