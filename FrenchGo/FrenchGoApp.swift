//
//  FrenchGoApp.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import SwiftUI

@main
struct FrenchGoApp: App {
    @StateObject var userRepository = UserRepository.shared
    @State var loginSuccessful = false
    
    var body: some Scene {
        WindowGroup {
            if userRepository.isLoggedIn {
                MainTabView()
            } else {
                Login()
            }
        }
    }
}
