//
//  ThemeButtonView.swift
//  MemoGame
//
//  Created by Kardahim on 16/10/2023.
//

import SwiftUI

struct ThemeButtonView: View {
    @Binding var showTheme: Int
    @Binding var content: Array<String>
    let colors = [Color.blue, Color.red, Color.green]
    let buttonText: String
    
    var body: some View {
        Group {
            if buttonText == "1" {
                Button {
                    showTheme = 1
                    shuffleContent()
                } label: {
                    VStack {
                        Image(systemName: "smiley").font(.title)
                        Text("Motyw 1")
                    }
                }
            } else if buttonText == "2" {
                Button {
                    showTheme = 2
                    shuffleContent()
                } label: {
                    VStack {
                        Image(systemName: "shuffle.circle").font(.title)
                        Text("Motyw 2")
                    }
                }
            } else {
                Button {
                    showTheme = 3
                    shuffleContent()
                } label: {
                    VStack {
                        Image(systemName: "paperplane.circle").font(.title)
                        Text("Motyw 3")
                    }
                }
            }
        }.foregroundColor(colors[showTheme - 1])
    }
    
    func shuffleContent() {
        content = content.shuffled()
    }
}

struct ThemeButtonView_Previews: PreviewProvider {
    @State static var showTheme = 1
    @State static var emojisTheme1 = ["😀", "😡", "🥸", "😇",
                        "😀", "😡", "🥸", "😇"]
    static var previews: some View {
        ThemeButtonView(showTheme: $showTheme, content: $emojisTheme1, buttonText: "1")
    }
}
