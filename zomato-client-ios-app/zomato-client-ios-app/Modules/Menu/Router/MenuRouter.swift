//
//  MenuRouter.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/25/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import RxSwift

class MenuRouter {
    
    weak var view: MenuViewController?
    private let disposeBag = DisposeBag()
    
    let subjectResult = PublishSubject<Void>()
    
    static func assembleModule(restaurant: Restaurant) -> MenuRouter {
        let view = R.storyboard.menuStoryboard.menuViewController()!
        let presenter = MenuPresenter(restaurant: restaurant)
        let router = MenuRouter()
        view.presenter = presenter
        presenter.router = router
        router.view = view
        return router
    }

    func closeModule() {
        subjectResult.onCompleted()
    }
    
}
