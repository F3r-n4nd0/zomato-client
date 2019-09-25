//
//  RestaurantsRouter.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class RestaurantsRouter {
    
    weak var view: RestaurantsViewController?
    private let disposeBag = DisposeBag()
    
    static func assembleModule() -> RestaurantsRouter {
        let view = R.storyboard.restaurantsStoryboard.restaurantsViewController()!
        let presenter = RestaurantsPresenter()
        let interactor = RestaurantsInteractor()
        let router = RestaurantsRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func selectCity(animate: Bool, callBack: @escaping (City) -> Void) {
        let citiesRouter = CitiesRouter.assembleModule()
        self.view?.navigationController?.pushViewController(citiesRouter.view!, animated: animate)
        citiesRouter.subjectResult.subscribe(onNext: { (city) in
            callBack(city)
        },onCompleted: {
            self.view?.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
    }
    
}
