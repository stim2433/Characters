//
//  Service.swift
//  Characters
//
//  Created by stimLite on 04.07.2022.
//

import Foundation

enum ServiceMethod: String {
    case get = "GET"
}

protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var method: ServiceMethod { get }
}

extension Service {
    public var urlRequest: URLRequest {
        guard let url = self.url else { fatalError("URL not be open")}
        var reques = URLRequest(url: url)
        reques.httpMethod = method.rawValue
        return reques
    }
    
    private var url: URL? {
        var urlComponnents = URLComponents (string: baseURL)
        urlComponnents?.path = path
        return urlComponnents?.url
    }
}
