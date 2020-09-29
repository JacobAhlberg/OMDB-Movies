//
//  View+extensions.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-28.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
