//
//  ContactUsView.swift
//  Betterish
//
//  Created by Andrei Mirica on 24.04.2023.
//

import SwiftUI

struct ContactUsView: View {
    var body: some View {
        VStack(spacing: 16) {
            
            Section {
                Text("We love hearing from our users! If you have any questions, comments, or feedback, we're here to help.")
                    .multilineTextAlignment(.center)
                    .font(.headline)
            }

            Section {
                HStack {
                    Image(systemName: "phone")
                    Text("0774321045")
                    Spacer()
                }.padding(.top)
                
                Divider()
                
                HStack {
                    Image(systemName: "mail")
                    Text("contactUs@FrenchGo.com")
                    Spacer()
                }
                
                Divider()
                
                HStack {
                    Image("facebook")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("FrenchGo Romania")
                    Spacer()
                }
                
                Divider()
                
                HStack {
                    Image("instagram")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("FrenchGo_Romania")
                    Spacer()
                }
                
                Divider()
                
                
                HStack {
                    Image("twitter")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("FrenchGo_Romania")
                    Spacer()
                }
            }
            
            Divider()
            
            Spacer()
            
            Text("Thank you for choosing Betterish to help you achieve your wellness goals. We look forward to hearing from you!")
                .multilineTextAlignment(.center)
        }.padding()
            .navigationTitle(Text("Contact Us"))
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
