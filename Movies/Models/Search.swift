//
//  Search.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-28.
//

import Foundation

struct Search: Codable {
    let result: [MovieSearch]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case result = "Search"
        case totalResults
        case response = "Response"
    }
}

struct MovieSearch: Codable {
    let title, year, imdbId: String
    let type: MediaType
    let poster: String

    var imageData: Data? {
        guard let url = URL(string: poster),
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        return data
    }

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

enum MediaType: String, Codable {
    case movie
    case series
    case episode
}
