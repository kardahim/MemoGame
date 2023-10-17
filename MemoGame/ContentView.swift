//
//  ContentView.swift
//  MemoGame
//
//  Created by Kardahim on 15/10/2023.
//

import SwiftUI

struct ContentView: View {
    // emojis array
    let emojis = ["👺", "😁", "🐶", "🐴", "🦄", "⚽️",
                  "👺", "😁", "🐶", "🐴", "🦄", "⚽️",
                  "👺", "😁", "🐶", "🐴", "🦄", "⚽️",
                  "👺", "😁", "🐶", "🐴", "🦄", "⚽️",
                  "👺", "😁", "🐶", "🐴", "🦄", "⚽️"]
    @State var emojisTheme1 = ["😀", "😡", "🥸", "😇",
                               "😀", "😡", "🥸", "😇"].shuffled()
    @State var emojisTheme2 = ["🐶", "🦁", "🐰", "🐷", "🐒", "🪲", "🐍", "🦕",
                        "🐶", "🦁", "🐰", "🐷", "🐒", "🪲", "🐍", "🦕"].shuffled()
    @State var emojisTheme3 = ["⚽️", "🏀", "🥎", "🎱",
                        "⚽️", "🏀", "🥎", "🎱"].shuffled()
    
    @State var cardsCount = 2
    @State var showTheme = 1
    
    var body: some View {
        // let addButton = adjustCardNumber(by: 2, symbol: "+")
        // let subButton = adjustCardNumber(by: -2, symbol: "-")
        let cards = cardDisplay()
        
        VStack {
            Text("Memo").font(.largeTitle)
            cards
            Spacer()
            HStack {
                // subButton
                // Spacer()
                // addButton
                ThemeButtonView(showTheme: $showTheme, content: $emojisTheme1, buttonText: "1")
                    Spacer()
                    ThemeButtonView(showTheme: $showTheme, content: $emojisTheme2, buttonText: "2")
                    Spacer()
                    ThemeButtonView(showTheme: $showTheme, content: $emojisTheme3, buttonText: "3")
            }
        }.padding()
    }
    
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        let temp: Int = cardsCount + offset
        
        var state: Bool = false
        if temp < 2 || temp > emojis.count {
            state.toggle()
        }
        
        return Button(symbol) {cardsCount += offset}
            .disabled(state)
            .frame(width: 30, height: 20)
            .border(.blue)
    }
    
    func cardDisplay() -> some View {
        return (
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
//                    ForEach(0..<cardsCount, id: \.self) { index in
//                        CardView(content: emojis[index], showTheme: $showTheme).aspectRatio(2/3, contentMode: .fit)
//                    }
                    if showTheme == 1 {
                        ForEach(0..<emojisTheme1.count, id: \.self) { index in
                            CardView(content: emojisTheme1[index], showTheme: $showTheme).aspectRatio(2/3, contentMode: .fit)
                        }
                    } else if showTheme == 2 {
                        ForEach(0..<emojisTheme2.count, id: \.self) { index in
                            CardView(content: emojisTheme2[index], showTheme: $showTheme).aspectRatio(2/3, contentMode: .fit)
                        }
                    } else {
                        ForEach(0..<emojisTheme3.count, id: \.self) { index in
                            CardView(content: emojisTheme3[index], showTheme: $showTheme).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
