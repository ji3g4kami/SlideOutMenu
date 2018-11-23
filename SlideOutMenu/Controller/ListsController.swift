//
//  ListsController.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/23.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class ListsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Lists"
        label.font = UIFont.boldSystemFont(ofSize: 64)
        label.frame = view.frame
        label.textAlignment = .center
        view.addSubview(label)
    }
    



}
