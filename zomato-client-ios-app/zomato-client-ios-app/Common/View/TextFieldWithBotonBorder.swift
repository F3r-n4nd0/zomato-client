//
//  TextFieldWithBotonBorder.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit

class TextFieldWithBotonBorder: UITextField {
    
    private let border = CALayer()
    private let width = CGFloat(1.0)
    private let color = UIColor.lightGray.cgColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBottonBorder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addBottonBorder()
    }
    
    private func addBottonBorder() {
        self.border.borderColor = self.color
        self.border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        self.border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        self.border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
    }
    
}
