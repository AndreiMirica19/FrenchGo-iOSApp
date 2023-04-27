//
//  QUizCardView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 27.04.2023.
//

import SwiftUI

struct QUizCardView: View {
    var body: some View {
        VStack {
            Text("Initial Quiz")
                .font(.largeTitle)
            .fontWeight(.black)
            
            Spacer()
            
            Text("Do this quiz in order to calculate your french level")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .fontWeight(.black)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.red)
        .cornerRadius(15)
        .shadow(radius: 15)
    }
}

struct QUizCardView_Previews: PreviewProvider {
    static var previews: some View {
        QUizCardView()
    }
}
