//
//  NetworkError.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case parametersInvalid
    case encodingFailed
    case timedOut
    case cancelled
    case httpError(Int)
    case underlyingError(Error)
    case noResponse
    case notFound
    case parseError(Error)
    case unknown
}
