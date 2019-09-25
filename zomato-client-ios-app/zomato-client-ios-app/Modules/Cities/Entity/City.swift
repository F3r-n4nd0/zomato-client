//
//  City.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct City: Codable {
    
    let id: Int
    let name: String
    let countryID: Int
    let countryName: String
    let countryFlagURL: String
    let shouldExperimentWith, discoveryEnabled, hasNewAdFormat, isState: Int
    let stateID: Int
    let stateName, stateCode: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case countryID = "country_id"
        case countryName = "country_name"
        case countryFlagURL = "country_flag_url"
        case shouldExperimentWith = "should_experiment_with"
        case discoveryEnabled = "discovery_enabled"
        case hasNewAdFormat = "has_new_ad_format"
        case isState = "is_state"
        case stateID = "state_id"
        case stateName = "state_name"
        case stateCode = "state_code"
    }
    
}
