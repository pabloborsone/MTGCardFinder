//
//  Planeswalker.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 08/04/21.
//

import Foundation

struct CardValues: Hashable, Codable, Identifiable {
    let id: String
    let name: String
    let type: String
    let colors: [CardColor]
    let imageUrl: URL?
    let text: String?
}

struct Card: Hashable, Codable {
    let cards: [CardValues]
}

enum CardColor: String, Codable, CodingKey, CaseIterable {
    case white = "White", black = "Black", blue = "Blue", green = "Green", red = "Red"
    
    var imageName: String {
        rawValue.lowercased() + "-mana"
    }
}
