//
//  LockedLessonCardView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import SwiftUI

struct LockedLessonCardView: View {
    var body: some View {
        ZStack {
            LessonCardView()
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
        LockedLessonCardView()
    }
}
