//
//  MenuController.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/20.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

struct MenuItem {
    let icon: UIImage?
    let title: String
    
    init(icon: String, title: String) {
        self.icon = UIImage(named: icon)
        self.title = title
    }
}

class MenuController: UITableViewController {
    
    let menuItems = [
        MenuItem(icon: "profile", title: "Home"),
        MenuItem(icon: "lists", title: "Lists"),
        MenuItem(icon: "bookmarks", title: "Bookmarks"),
        MenuItem(icon: "moments", title: "Moments")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeaderView = CustomMenuHeaderView()
        return customHeaderView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuItemCell(style: .default, reuseIdentifier: "cellId")
        let menuItem = menuItems[indexPath.row]
        cell.titleLabel.text = menuItem.title
        cell.iconImageView.image = menuItem.icon
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let baseSlidingViewController = UIApplication.shared.keyWindow?.rootViewController as? BaseSlidingController
        baseSlidingViewController?.didSelectMenuItem(indexPath: indexPath)
    }
    
    deinit {
        print(String(describing: self), "is de-initialized")
    }
    

}
