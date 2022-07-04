//
//  Networck.swift
//  Characters
//
//  Created by stimLite on 03.07.2022.
//

import Foundation


class NetworckService <T: Service> {
    var urlSession = URLSession.shared
    
    init () { }
    
    func load (service: T, comletion: @escaping (Result<Data, Error>) -> Void) {
        call(service.urlRequest, completion: comletion)
    }
    
    func load<U> (service: T, dataType: U.Type, completion: @escaping (Result<U, Error>) -> Void) where U:Decodable {
        call(service.urlRequest) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let obj = try decoder.decode(dataType.self, from: data)
                    completion(.success(obj))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}

extension NetworckService {
    private func call (_ reques: URLRequest, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping (Result<Data, Error>) -> Void) {
        urlSession.dataTask(with: reques) { data, _, error in
            if let error = error {
                deliverQueue.async {
                    completion(.failure(error))
                }
            } else {
                deliverQueue.async {
                    completion(.success(data!))
                }
            }
            
        }.resume()
    }
}
