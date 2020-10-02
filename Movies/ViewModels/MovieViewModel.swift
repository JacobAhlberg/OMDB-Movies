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
    @Published var isLoading = false
    @Published var error: NetworkError?

    private let networkManager: NetworkManager
    private var subscriptions = Set<AnyCancellable>()

    private var nextPage = 1
    private var lastSearch = ""

    init(networkManager: NetworkManager = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    func search(by title: String) {
        guard !title.isEmpty else { return }

        guard !isLoading else { return }

        // Reset
        resetCurrentPageIfNeeded(searchTitle: title)

        self.isLoading = true

        networkManager.search(by: title, page: nextPage)
            .sink(receiveCompletion: { self.onCompletion($0, searchedTitle: title) },
                  receiveValue: { self.onRecieve($0, searchedTitle: title) })
            .store(in: &subscriptions)
    }

    func fetchNextPage() {
        search(by: lastSearch)
    }

    private func onCompletion(_ completion: Subscribers.Completion<Error>, searchedTitle: String) {
        switch completion {
        case .finished:
            self.lastSearch = searchedTitle
            self.nextPage += 1
            self.error = nil
        case .failure(let error):
            if let error = error as? NetworkError {
                self.error = error
            } else {
                self.error = .underlyingError(error)
            }
            print("Failed with error: \(error)")
        }
        self.isLoading = false
    }

    private func onRecieve(_ search: Search, searchedTitle: String) {
        if searchedTitle == lastSearch {
            self.movies.append(contentsOf: search.result)
        } else {
            self.movies = search.result
        }
    }

    private func resetCurrentPageIfNeeded(searchTitle: String) {
        if lastSearch != searchTitle {
            nextPage = 1
        }
    }
}
