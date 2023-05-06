//
//  HomeView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    @State var alertIsShown = false
    @State var alertMessage = ""
    @State var intialQuiz: InitialQuizDTO? = nil
    @State var course: CourseDTO? = nil
    @State var userDetails: UserDTO? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Section {
                        
                        if let intialQuiz = intialQuiz {
                            NavigationLink {
                                InitialQuizView(quiz: intialQuiz)
                            } label: {
                                
                                QUizCardView()
                                    .frame(height: 180)
                                    .padding(.top)
                                    .tint(.black)
                                
                            }
                        }  else {
                            if let course = course, let userDetails = userDetails {
                                NavigationLink {
                                    LessonView(lesson: course.lessons[userDetails.lastLessonIndex])
                                } label: {
                                    LessonCardView(lesson: course.lessons[userDetails.lastLessonIndex], lessonNumber: (userDetails.lastLessonIndex + 1), courseName: course.courseName)
                                        .frame(height: 240)
                                        .padding()
                                }
                            }
                        }
                    } header: {
                        Text("Current Lesson")
                            .font(.title)
                            .fontWeight(.black)
                    }
                    
                    Spacer(minLength: 72)
                    
                    Section {
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack {
                                if let course = course, let userDetails = userDetails {
                                    ForEach(0...course.lessons.count - 1, id: \.self) { index in
                                        if index <= userDetails.lastLessonIndex {
                                            LessonCardView(lesson: course.lessons[index], lessonNumber: (index + 1), courseName: course.courseName)
                                                .frame(height: 180)
                                                .padding()
                                        } else {
                                            LockedLessonCardView(lesson: course.lessons[index], lessonNumber: (index + 1), courseName: course.courseName)
                                                .frame(height: 180)
                                                .padding()
                                        }
                                    }
                                    
                                }
                            }
                        }
                    } header: {
                        Text("All lessons")
                            .font(.title)
                            .fontWeight(.black)
                    }
                }.frame(width: .infinity)
            }.padding()
                .onAppear {
                    homeViewModel.userDetails()
                    //homeViewModel.quiz()
                }
                .onReceive(homeViewModel.$userDetailsResponse) { response in
                    guard let userDetails = response.0 else {
                        guard let error = response.1 else {
                            return
                        }
                        alertMessage = error.getErrorMessage()
                        alertIsShown = true
                        return
                    }
                    
                    self.userDetails = userDetails
                    
                    let courseDifficulty = CourseDifficulty(rawValue: userDetails.level)
                    
                    switch courseDifficulty {
                    case .beginner, .intermediate, .advance:
                        homeViewModel.getCourse(level: userDetails.level)
                        
                    case .none:
                        homeViewModel.quiz()
                    }
                }
                .onReceive(homeViewModel.$courseResponse) { response in
                    guard let course = response.0 else {
                        guard let error = response.1 else {
                            return
                        }
                        
                        alertMessage = error.getErrorMessage()
                        alertIsShown = true
                        return
                    }
                    
                    self.course = course
                }
                .onReceive(homeViewModel.$quizResponse) { response in
                    guard let quiz = response.0 else {
                        guard let error = response.1 else {
                            return
                        }
                        alertMessage = error.getErrorMessage()
                        alertIsShown = true
                        return
                    }
                    
                    intialQuiz = quiz
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
