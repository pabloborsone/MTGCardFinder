//
//  ColorView.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 16/04/21.
//

import SwiftUI

class Filter: ObservableObject {
    @Published var filterColor: [CardColor] = []
}

struct ColorView: View {
    let cardColor: CardColor
    @State var imageOpacity = 0.5
    @EnvironmentObject var colorFilter: Filter
    
    var body: some View {
        Button {
            setupImage(withColor: cardColor, isHighlighted: imageOpacity == 1.0)
        } label: {
            Image(cardColor.imageName)
                .resizable()
                .scaledToFit()
                .opacity(imageOpacity)
        }
        .buttonStyle(ManaButtonStyle())
    }
    
    private func setupImage(withColor color: CardColor, isHighlighted: Bool = false) {
        if isHighlighted {
            imageOpacity = 0.5
            colorFilter.filterColor.removeAll(where: { $0 == color })
        } else {
            imageOpacity = 1.0
            colorFilter.filterColor.append(color)
        }
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(cardColor: .white)
    }
}
