//
//  Movie.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import Foundation

struct Movie: Codable {
    let title, year, rated, released: String
    let runtime, genre, director, writer: String
    let actors, plot, language, country: String
    let awards, poster: String
    let ratings: [Rating]
    let metascore, imdbRating, imdbVotes, imdbId: String
    let type: MediaType
    let dvd, boxOffice, production: String
    let website, response: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes
        case imdbId = "imdbID"
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}

// MARK: - Rating
struct Rating: Codable {
    let source, value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}

extension Movie {
    static let movie = Movie(title: "Batman: Under the Red Hood",
                             year: "2010",
                             rated: "PG-13",
                             released: "27 Jul 2010",
                             runtime: "75 min",
                             genre: "Animation, Action, Crime, Drama, Sci-Fi, Thriller",
                             director: "Brandon Vietti",
                             writer: "Judd Winick, Bob Kane (Batman created by)",
                             actors: "Bruce Greenwood, Jensen Ackles, John DiMaggio, Neil Patrick Harris",
                             plot: "Batman faces his ultimate challenge as the mysterious Red Hood takes Gotham City by firestorm. One part vigilante, one part criminal kingpin, Red Hood begins cleaning up Gotham with the efficiency of Batman, but without following the same ethical code. Killing is an option. And when the Joker falls in the balance between the two, hard truths are revealed and old wounds are reopened.",
                             language: "English",
                             country: "USA",
                             awards: "1 nominations.",
                             poster: "https://m.media-amazon.com/images/M/MV5BNmY4ZDZjY2UtOWFiYy00MjhjLThmMjctOTQ2NjYxZGRjYmNlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg",
                             ratings: [
                                .init(source: "Internet Movie Database",
                                      value: "8.1/10"),
                                .init(source: "Rotten Tomatoes",
                                      value: "100%")
                             ],
                             metascore: "N/A",
                             imdbRating: "8.1",
                             imdbVotes: "53,552",
                             imdbId: "tt1569923",
                             type: .movie,
                             dvd: "N/A",
                             boxOffice: "N/A",
                             production: "DC Entertainment, Warner Bros. Animation",
                             website: "N/A",
                             response: "True")
}
