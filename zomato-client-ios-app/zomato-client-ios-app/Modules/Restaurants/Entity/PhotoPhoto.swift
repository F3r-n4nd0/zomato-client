//
//  PhotoPhoto.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct PhotoPhoto: Codable {
    
    let id: String
    let url, thumbURL: String
    let resID: Int
    let caption: String
    let timestamp: Int
    let friendlyTime: String
    let width, height: Int
    
    enum CodingKeys: String, CodingKey {
        case id, url
        case thumbURL = "thumb_url"
        case resID = "res_id"
        case caption, timestamp
        case friendlyTime = "friendly_time"
        case width, height
    }
}
