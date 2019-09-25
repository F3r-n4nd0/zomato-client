//
//  RestaurantRestaurant.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct Restaurant: Codable {

    let apikey: String
    let id, name: String
    let url: String
    let location: Location
    let cuisines, timings: String
    let averageCostForTwo, priceRange: Int
    let highlights: [String]
    let opentableSupport, isZomatoBookRes: Int
    let isBookFormWebView: Int
    let bookFormWebViewURL, bookAgainURL: String
    let thumb: String
    let userRating: UserRating
    let allReviewsCount: Int
    let photosURL: String
    let photoCount: Int
    let menuURL: String
    let featuredImage: String
    let hasOnlineDelivery, isDeliveringNow: Int
    let includeBogoOffers: Bool
    let deeplink: String
    let isTableReservationSupported, hasTableBooking: Int
    let eventsURL: String
    let phoneNumbers: String
    let establishment: [String]
    let photos: [PhotoElement]?
    
    enum CodingKeys: String, CodingKey {
        case apikey, id, name, url, location
        case cuisines, timings
        case averageCostForTwo = "average_cost_for_two"
        case priceRange = "price_range"
        case highlights
        case opentableSupport = "opentable_support"
        case isZomatoBookRes = "is_zomato_book_res"
        case isBookFormWebView = "is_book_form_web_view"
        case bookFormWebViewURL = "book_form_web_view_url"
        case bookAgainURL = "book_again_url"
        case thumb
        case userRating = "user_rating"
        case allReviewsCount = "all_reviews_count"
        case photosURL = "photos_url"
        case photoCount = "photo_count"
        case menuURL = "menu_url"
        case featuredImage = "featured_image"
        case hasOnlineDelivery = "has_online_delivery"
        case isDeliveringNow = "is_delivering_now"
        case includeBogoOffers = "include_bogo_offers"
        case deeplink
        case isTableReservationSupported = "is_table_reservation_supported"
        case hasTableBooking = "has_table_booking"
        case eventsURL = "events_url"
        case phoneNumbers = "phone_numbers"
        case establishment
        case photos
    }
}
