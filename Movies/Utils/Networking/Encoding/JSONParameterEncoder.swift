//
//  JSONParameterEncoder.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-25.
//

import Foundation

struct JSONParameterEncoder: ParameterEncoding {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
