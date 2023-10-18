//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nicky Taylor on 10/14/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
