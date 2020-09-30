//
//  UIKitSearchBar.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-29.
//

import Foundation
import SwiftUI

struct UIKitSearchBar: UIViewRepresentable {
    @Binding var text: String
    let placeHolderText: String

    var searchButtonClicked: () -> Void
    var didStartEditing: () -> Void
    var didEndEditing: () -> Void

    class Coordinator: NSObject {
        @Binding var text: String

        var searchButtonClicked: () -> Void
        var didStartEditing: () -> Void
        var didEndEditing: () -> Void

        init(text: Binding<String>,
             didStartEditing: @escaping () -> Void,
             didEndEditing: @escaping () -> Void,
             searchButtonClicked: @escaping () -> Void) {
            _text = text
            self.didStartEditing = didStartEditing
            self.didEndEditing = didEndEditing
            self.searchButtonClicked = searchButtonClicked
        }
    }

    func makeCoordinator() -> UIKitSearchBar.Coordinator {
        return Coordinator(text: $text,
                           didStartEditing: didStartEditing,
                           didEndEditing: didEndEditing,
                           searchButtonClicked: searchButtonClicked)
    }

    func makeUIView(context: UIViewRepresentableContext<UIKitSearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.text = self.text
        searchBar.placeholder = self.placeHolderText
        searchBar.keyboardType = .asciiCapable
        searchBar.returnKeyType = .search
        searchBar.autocapitalizationType = .words
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar,
                      context: Context) {
        uiView.text = self.text
    }
}

extension UIKitSearchBar.Coordinator: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        text = searchText
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchButtonClicked()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        didStartEditing()
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        didEndEditing()
        return true
    }
}
