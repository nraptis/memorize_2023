//
//  ContentView.swift
//  Memorize
//
//  Created by Nicky Taylor on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🧠", "🎨", "👙", "💖", "👒", "💍", "💋", "🧩"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill().foregroundColor(.white)
                base.strokeBorder(lineWidth: 4.0, antialiased: false)
                Text(content)
            } else {
                base.fill()
                
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
