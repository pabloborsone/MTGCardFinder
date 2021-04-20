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
        VStack(alignment: .center) {
            AsyncImage(url: card.imageUrl ?? defaultUrl,
                       placeholder: { Text("Loading...") })
            Text(card.name)
                .padding()
            Text(card.type)
                .padding()
            HStack {
                ForEach(card.colors, id: \.self) { color in
                    Text(color.stringValue)
                        .foregroundColor(.orange)
                }
            }
        }
    }
}

struct CardRow_Previews: PreviewProvider {
    static var previews: some View {
        CardRow(card: CardValues(id: "", name: "", type: "", subtypes: [""], cmc: 0.0, colors: [.black], imageUrl: URL(fileURLWithPath: "")))
    }
}
