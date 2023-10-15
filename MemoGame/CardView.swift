//
//  CardView.swift
//  MemoGame
//
//  Created by Kardahim on 15/10/2023.
//

import SwiftUI

struct CardView: View {
    let content: String
    @State var isEmojiShow:Bool = true
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack {
            base.fill(.blue)
            Group {
                base.fill(.white)
                base.stroke(.blue, lineWidth:2)
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
    static var previews: some View {
        CardView(content: "😁", isEmojiShow: true)
    }
}
