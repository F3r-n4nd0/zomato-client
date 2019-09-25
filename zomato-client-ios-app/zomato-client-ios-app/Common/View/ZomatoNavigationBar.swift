//
//  ZomatoNavigationBar.swift
//  zomato-client-ios-app
//
//  Created by Fernando Luna on 9/24/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit

class ZomatoNavigationBar: UINavigationBar {

    var imageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle()
        setColors()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setTitle()
        setColors()
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        updateFrameTitle()
    }
    
    func setTitle() {
        let logo = R.image.zomatoLogoNavigationBar()!
        imageView = UIImageView(image: logo)
        let bannerWidth = self.frame.size.width
        let bannerHeight = self.frame.size.height
        let posImageX = bannerWidth * 0.3
        imageView?.frame = CGRect(x: posImageX, y: 0, width: posImageX, height: bannerHeight)
        imageView?.contentMode = .scaleAspectFit
        self.topItem?.titleView = imageView
    }
    
    func setColors() {
        self.barTintColor = R.color.navigationBarColor()!
        self.isTranslucent = false
    }
    
    func updateFrameTitle() {
        if let imageView = imageView {
            let bannerWidth = self.frame.size.width
            let bannerHeight = self.frame.size.height
            let posImageX = bannerWidth * 0.3
            imageView.frame = CGRect(x: posImageX, y: 0, width: posImageX, height: bannerHeight)
        }
    }

}
