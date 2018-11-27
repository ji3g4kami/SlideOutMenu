//
//  ChatroomMenuCell.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/26.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class ChatroomMenuCell: UITableViewCell {

    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 0.2941, green: 0.6, blue: 0.5411, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, UIView()])
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        addSubview(bgView)
        bgView.fillSuperview(padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        sendSubviewToBack(bgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        bgView.isHidden = !selected
    }

}
