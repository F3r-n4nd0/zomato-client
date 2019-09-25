//
//  MenuPresenter.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/25/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation


class MenuPresenter {
    
    var router: MenuRouter!

    private var restaurant: Restaurant
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
    func getRestaurant() -> Restaurant {
        return self.restaurant
    }
    
    func closeMenu() {
        router.closeModule()
    }
    
}
