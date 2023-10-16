//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Nicky Taylor on 10/16/23.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var symbol: CardContent
        
    }
    
}
