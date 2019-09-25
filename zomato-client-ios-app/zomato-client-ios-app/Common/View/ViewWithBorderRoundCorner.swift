//
//  ViewWithBorderRoundCorner.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit

class ViewWithBorderRoundCorner: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBorderRoundCorner()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setBorderRoundCorner()
    }
    
    func setBorderRoundCorner() {
        self.layer.cornerRadius = self.bounds.size.width * 0.02
        self.layer.borderColor = R.color.borderLightGreyColor()?.cgColor
        self.layer.borderWidth = 1
    }
    
}
