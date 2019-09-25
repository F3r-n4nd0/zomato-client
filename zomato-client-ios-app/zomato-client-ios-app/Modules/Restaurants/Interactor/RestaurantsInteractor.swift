//
//  RestaurantsInteractor.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class RestaurantsInteractor {
    
    func getLastCity() -> City? {
        do {
            let userDefaults = UserDefaults.standard
            if let data = userDefaults.data(forKey: "last-city") {
                let city = try PropertyListDecoder().decode(City.self, from: data)
                return city
            }
        } catch (let error) {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func storeLastCity(city: City) {
        if let encoded = try? PropertyListEncoder().encode(city) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "last-city")
            defaults.synchronize()
        }
    }
    
}
