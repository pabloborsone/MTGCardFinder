//
//  CardList.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 12/04/21.
//

import SwiftUI

struct CardList: View {
    @StateObject var cardData = CardsData()
    @EnvironmentObject var colorFilter: Filter
    
    var body: some View {
        NavigationView {
            List(cardData.card.cards) { card in
                NavigationLink(destination: DetailView(card: card)) {
                    CardRow(card: card)
                        .onAppear { cardData.loadMoreContentIfNeeded(currentItem: card) }
                }
            }
            .navigationTitle("Cards")
            .navigationBarHidden(false)
        }
        if cardData.isLoadingPage {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                
        }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList()
    }
}
