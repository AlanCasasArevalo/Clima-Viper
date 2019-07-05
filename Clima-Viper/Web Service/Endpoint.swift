//
//  Endpoint.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

private enum HTTPMethod: String {
    case get = "GET"
}

internal enum Endpoint {
    case weather(query: String)
}

internal extension Endpoint {
    func request(with baseURL: URL, parameters: [String: String]) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var newParameters = self.parameters
        parameters.forEach {
            newParameters.updateValue($1, forKey: $0)
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = newParameters.map(URLQueryItem.init)
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        return request
    }
}

private extension Endpoint {
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .weather(let query):
            return "weather"
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .weather(let query):
            return [
                "q": query
            ]
        }
    }
    
}

