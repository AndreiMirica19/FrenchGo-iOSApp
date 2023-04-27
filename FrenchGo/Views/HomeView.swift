//
//  HomeView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Section {
                    QUizCardView()
                        .frame(height: 180)
                    .padding(.top)
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
