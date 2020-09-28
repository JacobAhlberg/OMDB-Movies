//
//  MovieViewModel.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var movies: [MovieSearch] = []

    private let networkManager: NetworkManager

    private var cancellable: AnyCancellable?

    init(networkManager: NetworkManager = NetworkManager.shared) {
        self.networkManager = networkManager
        search(by: "Blade")
    }

    func fetch(search: String) {
        cancellable = networkManager.getMovie(by: search)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished: print("FINISHED")
                case .failure(let error): print("Failed with error: \(error)")
                }
            },
            receiveValue: {
                print("Values: \($0)")
            })
    }

    func search(by title: String) {
        cancellable = networkManager.search(by: title)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: print("FINISHED")
                case .failure(let error): print("Failed with error: \(error)")
                }
            },
            receiveValue: { (search) in
                self.movies = search.result
            })
    }
}
