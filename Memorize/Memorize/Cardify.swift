//
//  Cardify.swift
//  Memorize
//
//  Created by Nicky Taylor on 10/20/23.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            base.strokeBorder(lineWidth: Constants.lineWidth, antialiased: false)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity( isFaceUp ? 0 : 1)
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
