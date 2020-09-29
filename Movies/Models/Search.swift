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

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

extension MovieSearch: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.imdbId == rhs.imdbId
    }
}

enum MediaType: String, Codable {
    case movie
    case series
    case episode
    case game
}

