//
//  RestaurantsPresenter.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class RestaurantsPresenter {
    
    var router: RestaurantsRouter!
    var interactor: RestaurantsInteractor!
    
    let publishRestaurants = PublishSubject<[Restaurant]>()
    let publishCity = PublishSubject<City?>()
    
    private var disposeBag = DisposeBag()
    private var city: City? = nil {
        didSet {
            self.publishCity.onNext(city)
        }
    }
    private var restaurants: [Restaurant] = [] {
        didSet {
            self.publishRestaurants.onNext(restaurants)
        }
    }
    
    func loadData() {
        city = interactor.getLastCity()
        if let city = city {
            interactor.storeLastCity(city: city)
        } else {
            showSelectCity(animate: false)
        }
    }
    
    func selectCity() {
        showSelectCity(animate: true)
    }
    
    func searchRestaurants(query: String) {
        guard let city = self.city else {
            return
        }
        interactor.getRestaurants(cityId: city.id, query: query).bind { [weak self] (restaurants) in
            self?.restaurants = restaurants
            }.disposed(by: self.disposeBag)
    }
    
    private func showSelectCity(animate: Bool) {
        router.selectCity(animate: animate) { [weak self] (city) in
            self?.selectNewCity(city: city)
        }
    }
    
    private func selectNewCity(city: City) {
        self.city = city
        interactor.storeLastCity(city: city)
    }
    
}
