//
//  LessonView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 30.04.2023.
//

import SwiftUI

struct LessonView: View {
    var lesson: LessonDTO
    var body: some View {
        ScrollView {
            VStack {
                Text(lesson.title)
                    .font(.title)
                    .fontWeight(.black)
                
                Text(lesson.text)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .padding(.top, 16)
                
                NavigationLink {
                    QuizView(quiz: lesson.quiz)
                } label: {
                    Text("Take Quiz")
                    
                }.buttonStyle(.borderedProminent)
                    .tint(.green)
            }.padding()
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(lesson: LessonDTO(title: "title example", text: "testtttt", quiz: QuizDTO(questions: [])))
    }
}
