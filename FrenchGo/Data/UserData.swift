//
//  UserData.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import Foundation

struct UserData: Codable {
    var name: String
    var email: String
    var level: String
    var password: String
    var lastLessonIndex: Int
}
