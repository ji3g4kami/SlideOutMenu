//
//  CustomMenuHeaderView.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/22.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class CustomMenuHeaderView: UIView {
    
    let nameLabel = UILabel()
    let userNameLabel = UILabel()
    let statsLabel = UILabel()
    let profileImageView = CustomImageView(width: 48, height: 48)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupComponentsProperties()
        setupStackView()
    }
    
    fileprivate func setupStackView() {
        let arrangedSubViews = [
            UIStackView(arrangedSubviews: [profileImageView, UIView()]), nameLabel, userNameLabel ,statsLabel
        ]
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubViews)
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.setCustomSpacing(32, after: userNameLabel)
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
    
    fileprivate func setupComponentsProperties() {
        nameLabel.text = "Peter"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        userNameLabel.text = "@peterchen"
        profileImageView.image = UIImage(named: "Peter")
        profileImageView.contentMode = .scaleAspectFit
        
        setupAttributedText()
    }
    
    fileprivate func setupAttributedText() {
        statsLabel.font = UIFont.systemFont(ofSize: 14)
        let attributedText = NSMutableAttributedString(string: "151 ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)])
        attributedText.append(NSMutableAttributedString(string: "Following  ", attributes: [.foregroundColor: UIColor.black]))
        attributedText.append(NSMutableAttributedString(string: "38 ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)]))
        attributedText.append(NSMutableAttributedString(string: "Followers", attributes: [.foregroundColor: UIColor.black]))
        statsLabel.attributedText = attributedText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
