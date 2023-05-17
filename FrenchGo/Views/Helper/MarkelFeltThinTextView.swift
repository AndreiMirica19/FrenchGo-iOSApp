//
//  MarkelFeltTextView.swift
//  FrenchGo
//
//  Created by Andrei Mirica on 17.05.2023.
//

import SwiftUI

struct MarkelFeltThinTextView: View {
    var text: String
    var textSize: Int
    
    var body: some View {
        Text(text)
            .font(.custom(
                   "MarkerFelt-Thin",
                   fixedSize: CGFloat(textSize)))
    }
}

struct MarkelFeltTextView_Previews: PreviewProvider {
    static var previews: some View {
        MarkelFeltThinTextView(text: "Hello world", textSize: 16)
    }
}
