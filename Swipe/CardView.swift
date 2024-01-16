//
//  CardView.swift
//  Swipe
//
//  Created by Anant Narain on 15/01/24.
//

import SwiftUI

struct CardView: View {
    let card: CardModel

    var body: some View {
        VStack {
            Text(card.content)
                .font(.title)
                .padding()
        }
        .frame(width: 300, height: 400)
        .background(Color.blue)
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

