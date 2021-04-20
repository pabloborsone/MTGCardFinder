//
//  CardList.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 12/04/21.
//

import SwiftUI

struct CardList: View {
    @State var card = Card(cards: [])
    let cardsData = CardsData()
    @EnvironmentObject var colorFilter: Filter
    
    var body: some View {
        List(card.cards) { card in
            CardRow(card: card)
        }.onAppear {
            fetch()
        }.onChange(of: colorFilter.filterColor, perform: { value in
            fetch(usingFilters: colorFilter.filterColor)
        })
    }
    
    private func fetch(usingFilters filters: [CardColor]? = nil) {
        cardsData.fetch(usingFilters: filters) { self.card = $0 }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList()
    }
}