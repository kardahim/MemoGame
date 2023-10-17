//
//  CardView.swift
//  MemoGame
//
//  Created by Kardahim on 15/10/2023.
//

import SwiftUI

struct CardView: View {
    let content: String
    let colors = [Color.blue, Color.red, Color.green]
    @State var isEmojiShow:Bool = false
    @Binding var showTheme: Int
    
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack {
            base.fill(colors[showTheme - 1])
            Group {
                base.fill(.white)
                base.stroke(colors[showTheme - 1], lineWidth:2)
                Text(content).font(.largeTitle)
            }
            .opacity(isEmojiShow ? 1 : 0)
        }
        .onTapGesture {
            isEmojiShow.toggle()
        }
    }
    
}

struct CardView_Previews: PreviewProvider {
    @State static var showTheme = 1	
    static var previews: some View {
        CardView(content: "😁", isEmojiShow: true, showTheme: $showTheme)
    }
}
