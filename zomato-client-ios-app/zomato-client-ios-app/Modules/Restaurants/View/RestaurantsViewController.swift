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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var layoutContraintHeightTop: NSLayoutConstraint!
    @IBOutlet weak var layoutContraintHeightBotton: NSLayoutConstraint!
    
    private var disposeBag = DisposeBag()
    private var disposableKeyboard: Disposable?
    private let heightTopContraint: CGFloat = 185
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadObservers()
        presenter.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subcribeKeyboardMove()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeKeyboardMove()
    }
    
    private func loadObservers() {
        
        tableView.register(R.nib.restaurantTableViewCell)
        
        presenter.publishCity.bind { [weak self] (city) in
            self?.loadCity(city: city)
        }.disposed(by: disposeBag)
        
        textFieldSearch.rx.text.orEmpty
            .debounce(.milliseconds(700), scheduler: MainScheduler.instance)
            .bind { [weak self] query in
                self?.presenter.searchRestaurants(query: query)
            }.disposed(by: self.disposeBag)
        
        presenter.publishRestaurants.bind(to: tableView.rx.items(cellIdentifier: R.nib.restaurantTableViewCell.name)) { [weak self] row, restaurant, cell in
            let cellRestaurant = cell as! RestaurantTableViewCell
            cellRestaurant.labelRestaurantName.text = restaurant.name
            let urlRestaurant = URL(string: restaurant.thumb)
            cellRestaurant.imageViewRestaurant?.kf.setImage(with: urlRestaurant)
            cellRestaurant.labelLocation.text = restaurant.location.address
            cellRestaurant.delegate = self
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
    
    private func subcribeKeyboardMove() {
        disposableKeyboard = keyboardHeight(view: view)
            .observeOn(MainScheduler.instance)
            .bind(onNext: { [weak self] keyboardHeight in
                if keyboardHeight == 0 {
                    self?.layoutContraintHeightTop.constant = self?.heightTopContraint ?? 0
                } else {
                    self?.layoutContraintHeightTop.constant = 0
                }
                self?.layoutContraintHeightBotton.constant = keyboardHeight
            })
        disposableKeyboard?.disposed(by: disposeBag)
    }
    
    private func unsubscribeKeyboardMove() {
        disposableKeyboard?.dispose()
    }
    
    private func keyboardHeight(view: UIView) -> Observable<CGFloat> {
        return PublishSubject
            .from([
                NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
                    .map { notification -> CGFloat in
                        let viewBoardScreenEndFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
                        let viewBoardViewEndFrame = view.convert(viewBoardScreenEndFrame, to: view.window)
                        return viewBoardViewEndFrame.height
                },
                NotificationCenter.default.rx.notification(UIResponder.keyboardWillChangeFrameNotification)
                    .map { notification -> CGFloat in
                        let viewBoardScreenEndFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
                        let viewBoardViewEndFrame = view.convert(viewBoardScreenEndFrame, to: view.window)
                        return viewBoardViewEndFrame.height
                },
                NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
                    .map { _ -> CGFloat in
                        0
                }
                ])
            .merge()
    }
    
    @IBAction func selectTapGestureCity(_ sender: UITapGestureRecognizer) {
        presenter.selectCity()
    }
    
}

extension RestaurantsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showMenu(row: indexPath.row)
    }
    
}

extension RestaurantsViewController : RestaurantTableViewCellDelegate {
    
    func showWeb(viewCell: RestaurantTableViewCell) {
        let indexPath = tableView.indexPath(for: viewCell)
        if let indexPath = indexPath {
            presenter.showWeb(row: indexPath.row)
        }
    }
    
    func showLocation(viewCell: RestaurantTableViewCell) {
        let indexPath = tableView.indexPath(for: viewCell)
        if let indexPath = indexPath {
            presenter.showLocation(row: indexPath.row)
        }
    }
    
}
