//
//  LessonCardView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import SwiftUI

struct LessonCardView: View {
    var body: some View {
        VStack {
            Text("Debutant Course")
                .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(.white)
            
            
            Text("Lesson 1")
                .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(.white)

            Spacer()
            
            Text("French Present Tense")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .fontWeight(.black)
                .font(.title)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.blue)
        .cornerRadius(15)
        .shadow(radius: 15)
    }
}

struct LessonCardView_Previews: PreviewProvider {
    static var previews: some View {
        LessonCardView()
    }
}
