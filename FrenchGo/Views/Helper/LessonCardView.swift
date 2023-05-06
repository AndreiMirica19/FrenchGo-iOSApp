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
            Text(courseName)
                .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(.white)
            
            
            Text("Lesson \(lessonNumber)")
                .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(.white)

            Spacer()
            
            Text(lesson.title)
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
        LessonCardView(lesson: LessonDTO(title: "", text: "", quiz: QuizDTO(questions: [])), lessonNumber: 0, courseName: "")
    }
}
