//
//  NetworkRouter.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-25.
//

import Foundation
import Combine

protocol NetworkRouter: class {
    associatedtype EndPoint = EndPointType
    func execute<T: Decodable>(_ route: EndPoint, _ decoder: JSONDecoder) -> AnyPublisher<T, Error>
    func cancel()
}
