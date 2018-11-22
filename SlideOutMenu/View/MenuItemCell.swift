//
//  MenuItemCell.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/22.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class MenuItemCell: UITableViewCell {

    let iconImageView: UIImageView = {
       let imageView = CustomImageView(width: 38, height: 38)
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "bookmarks")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel, UIView()])
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        stackView.spacing = 12
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 12, bottom: 8, right: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
