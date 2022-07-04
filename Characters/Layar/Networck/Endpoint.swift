//
//  Endpoint.swift
//  Characters
//
//  Created by stimLite on 04.07.2022.
//

import Foundation

enum Endpoint {
    case region
}

extension Endpoint: Service {
    var baseURL: String {
        return "https://rickandmortyapi.com"
    }
    
    var path: String {
        switch self {
        case .region:
            return "/api/character"
        }
    }
    
    var method: ServiceMethod {
        return .get
    }
}
