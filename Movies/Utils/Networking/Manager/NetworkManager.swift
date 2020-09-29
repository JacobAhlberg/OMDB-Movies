//
//  NetworkManager.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()

    private let router = Router<MovieAPI>()

    func getMovieDetails(by id: String) -> AnyPublisher<Movie, Error> {
        return router.execute(.movie(id: id), JSONDecoder())
    }

    func search(by title: String, page: Int) -> AnyPublisher<Search, Error> {
        return router.execute(.search(title: title, page: page), JSONDecoder())
    }
}
