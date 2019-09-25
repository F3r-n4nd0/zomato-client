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
    
    let publishCity = PublishSubject<City?>()
    
    private var disposeBag = DisposeBag()
    private var city: City? = nil {
        didSet {
            self.publishCity.onNext(city)
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
