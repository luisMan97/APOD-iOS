//
//  APIManager.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera LadinoA on 28/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation
import Combine

class APIManager {
    
    static func request<T: Codable>(service: APIRouter) -> AnyPublisher<T, Error> {
        guard let request = service.request else {
            let error = NSError(domain: "error", code: 404, userInfo: [NSLocalizedDescriptionKey: "Bad URL"])
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
