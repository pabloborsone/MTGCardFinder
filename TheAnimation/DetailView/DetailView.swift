//
//  DetailView.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 23/04/21.
//

import SwiftUI

struct DetailView: View {
    let defaultUrl = URL(string: "https://static.wikia.nocookie.net/mtgsalvation_gamepedia/images/f/f8/Magic_card_back.jpg/revision/latest/scale-to-width-down/250?cb=20140813141013")!
    
    var card: CardValues
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: card.imageUrl ?? defaultUrl,
                           placeholder: { ProgressView() })
                    .padding()
                Text(card.text ?? "")
                    .font(.callout).italic()
                    .padding()
            }
            .navigationBarTitle(card.name, displayMode: .inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(card: CardValues(id: "", name: "Ancestor's Chosen", type: "Angel", colors: [.white], imageUrl: nil, text: "First strike (This creature deals combat damage before creatures without first strike.)\nWhen Ancestor's Chosen enters the battlefield, you gain 1 life for each card in your graveyard."))
    }
}
