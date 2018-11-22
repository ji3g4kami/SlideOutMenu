//
//  ProfileImageView.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/22.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class ProfileImageView: UIImageView {

    let width: CGFloat
    let height: CGFloat
    
    override var intrinsicContentSize: CGSize {
        return .init(width: width, height: height)
    }
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        super.init(frame: .zero)
        self.layer.cornerRadius = self.width/2
        self.clipsToBounds = true
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
