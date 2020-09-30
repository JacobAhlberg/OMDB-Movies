//
//  SmallTitleModifier.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-30.
//

import SwiftUI

struct SmallTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 14,
                          weight: .heavy,
                          design: .default))
            .foregroundColor(Color(.systemGray))
    }
}
