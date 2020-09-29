//
//  SearchBar.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-28.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @State private var isEditing = false

    var placeHolder: String
    var searchButtonClicked: () -> Void

    var body: some View {
        HStack {
            UIKitSearchBar(text: $searchText,
                           placeHolderText: placeHolder,
                           searchButtonClicked: {
                            searchButtonClicked()
                            hideKeyboard()
                           },
                           didStartEditing: {
                            withAnimation { isEditing = true }
                           },
                           didEndEditing: {
                            withAnimation { isEditing = false }
                           })
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    hideKeyboard()
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBar(searchText: .constant(""),
                      placeHolder: "Search",
                      searchButtonClicked: { })
        }.background(Color(.systemBackground))
    }
}
