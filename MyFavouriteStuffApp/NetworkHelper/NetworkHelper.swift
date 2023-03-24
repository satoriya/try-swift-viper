//
//  NetworkHelper.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 24/03/23.
//

import Foundation

protocol NetworkingProtocol {
    func callApi<T:Decodable>(url: URL, model: T.Type, completion: @escaping(Result<T, Error>) -> Void)
}

struct NetworkingService: NetworkingProtocol {
    func callApi<T:Decodable>(url: URL, model: T.Type, completion: @escaping(Result<T, Error>) -> Void) where T : Decodable {
        URLSession.shared.dataTask(with: url) { success, respons, error in
            guard let error = error else {
                if let success = success {
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(T.self, from: success)
                        completion(.success(data))
                    } catch let error {
                        completion(.failure(error))
                    }
                }
                return
            }
            completion(.failure(error))
            
        }.resume()
    }
    
    
}
