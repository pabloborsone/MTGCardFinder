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
                .frame(width: 50)
                .padding()
            VStack(alignment: .leading) {
                Text(card.name)
                    .font(.headline)
                Text(card.type)
                    .font(.subheadline)
            }
            Spacer()
            VStack(alignment: .trailing) {
                ForEach(card.colors, id: \.self) { color in
                    ColorView(cardColor: color)
                        .frame(width: 25, height: 25, alignment: .center)
                }
            }
        }
    }
}

struct CardRow_Previews: PreviewProvider {
    static var previews: some View {
        CardRow(card: CardValues(id: "1", name: "Liliana Vess", type: "Creature - Demon", subtypes: ["Demon", "Angel"], cmc: 0.0, colors: [.black], imageUrl: URL(fileURLWithPath: "")))
    }
}
