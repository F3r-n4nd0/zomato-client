//
//  UserRating.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct UserRating: Codable {
    
    let aggregateRating: String
    let votes: String
    
    enum CodingKeys: String, CodingKey {
        case aggregateRating = "aggregate_rating"
        case votes
    }
    
}
