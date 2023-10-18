//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Nicky Taylor on 10/16/23.
//

import Foundation

struct MemoryGame<CardContent> {
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(symbol: content))
            cards.append(Card(symbol: content))
        }
    }
    
    private(set) var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        var symbol: CardContent
    }
    
}
