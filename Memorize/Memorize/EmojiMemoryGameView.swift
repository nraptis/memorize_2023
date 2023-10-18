//
//  ContentView.swift
//  Memorize
//
//  Created by Nicky Taylor on 10/14/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    let emojis = ["🦄", "🎀", "💖", "👒", "💋", "👠", "🧶",
                  "🍭", "🎲", "🧲", "🍹", "🪮", "🪭", "🎨"]
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill().foregroundColor(.white)
                base.strokeBorder(lineWidth: 4.0, antialiased: false)
                Text(card.symbol)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1.0, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity( card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
