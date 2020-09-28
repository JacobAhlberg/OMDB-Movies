//
//  URLParameterEncoder.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-25.
//

import Foundation

struct URLParameterEncoder: ParameterEncoding {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.invalidURL }

        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()

            parameters.forEach {
                let queryItem = URLQueryItem(name: $0.key,
                                             value: "\($0.value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }

        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
    }
}
