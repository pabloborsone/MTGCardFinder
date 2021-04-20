//
//  CardsData.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 08/04/21.
//

import Foundation

class CardsData {
    private let baseURL = "https://api.magicthegathering.io/v1/cards?"
    private let colorsParam = "colors="
    
    func fetch(usingFilters filters: [CardColor]? = nil, completion: @escaping (Card) -> Void) {
        let stringUrl = baseURL + colorsParam + (filters?.reduce("") { $0 + $1.rawValue + "," } ?? "")
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }
            do {
                let cardData = try JSONDecoder().decode(Card.self, from: data)
                DispatchQueue.main.async {
                    completion(cardData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
