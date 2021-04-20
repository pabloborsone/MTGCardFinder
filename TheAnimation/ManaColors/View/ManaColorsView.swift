//
//  ManaColorsView.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 16/04/21.
//

import SwiftUI

struct ManaColorsView: View {
    let phoneWidth = UIScreen.main.bounds.width
    
    var body: some View {
        HStack(alignment: .center) {
            ForEach(CardColor.allCases, id: \.self) { color in
                ColorView(cardColor: color)
            }
        }
        .frame(width: phoneWidth, height: 50)
    }
}

struct ManaColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ManaColorsView()
    }
}
