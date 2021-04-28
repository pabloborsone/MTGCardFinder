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
    let colors: [CardColor]?
    let imageUrl: URL?
    let text: String?
}

struct Card: Hashable, Codable {
    var cards: [CardValues]
}

enum CardColor: String, Codable, CodingKey, CaseIterable {
    case white, black, blue, green, red
    
    var imageName: String {
        rawValue.lowercased() + "-mana"
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            let color = try container.decode(String.self)
            self = CardColor(rawValue: color.lowercased())!
        } catch {
            print(error)
            self = CardColor(rawValue: "white")!
        }
    }
}
