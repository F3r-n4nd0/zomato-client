//
//  CitiesRouter.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import RxSwift

class CitiesRouter {
    
    weak var view: CitiesViewController?
    private let disposeBag = DisposeBag()
    
    let subjectResult = PublishSubject<City>()
    
    static func assembleModule() -> CitiesRouter {
        let view = R.storyboard.citiesStoryboard.citiesViewController()!
        let presenter = CitiesPresenter()
        let interactor = CitiesInteractor()
        let router = CitiesRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func selectCity(city: City) {
        subjectResult.onNext(city)
        subjectResult.onCompleted()
    }
    
    func closeModule() {
        subjectResult.onCompleted()
    }
    
}
