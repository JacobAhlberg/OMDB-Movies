//
//  EndPointType.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-24.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }

    var timeout: TimeInterval { get }
    var retries: Int { get }
}

extension EndPointType {
    var timeout: TimeInterval { 30 }
    var retries: Int { 1 }
}

