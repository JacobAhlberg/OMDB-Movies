//
//  Router.swift
//  Movies
//
//  Created by Jacob Ahlberg on 2020-09-25.
//

import Foundation
import Combine

class Router<Endpoint: EndPointType>: NetworkRouter {
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        return URLSession(configuration: configuration)
    }()

    func execute<T: Decodable>(_ route: Endpoint, _ decoder: JSONDecoder) -> AnyPublisher<T, Error> {
        var request: URLRequest
        do {
            request = try buildRequest(from: route)
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }

        return session
            .dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .retry(route.retries)
            .mapError { NetworkError.underlyingError($0) }
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse else {
                    throw NetworkError.noResponse
                }

                if case 404 = response.statusCode {
                    throw NetworkError.notFound
                }

                guard 200..<400 ~= response.statusCode else {
                    throw NetworkError.httpError(responseCode: response.statusCode)
                }

                if let _ = try? decoder.decode(InvalidResponse.self, from: $0.data) {
                    throw NetworkError.notFound
                }

                return $0.data
            }
            .decode(type: T.self, decoder: decoder)
            .mapError { NetworkError.parseError($0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func cancel() {
        session.invalidateAndCancel()
    }

    private func buildRequest(from route: Endpoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalCacheData,
                                 timeoutInterval: route.timeout)
        request.httpMethod = route.httpMethod.rawValue

        do {
            switch route.task {
            case .request:
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters,
                                    let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters,
                                             urlParameters: urlParameters,
                                             request: &request)
            case .requestParametersAndHeaders(let bodyParameters,
                                              let urlParameters,
                                              let additionalHeaders):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }

    private func configureParameters(bodyParameters: Parameters?,
                                     urlParameters: Parameters?,
                                     request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }

    private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
    }
}
