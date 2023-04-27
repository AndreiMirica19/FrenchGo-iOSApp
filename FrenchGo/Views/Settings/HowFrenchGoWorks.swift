//
//  HowFrenchGoWorks.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import SwiftUI

struct HowFrenchGoWorks: View {
    var body: some View {
        VStack {
            Text("FrenchGo is an app where users can learn french no matter what their language by following the next steps:")
                .multilineTextAlignment(.center)
                .font(.headline)
            
            Spacer()
            
            HStack {
                NumberView(number: "1")
                VStack(alignment: .leading) {
                    Text("The first test")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("The user will be administered a language level assessment test, which will comprise questions categorized as either easy, medium, or hard.")
                        .multilineTextAlignment(.leading)
                }
            }.padding()
            
            HStack {
                NumberView(number: "2")
                VStack(alignment: .leading) {
                    Text("The first lesson")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("The user will be administrated a language level and will start to read the first leson")
                        .multilineTextAlignment(.leading)
                }
            }.padding()
            
            HStack {
                NumberView(number: "3")
                VStack(alignment: .leading) {
                    Text("The first quiz")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("After the lesson, a quiz will be given. The user will have to get 100% to get to the next lesson")
                        .multilineTextAlignment(.leading)
                }
            }.padding()
            
            Spacer()
            
        }.navigationTitle("How FrenchGo works")
            .padding()
    }
}

struct HowFrenchGoWorks_Previews: PreviewProvider {
    static var previews: some View {
        HowFrenchGoWorks()
    }
}
