//
//  LessonView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 30.04.2023.
//

import SwiftUI

struct LessonView: View {
    var lesson: LessonDTO
    var isPreviousLesson: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                MarkerFeltWideTextView(text: lesson.title, textSize: 34)
                
                MarkelFeltThinTextView(text: lesson.text, textSize: 18)
                    .padding(.top, 16)
                
                NavigationLink {
                    QuizView(quiz: lesson.quiz, isPreviousQuestion: isPreviousLesson)
                } label: {
                    MarkelFeltThinTextView(text: "Quiz", textSize: 18)
                    
                }.buttonStyle(.borderedProminent)
                    .tint(.green)
            }.padding()
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(lesson: LessonDTO(title: "title example", text: "testtttt", quiz: QuizDTO(questions: [])), isPreviousLesson: false)
    }
}
