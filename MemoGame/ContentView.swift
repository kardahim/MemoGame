//
//  ContentView.swift
//  MemoGame
//
//  Created by Kardahim on 15/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel = MemoGameViewModel()
    @State private var lastScoreChange: (points: Int, cardId: String) = (0, "0")
    
    var body: some View {
        VStack {
            Text("Memo game").font(.title)
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            HStack {
                Text("Wynik: \(viewModel.score)").font(.title2)
                Spacer()
                Button("SHUFFLE") {
                    viewModel.shuffle()
                }
            }.padding(.bottom, 20)
            themeButtons
        }.padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                ZStack {
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            let prevScore = viewModel.score
                            viewModel.choose(card)
                            let scoreChange = viewModel.score - prevScore
                            lastScoreChange = (scoreChange, card.id)
                        }
                        .transformIntoCard(isFaceUp: card.isFaceUp)
                    
                    if card.id == lastScoreChange.cardId && lastScoreChange.points != 0 {
                        FlyingNumber(number: lastScoreChange.points)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    lastScoreChange = (0, "0")
                                }
                            }
                    }
                }
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
    func scoreChange(for cardId: String) -> Int {
        return cardId == lastScoreChange.cardId ? lastScoreChange.points : 0
    }
    
    var themeButtons: some View {
        HStack {
            Spacer()
            ThemeButtonView(viewModel: viewModel, imageName: "pencil", content: "Motyw 1", ownColor: .blue)
            Spacer()
            ThemeButtonView(viewModel: viewModel, imageName: "pencil", content: "Motyw 2", ownColor: .red)
            Spacer()
            ThemeButtonView(viewModel: viewModel, imageName: "pencil", content: "Motyw 3", ownColor: .green)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
