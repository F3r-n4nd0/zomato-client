//
//  CitiesPresenter.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class CitiesPresenter {
    
    var router: CitiesRouter!
    var interactor: CitiesInteractor!
    
    let publishCities = PublishSubject<[City]>()
    
    private var disposeBag = DisposeBag()
    private var cities: [City] = [] {
        didSet {
           self.publishCities.onNext(cities)
        }
    }
    
    func searchCity(query: String) {
        interactor.getCities(query: query).bind { [weak self] (cities) in
            self?.cities = cities
        }.disposed(by: self.disposeBag)
    }
    
    func cancel() {
        router.closeModule()
    }
    
    func selectRow(row: Int) {
        let city = cities[row]
        router.selectCity(city: city)
    }
    
}
