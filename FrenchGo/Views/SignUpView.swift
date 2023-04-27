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
                
            }.padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
