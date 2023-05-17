//
//  LessonCardView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import SwiftUI

struct LessonCardView: View {
    var lesson: LessonDTO
    var lessonNumber: Int
    var courseName: String
    
    var body: some View {
        VStack {
            MarkerFeltWideTextView(text: courseName, textSize: 28)
                .foregroundColor(.white)
            
            MarkelFeltThinTextView(text: "Lesson \(lessonNumber)", textSize: 24)
                .foregroundColor(.white)

            Spacer()
            
            MarkelFeltThinTextView(text: lesson.title, textSize: 24)
                .foregroundColor(.white)
            
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
        LessonCardView(lesson: LessonDTO(title: "Perfect simple", text: "You learn how to", quiz: QuizDTO(questions: [])), lessonNumber: 0, courseName: "Debutant course")
    }
}
