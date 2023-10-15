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
    @State var cardsCount = 2
    
    var body: some View {
        let addButton = adjustCardNumber(by: 2, symbol: "+")
        let subButton = adjustCardNumber(by: -2, symbol: "-")
        let cards = cardDisplay()
        
        VStack {
            cards
            Spacer()
            HStack {
                subButton
                Spacer()
                addButton
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
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                    ForEach(0..<cardsCount, id: \.self) { index in
                        CardView(content: emojis[index])
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
