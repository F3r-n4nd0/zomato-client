//
//  RestaurantTableViewCell.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit

protocol RestaurantTableViewCellDelegate: class {
    func showWeb(viewCell: RestaurantTableViewCell)
    func showLocation(viewCell: RestaurantTableViewCell)
}

class RestaurantTableViewCell: UITableViewCell {
    
    weak var delegate: RestaurantTableViewCellDelegate?
    
    @IBOutlet weak var labelRestaurantName: UILabel!
    @IBOutlet weak var imageViewRestaurant: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func touchInsideWeb(_ sender: UIButton) {
         delegate?.showWeb(viewCell: self)
    }
    
    @IBAction func touchInsideLocation(_ sender: UIButton) {
         delegate?.showLocation(viewCell: self)
    }
    
}
