//
//  ChatroomMenuContainerController.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/26.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class ChatroomMenuContainerController: UIViewController {
    
    let chatroomsMenuController = ChatroomsMenuController()
    let searchContainerView = SearchContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = menuBackgroundColor
        
        view.addSubview(searchContainerView)
        searchContainerView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        searchContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        
        let chatroomsView = chatroomsMenuController.view!
        view.addSubview(chatroomsView)        
        chatroomsView.anchor(top: searchContainerView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        searchContainerView.searchBar.delegate = chatroomsMenuController
    }
    

}

class SearchContainerView: UIView {
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Enter something"
        return searchBar
    }()
    
    let rocketImageView: UIImageView = {
        let rocketImageView = UIImageView(image: #imageLiteral(resourceName: "rocket"))
        rocketImageView.contentMode = .scaleAspectFit
        return rocketImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(displayP3Red: 62/255, green: 49/255, blue: 60/255, alpha: 1)
        
        addSubview(rocketImageView)
        addSubview(searchBar)
        
        rocketImageView.anchor(top: nil, leading: self.leadingAnchor, bottom: searchBar.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 12, right: 0))
        rocketImageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        rocketImageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .white
        searchBar.anchor(top: nil, leading: rocketImageView.trailingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 4, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
