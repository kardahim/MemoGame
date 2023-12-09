//
//  CirclePart.swift
//  MemoGame
//
//  Created by Kardahim on 27/11/2023.
//

import SwiftUI
import CoreGraphics

struct CirclePart: Shape {
    let startAngle: Double = 270
    let endAngle: Double = 160
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        path.move(to: center)
        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(startAngle),
            endAngle: .degrees(endAngle),
            clockwise: false)
        return path
    }
}

struct CirclePart_Previews: PreviewProvider {
    static var previews: some View {
        CirclePart().fill(.blue)
    }
}
