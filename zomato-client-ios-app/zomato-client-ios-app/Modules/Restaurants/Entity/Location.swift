//
//  Location.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct Location: Codable {
    let address, locality, city: String
    let cityID: Int
    let latitude, longitude, zipcode: String
    let countryID: Int
    let localityVerbose: String
    
    enum CodingKeys: String, CodingKey {
        case address, locality, city
        case cityID = "city_id"
        case latitude, longitude, zipcode
        case countryID = "country_id"
        case localityVerbose = "locality_verbose"
    }
}
