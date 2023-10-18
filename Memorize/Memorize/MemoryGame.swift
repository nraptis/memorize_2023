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
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[potentialMatchIndex].symbol == cards[chosenIndex].symbol {
                        cards[potentialMatchIndex].isMatched = true
                        cards[chosenIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            return "\(id): \(symbol) \(isFaceUp ? "up" : "down")\(isMatched ? " matched" : "")"
        }
        
        var isFaceUp = false
        var isMatched = false
        var symbol: CardContent
        var id: String
    }
    
}

extension Array {
    var only: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
