//
//  ButtonStyle.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 16/04/21.
//

import SwiftUI

struct ManaButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .clipShape(Circle())
            .shadow(radius: 5)
            .overlay(Circle().stroke(Color.black))
    }
}
