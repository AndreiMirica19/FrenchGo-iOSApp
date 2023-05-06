//
//  LockedLessonCardView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import SwiftUI

struct LockedLessonCardView: View {
    var lesson: LessonDTO
    var lessonNumber: Int
    var courseName: String
    
    var body: some View {
        ZStack {
            LessonCardView(lesson: lesson, lessonNumber: lessonNumber, courseName: courseName)
                .blur(radius: 2)
            
            Image(systemName: "lock.circle")
                .resizable()
                .frame(width: 88, height: 88)
                .foregroundColor(.white)
        }
    }
}

struct LockedLessonCardView_Previews: PreviewProvider {
    static var previews: some View {
        LockedLessonCardView(lesson: LessonDTO(title: "", text: "", quiz: QuizDTO(questions: [])), lessonNumber: 0, courseName: "")
    }
}
