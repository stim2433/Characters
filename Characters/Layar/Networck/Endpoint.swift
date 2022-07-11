//
//  Endpoint.swift
//  Characters
//
//  Created by stimLite on 04.07.2022.
//

import Foundation

enum Endpoint {
    case region
    case avatar (String)
}

extension Endpoint: Service {
    var baseURL: String {
        return "https://rickandmortyapi.com"
    }
    
    var path: String {
        switch self {
        case .region:
            return "/api/character"
        case .avatar( let index):
            return "/api/character/avatar/\(index).jpeg"
        }
    }
    
    var method: ServiceMethod {
        return .get
    }
}
