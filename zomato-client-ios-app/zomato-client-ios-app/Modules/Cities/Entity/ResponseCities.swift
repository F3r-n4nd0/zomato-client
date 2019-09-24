//
//  ResponseCities.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation


struct ResponseCities: Codable {
    
    let locationSuggestions: [City]
    let status: String
    let hasMore, hasTotal: Int
    
    enum CodingKeys: String, CodingKey {
        case locationSuggestions = "location_suggestions"
        case status
        case hasMore = "has_more"
        case hasTotal = "has_total"
    }
}
