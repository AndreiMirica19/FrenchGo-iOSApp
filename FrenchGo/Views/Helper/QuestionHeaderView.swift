//
//  QuestionHeaderView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 06.05.2023.
//

import SwiftUI

struct QuestionHeaderView: View {
    var currentQuestion: Int
    var questionText: String
    
    var body: some View {
        VStack {
            MarkerFeltWideTextView(text: "Question \(currentQuestion + 1)", textSize: 34)
                .fontWeight(.black)
                .font(.largeTitle)
                .foregroundColor(Color("DarkGreen"))
            
            MarkerFeltWideTextView(text: questionText, textSize: 30)
                .fontWeight(.bold)
                .font(.title)
                .padding(.top)
        }
    }
}

struct QuestionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionHeaderView(currentQuestion: 1, questionText: "1 + 2")
    }
}
