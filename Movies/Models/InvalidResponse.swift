//
//  InvalidResponse.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-28.
//

import Foundation

struct InvalidResponse: Codable {
    let response, error: String

    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case error = "Error"
    }
}
