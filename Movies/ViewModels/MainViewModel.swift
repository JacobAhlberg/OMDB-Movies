//
//  MainViewModel.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var movie: Movie

    init() {
        fetch()
    }

    func fetch(search: String = "Blade") {

    }
}
