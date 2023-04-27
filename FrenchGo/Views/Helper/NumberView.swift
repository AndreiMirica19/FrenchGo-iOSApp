//
//  NumberView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 25.04.2023.
//

import SwiftUI

struct NumberView: View {
    var number: String
    var body: some View {
        Text(number)
            .padding()
            .overlay {
                Circle()
                    .stroke()
            }
    }
}

struct Number_Previews: PreviewProvider {
    static var previews: some View {
        NumberView(number: "1")
    }
}
