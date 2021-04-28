//
//  ContentView.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 08/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
//                Spacer()
//                ManaColorsView()
//                Divider()
                CardList()
            }
        }
        .environmentObject(Filter())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
