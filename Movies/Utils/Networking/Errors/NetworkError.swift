//
//  NetworkError.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import Foundation

enum NetworkError: Error, Identifiable {
    var id: String { localizedDescription }

    case invalidURL
    case parametersInvalid
    case encodingFailed
    case timedOut
    case cancelled
    case httpError(responseCode: Int)
    case underlyingError(Error)
    case noResponse
    case notFound
    case parseError(Error)
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .httpError(let responseCode): return "Server error: \(responseCode)"
        case .timedOut: return "Timed out"
        case .notFound: return "Not found"
        case .underlyingError(let error): return error.localizedDescription
        default: return "Unknown error"
        }
    }
}
