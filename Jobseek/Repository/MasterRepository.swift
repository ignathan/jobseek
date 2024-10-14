//
//  MasterRepository.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidUrl
}

class MasterRepository {
    
    static let shared = MasterRepository()
    
    let baseUrlString = "https://run.mocky.io/"
    
    var urlSession = URLSession.shared
    
    func getResponse<T: Decodable>(endpointString: String) -> AnyPublisher<T, Error> {
        return Future<T, Error> { [weak self] promise in
            
            guard let self,
                  let url = URL(string: self.baseUrlString + endpointString)
            else { return promise(.failure(APIError.invalidUrl)) }
            
            urlSession.dataTask(with: url) { data, _, error in
                
                if let error {
                    promise(.failure(error))
                    
                } else if let data {
                    do {
                        let object = try JSONDecoder().decode(T.self, from: data)
                        promise(.success(object))
                        
                    } catch {
                        promise(.failure(error))
                    }
                }
            }.resume()
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
