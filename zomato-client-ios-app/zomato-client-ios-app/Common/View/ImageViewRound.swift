//
//  ImageViewRound.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/25/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit

class ImageViewRound: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRoundCorner()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setRoundCorner()
    }
    
    func setRoundCorner() {
        self.layer.cornerRadius = self.bounds.size.width * 0.2
    }
    
}
