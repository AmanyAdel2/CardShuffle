//
//  CardsShuffleView.swift
//  CardShuffle
//
//  Created by Macos on 5/08/2026.
//

import SwiftUI

struct CardsShuffleView: View {
    
    // MARK: - Variables
    
    @State private var cards: [ShuffleCard] = [
        ShuffleCard(color: Color(white: 0.9)),
        ShuffleCard(color: .blue),
        ShuffleCard(color: .red),
        ShuffleCard(color: Color.yellow)
    ]
    
    @State private var dragOffset: CGSize = .zero
    
    private let scaleStep: CGFloat = 0.05
    private let depthSpacing: CGFloat = -16
    private let swipeThreshold: CGFloat = -60
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
                
            ForEach(Array(cards.enumerated()), id: \.element.id) { index, card in
                cardItemView(index: index, card: card)
            }
        }
    }
    
  
    
    @ViewBuilder
    private func cardItemView(index: Int, card: ShuffleCard) -> some View {
        let isTopCard = index == cards.count - 1
        let depthIndex = CGFloat(cards.count - 1 - index)
        
        let scale = 1.0 - (depthIndex * scaleStep)
        let yOffset = depthIndex * depthSpacing
        let activeDrag = isTopCard ? dragOffset : .zero
        
        ShuffleCardFace(color: card.color)
            .scaleEffect(scale)
            .offset(y: yOffset)
            .offset(activeDrag)
            .rotation3DEffect(.degrees(card.flipRotation), axis: (x: 1, y: 0, z: 0), perspective: 0.8)
            .zIndex(Double(index))
            .gesture(dragGesture(isTopCard: isTopCard))
    }
    
    // MARK: - Previews
    
    struct CardsShuffleView_Previews: PreviewProvider {
        static var previews: some View {
            CardsShuffleView()
        }
    }
    
    // MARK: - Gestures & Actions
    
    private func dragGesture(isTopCard: Bool) -> some Gesture {
        DragGesture()
            .onChanged { value in
                guard isTopCard else { return }
                dragOffset = value.translation
            }
            .onEnded { value in
                guard isTopCard else { return }

                if value.translation.height < swipeThreshold {
                    shuffleFrontCardToBack()
                } else {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7)) {
                        dragOffset = .zero
                    }
                }
            }
    }

    private func shuffleFrontCardToBack() {
        withAnimation(.spring(response: 0.7, dampingFraction: 0.75)) {
            let swipedCard = cards.removeLast()
            cards.insert(swipedCard, at: 0)
            dragOffset = .zero
        }
    }
}
    struct CardsShuffleView_Previews: PreviewProvider {
        static var previews: some View {
            CardsShuffleView()
        }
    }
    
    
    
    
