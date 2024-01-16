//
//  SwipeableCardStackView.swift
//  Swipe
//
//  Created by Anant Narain on 15/01/24.
//

// SwipeableCardStackView.swift
import SwiftUI

struct SwipeableCardStackView: View {
    @Binding var cards: [CardModel]

    var body: some View {
        CardStackView(cards: $cards)
    }
}

