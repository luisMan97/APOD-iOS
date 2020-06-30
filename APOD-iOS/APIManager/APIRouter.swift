//
//  APIRouter.swift
//  APOD-iOS
//
//  Created by Jorge Luis Rivera Ladino on 28/06/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

enum APIRouter {
    
    case Apod([String: Any])
    
    private var method: HTTPMethod {
        switch self {
        case .Apod:
            return .GET
        }
    }
    
    private var path: String {
        switch self {
        case .Apod(let params):
            let date = params["date"] ?? ""
            return "planetary/apod?api_key=nlPhgpIyS3n4JpMFOMaWpMw6pQKhchCNfsWFz4Wa&date=\(date)"
        }
    }
    
    private var url: String {
        return ApiManagerConstants.endpoint
    }
    
    var request: URLRequest? {
        guard let url = NSURL(string: url + path) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url as URL)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
            case .Apod:
            return urlRequest
        }
    }
    
}

