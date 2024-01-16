//
//  CardStackView.swift
//  Swipe
//
//  Created by Anant Narain on 15/01/24.
//

// CardStackView.swift
import SwiftUI

struct CardStackView: View {
    @Binding var cards: [CardModel]
    @State private var currentIndex = 0
    @State private var offset: CGSize = .zero
    let cardWidth: CGFloat = 320
    let cardHeight: CGFloat = 250
    
    let horizontalSpacing: CGFloat = 20
    var body: some View {
        ZStack {
            ForEach(cards.indices) { index in
                VStack {
                    Text(cards[index].title)
                    
                        .font(.system(size: 18))
                        .foregroundColor(Color.green)
                    
                    Text(cards[index].content)
                    
                        .font(.system(size: 17))
                        .multilineTextAlignment(.leading)
                }
                .padding(20) // Add padding to separate content from card edges
                .frame(width: cardWidth, height: cardHeight)
                .background(Color.white) // Maintain card color
                .cornerRadius(16)
                .shadow(radius: 8)
                
                .offset(y: CGFloat(index) * 10)
                //.rotationEffect(.degrees(Double(index) * 1))
                .zIndex(Double(index))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation
                        }
                        .onEnded { value in
                            //  let cardHeight = CGFloat(400)
                            let offsetThreshold = cardHeight / 2
                            
                            withAnimation {
                                // Check if the drag offset is greater than half the card height
                                if value.translation.height > offsetThreshold {
                                    currentIndex += 1
                                    let removedCard = cards.removeFirst()
                                    cards.append(removedCard)
                                } else if value.translation.height < -offsetThreshold {
                                    currentIndex -= 1
                                    let removedCard = cards.removeLast()
                                    cards.insert(removedCard, at: 0)
                                }
                                
                                offset = .zero
                            }
                        }
                    
                )
                
            }
            .padding()
        }
    }
}
