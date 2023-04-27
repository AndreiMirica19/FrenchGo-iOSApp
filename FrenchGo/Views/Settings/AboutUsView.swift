//
//  AboutUsView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        VStack {
            Text("FrrenchGo is an innovative language learning app designed to help users learn French in a fun and engaging way")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 24)
            
            Text("Our app is designed to be user-friendly and accessible to learners of all levels, from beginners to advanced speakers. With a range of interactive exercises, including listening comprehension, speaking practice, and grammar drills, FrrenchGo provides a comprehensive and engaging learning experience.")
                .fontWeight(.semibold)
            
            Text("We also understand the importance of incorporating real-world scenarios and cultural context into language learning. That's why we offer a range of lessons that focus on French culture, history, and society, allowing users to not only learn the language but also gain a deeper understanding of French culture.")
                .fontWeight(.semibold)
                .padding(.top)
            
            Spacer()
        }.padding()
            .navigationTitle("About Us")
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
