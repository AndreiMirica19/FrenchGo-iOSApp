//
//  AnswersView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 06.05.2023.
//

import SwiftUI

struct AnswersView: View {
    var qustionAnswers: [String]
    var rightAnswerIndex: Int
    var selectedAnswerIndex: Int? = nil
    var answerTapped: ((_ answerIndex: Int) -> Void)
    
    var body: some View {
        VStack {
            ForEach(qustionAnswers.indices, id: \.self) { answerIndex in
                
                let answer = qustionAnswers[answerIndex]
                
                Button {
                    answerTapped(answerIndex)
                    
                } label: {
                    HStack {
                        Spacer()
                        Text(answer)
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding()
                    .background(backgroundColor(for: answerIndex))
                    .cornerRadius(8)
                    
                }
            }
        }
    }
    
    func backgroundColor(for answerIndex: Int) -> Color {
        if let selectedAnswerIndex = selectedAnswerIndex {
            if answerIndex == selectedAnswerIndex {
                return answerIndex == rightAnswerIndex ? .green : .red
            } else {
                return .blue
            }
        } else {
            return .blue
        }
    }
}

struct AnswersView_Previews: PreviewProvider {
    static var previews: some View {
        AnswersView(qustionAnswers: [], rightAnswerIndex: 0) {_ in 
            
        }
    }
}
