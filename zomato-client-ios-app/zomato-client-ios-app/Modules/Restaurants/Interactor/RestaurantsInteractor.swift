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
    
    func getRestaurants(cityId: Int, query: String) -> Observable<[Restaurant]> {
        return Observable<[Restaurant]>.create { observer in
            let url = ZomatoAPIEndpoints.Restaurants.get(cityId: cityId, query: query).url
            let request = ZomatoRequest.sharedInstance.getRequestGet(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let response = try JSONDecoder().decode(ResponseRestaurants.self, from: data ?? Data())
                    let restaurants = response.restaurants.map({ (restaurantElement) -> Restaurant in
                        return restaurantElement.restaurant
                    })
                    observer.onNext(restaurants)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
}
