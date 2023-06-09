//
//  ContentView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import SwiftUI

struct Login: View {
    @Environment(\.colorScheme) private var colorScheme
    @State var email = ""
    @State var password = ""
    @State var errorMessage = ""
    @State var displayError = false
    @State var keepMeLogin = false
    @State var displaySignUp = false
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Image("eiffel")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("FrenchGo")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.blue)
                
                Spacer()
                
                CustomTextView(text: $email, imageName: "mail", placeHolder: "Email")
                    .padding()
                    .padding(.horizontal)
                    .frame(maxWidth: 400)
                
                PasswordTextView(text: $password, placeHolder: "Password")
                    .padding()
                    .padding(.horizontal)
                    .frame(maxWidth: 400)
                
                HStack {
                    Image(systemName: keepMeLogin ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            keepMeLogin.toggle()
                        }
                    
                    Text("Keep me login")
                        .fontWeight(.bold)
                }.padding(.top)
                
                Spacer()
                
                Button {
                    if !email.isEmpty && !password.isEmpty {
                        loginViewModel.login(loginData: LoginData(password: password, email: email), keepLogedIn: keepMeLogin)
                    } else {
                        errorMessage = "You must complete the fields."
                        displayError = true
                    }
                } label: {
                    Text("Login")
                        .font(.headline)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .alert("Error", isPresented: $displayError, actions: {}, message: {
                    Text(errorMessage)
                })
                .onReceive(loginViewModel.$response, perform: { response in
                    guard response.0 != nil else {
                        guard let error = response.1 else {
                            return
                        }
                        errorMessage = error.getErrorMessage()
                        displayError = true
                        return
                    }
                    
                    UserRepository.shared.login()
                })
                
                HStack {
                    Text("Don't you have an account?")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(.black)
                    
                    Button {
                        displaySignUp = true
                    } label: {
                        Text("Sign up")
                            .fontWeight(.bold)
                            .font(.title3)
                    }
                }
            }
            .sheet(isPresented: $displaySignUp, content: {
                SignUpView()
            })
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
