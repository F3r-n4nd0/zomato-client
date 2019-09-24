//
//  ZomatoRequest.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class ZomatoRequest {
    
    static let sharedInstance = ZomatoRequest()
    
    var apiKey: String? = "231280223369525627b2621f34448d05"
    
    private init() {
    }

    func getRequestGet(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        addAuthCredential(&request)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func addAuthCredential(_ request: inout URLRequest) {
        if let apiKey = apiKey {
            request.addValue(apiKey, forHTTPHeaderField: "user-key")
        }
    }
    
}

