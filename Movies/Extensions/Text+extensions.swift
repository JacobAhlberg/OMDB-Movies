//
//  Text+extensions.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-30.
//

import SwiftUI

extension Text {
    func smallTitle() -> ModifiedContent<Text, SmallTitleModifier> {
        self.modifier(SmallTitleModifier())
    }
}
