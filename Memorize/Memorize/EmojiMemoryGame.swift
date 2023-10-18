//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nicky Taylor on 10/16/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    private static let emojis = ["🦄", "🎀", "💖", "👒", "💋", "👠", "🧶", "🍭", "🎲", "🧲", "🍹", "🪮", "🪭", "🎨"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 40) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "🤹🏽‍♀️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
