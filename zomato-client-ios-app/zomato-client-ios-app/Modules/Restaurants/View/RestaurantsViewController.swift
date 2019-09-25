//
//  RestaurantsViewController.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class RestaurantsViewController: UIViewController {

    var presenter: RestaurantsPresenter!
    
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var imageViewFlag: UIImageView!
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadObservers()
        presenter.loadData()
    }
    
    private func loadObservers() {
        presenter.publishCity.bind { [weak self] (city) in
            self?.loadCity(city: city)
        }.disposed(by: disposeBag)
    }
    
    private func loadCity(city: City?) {
        guard let city = city else {
            labelCityName.text = "Select a city"
            imageViewFlag.image = nil
            return
        }
        labelCityName.text = city.name
        if city.countryFlagURL.isEmpty {
            imageViewFlag.image = nil
        } else {
            let urlFlag = URL(string: city.countryFlagURL)
            imageViewFlag?.kf.setImage(with: urlFlag)
        }
        
    }
    
    @IBAction func selectTapGestureCity(_ sender: UITapGestureRecognizer) {
        presenter.selectCity()
    }
    
}
