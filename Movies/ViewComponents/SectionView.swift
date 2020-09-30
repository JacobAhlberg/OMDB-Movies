//
//  SectionView.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-30.
//

import SwiftUI

struct SectionView<Content: View>: View {
    var title: Text
    var content: Content
    let alignment: HorizontalAlignment
    let spacing: CGFloat

    init(title: Text,
         alignment: HorizontalAlignment = .leading,
         spacing: CGFloat = 5,
         @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    var body: some View {
        VStack(alignment: alignment, spacing: spacing) {
            title.smallTitle()
            HStack {
                content
                Spacer()
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(title: Text("Title")) {
            Text("Lorem ipsum")
        }
    }
}
