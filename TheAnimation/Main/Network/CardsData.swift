//
//  CardsData.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 08/04/21.
//

import Foundation
import Combine

class CardsData: ObservableObject {
    @Published var card = Card(cards: [])
    @Published var isLoadingPage = false
    
    private var currentPage = 1
    
    private let baseURL = "https://api.magicthegathering.io/v1/cards"
    private var pageParam: String { "?page=\(currentPage)" }
    private let colorsParam = "&colors="
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        loadMoreContentIfNeeded(currentItem: nil)
    }

    func loadMoreContentIfNeeded(currentItem item: CardValues?) {
        guard let item = item else {
            fetch()
            return
        }
        
        guard !isLoadingPage else { return }
        
        let thresholdIndex = card.cards.endIndex - 5
        if card.cards.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            fetch()
        }
    }
    
    private func fetch() {
        isLoadingPage = true
        
        let stringUrl = baseURL + pageParam
        let url = URL(string: stringUrl)!
        URLSession.shared.dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { response in
                if let httpResponse = response.response as? HTTPURLResponse {
                     if let xDemAuth = httpResponse.allHeaderFields["total-count"] as? String {
                        print("----------------" + xDemAuth)
                     }
                }
            })
            .map(\.data)
            .decode(type: Card.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { response in
                self.isLoadingPage = false
                self.currentPage += 1
            })
            .sink(receiveCompletion: { print("Success completion: \($0)") },
                  receiveValue: { [weak self] in self?.card.cards.append(contentsOf: $0.cards) })
            .store(in: &cancellableSet)
    }
}
