//
//  SignUpView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import SwiftUI

struct SignUpView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var errorIsShown = false
    @State var errorMessage = ""
    @State var successfulRegistration = false
    @StateObject var registerViewModel = RegisterViewModel()
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>


    var body: some View {
        ZStack {
            Image("eiffel")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                CustomTextView(text: $name, imageName: "person", placeHolder: "Full name")
                    .padding()
                
                CustomTextView(text: $email, imageName: "mail", placeHolder: "Email")
                    .padding()
                
                
                PasswordTextView(text: $password, placeHolder: "Password")
                    .padding()
                
                PasswordTextView(text: $confirmPassword, placeHolder: "Confirm Password")
                    .padding()
                
                Button {
                    if validateFields() {
                        registerViewModel.register(registerData: UserData(name: name, email: email, level: "", password: password, lastLessonIndex: 0))
                    }
                } label: {
                    HStack {
                        Image(systemName: "person.badge.plus")
                            .foregroundColor(.white)
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .frame(minWidth: 300, minHeight: 44)
                    .background(.red)
                    .cornerRadius(8)
                }
                
                HStack {
                    Text("Already have an account?")
                        .fontWeight(.bold)
                    Button {
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        Text("Log in")
                            .foregroundColor(Color.blue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 24)
                .onReceive(registerViewModel.$response, perform: { response in
                    guard let response = registerViewModel.response.0 else {
                        guard let error = registerViewModel.response.1 else {
                            return
                        }
                        
                        errorIsShown = true
                        errorMessage = error.getErrorMessage()
                        return
                    }
                    
                    switch response.statusCode {
                    case 201:
                        successfulRegistration = true

                    default:
                        errorIsShown = true
                        errorMessage = response.message
                        
                    }
                })
                .alert(errorMessage, isPresented: $errorIsShown) {
                    Button("OK", role: .cancel) {}
                }
                .alert("Registration complete", isPresented: $successfulRegistration) {
                    Button("Go to login", role: .cancel) {
                        dismiss()
                    }
                }
                
            }.padding()
        }
    }
    
    func validateFields() -> Bool {
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorIsShown = true
            errorMessage = "Empty fields"
            return false
        }
        
        guard email.isValidEmail() else {
            errorIsShown = true
            errorMessage = "Wrong email format"
            return false
        }
        
        guard password.count > 8 else {
            errorIsShown = true
            errorMessage = "Password must be at least 8 characters long"
            return false
        }
        
        if password != confirmPassword {
            errorIsShown = true
            errorMessage = "Passwords don't match"
            return false
        }
        
        return true
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
