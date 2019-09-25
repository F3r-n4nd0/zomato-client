//
//  ZomatoAPIEndpoints.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation


#if DEBUG
struct API {
    static let baseUrl = "https://developers.zomato.com/api"
}
#else
struct API {
    static let baseUrl = "https://developers.zomato.com/api"
}
#endif

protocol Endpoint {
    var path: String { get }
    var url: URL { get }
}


enum ZomatoAPIEndpoints {
    
    enum Cities: Endpoint {
        case get(query: String)
        public var path: String {
            switch self {
            case .get: return "/v2.1/cities"
            }
        }
        public var url: URL {
            switch self {
            case .get(let query):
                var url = URLComponents(string:"\(API.baseUrl)\(path)")!
                url.queryItems = [
                    URLQueryItem(name: "q", value: query)
                ]
                return url.url!
            }
        }
    }
    
    
    enum Restaurants: Endpoint {
        case get(cityId: Int, query: String)
        public var path: String {
            switch self {
            case .get: return "/v2.1/search"
            }
        }
        public var url: URL {
            switch self {
            case .get(let cityId, let query):
                var url = URLComponents(string:"\(API.baseUrl)\(path)")!
                url.queryItems = [
                    URLQueryItem(name: "q", value: query),
                    URLQueryItem(name: "entity_id", value: "\(cityId)"),
                    URLQueryItem(name: "entity_type", value: "city")
                ]
                return url.url!
            }
        }
    }
    
}
