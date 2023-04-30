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
    @State var intialQuiz: QuizDTO? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Section {
                        
                        if let intialQuiz = intialQuiz {
                            NavigationLink {
                                QuizView(quiz: intialQuiz, isFirstQuiz: true)
                            } label: {
                                QUizCardView()
                                    .frame(height: 180)
                                    .padding(.top)
                                    .tint(.black)
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
                                ForEach(0...8, id: \.self) { index in
                                    if index < 4 {
                                        LessonCardView()
                                            .frame(height: 180)
                                            .padding()
                                    } else {
                                        LockedLessonCardView()
                                            .frame(height: 180)
                                            .padding()
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
                    
                    let courseDifficulty = CourseDifficulty(rawValue: userDetails.level)
                    
                    switch courseDifficulty {
                    case .beginner:
                        break
                    case .intermediate:
                        break
                    case .advance:
                        break
                    case .none:
                        homeViewModel.quiz()
                    }
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
