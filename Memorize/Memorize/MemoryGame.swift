//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Nicky Taylor on 10/16/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(symbol: content, id: "\(pairIndex+1)a"))
            cards.append(Card(symbol: content, id: "\(pairIndex+1)b"))
        }
    }
    
    private(set) var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp = true
        var isMatched = false
        var symbol: CardContent
        
        var id: String
    }
    
}
