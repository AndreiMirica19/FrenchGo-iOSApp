//
//  LoginProtocol.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

protocol LoginProtocol {
    static func login(loginData: LoginData) async throws -> (Data?, NetworkError?)
}
