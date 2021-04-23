//
//  CardRow.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 08/04/21.
//

import SwiftUI

struct CardRow: View {
    var card: CardValues
    let defaultUrl = URL(string: "https://static.wikia.nocookie.net/mtgsalvation_gamepedia/images/f/f8/Magic_card_back.jpg/revision/latest/scale-to-width-down/250?cb=20140813141013")!
    
    var body: some View {
        HStack {
            AsyncImage(url: card.imageUrl ?? defaultUrl,
                       placeholder: { ProgressView() })
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            VStack(alignment: .leading) {
                Text(card.name)
                    .font(.headline)
                Text(card.type)
                    .font(.subheadline)
            }
        }
    }
}

struct CardRow_Previews: PreviewProvider {
    static var previews: some View {
        CardRow(card: CardValues(id: "1", name: "Liliana Vess", type: "Creature - Demon", colors: [.black], imageUrl: URL(fileURLWithPath: ""), text: "I destroy everyone who dares to stand in my way"))
    }
}
