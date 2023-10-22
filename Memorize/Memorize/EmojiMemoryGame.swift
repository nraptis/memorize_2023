//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nicky Taylor on 10/16/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🦄", "🎀", "💖", "👒", "💋", "👠", "🧶", "🍭", "🎲", "🧲", "🍹", "🪮", "🪭", "🎨"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 6) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "🤹🏽‍♀️"
            }
        }
    }
    
    var color: Color {
        .orange
    }
    
    var score: Int {
        model.score
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card: card)
    }
    
}
