//
//  MarkerFeltWideTextView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 17.05.2023.
//

import SwiftUI

struct MarkerFeltWideTextView: View {
    var text: String
    var textSize: Int
    
    var body: some View {
        Text(text)
            .font(.custom(
                   "MarkerFelt-Wide",
                   fixedSize: CGFloat(textSize)))
    }
}

struct MarkerFeltWideTextView_Previews: PreviewProvider {
    static var previews: some View {
        MarkerFeltWideTextView(text: "text", textSize: 16)
    }
}
