//
//  HTTPTask.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import Foundation

typealias HTTPHeaders = [String: String]
typealias HTTPQueryItems = [String: String]


enum HTTPTask {
    case request

    case requestParameters(bodyParameters: Parameters?,
                 urlParameters: Parameters?)

    case requestParametersAndHeaders(bodyParameters: Parameters?,
                 urlParameters: Parameters?,
                 headers: HTTPHeaders?)
}
