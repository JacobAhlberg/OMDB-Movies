//
//  MovieAPI.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-25.
//

import Foundation

enum MovieAPI {
    case search(title: String)
    case movie(id: String)
}

extension MovieAPI: EndPointType {
    var baseURL: URL { URL(string: "http://www.omdbapi.com/?")! }

    var path: String {
        switch self {
        case .search: return ""
        case .movie: return ""
        }
    }

    var httpMethod: HTTPMethod { .get }

    var task: HTTPTask {
        switch self {
        case .movie(let id): return .requestParameters(bodyParameters: nil,
                                                       urlParameters: [
                                                        "apikey": NetworkManager.apiKey
                                                       ])
        case .search(let title): return .requestParameters(bodyParameters: nil,
                                                       urlParameters: [
                                                        "apikey": NetworkManager.apiKey,
                                                        "s": title
                                                       ])
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        case .movie, .search: return nil
        }
    }
}
