//
//  CitiesViewController.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CitiesViewController: UIViewController {

    var presenter: CitiesPresenter!
    
    @IBOutlet weak var searchBarController: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSearchObserver()
    }
    
    private func loadSearchObserver() {
        
        tableView.register(R.nib.cityTableViewCell)
        
        searchBarController.rx.text.orEmpty
            .debounce(.milliseconds(700), scheduler: MainScheduler.instance)
            .bind { [weak self] query in
                self?.presenter.searchCity(query: query)
        }.disposed(by: self.disposeBag)
        
        presenter.publishCities.bind(to: tableView.rx.items(cellIdentifier: R.nib.cityTableViewCell.name)) { row, model, cell in
            let cellCity = cell as! CityTableViewCell
            cellCity.textLabel?.text = model.name
        }.disposed(by: disposeBag)
        
    }
   

}
