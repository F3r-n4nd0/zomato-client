//
//  CitiesInteractor.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class CitiesInteractor {
    
    func getCities(query: String) -> Observable<[City]> {
        return Observable<[City]>.create { observer in
            let url = ZomatoAPIEndpoints.Cities.get(query: query).url
            let request = ZomatoRequest.sharedInstance.getRequestGet(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let response = try JSONDecoder().decode(ResponseCities.self, from: data ?? Data())
                    observer.onNext(response.locationSuggestions)
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
