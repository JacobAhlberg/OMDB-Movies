//
//  BackgroundShape.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-30.
//

import SwiftUI

struct BackgroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: rect.minX, y: rect.maxY / 2.5))
        path.addLine(to: .init(x: rect.maxX, y: (rect.maxY / 2.5) * 0.8))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        return path
    }
}

struct BackgroundShape_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundShape()
    }
}
