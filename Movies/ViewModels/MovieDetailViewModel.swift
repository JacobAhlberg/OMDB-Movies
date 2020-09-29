//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-29.
//

import UIKit
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var isLoading = false
    @Published var error: Error?

    private var subscriptions = Set<AnyCancellable>()

    private let networkManager: NetworkManager
    private var searchedMovie: MovieSearch

    init(movie: MovieSearch, networkManager: NetworkManager = NetworkManager.shared) {
        self.searchedMovie = movie
        self.networkManager = networkManager
        self.fetchDetails()
    }

    init() {
        searchedMovie = .init(title: "", year: "", imdbId: "", type: .movie, poster: "")
        networkManager = NetworkManager.shared
    }

    var movieTitle: String { searchedMovie.title }
    var moviePoster: UIImage? {
        guard let posterData = movie?.poster.convertToData else {
            return nil
        }
        return UIImage(data: posterData)
    }

    func fetchDetails() {
        networkManager.getMovieDetails(by: searchedMovie.imdbId)
            .sink(receiveCompletion: onCompletion,
                  receiveValue: onReceive)
            .store(in: &subscriptions)
    }

    private func onCompletion(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished: print("Finished")
        case .failure(let error): self.error = error
        }
    }

    private func onReceive(_ movie: Movie) {
        self.movie = movie
    }
}
