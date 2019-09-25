//
//  ResponseRestaurants.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct ResponseRestaurants: Codable {
    
    let resultsFound, resultsStart, resultsShown: Int
    let restaurants: [RestaurantElement]
    
    enum CodingKeys: String, CodingKey {
        case resultsFound = "results_found"
        case resultsStart = "results_start"
        case resultsShown = "results_shown"
        case restaurants
    }
}
