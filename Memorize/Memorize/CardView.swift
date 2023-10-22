//
//  CardView.swift
//  Memorize
//
//  Created by Nicky Taylor on 10/19/23.
//

import SwiftUI

struct CardView: View {
    
    typealias Card = MemoryGame<String>.Card
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.4
            static let inset: CGFloat = 6
        }
    }
    
    var body: some View {
        TimelineView(.animation(minimumInterval: 1/10)) { timeline in
            if card.isFaceUp || !card.isMatched {
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360))
                    .opacity(Constants.Pie.opacity)
                    .overlay(
                        cardContents
                    )
                    .padding(Constants.inset)
                    .cardify(isFaceUp: card.isFaceUp)
                    .transition(.scale)
            } else {
                Color.clear
            }
        }
    }
    
    var cardContents: some View {
        Text(card.symbol)
            .font(.system(size: Constants.FontSize.largest))
            .minimumScaleFactor(Constants.FontSize.scaleFactor)
            .multilineTextAlignment(.center)
            .aspectRatio(1.0, contentMode: .fit)
            .opacity(Constants.Pie.inset)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.spin(duration: 1.0), value: card.isMatched)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: duration).repeatForever(autoreverses: false)
    }
}

struct CardView_Previews: PreviewProvider {
    
    typealias Card = MemoryGame<String>.Card
    static var previews: some View {
        VStack {
            HStack {
                CardView(Card(isFaceUp: true, symbol: "🎷", id: "1a"))
                    .padding()
                    .foregroundColor(.green)
                CardView(Card(symbol: "🎷", id: "1a"))
                    .padding()
                    .foregroundColor(.green)
            }
            HStack {
                CardView(Card(symbol: "🎷", id: "1a"))
                    .padding()
                    .foregroundColor(.green)
                CardView(Card(isFaceUp: true, symbol: "This is a rather long name, hahahahahaha, long name", id: "1a"))
                    .padding()
                    .foregroundColor(.green)
            }
            
        }
    }
    
}
