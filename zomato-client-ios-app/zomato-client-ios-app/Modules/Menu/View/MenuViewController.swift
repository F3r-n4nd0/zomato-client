//
//  MenuViewController.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/25/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import Kingfisher

class MenuViewController: UIViewController {

    var presenter: MenuPresenter!
    
    @IBOutlet weak var imageViewRestaurant: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAddrs: UILabel!
    @IBOutlet weak var labelCity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRestaurant()
    }
    
    private func loadRestaurant() {
        let restaurant = presenter.getRestaurant()
        labelName.text = restaurant.name
        labelAddrs.text = restaurant.location.address
        labelCity.text = restaurant.location.city
        let urlString = restaurant.photos?.first?.photo.url ?? restaurant.thumb
        let url = URL(string: urlString)
        imageViewRestaurant.kf.setImage(with: url)
    }
    
    @IBAction func selectBack(_ sender: UIBarButtonItem) {
        presenter.closeMenu()
    }
    
}
