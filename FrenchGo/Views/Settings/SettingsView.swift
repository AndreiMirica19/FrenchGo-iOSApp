//
//  SettingsView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    
                    Button {
                        
                    } label: {
                        Text("Log out")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Delete account")
                            .foregroundColor(.red)
                    }
                    
                }  header: {
                    Text("Account actions")
                        .font(.headline)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                
                Section {
                    
                    NavigationLink {
                        HowFrenchGoWorks()
                    } label: {
                        Text("How FrenchGo works")
                    }
                    
                    NavigationLink {
                        AboutUsView()
                    } label: {
                        Text("About us")
                    }
                    
                    NavigationLink {
                        // ContactUsView()
                    } label: {
                        Text("Contact us")
                    }
                    
                    
                } header: {
                    Text("Support")
                        .font(.headline)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        Text("Terms and Condtitions")
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        Text("Privacy Policy")
                    }
                } header: {
                    Text("Legal")
                        .font(.headline)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
