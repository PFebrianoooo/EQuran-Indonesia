//
//  NetworkingManager.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 03/05/24.
//

import Foundation
import Combine

class NetworkingManager {
    
    private enum errorMessage: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url):
                return "[🔥] Bad URL Response.\n Chek your url and try again :\(url)"
            case .unknown:
                return "[?] Unkwnon Error Occured"
            }
        }
    }
    
    private init() {    }
    
    static func downloadData(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.global(qos: .background))
            .tryMap({try handleCompletion(output: $0, url: url)})
            .retry(2)
            .eraseToAnyPublisher()
    }
    
    static func handleCompletion(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw errorMessage.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func receiveErrorCompletion(comp: Subscribers.Completion<Error>) {
        switch comp {
        case .finished:
            break
        case .failure(let error):
            print("\(error.localizedDescription)")
        }
    }
}
