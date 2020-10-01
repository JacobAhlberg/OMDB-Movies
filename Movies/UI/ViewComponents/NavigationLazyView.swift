//
//  NavigationLazyView.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-30.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
}
