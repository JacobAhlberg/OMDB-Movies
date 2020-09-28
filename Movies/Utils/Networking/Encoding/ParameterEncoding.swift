//
//  ParameterEncoding.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import Foundation

typealias Parameters = [String: Any]

protocol ParameterEncoding {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
