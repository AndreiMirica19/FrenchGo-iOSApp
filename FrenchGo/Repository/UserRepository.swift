//
//  UserRepository.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import Foundation

class UserRepository: ObservableObject {
    static let shared = UserRepository()
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.setValue(isLoggedIn, forKey: "logedIn")
        }
    }
    
    init() {
        isLoggedIn = UserDefaults.standard.bool(forKey: "logedIn")
    }
    
    func login() {
        isLoggedIn = true
    }
}
